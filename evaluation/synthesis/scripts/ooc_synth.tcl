set_param general.maxThreads 6

proc ft_synth { hdl_dir out_dir design } {
    # Alveo U280 part
    set ft_part xcu280-fsvh2892-2L-e

    read_verilog [ glob ./$hdl_dir/*.v ]
    read_xdc [ glob ./$hdl_dir/*.xdc ]

    synth_design -part $ft_part -top $design -mode out_of_context > $out_dir/1.synth_design.log

    write_checkpoint -force $out_dir/post_synth

    report_utilization -hierarchical -hierarchical_depth 8 -file $out_dir/utilization_hier.post_synth.txt
    report_utilization -hierarchical -hierarchical_depth 8 -hierarchical_percentages -file $out_dir/utilization_hier_perc.post_synth.txt
    report_utilization -file $out_dir/utilization.post_synth.txt

    report_timing -file $out_dir/timing.post_synth.txt

    opt_design > $out_dir/2.opt_design.log
    place_design > $out_dir/3.place_design.log
    phys_opt_design > $out_dir/4.phys_opt_design.log
    route_design > $out_dir/5.route_design.log
    phys_opt_design > $out_dir/6.phys_opt_design.log

    write_checkpoint -force $out_dir/post_pr

    report_utilization -hierarchical -hierarchical_depth 8 -file $out_dir/utilization_hier.post_pr.txt
    report_utilization -hierarchical -hierarchical_depth 8 -hierarchical_percentages -file $out_dir/utilization_hier_perc.post_pr.txt
    report_utilization -file $out_dir/utilization.post_pr.txt
    
    report_timing -file $out_dir/timing.post_pr.txt
}
