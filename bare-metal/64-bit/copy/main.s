	.file	"main.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.globl	Size
	.section	.sdata,"aw",@progbits
	.align	2
	.type	Size, @object
	.size	Size, 4
Size:
	.word	64
	.section	.rodata
	.align	2
.LC0:
	.string	"\n"
	.align	2
.LC1:
	.string	"Initializing FGPU ... \n"
	.align	2
.LC2:
	.string	"Downloading code ... \n"
	.align	2
.LC3:
	.string	"DONE! \n"
	.align	2
.LC4:
	.string	"Preparing descriptor ... \n"
	.align	2
.LC5:
	.string	"Computing descriptor ... \n"
	.align	2
.LC6:
	.string	"DONE!! \n"
	.align	2
.LC7:
	.string	"Computing on FGPU ... \n"
	.align	2
.LC8:
	.string	"Initializing memory ... \n"
	.align	2
.LC9:
	.string	"Downloading descriptor ... \n"
	.align	2
.LC10:
	.string	"Writing to control registers of FGPU ... \n"
	.align	2
.LC11:
	.string	"Checking target array before execution: "
	.align	2
.LC12:
	.string	"%d"
	.align	2
.LC13:
	.string	"\n Finish (they should be 0) "
	.align	2
.LC14:
	.string	"Checking results: \n"
	.align	2
