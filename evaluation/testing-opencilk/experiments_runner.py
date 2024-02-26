import subprocess
import os

# Create an output text file to dump the output of the experiments, it should be under output directory
# create the directory if it does not exist
if not os.path.exists("output"):
    os.makedirs("output")

# in the output folder, check for files names with the pattern experiments_output_{index}.txt, if it exists, create a new file with the next index
output_file_index = 0
while os.path.exists(f"output/experiments_output_{output_file_index}.txt"):
    output_file_index += 1

output_file = open(f"output/experiments_output_{output_file_index}.txt", "w+")

# Create an array of delays to be used in the experiments
# delays = [16, 32, 64, 128, 256, 512, 1024]
delays = [16, 32, 64]

# Number of workers
num_workers = 8
worker_setting_string = "CILK_NWORKERS="
compile_command = "clang++"
compile_flags = "-fopencilk -fcilktool=cilkscale-benchmark -O3 -o"
T1_CALCULATION_ROUNDS = 2
TN_CALCULATION_ROUNDS = 2

def getT1(exp_name, delay):
    # Compile the experiment
    subprocess.run(f"{compile_command} {exp_name}/{exp_name}.cpp {compile_flags} {exp_name}/{exp_name}_benchmark", shell=True)
    # Run the experiment
    T1 = 0
    for i in range(T1_CALCULATION_ROUNDS):
        output = subprocess.run(f"{worker_setting_string}1 ./{exp_name}/{exp_name}_benchmark {delay}", shell=True, capture_output=True).stdout
        # extract T1 as float from the output, in line 2 after the second comma and remove the newline character 
        T1 += float(output.decode("utf-8").split(",")[2].replace("\n", ""))
    T1 = (T1 / T1_CALCULATION_ROUNDS).__round__(9)
    return T1

# compile and run each round of experiments
# exp_list = ["paper_exp1", "paper_exp2", "paper_exp3"]
exp_list = ["paper_exp1"]

# Calculate total number of experiments
total_experiments = len(exp_list) * len(delays)

# Create a progress bar
progress_bar = 0

# Create a function that takes the total number of experiments and the progres_bar and shows the progress bar
def show_progress_bar(total_experiments, progres_bar):
    print(f"Progress: {progress_bar}/{total_experiments} ({progress_bar/total_experiments*100}%)")

# For each delay compile and run experiment 1 using pipes, get the output as a string variable
for exp in exp_list:
    
    output_file.write(f"Experiment: {exp}\n")
    
    for delay in delays:        
        T1 = getT1(exp, delay)
        TN = 0
        for i in range(TN_CALCULATION_ROUNDS):
            # Run the experiment
            output = subprocess.run(f"{worker_setting_string}{num_workers} ./{exp}/{exp}_benchmark {delay}", shell=True, capture_output=True).stdout
            # extract TN as float from the output, in line 2 after the first comma 
            TN += float(output.decode("utf-8").split(",")[2].replace("\n", ""))
        TN = (TN / TN_CALCULATION_ROUNDS).__round__(9)
        # Calculate perfect speedup
        TN_perfect = (T1 / num_workers).__round__(9)
        # Calculate efficiency to the nearest second decimal
        efficiency_percentage = (TN_perfect * 100 / TN).__round__(2)

        # Write the results to the output file
        # output the data but align the columns
        output_file.write(f"\t Workers Count {num_workers:>12} | Delay: {delay:>12} | T1: {T1:>12} | TN_perfect: {TN_perfect:>12}  | TN: {TN:>12} | Efficiency: {efficiency_percentage:>12}%\n")
        
        progress_bar += 1
        show_progress_bar(total_experiments, progress_bar)
    
    output_file.write("===================================================\n")



# Close the output file
output_file.close()


# cluster

# sudo adduser shahawy
# sudo usermod -aG sudo shahawy
# su shahawy
# sudo apt-get update
# sudo apt-get install build-essential
# wget https://github.com/OpenCilk/opencilk-project/releases/download/opencilk/v2.0/OpenCilk-2.0.0-x86_64-Linux-Ubuntu-22.04.sh
# sh OpenCilk-2.0.0-x86_64-Linux-Ubuntu-22.04.sh
# echo 'export PATH="/home/shahawy/OpenCilk-2.0.0-x86_64-Linux-Ubuntu-22.04/bin:$PATH"' >> ~/.bashrc
# source ~/.bashrc
# echo off | sudo tee /sys/devices/system/cpu/smt/control
