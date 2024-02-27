#ifndef HARDCILK_TOP_HPP_INCLUDED
#define HARDCILK_TOP_HPP_INCLUDED

#include <systemc>

#include <memory>
#include <vector>

#include <sctlm/tlm_lib/tlm_module.hpp>

#include <hardcilk/Context.hpp>

namespace hardcilk {

struct Top : sc_core::sc_module, sctlm::tlm_lib::tlm_module {
    SC_HAS_PROCESS(Top);

    sc_core::sc_in<bool> clock;
    sc_core::sc_in<bool> reset;

    Context& context;

    Top(sc_core::sc_module_name const& name, Context& context);

    SCTLM_TLM_MODULE()

    SCTLM_TLM_BEGIN_PORTS()

    SCTLM_TLM_END_PORTS()

    void verilated_trace(VerilatedVcdC* tfp, int levels, int options = 0) override {
        system_->verilated_trace(tfp, levels, options);
    }

private:
    std::unique_ptr<tlm_module> system_;
    std::vector<std::unique_ptr<tlm_module>> tlm_modules_;
    std::vector<std::unique_ptr<sc_core::sc_module>> modules_;
};

} /* namespace hardcilk */

#endif /* HARDCILK_TOP_HPP_INCLUDED */
