### Run inside the repo directory to build the image
>docker build -t evalimage .

### Run inside the repo directory to run the image in interactive mode
>docker run -it -v "$(pwd)":/mnt evaluation /bin/bash

### In the docker image terminal run this command to install necessary libraries
>sh /mnt/post-script.sh 

### Inside the docker image in the ~/repos/HardCilk directory, run the following command to run the HardCilk experiments
>python3 run_evaluation.py