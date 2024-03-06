# Run the post script to install necessary packages and run the experiment
import subprocess
import time
import threading


p = subprocess.Popen('sh post-script.sh', shell=True)
p.wait()


def run_arch_gen():
    subprocess.Popen('cd architecture-generator/ && exec sbt "runMain fullSysGen.ServerEmitter"', shell=True)


def runTesting():
    time.sleep(30)  
    
    # Generate the circuits to be simulated
    g1 = subprocess.Popen('cd evaluation/HardCilk/simulations/paper_exp_dae_0 && python3 generate_bulk.py', shell=True)
    g2 = subprocess.Popen('cd evaluation/HardCilk/simulations/paper_exp_dae_1 && python3 generate_bulk.py', shell=True)
    g3 = subprocess.Popen('cd evaluation/HardCilk/simulations/paper_exp1 && python3 generate_bulk.py', shell=True)
    g4 = subprocess.Popen('cd evaluation/HardCilk/simulations/paper_exp2 && python3 generate_bulk.py', shell=True)
    g5 = subprocess.Popen('cd evaluation/HardCilk/simulations/paper_exp3 && python3 generate_bulk.py', shell=True)

    g1.wait()
    g2.wait()
    g3.wait()
    g4.wait()
    g5.wait()

    # Run cmake and make
    p = subprocess.Popen('cd evaluation/HardCilk && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make -j 8', shell=True)
    p.wait()
    
    # symbolic links for the runner
    p = subprocess.Popen('cd evaluation/HardCilk/simulations && mkdir run && mkdir run/bin', shell=True)
    p.wait()    
    
    l1 = subprocess.Popen('cd evaluation/HardCilk/simulations/run/bin && ln -s ../../../build/simulations/paper_exp_dae_0/simulation_paper_exp_dae_0', shell=True)
    l2 = subprocess.Popen('cd evaluation/HardCilk/simulations/run/bin && ln -s ../../../build/simulations/paper_exp_dae_1/simulation_paper_exp_dae_1', shell=True)
    l3 = subprocess.Popen('cd evaluation/HardCilk/simulations/run/bin && ln -s ../../../build/simulations/paper_exp1/simulation_paper_exp1', shell=True)
    l4 = subprocess.Popen('cd evaluation/HardCilk/simulations/run/bin && ln -s ../../../build/simulations/paper_exp2/simulation_paper_exp2', shell=True)
    l5 = subprocess.Popen('cd evaluation/HardCilk/simulations/run/bin && ln -s ../../../build/simulations/paper_exp3/simulation_paper_exp3', shell=True)

    l1.wait()
    l2.wait()
    l3.wait()
    l4.wait()
    l5.wait()


    # Run the experiments
    p = subprocess.Popen('cd evaluation/HardCilk/simulations && python3 run_exp_all.py --run --force --num-workers 8', shell=True)
    p.wait()

    # copy results to /results
    p = subprocess.Popen('cp -r evaluation/HardCilk/simulations/run /results', shell=True)
    p.wait()

    print("Experiments Finished!")


# Create threads for each function
thread1 = threading.Thread(target=run_arch_gen)
thread2 = threading.Thread(target=runTesting)

# Start the threads
thread1.start()
thread2.start()

# Join the the testing thread
thread2.join()
