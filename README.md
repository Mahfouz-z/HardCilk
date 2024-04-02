## Running evaluation directions
### Run inside the repo directory to build the image
>docker build -t evalimage .

### Run inside the repo directory to run the image in interactive mode
>docker run -it -v "$(pwd)":/mnt evalimage /bin/bash

### In the docker image terminal run this command to install necessary libraries
>sh /mnt/post-script.sh 

### In the docker image terminal run the following command to run the generator server, wait for the server to show that it is running before running the next command
>cd ~/repos/HardCilk/architecture-generator/ && exec sbt "runMain fullSysGen.ServerEmitter"

### In your device terminal run the following command to get the container id
>docker ps

### Use the container id to connect to a new terminal instance in the image 
> docker exec -it \<container-id\> /bin/bash


### Inside the docker image from the new terminal in the ~/repos/HardCilk directory, run the following command to run the HardCilk experiments
>python3 run_evaluation.py