.LC15:
	.string	"%d\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "main.c"
	.loc 1 27 0
	.cfi_startproc
	addi	sp,sp,-160
	.cfi_def_cfa_offset 160
	sw	ra,156(sp)
	sw	s0,152(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,160
	.cfi_def_cfa 8, 0
	li	t1,-8192
	add	sp,sp,t1
	.loc 1 28 0
	lla	a0,.LC0
	call	kprintf
	.loc 1 29 0
	lla	a0,.LC1
	call	kprintf
	.loc 1 31 0
	lla	a0,.LC2
	call	kprintf
	.loc 1 33 0
	li	a5,1073823744
	sw	a5,-72(s0)
	.loc 1 34 0
	li	a5,51
	sw	a5,-76(s0)
	.loc 1 36 0
	sw	zero,-80(s0)
.LBB2:
	.loc 1 39 0
	sw	zero,-20(s0)
	j	.L2
.L3:
	.loc 1 40 0 discriminator 3
	lla	a5,code
	lw	a4,0(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a4,a4,a5
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a3,-72(s0)
	add	a5,a3,a5
	lw	a4,0(a4)
	sw	a4,0(a5)
	.loc 1 39 0 discriminator 3
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L2:
	.loc 1 39 0 is_stmt 0 discriminator 1
	lw	a4,-20(s0)
	lw	a5,-76(s0)
	bltu	a4,a5,.L3
.LBE2:
	.loc 1 43 0 is_stmt 1
	lla	a0,.LC3
	call	kprintf
	.loc 1 44 0
	lla	a0,.LC4
	call	kprintf
	.loc 1 46 0
	li	a5,64
	sw	a5,-84(s0)
	.loc 1 47 0
	sw	zero,-24(s0)
	.loc 1 49 0
	lla	a5,Size
	lw	a5,0(a5)
	sw	a5,-88(s0)
	.loc 1 50 0
	sw	zero,-92(s0)
	.loc 1 52 0
	li	a5,1
	sw	a5,-96(s0)
	.loc 1 53 0
	lla	a5,Size
	lw	a5,0(a5)
	sw	a5,-100(s0)
	.loc 1 55 0
	sw	zero,-104(s0)
	.loc 1 60 0
	lw	a5,-88(s0)
	slli	a5,a5,2
	sw	a5,-108(s0)
	.loc 1 62 0
	lla	a0,.LC3
	call	kprintf
	.loc 1 64 0
	lla	a0,.LC5
	call	kprintf
	.loc 1 68 0
	lw	a5,-100(s0)
	sw	a5,-104(s0)
	.loc 1 69 0
	lw	a5,-84(s0)
	sw	a5,-24(s0)
	.loc 1 70 0
	lw	a4,-100(s0)
	lw	a5,-84(s0)
	divu	a5,a4,a5
	sw	a5,-112(s0)
	.loc 1 71 0
	lw	a4,-96(s0)
	li	a5,1
	bleu	a4,a5,.L4
	.loc 1 74 0
	lw	a4,-100(s0)
	lw	a5,-36(s0)
	mul	a5,a4,a5
	sw	a5,-104(s0)
	.loc 1 75 0
	lw	a4,-84(s0)
	lw	a5,-28(s0)
	mul	a5,a4,a5
	sw	a5,-24(s0)
	.loc 1 76 0
	lw	a4,-36(s0)
	lw	a5,-28(s0)
	divu	a5,a4,a5
	sw	a5,-44(s0)
	j	.L5
.L4:
	.loc 1 79 0
	sw	zero,-36(s0)
	lw	a5,-36(s0)
	sw	a5,-44(s0)
	lw	a5,-44(s0)
	sw	a5,-28(s0)
.L5:
	.loc 1 81 0
	lw	a4,-96(s0)
	li	a5,2
	bleu	a4,a5,.L6
	.loc 1 84 0
	lw	a4,-100(s0)
	lw	a5,-36(s0)
	mul	a5,a4,a5
	lw	a4,-40(s0)
	mul	a5,a4,a5
	sw	a5,-104(s0)
	.loc 1 85 0
	lw	a4,-84(s0)
	lw	a5,-28(s0)
	mul	a5,a4,a5
	lw	a4,-32(s0)
	mul	a5,a4,a5
	sw	a5,-24(s0)
	.loc 1 86 0
	lw	a4,-40(s0)
	lw	a5,-32(s0)
	divu	a5,a4,a5
	sw	a5,-48(s0)
	j	.L7
.L6:
	.loc 1 89 0
	sw	zero,-40(s0)
	lw	a5,-40(s0)
	sw	a5,-48(s0)
	lw	a5,-48(s0)
	sw	a5,-32(s0)
.L7:
	.loc 1 92 0
	lw	a5,-24(s0)
	srli	a5,a5,6
	sw	a5,-52(s0)
	.loc 1 93 0
	lw	a5,-24(s0)
	andi	a5,a5,63
	beqz	a5,.L8
	.loc 1 94 0
	lw	a5,-52(s0)
	addi	a5,a5,1
	sw	a5,-52(s0)
.L8:
	.loc 1 96 0
	lla	a0,.LC6
	call	kprintf
	.loc 1 98 0
	sw	zero,-116(s0)
	lw	a5,-116(s0)
	sw	a5,-120(s0)
	lw	a5,-120(s0)
	sw	a5,-92(s0)
	.loc 1 99 0
	li	a5,2
	sw	a5,-124(s0)
	.loc 1 103 0
	lla	a0,.LC7
	call	kprintf
	.loc 1 104 0
	lla	a0,.LC8
	call	kprintf
.LBB3:
	.loc 1 111 0
	sw	zero,-56(s0)
	j	.L9
.L10:
	.loc 1 112 0 discriminator 3
	li	a5,-4096
	addi	a4,s0,-16
	add	a4,a4,a5
	lw	a5,-56(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-56(s0)
	sw	a4,-144(a5)
	.loc 1 113 0 discriminator 3
	li	a5,-8192
	addi	a4,s0,-16
	add	a4,a4,a5
	lw	a5,-56(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	sw	zero,-144(a5)
	.loc 1 111 0 discriminator 3
	lw	a5,-56(s0)
	addi	a5,a5,1
	sw	a5,-56(s0)
.L9:
	.loc 1 111 0 is_stmt 0 discriminator 1
	lw	a4,-56(s0)
	li	a5,1023
	bleu	a4,a5,.L10
.LBE3:
	.loc 1 115 0 is_stmt 1
	lla	a0,.LC3
	call	kprintf
	.loc 1 117 0
	lla	a0,.LC9
	call	kprintf
	.loc 1 120 0
	li	a5,1073807360
	sw	a5,-128(s0)
.LBB4:
	.loc 1 121 0
	sw	zero,-60(s0)
	j	.L11
.L12:
	.loc 1 122 0 discriminator 3
	lw	a5,-60(s0)
	slli	a5,a5,2
	lw	a4,-128(s0)
	add	a5,a4,a5
	sw	zero,0(a5)
	.loc 1 121 0 discriminator 3
	lw	a5,-60(s0)
	addi	a5,a5,1
	sw	a5,-60(s0)
.L11:
	.loc 1 121 0 is_stmt 0 discriminator 1
	lw	a4,-60(s0)
	li	a5,31
	ble	a4,a5,.L12
.LBE4:
	.loc 1 124 0 is_stmt 1
	lw	a5,-52(s0)
	addi	a5,a5,-1
	slli	a4,a5,28
	lw	a5,-80(s0)
	or	a4,a4,a5
	lw	a5,-128(s0)
	sw	a4,0(a5)
	.loc 1 125 0
	lw	a5,-128(s0)
	addi	a5,a5,4
	lw	a4,-100(s0)
	sw	a4,0(a5)
	.loc 1 126 0
	lw	a5,-128(s0)
	addi	a5,a5,8
	lw	a4,-36(s0)
	sw	a4,0(a5)
	.loc 1 127 0
	lw	a5,-128(s0)
	addi	a5,a5,12
	lw	a4,-40(s0)
	sw	a4,0(a5)
	.loc 1 128 0
	lw	a5,-128(s0)
	addi	a5,a5,16
	lw	a4,-92(s0)
	sw	a4,0(a5)
	.loc 1 129 0
	lw	a5,-128(s0)
	addi	a5,a5,20
	lw	a4,-120(s0)
	sw	a4,0(a5)
	.loc 1 130 0
	lw	a5,-128(s0)
	addi	a5,a5,24
	lw	a4,-116(s0)
	sw	a4,0(a5)
	.loc 1 131 0
	lw	a5,-96(s0)
	addi	a5,a5,-1
	slli	a4,a5,30
	lw	a5,-32(s0)
	slli	a5,a5,20
	or	a4,a4,a5
	lw	a5,-28(s0)
	slli	a5,a5,10
	or	a3,a4,a5
	lw	a5,-128(s0)
	addi	a5,a5,28
	lw	a4,-84(s0)
	or	a4,a3,a4
	sw	a4,0(a5)
	.loc 1 132 0
	lw	a5,-128(s0)
	addi	a5,a5,32
	lw	a4,-112(s0)
	addi	a4,a4,-1
	sw	a4,0(a5)
	.loc 1 133 0
	lw	a5,-128(s0)
	addi	a5,a5,36
	lw	a4,-44(s0)
	addi	a4,a4,-1
	sw	a4,0(a5)
	.loc 1 134 0
	lw	a5,-128(s0)
	addi	a5,a5,40
	lw	a4,-48(s0)
	addi	a4,a4,-1
	sw	a4,0(a5)
	.loc 1 135 0
	lw	a5,-124(s0)
	slli	a3,a5,28
	lw	a5,-128(s0)
	addi	a5,a5,44
	lw	a4,-24(s0)
	or	a4,a3,a4
	sw	a4,0(a5)
	.loc 1 136 0
	lw	a5,-128(s0)
	addi	a5,a5,64
	li	a4,-4096
	addi	a4,a4,-144
	addi	a3,s0,-16
	add	a4,a3,a4
	sw	a4,0(a5)
	.loc 1 137 0
	lw	a5,-128(s0)
	addi	a5,a5,68
	li	a4,-8192
	addi	a4,a4,-144
	addi	a3,s0,-16
	add	a4,a3,a4
	sw	a4,0(a5)
	.loc 1 139 0
	lla	a0,.LC3
	call	kprintf
	.loc 1 141 0
	lla	a0,.LC10
	call	kprintf
	.loc 1 142 0
	lla	a0,.LC11
	call	kprintf
.LBB5:
	.loc 1 143 0
	sw	zero,-64(s0)
	j	.L13
.L14:
	.loc 1 144 0 discriminator 3
	li	a5,-8192
	addi	a4,s0,-16
	add	a4,a4,a5
	lw	a5,-64(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,-144(a5)
	mv	a1,a5
	lla	a0,.LC12
	call	kprintf
	.loc 1 143 0 discriminator 3
	lw	a5,-64(s0)
	addi	a5,a5,1
	sw	a5,-64(s0)
.L13:
	.loc 1 143 0 is_stmt 0 discriminator 1
	lw	a4,-64(s0)
	li	a5,49
	ble	a4,a5,.L14
.LBE5:
	.loc 1 146 0 is_stmt 1
	lla	a0,.LC13
	call	kprintf
.LBB6:
	.loc 1 148 0
	li	a5,65536
	addi	a5,a5,-1
	sw	a5,-132(s0)
	li	a5,1073840128
	addi	a5,a5,12
	sw	a5,-136(s0)
	lw	a5,-136(s0)
	lw	a4,-132(s0)
 #APP
# 148 "main.c" 1
	str  a4,[a5]

# 0 "" 2
 #NO_APP
.LBE6:
.LBB7:
	.loc 1 149 0
	li	a5,65536
	addi	a5,a5,-1
	sw	a5,-140(s0)
	li	a5,1073840128
	addi	a5,a5,8
	sw	a5,-144(s0)
	lw	a5,-144(s0)
	lw	a4,-140(s0)
 #APP
# 149 "main.c" 1
	str  a4,[a5]

# 0 "" 2
 #NO_APP
.LBE7:
.LBB8:
	.loc 1 151 0
	li	a5,1
	sw	a5,-148(s0)
	li	a5,1073840128
	addi	a5,a5,4
	sw	a5,-152(s0)
	lw	a5,-152(s0)
	lw	a4,-148(s0)
 #APP
# 151 "main.c" 1
	str  a4,[a5]

# 0 "" 2
 #NO_APP
.LBE8:
	.loc 1 152 0
	nop
.L15:
.LBB9:
	.loc 1 152 0 is_stmt 0 discriminator 1
	li	a5,1073840128
	sw	a5,-156(s0)
	lw	a5,-156(s0)
 #APP
# 152 "main.c" 1
	ldr   a5,[a5]

# 0 "" 2
 #NO_APP
	sw	a5,-160(s0)
	lw	a5,-160(s0)
.LBE9:
	beqz	a5,.L15
	.loc 1 155 0 is_stmt 1
	lla	a0,.LC3
	call	kprintf
	.loc 1 157 0
	lla	a0,.LC14
	call	kprintf
.LBB10:
	.loc 1 158 0
	sw	zero,-68(s0)
	j	.L16
.L17:
	.loc 1 159 0 discriminator 3
	li	a5,-8192
	addi	a4,s0,-16
	add	a4,a4,a5
	lw	a5,-68(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,-144(a5)
	mv	a1,a5
	lla	a0,.LC15
	call	kprintf
	.loc 1 158 0 discriminator 3
	lw	a5,-68(s0)
	addi	a5,a5,1
	sw	a5,-68(s0)
.L16:
	.loc 1 158 0 is_stmt 0 discriminator 1
	lw	a4,-68(s0)
	li	a5,49
	ble	a4,a5,.L17
.LBE10:
	.loc 1 161 0 is_stmt 1
	li	a5,0
	.loc 1 162 0
	mv	a0,a5
	li	t1,8192
	add	sp,sp,t1
	.cfi_def_cfa 2, 160
	lw	ra,156(sp)
	.cfi_restore 1
	lw	s0,152(sp)
	.cfi_restore 8
	addi	sp,sp,160
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.file 2 "/home/munozher/Documents/demo/vivado_riscv/vivado-risc-v/workspace/gcc/riscv/riscv32-unknown-elf/include/sys/lock.h"
	.file 3 "/home/munozher/Documents/demo/vivado_riscv/vivado-risc-v/workspace/gcc/riscv/riscv32-unknown-elf/include/sys/_types.h"
	.file 4 "/home/munozher/Documents/demo/vivado_riscv/vivado-risc-v/workspace/gcc/riscv/lib/gcc/riscv32-unknown-elf/7.2.0/include/stddef.h"
	.file 5 "/home/munozher/Documents/demo/vivado_riscv/vivado-risc-v/workspace/gcc/riscv/riscv32-unknown-elf/include/sys/reent.h"
	.file 6 "/home/munozher/Documents/demo/vivado_riscv/vivado-risc-v/workspace/gcc/riscv/riscv32-unknown-elf/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xb81
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF148
	.byte	0xc
	.4byte	.LASF149
	.4byte	.LASF150
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x4
	.4byte	0x64
	.byte	0x2
	.byte	0x10
	.byte	0x4
	.4byte	.LASF9
	.byte	0x5
	.4byte	.LASF10
	.byte	0x2
	.byte	0x7
	.4byte	0x5d
	.byte	0x5
	.4byte	.LASF11
	.byte	0x3
	.byte	0x2c
	.4byte	0x41
	.byte	0x5
	.4byte	.LASF12
	.byte	0x3
	.byte	0x72
	.4byte	0x41
	.byte	0x5
	.4byte	.LASF13
	.byte	0x3
	.byte	0x91
	.4byte	0x5d
	.byte	0x6
	.4byte	.LASF14
	.byte	0x4
	.2byte	0x165
	.4byte	0x64
	.byte	0x7
	.byte	0x4
	.byte	0x3
	.byte	0xa6
	.4byte	0xce
	.byte	0x8
	.4byte	.LASF15
	.byte	0x3
	.byte	0xa8
	.4byte	0xa3
	.byte	0x8
	.4byte	.LASF16
	.byte	0x3
	.byte	0xa9
	.4byte	0xce
	.byte	0
	.byte	0x9
	.4byte	0x2c
	.4byte	0xde
	.byte	0xa
	.4byte	0x64
	.byte	0x3
	.byte	0
	.byte	0xb
	.byte	0x8
	.byte	0x3
	.byte	0xa3
	.4byte	0xff
	.byte	0xc
	.4byte	.LASF17
	.byte	0x3
	.byte	0xa5
	.4byte	0x5d
	.byte	0
	.byte	0xc
	.4byte	.LASF18
	.byte	0x3
	.byte	0xaa
	.4byte	0xaf
	.byte	0x4
	.byte	0
	.byte	0x5
	.4byte	.LASF19
	.byte	0x3
	.byte	0xab
	.4byte	0xde
	.byte	0x5
	.4byte	.LASF20
	.byte	0x3
	.byte	0xaf
	.4byte	0x77
	.byte	0xd
	.byte	0x4
	.byte	0xe
	.byte	0x4
	.4byte	0x11d
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF21
	.byte	0xf
	.4byte	0x11d
	.byte	0x5
	.4byte	.LASF22
	.byte	0x5
	.byte	0x16
	.4byte	0x48
	.byte	0x10
	.4byte	.LASF27
	.byte	0x18
	.byte	0x5
	.byte	0x2f
	.4byte	0x187
	.byte	0xc
	.4byte	.LASF23
	.byte	0x5
	.byte	0x31
	.4byte	0x187
	.byte	0
	.byte	0x11
	.string	"_k"
	.byte	0x5
	.byte	0x32
	.4byte	0x5d
	.byte	0x4
	.byte	0xc
	.4byte	.LASF24
	.byte	0x5
	.byte	0x32
	.4byte	0x5d
	.byte	0x8
	.byte	0xc
	.4byte	.LASF25
	.byte	0x5
	.byte	0x32
	.4byte	0x5d
	.byte	0xc
	.byte	0xc
	.4byte	.LASF26
	.byte	0x5
	.byte	0x32
	.4byte	0x5d
	.byte	0x10
	.byte	0x11
	.string	"_x"
	.byte	0x5
	.byte	0x33
	.4byte	0x18d
	.byte	0x14
	.byte	0
	.byte	0xe
	.byte	0x4
	.4byte	0x134
	.byte	0x9
	.4byte	0x129
	.4byte	0x19d
	.byte	0xa
	.4byte	0x64
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF28
	.byte	0x24
	.byte	0x5
	.byte	0x37
	.4byte	0x216
	.byte	0xc
	.4byte	.LASF29
	.byte	0x5
	.byte	0x39
	.4byte	0x5d
	.byte	0
	.byte	0xc
	.4byte	.LASF30
	.byte	0x5
	.byte	0x3a
	.4byte	0x5d
	.byte	0x4
	.byte	0xc
	.4byte	.LASF31
	.byte	0x5
	.byte	0x3b
	.4byte	0x5d
	.byte	0x8
	.byte	0xc
	.4byte	.LASF32
	.byte	0x5
	.byte	0x3c
	.4byte	0x5d
	.byte	0xc
	.byte	0xc
	.4byte	.LASF33
	.byte	0x5
	.byte	0x3d
	.4byte	0x5d
	.byte	0x10
	.byte	0xc
	.4byte	.LASF34
	.byte	0x5
	.byte	0x3e
	.4byte	0x5d
	.byte	0x14
	.byte	0xc
	.4byte	.LASF35
	.byte	0x5
	.byte	0x3f
	.4byte	0x5d
	.byte	0x18
	.byte	0xc
	.4byte	.LASF36
	.byte	0x5
	.byte	0x40
	.4byte	0x5d
	.byte	0x1c
	.byte	0xc
	.4byte	.LASF37
	.byte	0x5
	.byte	0x41
	.4byte	0x5d
	.byte	0x20
	.byte	0
	.byte	0x12
	.4byte	.LASF38
	.2byte	0x108
	.byte	0x5
	.byte	0x4a
	.4byte	0x256
	.byte	0xc
	.4byte	.LASF39
	.byte	0x5
	.byte	0x4b
	.4byte	0x256
	.byte	0
	.byte	0xc
	.4byte	.LASF40
	.byte	0x5
	.byte	0x4c
	.4byte	0x256
	.byte	0x80
	.byte	0x13
	.4byte	.LASF41
	.byte	0x5
	.byte	0x4e
	.4byte	0x129
	.2byte	0x100
	.byte	0x13
	.4byte	.LASF42
	.byte	0x5
	.byte	0x51
	.4byte	0x129
	.2byte	0x104
	.byte	0
	.byte	0x9
	.4byte	0x115
	.4byte	0x266
	.byte	0xa
	.4byte	0x64
	.byte	0x1f
	.byte	0
	.byte	0x12
	.4byte	.LASF43
	.2byte	0x190
	.byte	0x5
	.byte	0x5d
	.4byte	0x2a4
	.byte	0xc
	.4byte	.LASF23
	.byte	0x5
	.byte	0x5e
	.4byte	0x2a4
	.byte	0
	.byte	0xc
	.4byte	.LASF44
	.byte	0x5
	.byte	0x5f
	.4byte	0x5d
	.byte	0x4
	.byte	0xc
	.4byte	.LASF45
	.byte	0x5
	.byte	0x61
	.4byte	0x2aa
	.byte	0x8
	.byte	0xc
	.4byte	.LASF38
	.byte	0x5
	.byte	0x62
	.4byte	0x216
	.byte	0x88
	.byte	0
	.byte	0xe
	.byte	0x4
	.4byte	0x266
	.byte	0x9
	.4byte	0x2ba
	.4byte	0x2ba
	.byte	0xa
	.4byte	0x64
	.byte	0x1f
	.byte	0
	.byte	0xe
	.byte	0x4
	.4byte	0x2c0
	.byte	0x14
	.byte	0x10
	.4byte	.LASF46
	.byte	0x8
	.byte	0x5
	.byte	0x75
	.4byte	0x2e6
	.byte	0xc
	.4byte	.LASF47
	.byte	0x5
	.byte	0x76
	.4byte	0x2e6
	.byte	0
	.byte	0xc
	.4byte	.LASF48
	.byte	0x5
	.byte	0x77
	.4byte	0x5d
	.byte	0x4
	.byte	0
	.byte	0xe
	.byte	0x4
	.4byte	0x2c
	.byte	0x10
	.4byte	.LASF49
	.byte	0x68
	.byte	0x5
	.byte	0xb5
	.4byte	0x416
	.byte	0x11
	.string	"_p"
	.byte	0x5
	.byte	0xb6
	.4byte	0x2e6
	.byte	0
	.byte	0x11
	.string	"_r"
	.byte	0x5
	.byte	0xb7
	.4byte	0x5d
	.byte	0x4
	.byte	0x11
	.string	"_w"
	.byte	0x5
	.byte	0xb8
	.4byte	0x5d
	.byte	0x8
	.byte	0xc
	.4byte	.LASF50
	.byte	0x5
	.byte	0xb9
	.4byte	0x33
	.byte	0xc
	.byte	0xc
	.4byte	.LASF51
	.byte	0x5
	.byte	0xba
	.4byte	0x33
	.byte	0xe
	.byte	0x11
	.string	"_bf"
	.byte	0x5
	.byte	0xbb
	.4byte	0x2c1
	.byte	0x10
	.byte	0xc
	.4byte	.LASF52
	.byte	0x5
	.byte	0xbc
	.4byte	0x5d
	.byte	0x18
	.byte	0xc
	.4byte	.LASF53
	.byte	0x5
	.byte	0xc3
	.4byte	0x115
	.byte	0x1c
	.byte	0xc
	.4byte	.LASF54
	.byte	0x5
	.byte	0xc5
	.4byte	0x571
	.byte	0x20
	.byte	0xc
	.4byte	.LASF55
	.byte	0x5
	.byte	0xc7
	.4byte	0x59b
	.byte	0x24
	.byte	0xc
	.4byte	.LASF56
	.byte	0x5
	.byte	0xca
	.4byte	0x5bf
	.byte	0x28
	.byte	0xc
	.4byte	.LASF57
	.byte	0x5
	.byte	0xcb
	.4byte	0x5d9
	.byte	0x2c
	.byte	0x11
	.string	"_ub"
	.byte	0x5
	.byte	0xce
	.4byte	0x2c1
	.byte	0x30
	.byte	0x11
	.string	"_up"
	.byte	0x5
	.byte	0xcf
	.4byte	0x2e6
	.byte	0x38
	.byte	0x11
	.string	"_ur"
	.byte	0x5
	.byte	0xd0
	.4byte	0x5d
	.byte	0x3c
	.byte	0xc
	.4byte	.LASF58
	.byte	0x5
	.byte	0xd3
	.4byte	0x5df
	.byte	0x40
	.byte	0xc
	.4byte	.LASF59
	.byte	0x5
	.byte	0xd4
	.4byte	0x5ef
	.byte	0x43
	.byte	0x11
	.string	"_lb"
	.byte	0x5
	.byte	0xd7
	.4byte	0x2c1
	.byte	0x44
	.byte	0xc
	.4byte	.LASF60
	.byte	0x5
	.byte	0xda
	.4byte	0x5d
	.byte	0x4c
	.byte	0xc
	.4byte	.LASF61
	.byte	0x5
	.byte	0xdb
	.4byte	0x82
	.byte	0x50
	.byte	0xc
	.4byte	.LASF62
	.byte	0x5
	.byte	0xde
	.4byte	0x434
	.byte	0x54
	.byte	0xc
	.4byte	.LASF63
	.byte	0x5
	.byte	0xe2
	.4byte	0x10a
	.byte	0x58
	.byte	0xc
	.4byte	.LASF64
	.byte	0x5
	.byte	0xe4
	.4byte	0xff
	.byte	0x5c
	.byte	0xc
	.4byte	.LASF65
	.byte	0x5
	.byte	0xe5
	.4byte	0x5d
	.byte	0x64
	.byte	0
	.byte	0x15
	.4byte	0x98
	.4byte	0x434
	.byte	0x16
	.4byte	0x434
	.byte	0x16
	.4byte	0x115
	.byte	0x16
	.4byte	0x117
	.byte	0x16
	.4byte	0x5d
	.byte	0
	.byte	0xe
	.byte	0x4
	.4byte	0x43f
	.byte	0xf
	.4byte	0x434
	.byte	0x17
	.4byte	.LASF66
	.2byte	0x428
	.byte	0x5
	.2byte	0x239
	.4byte	0x571
	.byte	0x18
	.4byte	.LASF67
	.byte	0x5
	.2byte	0x23b
	.4byte	0x5d
	.byte	0
	.byte	0x18
	.4byte	.LASF68
	.byte	0x5
	.2byte	0x240
	.4byte	0x646
	.byte	0x4
	.byte	0x18
	.4byte	.LASF69
	.byte	0x5
	.2byte	0x240
	.4byte	0x646
	.byte	0x8
	.byte	0x18
	.4byte	.LASF70
	.byte	0x5
	.2byte	0x240
	.4byte	0x646
	.byte	0xc
	.byte	0x18
	.4byte	.LASF71
	.byte	0x5
	.2byte	0x242
	.4byte	0x5d
	.byte	0x10
	.byte	0x18
	.4byte	.LASF72
	.byte	0x5
	.2byte	0x243
	.4byte	0x828
	.byte	0x14
	.byte	0x18
	.4byte	.LASF73
	.byte	0x5
	.2byte	0x246
	.4byte	0x5d
	.byte	0x30
	.byte	0x18
	.4byte	.LASF74
	.byte	0x5
	.2byte	0x247
	.4byte	0x83d
	.byte	0x34
	.byte	0x18
	.4byte	.LASF75
	.byte	0x5
	.2byte	0x249
	.4byte	0x5d
	.byte	0x38
	.byte	0x18
	.4byte	.LASF76
	.byte	0x5
	.2byte	0x24b
	.4byte	0x84e
	.byte	0x3c
	.byte	0x18
	.4byte	.LASF77
	.byte	0x5
	.2byte	0x24e
	.4byte	0x187
	.byte	0x40
	.byte	0x18
	.4byte	.LASF78
	.byte	0x5
	.2byte	0x24f
	.4byte	0x5d
	.byte	0x44
	.byte	0x18
	.4byte	.LASF79
	.byte	0x5
	.2byte	0x250
	.4byte	0x187
	.byte	0x48
	.byte	0x18
	.4byte	.LASF80
	.byte	0x5
	.2byte	0x251
	.4byte	0x854
	.byte	0x4c
	.byte	0x18
	.4byte	.LASF81
	.byte	0x5
	.2byte	0x254
	.4byte	0x5d
	.byte	0x50
	.byte	0x18
	.4byte	.LASF82
	.byte	0x5
	.2byte	0x255
	.4byte	0x117
	.byte	0x54
	.byte	0x18
	.4byte	.LASF83
	.byte	0x5
	.2byte	0x278
	.4byte	0x806
	.byte	0x58
	.byte	0x19
	.4byte	.LASF43
	.byte	0x5
	.2byte	0x27c
	.4byte	0x2a4
	.2byte	0x148
	.byte	0x19
	.4byte	.LASF84
	.byte	0x5
	.2byte	0x27d
	.4byte	0x266
	.2byte	0x14c
	.byte	0x19
	.4byte	.LASF85
	.byte	0x5
	.2byte	0x281
	.4byte	0x865
	.2byte	0x2dc
	.byte	0x19
	.4byte	.LASF86
	.byte	0x5
	.2byte	0x286
	.4byte	0x60b
	.2byte	0x2e0
	.byte	0x19
	.4byte	.LASF87
	.byte	0x5
	.2byte	0x287
	.4byte	0x871
	.2byte	0x2ec
	.byte	0
	.byte	0xe
	.byte	0x4
	.4byte	0x416
	.byte	0x15
	.4byte	0x98
	.4byte	0x595
	.byte	0x16
	.4byte	0x434
	.byte	0x16
	.4byte	0x115
	.byte	0x16
	.4byte	0x595
	.byte	0x16
	.4byte	0x5d
	.byte	0
	.byte	0xe
	.byte	0x4
	.4byte	0x124
	.byte	0xe
	.byte	0x4
	.4byte	0x577
	.byte	0x15
	.4byte	0x8d
	.4byte	0x5bf
	.byte	0x16
	.4byte	0x434
	.byte	0x16
	.4byte	0x115
	.byte	0x16
	.4byte	0x8d
	.byte	0x16
	.4byte	0x5d
	.byte	0
	.byte	0xe
	.byte	0x4
	.4byte	0x5a1
	.byte	0x15
	.4byte	0x5d
	.4byte	0x5d9
	.byte	0x16
	.4byte	0x434
	.byte	0x16
	.4byte	0x115
	.byte	0
	.byte	0xe
	.byte	0x4
	.4byte	0x5c5
	.byte	0x9
	.4byte	0x2c
	.4byte	0x5ef
	.byte	0xa
	.4byte	0x64
	.byte	0x2
	.byte	0
	.byte	0x9
	.4byte	0x2c
	.4byte	0x5ff
	.byte	0xa
	.4byte	0x64
	.byte	0
	.byte	0
	.byte	0x6
	.4byte	.LASF88
	.byte	0x5
	.2byte	0x11f
	.4byte	0x2ec
	.byte	0x1a
	.4byte	.LASF89
	.byte	0xc
	.byte	0x5
	.2byte	0x123
	.4byte	0x640
	.byte	0x18
	.4byte	.LASF23
	.byte	0x5
	.2byte	0x125
	.4byte	0x640
	.byte	0
	.byte	0x18
	.4byte	.LASF90
	.byte	0x5
	.2byte	0x126
	.4byte	0x5d
	.byte	0x4
	.byte	0x18
	.4byte	.LASF91
	.byte	0x5
	.2byte	0x127
	.4byte	0x646
	.byte	0x8
	.byte	0
	.byte	0xe
	.byte	0x4
	.4byte	0x60b
	.byte	0xe
	.byte	0x4
	.4byte	0x5ff
	.byte	0x1a
	.4byte	.LASF92
	.byte	0xe
	.byte	0x5
	.2byte	0x13f
	.4byte	0x681
	.byte	0x18
	.4byte	.LASF93
	.byte	0x5
	.2byte	0x140
	.4byte	0x681
	.byte	0
	.byte	0x18
	.4byte	.LASF94
	.byte	0x5
	.2byte	0x141
	.4byte	0x681
	.byte	0x6
	.byte	0x18
	.4byte	.LASF95
	.byte	0x5
	.2byte	0x142
	.4byte	0x3a
	.byte	0xc
	.byte	0
	.byte	0x9
	.4byte	0x3a
	.4byte	0x691
	.byte	0xa
	.4byte	0x64
	.byte	0x2
	.byte	0
	.byte	0x1b
	.byte	0xd0
	.byte	0x5
	.2byte	0x259
	.4byte	0x792
	.byte	0x18
	.4byte	.LASF96
	.byte	0x5
	.2byte	0x25b
	.4byte	0x64
	.byte	0
	.byte	0x18
	.4byte	.LASF97
	.byte	0x5
	.2byte	0x25c
	.4byte	0x117
	.byte	0x4
	.byte	0x18
	.4byte	.LASF98
	.byte	0x5
	.2byte	0x25d
	.4byte	0x792
	.byte	0x8
	.byte	0x18
	.4byte	.LASF99
	.byte	0x5
	.2byte	0x25e
	.4byte	0x19d
	.byte	0x24
	.byte	0x18
	.4byte	.LASF100
	.byte	0x5
	.2byte	0x25f
	.4byte	0x5d
	.byte	0x48
	.byte	0x18
	.4byte	.LASF101
	.byte	0x5
	.2byte	0x260
	.4byte	0x56
	.byte	0x50
	.byte	0x18
	.4byte	.LASF102
	.byte	0x5
	.2byte	0x261
	.4byte	0x64c
	.byte	0x58
	.byte	0x18
	.4byte	.LASF103
	.byte	0x5
	.2byte	0x262
	.4byte	0xff
	.byte	0x68
	.byte	0x18
	.4byte	.LASF104
	.byte	0x5
	.2byte	0x263
	.4byte	0xff
	.byte	0x70
	.byte	0x18
	.4byte	.LASF105
	.byte	0x5
	.2byte	0x264
	.4byte	0xff
	.byte	0x78
	.byte	0x18
	.4byte	.LASF106
	.byte	0x5
	.2byte	0x265
	.4byte	0x7a2
	.byte	0x80
	.byte	0x18
	.4byte	.LASF107
	.byte	0x5
	.2byte	0x266
	.4byte	0x7b2
	.byte	0x88
	.byte	0x18
	.4byte	.LASF108
	.byte	0x5
	.2byte	0x267
	.4byte	0x5d
	.byte	0xa0
	.byte	0x18
	.4byte	.LASF109
	.byte	0x5
	.2byte	0x268
	.4byte	0xff
	.byte	0xa4
	.byte	0x18
	.4byte	.LASF110
	.byte	0x5
	.2byte	0x269
	.4byte	0xff
	.byte	0xac
	.byte	0x18
	.4byte	.LASF111
	.byte	0x5
	.2byte	0x26a
	.4byte	0xff
	.byte	0xb4
	.byte	0x18
	.4byte	.LASF112
	.byte	0x5
	.2byte	0x26b
	.4byte	0xff
	.byte	0xbc
	.byte	0x18
	.4byte	.LASF113
	.byte	0x5
	.2byte	0x26c
	.4byte	0xff
	.byte	0xc4
	.byte	0x18
	.4byte	.LASF114
	.byte	0x5
	.2byte	0x26d
	.4byte	0x5d
	.byte	0xcc
	.byte	0
	.byte	0x9
	.4byte	0x11d
	.4byte	0x7a2
	.byte	0xa
	.4byte	0x64
	.byte	0x19
	.byte	0
	.byte	0x9
	.4byte	0x11d
	.4byte	0x7b2
	.byte	0xa
	.4byte	0x64
	.byte	0x7
	.byte	0
	.byte	0x9
	.4byte	0x11d
	.4byte	0x7c2
	.byte	0xa
	.4byte	0x64
	.byte	0x17
	.byte	0
	.byte	0x1b
	.byte	0xf0
	.byte	0x5
	.2byte	0x272
	.4byte	0x7e6
	.byte	0x18
	.4byte	.LASF115
	.byte	0x5
	.2byte	0x275
	.4byte	0x7e6
	.byte	0
	.byte	0x18
	.4byte	.LASF116
	.byte	0x5
	.2byte	0x276
	.4byte	0x7f6
	.byte	0x78
	.byte	0
	.byte	0x9
	.4byte	0x2e6
	.4byte	0x7f6
	.byte	0xa
	.4byte	0x64
	.byte	0x1d
	.byte	0
	.byte	0x9
	.4byte	0x64
	.4byte	0x806
	.byte	0xa
	.4byte	0x64
	.byte	0x1d
	.byte	0
	.byte	0x1c
	.byte	0xf0
	.byte	0x5
	.2byte	0x257
	.4byte	0x828
	.byte	0x1d
	.4byte	.LASF66
	.byte	0x5
	.2byte	0x26e
	.4byte	0x691
	.byte	0x1d
	.4byte	.LASF117
	.byte	0x5
	.2byte	0x277
	.4byte	0x7c2
	.byte	0
	.byte	0x9
	.4byte	0x11d
	.4byte	0x838
	.byte	0xa
	.4byte	0x64
	.byte	0x18
	.byte	0
	.byte	0x1e
	.4byte	.LASF151
	.byte	0xe
	.byte	0x4
	.4byte	0x838
	.byte	0x1f
	.4byte	0x84e
	.byte	0x16
	.4byte	0x434
	.byte	0
	.byte	0xe
	.byte	0x4
	.4byte	0x843
	.byte	0xe
	.byte	0x4
	.4byte	0x187
	.byte	0x1f
	.4byte	0x865
	.byte	0x16
	.4byte	0x5d
	.byte	0
	.byte	0xe
	.byte	0x4
	.4byte	0x86b
	.byte	0xe
	.byte	0x4
	.4byte	0x85a
	.byte	0x9
	.4byte	0x5ff
	.4byte	0x881
	.byte	0xa
	.4byte	0x64
	.byte	0x2
	.byte	0
	.byte	0x20
	.4byte	.LASF118
	.byte	0x5
	.2byte	0x2fe
	.4byte	0x434
	.byte	0x20
	.4byte	.LASF119
	.byte	0x5
	.2byte	0x2ff
	.4byte	0x43a
	.byte	0x21
	.4byte	.LASF120
	.byte	0x6
	.byte	0x63
	.4byte	0x117
	.byte	0x21
	.4byte	.LASF121
	.byte	0x1
	.byte	0x18
	.4byte	0x8af
	.byte	0xe
	.byte	0x4
	.4byte	0x64
	.byte	0x22
	.4byte	.LASF122
	.byte	0x1
	.byte	0x19
	.4byte	0x64
	.byte	0x5
	.byte	0x3
	.4byte	Size
	.byte	0x23
	.4byte	.LASF152
	.byte	0x1
	.byte	0x1b
	.4byte	0x5d
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0xb71
	.byte	0x24
	.4byte	.LASF123
	.byte	0x1
	.byte	0x21
	.4byte	0xb71
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x24
	.4byte	.LASF124
	.byte	0x1
	.byte	0x22
	.4byte	0x64
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x7f
	.byte	0x24
	.4byte	.LASF125
	.byte	0x1
	.byte	0x24
	.4byte	0x64
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x24
	.4byte	.LASF126
	.byte	0x1
	.byte	0x2e
	.4byte	0x64
	.byte	0x3
	.byte	0x91
	.byte	0xac,0x7f
	.byte	0x24
	.4byte	.LASF127
	.byte	0x1
	.byte	0x2f
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x24
	.4byte	.LASF128
	.byte	0x1
	.byte	0x30
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x24
	.4byte	.LASF129
	.byte	0x1
	.byte	0x30
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x24
	.4byte	.LASF130
	.byte	0x1
	.byte	0x31
	.4byte	0x64
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x24
	.4byte	.LASF131
	.byte	0x1
	.byte	0x32
	.4byte	0x64
	.byte	0x3
	.byte	0x91
	.byte	0xa4,0x7f
	.byte	0x24
	.4byte	.LASF132
	.byte	0x1
	.byte	0x33
	.4byte	0x64
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0x24
	.4byte	.LASF133
	.byte	0x1
	.byte	0x33
	.4byte	0x64
	.byte	0x3
	.byte	0x91
	.byte	0x8c,0x7f
	.byte	0x24
	.4byte	.LASF134
	.byte	0x1
	.byte	0x34
	.4byte	0x64
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0x24
	.4byte	.LASF135
	.byte	0x1
	.byte	0x35
	.4byte	0x64
	.byte	0x3
	.byte	0x91
	.byte	0x9c,0x7f
	.byte	0x24
	.4byte	.LASF136
	.byte	0x1
	.byte	0x36
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x24
	.4byte	.LASF137
	.byte	0x1
	.byte	0x36
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x24
	.4byte	.LASF138
	.byte	0x1
	.byte	0x37
	.4byte	0x64
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0x24
	.4byte	.LASF139
	.byte	0x1
	.byte	0x38
	.4byte	0x64
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x7f
	.byte	0x24
	.4byte	.LASF140
	.byte	0x1
	.byte	0x38
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x24
	.4byte	.LASF141
	.byte	0x1
	.byte	0x38
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x24
	.4byte	.LASF142
	.byte	0x1
	.byte	0x39
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x24
	.4byte	.LASF143
	.byte	0x1
	.byte	0x3a
	.4byte	0x64
	.byte	0x3
	.byte	0x91
	.byte	0x84,0x7f
	.byte	0x24
	.4byte	.LASF144
	.byte	0x1
	.byte	0x3c
	.4byte	0x64
	.byte	0x3
	.byte	0x91
	.byte	0x94,0x7f
	.byte	0x24
	.4byte	.LASF145
	.byte	0x1
	.byte	0x6c
	.4byte	0xb77
	.byte	0x3
	.byte	0x91
	.byte	0xe0,0x5e
	.byte	0x24
	.4byte	.LASF146
	.byte	0x1
	.byte	0x6d
	.4byte	0xb77
	.byte	0x4
	.byte	0x91
	.byte	0xe0,0xbe,0x7f
	.byte	0x24
	.4byte	.LASF147
	.byte	0x1
	.byte	0x78
	.4byte	0xb71
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0x25
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0xa69
	.byte	0x26
	.string	"i"
	.byte	0x1
	.byte	0x27
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x25
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0xa83
	.byte	0x26
	.string	"i"
	.byte	0x1
	.byte	0x6f
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0x25
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0xa9d
	.byte	0x26
	.string	"i"
	.byte	0x1
	.byte	0x79
	.4byte	0x5d
	.byte	0x2
	.byte	0x91
	.byte	0x44
	.byte	0
	.byte	0x25
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0xab7
	.byte	0x26
	.string	"i"
	.byte	0x1
	.byte	0x8f
	.4byte	0x5d
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0
	.byte	0x25
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.4byte	0xadf
	.byte	0x26
	.string	"v"
	.byte	0x1
	.byte	0x94
	.4byte	0x5d
	.byte	0x3
	.byte	0x91
	.byte	0xfc,0x7e
	.byte	0x26
	.string	"a"
	.byte	0x1
	.byte	0x94
	.4byte	0x5d
	.byte	0x3
	.byte	0x91
	.byte	0xf8,0x7e
	.byte	0
	.byte	0x25
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.4byte	0xb07
	.byte	0x26
	.string	"v"
	.byte	0x1
	.byte	0x95
	.4byte	0x5d
	.byte	0x3
	.byte	0x91
	.byte	0xf4,0x7e
	.byte	0x26
	.string	"a"
	.byte	0x1
	.byte	0x95
	.4byte	0x5d
	.byte	0x3
	.byte	0x91
	.byte	0xf0,0x7e
	.byte	0
	.byte	0x25
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.4byte	0xb2f
	.byte	0x26
	.string	"v"
	.byte	0x1
	.byte	0x97
	.4byte	0x5d
	.byte	0x3
	.byte	0x91
	.byte	0xec,0x7e
	.byte	0x26
	.string	"a"
	.byte	0x1
	.byte	0x97
	.4byte	0x5d
	.byte	0x3
	.byte	0x91
	.byte	0xe8,0x7e
	.byte	0
	.byte	0x25
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.4byte	0xb59
	.byte	0x26
	.string	"val"
	.byte	0x1
	.byte	0x98
	.4byte	0x5d
	.byte	0x3
	.byte	0x91
	.byte	0xe0,0x7e
	.byte	0x26
	.string	"a"
	.byte	0x1
	.byte	0x98
	.4byte	0x5d
	.byte	0x3
	.byte	0x91
	.byte	0xe4,0x7e
	.byte	0
	.byte	0x27
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.byte	0x26
	.string	"i"
	.byte	0x1
	.byte	0x9e
	.4byte	0x5d
	.byte	0x3
	.byte	0x91
	.byte	0xbc,0x7f
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x4
	.4byte	0x6b
	.byte	0x28
	.4byte	0x64
	.byte	0x29
	.4byte	0x64
	.2byte	0x3ff
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0x1b
	.byte	0xe
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x17
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x13
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x13
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x17
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x13
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x23
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x24
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x28
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x29
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF40:
	.string	"_dso_handle"
.LASF48:
	.string	"_size"
.LASF92:
	.string	"_rand48"
.LASF130:
	.string	"problemSize"
.LASF72:
	.string	"_emergency"
.LASF62:
	.string	"_data"
.LASF112:
	.string	"_wcrtomb_state"
.LASF113:
	.string	"_wcsrtombs_state"
.LASF7:
	.string	"long long unsigned int"
.LASF52:
	.string	"_lbfsize"
.LASF134:
	.string	"nDim"
.LASF151:
	.string	"__locale_t"
.LASF110:
	.string	"_mbrtowc_state"
.LASF105:
	.string	"_wctomb_state"
.LASF29:
	.string	"__tm_sec"
.LASF6:
	.string	"long long int"
.LASF0:
	.string	"signed char"
.LASF58:
	.string	"_ubuf"
.LASF47:
	.string	"_base"
.LASF31:
	.string	"__tm_hour"
.LASF87:
	.string	"__sf"
.LASF38:
	.string	"_on_exit_args"
.LASF53:
	.string	"_cookie"
.LASF86:
	.string	"__sglue"
.LASF4:
	.string	"long int"
.LASF50:
	.string	"_flags"
.LASF42:
	.string	"_is_cxa"
.LASF68:
	.string	"_stdin"
.LASF124:
	.string	"size_count"
.LASF60:
	.string	"_blksize"
.LASF82:
	.string	"_cvtbuf"
.LASF61:
	.string	"_offset"
.LASF111:
	.string	"_mbsrtowcs_state"
.LASF109:
	.string	"_mbrlen_state"
.LASF39:
	.string	"_fnargs"
.LASF140:
	.string	"n_wg1"
.LASF141:
	.string	"n_wg2"
.LASF45:
	.string	"_fns"
.LASF25:
	.string	"_sign"
.LASF20:
	.string	"_flock_t"
.LASF70:
	.string	"_stderr"
.LASF27:
	.string	"_Bigint"
.LASF100:
	.string	"_gamma_signgam"
.LASF144:
	.string	"dataSize"
.LASF54:
	.string	"_read"
.LASF78:
	.string	"_result_k"
.LASF28:
	.string	"__tm"
.LASF8:
	.string	"unsigned int"
.LASF16:
	.string	"__wchb"
.LASF69:
	.string	"_stdout"
.LASF81:
	.string	"_cvtlen"
.LASF5:
	.string	"long unsigned int"
.LASF51:
	.string	"_file"
.LASF90:
	.string	"_niobs"
.LASF138:
	.string	"size"
.LASF3:
	.string	"short unsigned int"
.LASF84:
	.string	"_atexit0"
.LASF107:
	.string	"_signal_buf"
.LASF98:
	.string	"_asctime_buf"
.LASF77:
	.string	"_result"
.LASF15:
	.string	"__wch"
.LASF149:
	.string	"main.c"
.LASF14:
	.string	"wint_t"
.LASF146:
	.string	"target"
.LASF63:
	.string	"_lock"
.LASF65:
	.string	"_flags2"
.LASF139:
	.string	"n_wg0"
.LASF55:
	.string	"_write"
.LASF34:
	.string	"__tm_year"
.LASF116:
	.string	"_nmalloc"
.LASF9:
	.string	"long double"
.LASF115:
	.string	"_nextf"
.LASF33:
	.string	"__tm_mon"
.LASF43:
	.string	"_atexit"
.LASF120:
	.string	"suboptarg"
.LASF75:
	.string	"__sdidinit"
.LASF11:
	.string	"_off_t"
.LASF143:
	.string	"nParams"
.LASF80:
	.string	"_freelist"
.LASF122:
	.string	"Size"
.LASF10:
	.string	"_LOCK_RECURSIVE_T"
.LASF137:
	.string	"size2"
.LASF150:
	.string	"/home/munozher/Documents/demo/vivado_riscv/vivado-risc-v/bare-metal/copy"
.LASF131:
	.string	"offset0"
.LASF133:
	.string	"offset2"
.LASF1:
	.string	"unsigned char"
.LASF145:
	.string	"param1"
.LASF83:
	.string	"_new"
.LASF125:
	.string	"start_addr"
.LASF114:
	.string	"_h_errno"
.LASF2:
	.string	"short int"
.LASF36:
	.string	"__tm_yday"
.LASF46:
	.string	"__sbuf"
.LASF91:
	.string	"_iobs"
.LASF88:
	.string	"__FILE"
.LASF19:
	.string	"_mbstate_t"
.LASF49:
	.string	"__sFILE"
.LASF64:
	.string	"_mbstate"
.LASF101:
	.string	"_rand_next"
.LASF103:
	.string	"_mblen_state"
.LASF71:
	.string	"_inc"
.LASF44:
	.string	"_ind"
.LASF74:
	.string	"_locale"
.LASF76:
	.string	"__cleanup"
.LASF73:
	.string	"_unspecified_locale_info"
.LASF24:
	.string	"_maxwds"
.LASF66:
	.string	"_reent"
.LASF132:
	.string	"offset1"
.LASF93:
	.string	"_seed"
.LASF123:
	.string	"cram_ptr"
.LASF17:
	.string	"__count"
.LASF148:
	.string	"GNU C11 7.2.0 -march=rv32imac -mabi=ilp32 -mcmodel=medany -g -O0 -fno-pic -fno-common"
.LASF56:
	.string	"_seek"
.LASF118:
	.string	"_impure_ptr"
.LASF12:
	.string	"_fpos_t"
.LASF67:
	.string	"_errno"
.LASF21:
	.string	"char"
.LASF127:
	.string	"wg_size"
.LASF30:
	.string	"__tm_min"
.LASF142:
	.string	"nWF_WG"
.LASF94:
	.string	"_mult"
.LASF135:
	.string	"size0"
.LASF136:
	.string	"size1"
.LASF23:
	.string	"_next"
.LASF97:
	.string	"_strtok_last"
.LASF18:
	.string	"__value"
.LASF41:
	.string	"_fntypes"
.LASF95:
	.string	"_add"
.LASF129:
	.string	"wg_size2"
.LASF22:
	.string	"__ULong"
.LASF108:
	.string	"_getdate_err"
.LASF126:
	.string	"wg_size0"
.LASF128:
	.string	"wg_size1"
.LASF119:
	.string	"_global_impure_ptr"
.LASF121:
	.string	"code"
.LASF96:
	.string	"_unused_rand"
.LASF26:
	.string	"_wds"
.LASF35:
	.string	"__tm_wday"
.LASF89:
	.string	"_glue"
.LASF13:
	.string	"_ssize_t"
.LASF106:
	.string	"_l64a_buf"
.LASF85:
	.string	"_sig_func"
.LASF59:
	.string	"_nbuf"
.LASF117:
	.string	"_unused"
.LASF147:
	.string	"lram_ptr"
.LASF37:
	.string	"__tm_isdst"
.LASF99:
	.string	"_localtime_buf"
.LASF57:
	.string	"_close"
.LASF102:
	.string	"_r48"
.LASF104:
	.string	"_mbtowc_state"
.LASF79:
	.string	"_p5s"
.LASF152:
	.string	"main"
.LASF32:
	.string	"__tm_mday"
	.ident	"GCC: (GNU) 7.2.0"
