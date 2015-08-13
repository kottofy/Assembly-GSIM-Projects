#  Ex7_IO.s
# ----------------
# This is a program is to add two numbers and print out the sum.
# also, it shows how to do I/O operations.

.text
.globl main

main:

# Print Prompt on console
la $a0, Prompt1    # Load the address  of the string Prompt1 in $a0.
li $v0, 4          # load the system call code in $v0 for printing a string.
syscall            # make the system call.

# Print a carriage return
li $v0, 4
la $a0, CRLF      # move curser to next line by printing a CR and LF.
                              # This is in effect a println command.
syscall

# read an integer
li $v0, 5
syscall
sw $v0, Num1     # store the value at Num1.

# read another number
li $v0, 5        # load the system call code 5 for read integer.
syscall          # answer will be in $v0.
sw $v0, Num2

# Perform the addition
lw $t0, Num1
add $a0, $t0, $v0

# Print the sum
li $v0, 1   # load the system call code 1 for print _int.
syscall
la $a0, final
li $v0,4
syscall

# print Prompt2
la $a0, Prompt2
syscall

# Print a carriage return
li $v0, 4
la $a0, CRLF
syscall		# reading a string

# To read in a string, you have to first have a place for it.
# The address of this block of memory should be placed in $a0.
# Next the number of bytes this block can hold should be placed in $a1
# The read_string command will read up to 1 less than the number of
# bytes in $a1. It will place the null character into the nth. place.
# Note: If $a1 contains a number greater than the number of places
# allocated for the string you will over-write other variables
# in the data segment.
la $a0, Space
addi $a1,$0,11
li $v0, 8
syscall

#Print the Echo message and print the string just read in.
la $a0, Echo
li $v0, 4
syscall

# Print the string that was just read in
la $a0, Space
syscall
la $a0, Endofline
li $v0, 4
syscall    
li $v0, 10     #code 10 is for Exit.
syscall        # return to OS

##########
# Data
#########

    .data
Space: .ascii "           "
Echo: .asciiz " You entered:\n "
Num1: .word 0
Num2: .word 0
Prompt1: .ascii " Please type 2 integers, end each with the "
        .asciiz "Enter Key : "
Prompt2: .asciiz " Enter a string: "
CRLF: .byte 10,0
final: .asciiz " is the sum.\n"
Endofline: .asciiz "\n"
# End of file.