/*
 * Copyright (c) 2018 Xilinx Inc.
 * Written by Edgar E. Iglesias,
 *            Francisco Iglesias.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 *
 * References:
 *
 * [1] AMBA AXI and ACE Protocol Specification, ARM IHI 0022D, ID102711
 *
 */

#ifndef SCTLM_TLM_LIB_BRIDGES_AXILITE2TLM_BRIDGE_HPP_INCLUDED
#define SCTLM_TLM_LIB_BRIDGES_AXILITE2TLM_BRIDGE_HPP_INCLUDED
#define SC_INCLUDE_DYNAMIC_PROCESSES

#include <sctlm/tlm_lib/extensions/genattr.hpp>
#include <sctlm/tlm_lib/modules/aligner.hpp>
#include <sctlm/tlm_lib/protocols/amba/ace.hpp>
#include <sctlm/tlm_lib/protocols/amba/axi.hpp>

namespace sctlm::tlm_lib::bridges {

namespace detail {

using namespace protocols::amba::axi;
using namespace protocols::amba::ace;

template<
    int ADDR_WIDTH,
    int DATA_WIDTH>
class axilite2tlm : public sc_core::sc_module, public axi_common {
public:
    tlm_utils::simple_initiator_socket<axilite2tlm> socket;

    SC_HAS_PROCESS(axilite2tlm);

    sc_core::sc_in<bool> clk;
    sc_core::sc_in<bool> resetn;

    /* Write address channel.  */
    sc_core::sc_in<bool> awvalid;
    sc_core::sc_out<bool> awready;
    sc_core::sc_in<sc_dt::sc_bv<ADDR_WIDTH>> awaddr;
    sc_core::sc_in<sc_dt::sc_bv<3>> awprot;

    /* Write data channel.  */
    sc_core::sc_in<bool> wvalid;
    sc_core::sc_out<bool> wready;
    sc_core::sc_in<sc_dt::sc_bv<DATA_WIDTH>> wdata;
    sc_core::sc_in<sc_dt::sc_bv<DATA_WIDTH / 8>> wstrb;

    /* Write response channel.  */
    sc_core::sc_out<bool> bvalid;
    sc_core::sc_in<bool> bready;
    sc_core::sc_out<sc_dt::sc_bv<2>> bresp;

    /* Read address channel.  */
    sc_core::sc_in<bool> arvalid;
    sc_core::sc_out<bool> arready;
    sc_core::sc_in<sc_dt::sc_bv<ADDR_WIDTH>> araddr;
    sc_core::sc_in<sc_dt::sc_bv<3>> arprot;

    /* Read data channel.  */
    sc_core::sc_out<bool> rvalid;
    sc_core::sc_in<bool> rready;
    sc_core::sc_out<sc_dt::sc_bv<DATA_WIDTH>> rdata;
    sc_core::sc_out<sc_dt::sc_bv<2>> rresp;

    axilite2tlm(sc_core::sc_module_name name)
        : sc_core::sc_module(name)
        , axi_common(this)
        ,

        clk("clk")
        , resetn("resetn")
        ,

        awvalid("awvalid")
        , awready("awready")
        , awaddr("awaddr")
        , awprot("awprot")
        ,

        wvalid("wvalid")
        , wready("wready")
        , wdata("wdata")
        , wstrb("wstrb")
        ,

        bvalid("bvalid")
        , bready("bready")
        , bresp("bresp")
        ,

        arvalid("arvalid")
        , arready("arready")
        , araddr("araddr")
        , arprot("arprot")
        ,

        rvalid("rvalid")
        , rready("rready")
        , rdata("rdata")
        ,

