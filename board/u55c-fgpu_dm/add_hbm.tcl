create_bd_cell -type ip -vlnv xilinx.com:ip:hbm:1.0 hbm_0
set_property -dict [list CONFIG.USER_HBM_DENSITY       {8GB}          \
                        CONFIG.USER_HBM_STACK         {1}            \
                        CONFIG.USER_MEMORY_DISPLAY    {8192}        \
                        CONFIG.USER_SWITCH_ENABLE_00  {TRUE}         \
                        CONFIG.USER_SWITCH_ENABLE_01  {false}         \
                        CONFIG.USER_APB_EN            {false}        \
                        CONFIG.USER_CLK_SEL_LIST0     {AXI_01_ACLK}  \
                        CONFIG.USER_CLK_SEL_LIST1     {AXI_16_ACLK}  \
                        CONFIG.USER_MC_ENABLE_01      {TRUE}         \
                         CONFIG.USER_MC_ENABLE_02      {TRUE}         \
                         CONFIG.USER_MC_ENABLE_03      {TRUE}         \
                         CONFIG.USER_MC_ENABLE_04      {TRUE}         \
                         CONFIG.USER_MC_ENABLE_05      {TRUE}         \
                         CONFIG.USER_MC_ENABLE_05      {TRUE}         \
                         CONFIG.USER_MC_ENABLE_06      {TRUE}         \
                         CONFIG.USER_MC_ENABLE_07      {TRUE}         \
                         CONFIG.USER_MC_ENABLE_08      {TRUE}         \
                         CONFIG.USER_MC_ENABLE_09      {TRUE}         \
                         CONFIG.USER_MC_ENABLE_10      {TRUE}         \
                         CONFIG.USER_MC_ENABLE_11      {TRUE}         \
                         CONFIG.USER_MC_ENABLE_12      {TRUE}         \
                         CONFIG.USER_MC_ENABLE_13      {TRUE}         \
                         CONFIG.USER_MC_ENABLE_14      {TRUE}         \
                         CONFIG.USER_MC_ENABLE_15      {TRUE}         \
                         CONFIG.USER_MC0_ECC_BYPASS    {true}         \
                         CONFIG.USER_MC1_ECC_BYPASS    {true}         \
                         CONFIG.USER_MC2_ECC_BYPASS    {true}         \
                         CONFIG.USER_MC3_ECC_BYPASS    {true}         \
                         CONFIG.USER_MC4_ECC_BYPASS    {true}         \
                         CONFIG.USER_MC5_ECC_BYPASS    {true}         \
                         CONFIG.USER_MC6_ECC_BYPASS    {true}         \
                         CONFIG.USER_MC7_ECC_BYPASS    {true}         \
                         CONFIG.USER_MC8_ECC_BYPASS    {true}         \
                         CONFIG.USER_MC9_ECC_BYPASS    {true}         \
                         CONFIG.USER_MC10_ECC_BYPASS   {true}         \
                         CONFIG.USER_MC11_ECC_BYPASS   {true}         \
                         CONFIG.USER_MC12_ECC_BYPASS   {true}         \
                         CONFIG.USER_MC13_ECC_BYPASS   {true}         \
                         CONFIG.USER_MC14_ECC_BYPASS   {true}         \
                         CONFIG.USER_MC15_ECC_BYPASS   {true}         \
                         CONFIG.USER_PHY_ENABLE_01     {TRUE}         \
                         CONFIG.USER_PHY_ENABLE_02     {TRUE}         \
                         CONFIG.USER_PHY_ENABLE_03     {TRUE}         \
                         CONFIG.USER_PHY_ENABLE_04     {TRUE}         \
                         CONFIG.USER_PHY_ENABLE_05     {TRUE}         \
                         CONFIG.USER_PHY_ENABLE_06     {TRUE}         \
                         CONFIG.USER_PHY_ENABLE_07     {TRUE}         \
                         CONFIG.USER_PHY_ENABLE_08     {TRUE}         \
                         CONFIG.USER_PHY_ENABLE_09     {TRUE}         \
                         CONFIG.USER_PHY_ENABLE_10     {TRUE}         \
                         CONFIG.USER_PHY_ENABLE_11     {TRUE}         \
                         CONFIG.USER_PHY_ENABLE_12     {TRUE}         \
                         CONFIG.USER_PHY_ENABLE_13     {TRUE}         \
                         CONFIG.USER_PHY_ENABLE_14     {TRUE}         \
                         CONFIG.USER_PHY_ENABLE_15     {TRUE}         \
                        ] [get_bd_cells hbm_0]

for {set i 0} {$i<$N} {incr i} {
  set_property -dict [list [format "CONFIG.USER_SAXI_%02d" $i] {true}] [get_bd_cells hbm_0]
}
for {set i $N} {$i<32} {incr i} {
    set_property -dict [list [format "CONFIG.USER_SAXI_%02d" $i] {false}] [get_bd_cells hbm_0]
}
