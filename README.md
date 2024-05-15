# This repo includes the open source code corresponding to the FCCM'24 paper "HardCilk: Cilk-like Task Parallelism for FPGAs" 

You can find the paper [here](https://www.epfl.ch/labs/lap/wp-content/uploads/2024/05/ShahawyMay24-HardCilk-Cilk-like-Task-Parallelism-for-FPGAs-FCCM.pdf).
You can find the conference presentation video [here](https://youtu.be/1EjEUD5sPpg).

## Installing the Docker image
### Run inside the repo directory to build the image
>docker build -t evalimage .

### Run inside the repo directory to run the image in interactive mode
>docker run -it -v "$(pwd)":/mnt evalimage /bin/bash

### In the docker image terminal run this command to install necessary libraries
>sh /mnt/post-script.sh 

## Running the architectural generator
The architectural generator enables custom creation of the architecture described in the paper for any arbitrary task parallel algorithm described in [Cilk](https://dl.acm.org/doi/10.1145/209937.209958) syntax. 
1. Specify the JSON descriptor file for the code you to generate its circuit. An example descriptor for the fib example in the paper can be found in this [link](https://github.com/Mahfouz-z/HardCilk/blob/main/architecture-generator/taskDescriptors/fibonacci.json).
2. In the architecture-generator directory run:
   > exec sbt "runMain fullSysGen.CommandLineEmitter <path_to_JSON_file>"
3. You can find the output Verilog files in the output directory under the architecture-generator directory. The output Verilog has AXI4 and AXI-stream interfaces that you can easily integrate with your PEs and memory system. The interfaces are also compliant with the Vivado IP integrator which makes it easier to connect the ports.

## Running the paper evaluation
### In the docker image terminal run the following command to run the generator server, wait for the server to show that it is running before running the next command
>cd ~/repos/HardCilk/architecture-generator/ && exec sbt "runMain fullSysGen.ServerEmitter"

### In your device terminal run the following command to get the container id
>docker ps

### Use the container id to connect to a new terminal instance in the image 
> docker exec -it \<container-id\> /bin/bash


### Inside the docker image from the new terminal in the ~/repos/HardCilk directory, run the following command to run the HardCilk experiments
>python3 run_evaluation.py