        m_maxReadTransactions(16)
        , m_maxWriteTransactions(16)
        , m_numReadTransactions(0)
        , m_numWriteTransactions(0)
        , m_cur_TLM_rd(NULL)
        , m_cur_TLM_wr(NULL) {
        SC_THREAD(read_address_phase);
        SC_THREAD(read_data_phase);

        SC_THREAD(write_address_phase);
        SC_THREAD(write_data_phase);
        SC_THREAD(write_resp_phase);

        SC_THREAD(run_tlm_reads);
        SC_THREAD(run_tlm_writes);

        SC_THREAD(reset);
    }

private:
    class Transaction {
    public:
        Transaction(tlm::tlm_command cmd, std::uint64_t address, std::uint8_t AxProt, bool with_be = false)
            : m_gp(new tlm::tlm_generic_payload())
            , m_genattr(new extensions::genattr())
            , m_delay(sc_core::SC_ZERO_TIME)
            , m_abortScheduled(false) {
            std::uint8_t* data = new std::uint8_t[DATA_BUS_BYTES];

            if (IsNonSecure(AxProt)) {
                m_genattr->set_non_secure();
            }
            m_genattr->set_bufferable(false);
            m_genattr->set_modifiable(false);
            m_genattr->set_read_allocate(false);
            m_genattr->set_write_allocate(false);

            m_gp->set_command(cmd);
            m_gp->set_address(Align(address, DATA_BUS_BYTES));
            m_gp->set_data_length(DATA_BUS_BYTES);
            m_gp->set_data_ptr(reinterpret_cast<unsigned char*>(data));

            if (with_be) {
                std::uint8_t* be = new std::uint8_t[DATA_BUS_BYTES];

                m_gp->set_byte_enable_ptr(reinterpret_cast<unsigned char*>(be));
                m_gp->set_byte_enable_length(DATA_BUS_BYTES);
            } else {
                m_gp->set_byte_enable_ptr(NULL);
                m_gp->set_byte_enable_length(0);
            }

            m_gp->set_streaming_width(DATA_BUS_BYTES);
            m_gp->set_dmi_allowed(false);
            m_gp->set_response_status(tlm::TLM_INCOMPLETE_RESPONSE);

            m_gp->set_extension(m_genattr);
        }

        ~Transaction() {
            delete[] m_gp->get_data_ptr();

            if (m_gp->get_byte_enable_ptr()) {
                delete[] m_gp->get_byte_enable_ptr();
            }

            delete m_gp; // Also deletes m_genattr
        }

        std::uint64_t Align(std::uint64_t addr, std::uint64_t alignTo) {
            return (addr / alignTo) * alignTo;
        }

        bool IsNonSecure(std::uint8_t AxProt) {
            return (AxProt & AXI_PROT_NS) == AXI_PROT_NS;
        }

        tlm::tlm_response_status GetTLMResponse() {
            return m_gp->get_response_status();
        }

        template<typename T1, typename T2>
        void FillData(T1& wdata, T2& wstrb) {
            unsigned char* gp_data = m_gp->get_data_ptr();
            unsigned char* be = m_gp->get_byte_enable_ptr();

            //
            // Fill in data or mark the byte as TLM_DISABLED.
            // All data accesses use the full width of the data bus.
            //
            for (unsigned int i = 0; i < DATA_BUS_BYTES; i++) {
                if (wstrb.read().bit(i)) {
                    int firstbit = i * 8;
                    int lastbit = firstbit + 8 - 1;

                    assert(i < m_gp->get_data_length());
                    be[i] = TLM_BYTE_ENABLED;
                    gp_data[i] = wdata.read().range(lastbit, firstbit).to_uint();
                } else {
                    be[i] = TLM_BYTE_DISABLED;
                }
            }
        }

        template<typename T>
        void GetData(T& data) {
            unsigned char* gp_data = m_gp->get_data_ptr();

            // All data accesses use the full width of the data bus.
            for (unsigned int i = 0; i < DATA_BUS_BYTES; i++) {
                int firstbit = i * 8;
                int lastbit = firstbit + 8 - 1;

                data.range(lastbit, firstbit) = gp_data[i];
            }
        }

        tlm::tlm_generic_payload* GetGP() {
            return m_gp;
        }

