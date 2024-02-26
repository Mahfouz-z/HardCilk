create_clock -name clk -period 1.000 [get_ports clock]
set_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports clock]

# set_input_delay 0 -clock CLK  [all_inputs]
# set_output_delay 0 -clock CLK [all_outputs]
