# FGPU_RISCV_HBM

1. Edit main makefile:

BOARD ?= u55c-fgpu_dm
CONFIG ?= rocket32s1

2. Generate an FGPU IP with the desired Freq. in setup_environment.tcl
(selecting either u55c and u250 will create a compatible version for both boards, so no need to change) 

Possible configurations:

    Overall                         FGPU_definitions
CU      mem chn             C_CU_W      N_AXI_W     N_TAG_MANAGERS_W ( N_CU_W + n)
1       1                   0           0           +1              
1       2                   0           1           +1
1       4                   0           2           +2
1       8                   0           3           +3
1       16                  0           4           +4

2       1                   1           0           +1
2       2                   1           1           +1
2       4                   1           2           +1
2       8                   1           3           +2  
2       16                  1           4           +3

4       1                   2           0           +1
4       2                   2           1           +1
4       4                   2           2           +1
4       8                   2           3           +1  
4       16                  2           4           +2
    
8       1                   3           0           +1
8       2                   3           1           +1
8       4                   3           2           +1
8       8                   3           3           +1
8       16                  3           4           +1              


3. Modify boards/u55c-fgpu_dm/riscv-2023.tcl 

variable FGPU_master 16
variable FGPU_freq 250  

Both have to match your new FGPU-IP configurations.

4. modify board/rocket-freq 

.*            Rocket.*          100.0 

select desired frequency ( max. 125MHz, but doesn't work together with high FGPU frequencies, so I decided to go with 100MHz).

5. run the command make vivado-gui and generate bitstream afterwards.

6. Follow bare-metal README.md to run a hello world.

Important: the makefile for compilation changes if you are using 32 vs. 64 bit RISC-V.