        //
        // Drop byte enables if all bytes are enabled
        //
        void TryDropBE() {
            unsigned be_len = m_gp->get_byte_enable_length();
            unsigned char* be = m_gp->get_byte_enable_ptr();
            unsigned int i;

            // If all bytes are enabled delete byte_enable
            for (i = 0; i < be_len; i++) {
                if (be[i] != TLM_BYTE_ENABLED) {
                    break;
                }
            }

            if (i == be_len) {
                // All are enabled
                m_gp->set_byte_enable_ptr(NULL);
                m_gp->set_byte_enable_length(0);

                delete[] be;
            }
        }

        inline bool GetBufferable(std::uint8_t AxCache) {
            return AxCache & 0x1;
        }

        inline bool GetModifiable(std::uint8_t AxCache) {
            return (AxCache >> 1) & 0x1;
        }

        inline bool GetReadAllocate(std::uint8_t AxCache) {
            return (AxCache >> 2) & 0x1;
        }

        inline bool GetWriteAllocate(std::uint8_t AxCache) {
            return (AxCache >> 3) & 0x1;
        }

        void SetAbortScheduled() { m_abortScheduled = true; }
        bool AbortScheduled() { return m_abortScheduled; }

    private:
        tlm::tlm_generic_payload* m_gp;
        extensions::genattr* m_genattr;
        sc_core::sc_time m_delay;

        bool m_abortScheduled;
    };

    void RunTLMTransaction(Transaction*& tr, sc_core::sc_fifo<Transaction*>* inFifo, sc_core::sc_fifo<Transaction*>* outFifo) {
        while (true) {
            tlm::tlm_generic_payload* m_gp;
            sc_core::sc_time delay(sc_core::SC_ZERO_TIME);

            tr = inFifo->read();

            m_gp = tr->GetGP();

            socket->b_transport(*m_gp, delay);

            //
            // If reset gets asserted while running the TLM
            // transaction the reset thread shedules abort.
            //
            if (reset_asserted() || tr->AbortScheduled()) {
                delete tr;
                tr = NULL;

                //
                // Only wait for reset release if still in
                // reset. b_transport can return after release
                // has happened.
                //
                if (reset_asserted()) {
                    wait_for_reset_release();
                }
                continue;
            }

            //
            // Wait for annotated delay but abort if reset is
            // asserted.
            //
            wait(delay, resetn.negedge_event());

            if (reset_asserted()) {
                delete tr;
                tr = NULL;
                wait_for_reset_release();
                continue;
            }

            outFifo->write(tr);

            // Mark as no TLM ongoing (for reset functionality)
            tr = NULL;
        }
    }

    void run_tlm_reads() {
        RunTLMTransaction(m_cur_TLM_rd, &rtFifo, &rdDataFifo);
    }

    void run_tlm_writes() {
        RunTLMTransaction(m_cur_TLM_wr, &wtFifo, &wrRespFifo);
    }

    void read_address_phase() {
        while (true) {
            if (m_numReadTransactions < m_maxReadTransactions) {
                arready.write(true);
            } else {
                arready.write(false);
            }

            wait(clk.posedge_event() | resetn.negedge_event());

            if (reset_asserted()) {
                wait_for_reset_release();
                continue;
            }

            if (arvalid.read() && arready.read()) {
                // Sample read address and control lines
                Transaction* rt = new Transaction(tlm::TLM_READ_COMMAND, araddr.read().to_uint64(), arprot.read().to_uint());

                rtFifo.write(rt);

                m_numReadTransactions++;
            }
        }
    }

    void read_data_phase() {
        rvalid.write(false);

        while (true) {
            Transaction* rt = rdDataFifo.read();
            sc_dt::sc_bv<DATA_WIDTH> tmp;

            // Set AXI response
            switch (rt->GetTLMResponse()) {
            case tlm::TLM_ADDRESS_ERROR_RESPONSE:
                rresp.write(AXI_DECERR);
                break;
            case tlm::TLM_GENERIC_ERROR_RESPONSE:
                rresp.write(AXI_SLVERR);
                break;
            default:
            case tlm::TLM_OK_RESPONSE:
                rresp.write(AXI_OKAY);
                break;
            }

            rt->GetData(tmp);

            rdata.write(tmp);
            rvalid.write(true);

            // Wait for rready but abort if reset is asserted
            wait_abort_on_reset(rready);

            rvalid.write(false);

            delete rt;

            if (reset_asserted()) {
                wait_for_reset_release();
                //
                // m_numReadTransactions will be set to zero in
                // the reset thread
                //
            } else {
                m_numReadTransactions--;
            }
        }
    }

