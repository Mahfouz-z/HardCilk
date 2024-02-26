set_param general.maxThreads $MAXTHREADS
read_verilog [glob ./hdl/*.v]
read_xdc period.xdc
synth_design -top $TOP -part $PART -no_iobuf -mode out_of_context > syn.log
report_utilization > utilization.postsyn.rpt
report_timing > timing.postsyn.rpt
opt_design > opt.log
place_design > place.log
phys_opt_design > phyopt1.log
route_design > route.log
phys_opt_design > phyopt2.log
report_utilization > utilization.postpr.rpt
report_timing > timing.postpr.rpt

# write the done flag
set fp [open "vivadotiming.done" w]
puts $fp "done"
close $fp

