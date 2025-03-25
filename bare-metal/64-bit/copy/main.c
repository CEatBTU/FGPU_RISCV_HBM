#include <stdint.h>
#include <stdlib.h>

#include "common.h"
#include "kprintf.h"
#include "code.h"

#define FGPU_BASEADDR         0x60060000

// Control Registers of FGPU
#define STATUS_REG_ADDR         (FGPU_BASEADDR+ 0x8000)
#define START_REG_ADDR          (FGPU_BASEADDR+ 0x8004)
#define CLEAN_CACHE_REG_ADDR    (FGPU_BASEADDR+ 0x8008)
#define INITIATE_REG_ADDR       (FGPU_BASEADDR+ 0x800C)

// Macros
#define REG_READ(addr) \
    ({int val;int a=addr; asm volatile ("lw   %0,0(%1)\n" : "=r"(val) : "r"(a)); val;})

#define REG_WRITE(addr,val) \
    ({int v = val; int a = addr; __asm volatile ("sw  %1,0(%0)\n" :: "r"(a),"r"(v)); v;})

#define FENCE() \
    ({asm volatile ("fence iorw,iorw \n" );})
//fense.tso

//#define Start_Timer() Begin_Time = read_csr(0xB00)
//#define Stop_Timer() End_Time = read_csr(0xB00)
/*csrrw*/
// mcycle (0xB00) Machine cycle counter
//mcycleh (0xB80) Upper 32 bits of mcycle

extern unsigned int *code; // binary storde in code.c as an array
unsigned Size = 1024*1024;//256*1024; //4096;
unsigned maxSize = 1024*1024;

static void usleep(unsigned us) {
    uintptr_t cycles0;
    uintptr_t cycles1;
    asm volatile ("csrr %0, 0xB00" : "=r" (cycles0));
    for (;;) {
        asm volatile ("csrr %0, 0xB00" : "=r" (cycles1));
        if (cycles1 - cycles0 >= us * 100) break;
    }
}

uint64_t read_mcycle() {
    uint64_t cycles;
    asm volatile ("csrr %0, mcycle" : "=r"(cycles)); // Read the 64-bit mcycle register
    return cycles;
}

uint32_t elapsed_time(uint64_t start, uint64_t stop) {
    uint32_t res, resh, helperh, helper;
        res = (stop-start)*10; //10ns = 100MHz, 20ns = 50MHz
    return res;
}

