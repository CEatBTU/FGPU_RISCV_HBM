# FGPU_RISCV_HBM

This repository helps build a vivado-risc-v project (base repository [eugene-tarassov/vivado-risc-v](https://github.com/eugene-tarassov/vivado-risc-v), which is included as a submodule. For the moment, only boards Alveo U55C (with HBM as the main memory) and Alveo U250 (with DRAM as the main memory) are supported natively. If you need to use any other board, you will need to make some adjustments in the boards/ subdirectory, but you can use any of the aforementioned boards as templates. 

## Instructions
In order to setup the project for the FGPU-HBM integration, follow the instructions:
1. clone this repository.
2. > chmod +x setup.sh
3. > ./setup.sh

(This will simply copy the custom scripts and files into the correct locations for the main scripts to build the project properly).

We also tested a 64-bit version and this is also working fine. The rest of this guide will assume you are using a rocket32s1 version, but if you chose any other, simply substitute your version with the one on this guide.

2. Set the desired frequency of the FGPU in: 
>workspace/rocket32s1/fgpu/project_vivado/scripts/setup_environment.tcl

(selecting either u55c and u250 will create a compatible version for both boards, so no need to change). 

3. Set the FGPU configuration parameters in 
> workspace/rocket32s1/fgpu/RTL/db/fgpu_definitions_pkg.vhd

4. For the HBM integration (using multiple memory channels), the following configurations must be observed:


#### Possible configurations:
(the last three columns are the actual keys in the fgpu_definitions file)
|  # CU         | Mem_channels | C_CU_W | N_AXI_W | N_TAG_MANAGERS_W (N_CU_W+n)                   |
| :----------- | :-------------- | -------------------------: |-----------:|------:|
|1 |       1|                   0 |          0   |        +1|
|1   |    2          |         0         |  1         |  +1|
|1   |    4      |             0    |       2    |       +2|
|1    |   8        |           0       |    3    |       +3|
|1    |   16    |             0       |    4      |     +4|
||||||
|2    |   1       |            1   |        0    |       +1|
|2    |   2            |       1      |     1       |    +1|
|2   |    4       |            1   |        2     |      +1
|2   |    8       |            1   |        3     |      +2
|2   |    16       |           1    |       4    |       +3
||||||
|4    |   1         |          2    |       0   |        +1|
|4    |   2       |            2      |     1     |      +1|
|4    |   4        |           2     |      2     |      +1|
|4   |    8         |          2    |       3     |      +1|
|4  |     16         |         2   |        4      |     +2|
||||||
|8    |   1    |               3    |       0 |          +1|
|8     |  2    |               3     |      1  |         +1|
|8      | 4   |                3      |     2   |        +1|
|8       |8  |                 3       |    3    |       +1|
|8     |  16|                  3        |   4     |      +1|


5. Run the following script from within Vivado to generate a valid FGPU IP:
> workspace/rocket32s1/fgpu/project_vivado/scripts/main.tcl

For more information about how to create an FGPU instance, you can refer to: [CEatBTU/FGPU](https://github.com/CEatBTU/FGPU.git)

7. Modify 
> boards/u55c-fgpu_dm/riscv-2023.tcl 

(or the corresponding tcl script for your target board).

> variable FGPU_master 16
> variable FGPU_freq 250

Both values have to match your newly created FGPU-IP configurations.

8. modify board/rocket-freq 

> .*            Rocket.*          100.0 

select desired frequency (max. 125MHz, but doesn't work together with high FGPU frequencies (higher than 100MHz). 100MHz for the RISC-V has been extensively tested though).

After this is done, you can refer to the base repository to setup a vivado project, with the following adjustments in the scripts:

9. Edit main makefile:

>BOARD ?= u55c-fgpu_dm

And choose your RISC-V core version:
> CONFIG ?= rocket32s1

10. Run the command 
> make vivado-gui 

This will generate a Vivado project. You can generate a bitstream afterwards.

11. Follow bare-metal README to run a hello world, or run one of the custom applications compiled for the FGPU.

Important: the makefile for compilation changes if you are using 32 vs. 64 bit RISC-V.
Note: The base repository is able to generate a RISC-V that can host a Linux OS. You can also follow these steps and control the FGPU from within the OS.

## Reference
This work was published on the proceedings of: 38th GI/ITG International Conference on Architecture of Computing Systems.
Please cite us if you found our project useful.