    void write_address_phase() {
        while (true) {
            if (m_numWriteTransactions < m_maxWriteTransactions) {
                awready.write(true);
            } else {
                awready.write(false);
            }

            wait(clk.posedge_event() | resetn.negedge_event());

            if (reset_asserted()) {
                wait_for_reset_release();
                continue;
            }

            if (awvalid.read() && awready.read()) {
                // Sample write address and control lines
                Transaction* wt = new Transaction(tlm::TLM_WRITE_COMMAND, awaddr.read().to_uint64(), awprot.read().to_uint(), true);
                wrDataFifo.write(wt);
                m_numWriteTransactions++;
            }
        }
    }

    void write_data_phase() {
        while (true) {
            Transaction* wt;

            wt = wrDataFifo.read();

            wready.write(true);

            // Wait for wvalid but abort if reset is asserted
            wait_abort_on_reset(wvalid);

            wready.write(false);

            if (reset_asserted()) {
                wait_for_reset_release();
                continue;
            }

            wt->FillData(wdata, wstrb);

            wt->TryDropBE();

            wtFifo.write(wt);
        }
    }

    void write_resp_phase() {
        bvalid.write(false);

        while (true) {
            Transaction* wt = wrRespFifo.read();

            // Set AXI response
            switch (wt->GetTLMResponse()) {
            case tlm::TLM_ADDRESS_ERROR_RESPONSE:
                bresp.write(AXI_DECERR);
                break;
            case tlm::TLM_GENERIC_ERROR_RESPONSE:
                bresp.write(AXI_SLVERR);
                break;
            default:
            case tlm::TLM_OK_RESPONSE:
                bresp.write(AXI_OKAY);
                break;
            }

            bvalid.write(true);

            // Wait for bready but abort if reset is asserted
            wait_abort_on_reset(bready);

            bvalid.write(false);

            delete wt;

            if (reset_asserted()) {
                //
                // m_numWriteTransactions is set to zero in the
                // reset thread
                //
                wait_for_reset_release();
            } else {
                m_numWriteTransactions--;
            }
        }
    }

    void reset() {
        while (true) {
            wait(resetn.negedge_event());

            //
            // Reset got asserted, abort all transactions
            //

            axi2tlm_clear_fifo(rdDataFifo);
            axi2tlm_clear_fifo(wrRespFifo);

            axi2tlm_clear_fifo(wrDataFifo);

            axi2tlm_clear_fifo(rtFifo);
            axi2tlm_clear_fifo(wtFifo);

            if (m_cur_TLM_rd) {
                m_cur_TLM_rd->SetAbortScheduled();
            }
            if (m_cur_TLM_wr) {
                m_cur_TLM_wr->SetAbortScheduled();
            }

            m_numReadTransactions = 0;
            m_numWriteTransactions = 0;
        }
    }

    sc_core::sc_fifo<Transaction*> rdDataFifo;
    sc_core::sc_fifo<Transaction*> wrRespFifo;

    sc_core::sc_fifo<Transaction*> wrDataFifo;

    unsigned int m_maxReadTransactions;
    unsigned int m_maxWriteTransactions;
    unsigned int m_numReadTransactions;
    unsigned int m_numWriteTransactions;

    sc_core::sc_fifo<Transaction*> rtFifo;
    sc_core::sc_fifo<Transaction*> wtFifo;

    Transaction* m_cur_TLM_rd;
    Transaction* m_cur_TLM_wr;

    static const std::uint32_t DATA_BUS_BYTES = DATA_WIDTH / 8;
};

} /* namespace detail */

using detail::axilite2tlm;

} /* namespace sctlm::tlm_lib::bridges */

#endif /* SCTLM_TLM_LIB_BRIDGES_AXILITE2TLM_BRIDGE_HPP_INCLUDED */
