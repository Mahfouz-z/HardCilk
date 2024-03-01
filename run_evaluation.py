# Run the post script to install necessary packages and run the experiment
import subprocess
import os
import time

subprocess.Popen('sh post-script.sh', shell=True)

def run_arch_gen():
    subprocess.Popen('cd architecture-generator/ && exec sbt "runMain fullSysGen.ServerEmitter"', shell=True)

processid = os.fork()

if processid > 0 :
    run_arch_gen()

else:
    time.sleep(30) # Wait some time for the archGen server to launch
    
    # Generate the circuits to be simulated
    subprocess.Popen('cd evaluation/HardCilk/simulations/paper_exp_dae_0 && python3 generate_bulk.py', shell=True)
    subprocess.Popen('cd evaluation/HardCilk/simulations/paper_exp_dae_1 && python3 generate_bulk.py', shell=True)
    subprocess.Popen('cd evaluation/HardCilk/simulations/paper_exp1 && python3 generate_bulk.py', shell=True)
    subprocess.Popen('cd evaluation/HardCilk/simulations/paper_exp2 && python3 generate_bulk.py', shell=True)
    subprocess.Popen('cd evaluation/HardCilk/simulations/paper_exp3 && python3 generate_bulk.py', shell=True)

    # Run cmake and make
    subprocess.Popen('cd evaluation/HardCilk && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make -j 8', shell=True)

    # symbolic links for the runner
    subprocess.Popen('cd evaluation/HardCilk/simulations && mkdir run && mkdir run/bin', shell=True)
    subprocess.Popen('cd evaluation/HardCilk/simulations/run/bin && ln -s ../../../build/simulations/paper_exp_dae_0/simulation_paper_exp_dae_0', shell=True)
    subprocess.Popen('cd evaluation/HardCilk/simulations/run/bin && ln -s ../../../build/simulations/paper_exp_dae_1/simulation_paper_exp_dae_1', shell=True)
    subprocess.Popen('cd evaluation/HardCilk/simulations/run/bin && ln -s ../../../build/simulations/paper_exp1/simulation_paper_exp1', shell=True)
    subprocess.Popen('cd evaluation/HardCilk/simulations/run/bin && ln -s ../../../build/simulations/paper_exp2/simulation_paper_exp2', shell=True)
    subprocess.Popen('cd evaluation/HardCilk/simulations/run/bin && ln -s ../../../build/simulations/paper_exp3/simulation_paper_exp3', shell=True)

    # Run the experiments
    subprocess.Popen('cd evaluation/HardCilk/simulations && python3 run_exp_all.py', shell=True)

    # copy results to /results
    subprocess.Popen('cp -r evaluation/HardCilk/simulations/run /results', shell=True)