int main(void) {
    uint32_t tstart, tstarth;
    uint32_t tstop, tstoph;
    
    kprintf("\n******************************************\n");
    kprintf("****************WElCOME!!!****************\n");
    kprintf("******************************************\n\n");
    
    kprintf("\n");
    kprintf("Initializing FGPU ... \n");
    ////////////////////////////////////////////////////////////////
    kprintf("Downloading code ... \n");
  
    volatile unsigned *cram_ptr = (unsigned *)(FGPU_BASEADDR+ 0x4000);
    
    unsigned int size_count = COPY_LEN;

    unsigned start_addr = COPY_WORD_POS;
    for(int i=0; i < size_count; i++){
        cram_ptr[i] = code[i];
    }
    
    kprintf("DONE! \n");
    kprintf("Preparing descriptor ... \n");
    
    unsigned wg_size0 = 512;
    unsigned wg_size = 0;
    unsigned wg_size1, wg_size2;
    unsigned problemSize = Size;
    unsigned offset0 = 0;
    unsigned offset1, offset2;
    unsigned nDim = 1;
    unsigned size0 = Size;
    unsigned size1, size2;
    unsigned size=0;
    unsigned n_wg0, n_wg1, n_wg2;
    unsigned nWF_WG;
    unsigned nParams;

    unsigned dataSize = 4 * problemSize; // 4 bytes per word

    kprintf("DONE! \n");
    ////////////////////////////////////////////////////////////////
    kprintf("Computing descriptor ... \n");
    
    //assert(wg_size0 > 0 && wg_size0 <= 512);
    //assert(size0 % wg_size0 == 0);
    size = size0;
    wg_size = wg_size0;
    n_wg0 = size0 / wg_size0;
    if(nDim > 1){
        //assert(wg_size1 > 0 && wg_size1 <= 512);
        //assert(size1 % wg_size1 == 0);
        size = size0 * size1;
        wg_size = wg_size0 * wg_size1;
        n_wg1 = size1 / wg_size1;
    }
    else{
        wg_size1 = n_wg1 = size1 = 0;
    }
    if(nDim > 2){
        //assert(wg_size2 > 0 && wg_size2 <= 512);
        //assert(size2 % wg_size2 == 0);
        size = size0 * size1 * size2;
        wg_size = wg_size0 * wg_size1 * wg_size2;
        n_wg2 = size2 / wg_size2;
    }
    else{
        wg_size2 = n_wg2 = size2 = 0;
    }
    //assert(wg_size <= 512);
    nWF_WG = wg_size / 64;
    if(wg_size % 64 != 0)
        nWF_WG++;

    kprintf("DONE! \n");
    
    offset0 = offset1 = offset2 = 0;
    nParams = 2; // number of parameters
   
    ////////////////////////////////////////////////////////////////
    
    kprintf("Initializing memory ... \n");
    unsigned param1[Size];
    unsigned target[Size];
    unsigned target_riscv[Size];
    //unsigned *param1, *target;
    unsigned *param_ptr = (unsigned *)param1;
    unsigned *target_ptr = (unsigned *)target;
    unsigned *target_riscv_ptr = (unsigned *)target_riscv;
        
    for(unsigned i = 0; i < Size; i++){
        param_ptr[i] = (unsigned)i;
        target_ptr[i] = 0;
        target_riscv_ptr[i] = 0;
    }

    FENCE();
    kprintf("param1: 0x%x \n", param1);
    kprintf("target: 0x%x \n", target);
    kprintf("DONE! \n");
    //////////////////////////////////////////////////////////////////
    kprintf("Downloading descriptor ... \n");

    
    volatile unsigned* lram_ptr = (unsigned*)FGPU_BASEADDR;
    for(int i = 0; i < 32; i++){
        lram_ptr[i] = 0;
    }
    //FENCE();
    lram_ptr[0] = ((nWF_WG-1) << 28) | (0 << 14) | (start_addr);
    //kprintf("size0: 0x%x \n",size0);
    lram_ptr[1] = size0;
    lram_ptr[2] = size1;
    lram_ptr[3] = size2;
    lram_ptr[4] = offset0;
    lram_ptr[5] = offset1;
    lram_ptr[6] = offset2;
    lram_ptr[7] = ((nDim-1) << 30) | (wg_size2 << 20) | (wg_size1 << 10) | (wg_size0);
    lram_ptr[8] = n_wg0-1;
    lram_ptr[9] = n_wg1-1;
    lram_ptr[10] = n_wg2-1;
    lram_ptr[11] = (nParams << 28) | wg_size;
    lram_ptr[16] = (unsigned) param1 & 0x00FFFFFF;
    lram_ptr[17] = (unsigned) target & 0x00FFFFFF;   
     
    //FENCE();
    kprintf("DONE! \n");
    //////////////////////////////////////////////////////////////////

    kprintf("\nWriting to control registers of FGPU ... \n");

    REG_WRITE(INITIATE_REG_ADDR, 0xFFFF); // initiate FGPU when execution starts
    REG_WRITE(CLEAN_CACHE_REG_ADDR, 0xFFFF); // clean FGPU cache at end of execution
    
    FENCE();
    
    tstart=read_mcycle();
    //tstarth=read_mcycleh();
    
    REG_WRITE(START_REG_ADDR, 1);
    kprintf("\nWaiting for the status... \n");
    while(REG_READ(STATUS_REG_ADDR)==0);
    
    tstop=read_mcycle();
    //tstoph=read_mcycleh();
    //usleep(1000000);
    FENCE();
    
    kprintf("\nDONE! FGPU execution: %d ns \n", elapsed_time(tstart, tstop));
    //kprintf("\n in case of -1 start: %x %x stop: %x %x \n", tstarth, tstart, tstoph, tstop);
    
    kprintf("param1: 0x%x \n", param1);
    kprintf("target: 0x%x \n", target);

    kprintf("Checking results (target after): \n");
    int cnt=0;
    for(int i=0; i<Size; i++){
        //kprintf("Param: %d, Target: %d\n",param1[i],target[i]);
        if(target[i]!=(unsigned)i){
            //kprintf("Error at idx: %d, value: %d :( ", i,target[i] );
            cnt++;
        }
    }
    
    kprintf("total errors: %d \n",cnt);
    
    /*for(int i=0; i<8; i++){
        kprintf("Param: %d, Target: %d\n",param1[i],target[i]);
         
    }
    kprintf(".\n.\n.\n");
    for(int i=0; i<8; i++){
       
        kprintf("Param: %d, Target: %d\n",param1[(Size-1)-i],target[(Size-1)-i]); 
    }*/
     //////////////////////////////////////////////////////////////////
     ///RISC-V execution
     FENCE();
    
    tstart=read_mcycle();
    //tstarth=read_mcycleh();
    
    for(int i=0; i<Size; i++){
        target_riscv_ptr[i] = param_ptr[i]; 
    }
    
    tstop=read_mcycle();
    //tstoph=read_mcycleh(); 
       
    kprintf("\nDONE! RISCV execution: %d ns \n", elapsed_time(tstart, tstop));
    //kprintf("\n in case of -1 start: %x %x stop: %x %x \n", tstarth, tstart, tstoph, tstop);
    
    kprintf("Checking results RISCV (target after): \n");
    cnt=0;
    for(int i=0; i<Size; i++){
        if(target_riscv[i]!=(unsigned)i){
            cnt++;
        }
    }
    kprintf("total errors: %d",cnt);
    kprintf("\n*****************END*********************\n");
    return 0;
}


