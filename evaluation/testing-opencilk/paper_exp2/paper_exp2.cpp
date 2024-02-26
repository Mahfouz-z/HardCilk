#include <cilk/cilk.h>
#include <iostream>


using namespace std;


struct timespec start_time, end_time;

inline void wait(volatile int count = 128){
    for(volatile int i = 0; i < count; i++){
        continue;
    }
}


#define MAX_INIT_COUNT 8
#define BRANCH_FACTOR 6
#define BASE_DEPTH 2

#define SERIAL_TASKS 2

int DELAY_LOOPS = 32;
int total_tasks = 0;

void paper_exp2(
                    volatile int depth
                ){     
        total_tasks++;   
        if(depth != 0) {
            for(int i = 0; i < BRANCH_FACTOR; i++){
                wait(DELAY_LOOPS);
                if(i < SERIAL_TASKS) { 
                    cilk_spawn paper_exp2(depth - 1);
                    cilk_sync;
                } else {
                    cilk_spawn paper_exp2(depth - 1);    
                }  

            }
        } else {
            wait(DELAY_LOOPS);
        }
}


// in cilk1
/*
void paper_exp2(    
                    cont reutrAddress,
                    int iterator,
                    volatile int depth, 
                ){
        
        if(depth == 0) {
            wait(DELAY_LOOPS);
            sendArgument(returnAddress, 0);
            return; 
        }

        for(int i = iterator; i < BRANCH_FACTOR; i++){
            wait(DELAY_LOOPS);
            if(i < SERIAL_TASKS) { 
                newReturnAddress = spawnNext paper_exp2(returnAddress, i+1, depth); // get the address of the iterator to return to
                spawn paper_exp2(newReturnAddress, 0, depth - 1);
                return;
            }
            else {
                spawn paper_exp2(returnAddress, 0, depth - 1);    
            }  
        }
        sendArgument(returnAddress, 0);
}
*/

void root(){
    for(int i = 0; i < MAX_INIT_COUNT; i++){
        cilk_spawn paper_exp2(i + BASE_DEPTH);
    }  
}

int main(int argc, char *argv[]){
    if(argc > 1){
        DELAY_LOOPS = atoi(argv[1]);
    }
    cilk_spawn root();
    cilk_sync;
    cout << "Total tasks: " << total_tasks << endl; 
}


// clang++ paper_exp2/paper_exp2.cpp  -fopencilk -fcilktool=cilkscale -O3 -o paper_exp2/paper_exp2_scale
// CILK_NWORKERS=8 ./paper_exp2/paper_exp2_scale

// clang++ paper_exp2/paper_exp2.cpp  -fopencilk -fcilktool=cilkscale-benchmark -O3 -o paper_exp2/paper_exp2_benchmark
// CILK_NWORKERS=8 ./paper_exp2/paper_exp2_benchmark


// clang++ paper_exp2/paper_exp2.cpp  -fopencilk -fcilktool=cilkscale-instructions -O3 -o paper_exp2/paper_exp2_inst
// CILK_NWORKERS=8 ./paper_exp2/paper_exp2_inst

// python3 ../Downloads/OpenCilk-2.0.0-x86_64-Linux-Ubuntu-22.04/share/Cilkscale_vis/cilkscale.py     -c ./paper_exp2/paper_exp2_scale -b ./paper_exp2/paper_exp2_benchmark     -ocsv paper_exp2/cstable_qsort.csv -oplot paper_exp2/csplots_qsort.pdf 