create_clock -name clk -period 4.0 [get_ports clock]
set_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports clock]

# set_input_delay 0 -clock clk  [all_inputs]
# set_output_delay 0 -clock clk [all_outputs]
