#include <cilk/cilk.h>
#include <iostream>


using namespace std;


#define MAX_INIT_COUNT 8
#define BRANCH_FACTOR 6
#define BASE_DEPTH 2

int DELAY_LOOPS = 16;

inline void wait(volatile int count = 128){
    for(volatile int i = 0; i < count; i++){
        continue;
    }
}

void task2(){
    wait(DELAY_LOOPS/2);
}


void paper_exp3(
                  volatile int depth 
                ){
        if(depth != 0) {
            for(int i = 0; i < BRANCH_FACTOR; i++){
                wait(DELAY_LOOPS/2);
                cilk_spawn task2();
                cilk_spawn paper_exp3(depth - 1);
            }
        } else {
            wait(DELAY_LOOPS/2);
            //cilk_spawn task2();
        }
}

void root(){
    for(int i = 0; i < MAX_INIT_COUNT; i++){
        cilk_spawn paper_exp3(i + BASE_DEPTH);
    }  
}


int main(int argc, char *argv[]){
    if(argc > 1){
        DELAY_LOOPS = atoi(argv[1]);
    }
    cilk_spawn root();
    cilk_sync;
}



// ../Downloads/OpenCilk-2.0.0-x86_64-Linux-Ubuntu-22.04/bin/clang++ paper_exp3/paper_exp3.cpp  -fopencilk -fcilktool=cilkscale -O3 -o paper_exp3/paper_exp3_scale
// CILK_NWORKERS=8 ./paper_exp3/paper_exp3_scale

// ../Downloads/OpenCilk-2.0.0-x86_64-Linux-Ubuntu-22.04/bin/clang++ paper_exp3/paper_exp3.cpp  -fopencilk -fcilktool=cilkscale-benchmark -O3 -o paper_exp3/paper_exp3_benchmark
// CILK_NWORKERS=8 ./paper_exp3/paper_exp3_benchmark

// ../Downloads/OpenCilk-2.0.0-x86_64-Linux-Ubuntu-22.04/bin/clang++ paper_exp3/paper_exp3.cpp  -fopencilk -fcilktool=cilkscale-instructions -O3 -o paper_exp3/paper_exp3_inst
// CILK_NWORKERS=8 ./paper_exp3/paper_exp3_inst

// python3 ../Downloads/OpenCilk-2.0.0-x86_64-Linux-Ubuntu-22.04/share/Cilkscale_vis/cilkscale.py     -c ./paper_exp3/paper_exp3_scale -b ./paper_exp3/paper_exp3_benchmark     -ocsv paper_exp3/cstable_qsort.csv -oplot paper_exp3/csplots_qsort.pdf 