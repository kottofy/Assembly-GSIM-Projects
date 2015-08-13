.text
.globl main

main: 	sub $sp, $sp, 8
	sw $ra, 4($sp)
	sw $a0, 0($sp)		# $a0 will contain the result
	addi $a0, $0, 3		# n = 3
	jal fact
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8

	# print the result
	addi $a0, $v0, 0
	li $v0, 1
	syscall
	jr $ra
fact:
	sub $sp, $sp, 8		# stack frame for each fact()
	sw $ra, 4($sp)		# stack frame for each fact()
	sw $a0, 0($sp)		# stack frame for each fact()
	
	#test if n<1
	slti $t0, $a0, 1
	beq $t0, $0, L1		# if n>=1 go to L1
	lw $ra 4($sp)
	lw $a0, 0($sp)
	addi $v0, $a0, 1	# return 1
	add $sp, $sp, 8		# restore the $sp
	jr $ra
	
L1:				# if n>=1
	sub $a0, $a0, 1
	jal fact
	lw $ra, 4($sp)
	lw $a0, 0($sp)
	addi $sp, $sp, 8
	mul $v0, $a0, $v0	# return n*fact(n-1)
	jr $ra
	
	# end of file
