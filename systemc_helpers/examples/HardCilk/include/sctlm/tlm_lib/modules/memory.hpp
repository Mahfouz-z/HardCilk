/*
 * Copyright (c) 2011 Edgar E. Iglesias.
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
 */

#ifndef SCTLM_TLM_LIB_MODULES_MEMORY_HPP_INCLUDED
#define SCTLM_TLM_LIB_MODULES_MEMORY_HPP_INCLUDED

#include <cstddef>
#include <cstdint>

#include <memory>

#include <systemc>
#include <tlm>

#include <tlm_utils/simple_initiator_socket.h>
#include <tlm_utils/simple_target_socket.h>

namespace sctlm::tlm_lib::modules {

class memory
    : public sc_core::sc_module {
public:
    tlm_utils::simple_target_socket<memory> socket;

    /** @brief Memory access latency. */
    const sc_core::sc_time latency;

    /** @brief Size of the memory. */
    const std::size_t size;

    /** @brief Number of parallel requests handled by the memory. */
    const std::size_t parallelRequests;

    /**
     * @brief Creates a new `memory` object.
     *
     * @param parallelRequests Number of parallel requests to be processed.
     * If zero, the memory can use DMI.
     */
    memory(
        sc_core::sc_module_name name,
        sc_core::sc_time latency,
        std::size_t size,
        std::uint32_t parallelRequests = 0,
        std::uint8_t* buf = nullptr
    );

    bool dmiEnabled() const noexcept {
        return dmiEnabled_;
    }

    /**
     * @brief Enables DMI.
     *
     * @note DMI is disabled by default if the memory model has parallelRequests != 0.
     *
     */
    void dmiEnable();

    /**
     * @brief Disables DMI.
     *
     */
    void dmiDisable();

    /**
     * @brief Restores the default behavior of the DMI.
     *
     */
    void dmiDefault();

    virtual void b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay);
    virtual bool get_direct_mem_ptr(tlm::tlm_generic_payload& trans, tlm::tlm_dmi& dmi_data);
    virtual unsigned int transport_dbg(tlm::tlm_generic_payload& trans);

private:
    std::uint8_t* mem_;

    /** @brief Semaphore to model exclusive accesses to the memory. */
    sc_core::sc_semaphore semaphore_;

    /** @brief If parallel requests are not enabled, we can use DMI. */
    bool dmiEnabled_;

    /** @brief owned buffer object. */
    std::unique_ptr<std::uint8_t[]> buffer_;
};

} /* namespace sctlm::tlm_lib::modules */

#endif /* SCTLM_TLM_LIB_MODULES_MEMORY_HPP_INCLUDED */
