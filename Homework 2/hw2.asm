.data
buffer: .word
temparray:  .space 40
comma: .asciiz ","
message: .asciiz "file couldn't open!\n"
	.align 4
array: .space 40
hyphen: .asciiz "-"
endline: .asciiz "\n"
string2: .asciiz "maximum sequence with increasing order: " 
string: .asciiz "size: "
	.align 4
longest: .space 40
	.align 4
temp: 	.space 40 #temp array which will be holds temporary sequence
file: .asciiz "input1.txt"
file2: .asciiz "input2.txt"
file3: .asciiz "input3.txt"
file4: .asciiz "input4.txt"
file5: .asciiz "input5.txt"
file6: .asciiz "input6.txt"
.text

#s7 stores size of readed array
li $s6, 0 #holds the filw which will be open
main:
	beq $s6, 5, openfile6
	beq $s6, 2, openfile3
	beq $s6, 3, openfile4
	beq $s6, 4, openfile5
	beq $s6, 1, openfile2
	beq $s6, 0, openfile
	beq $s6, 6, exitt
	bne $t0,$zero,error

openfile6:
	la $a0, file6
	li $v0, 13
	li $a1, 0
	li $a2, 0
	syscall
	move $s0, $v0 #file descriptor in s0 register
	slti $t0, $v0,0
	j read

openfile4:
	la $a0, file4
	li $v0, 13
	li $a1, 0
	li $a2, 0
	syscall
	move $s0, $v0 #file descriptor in s0 register
	slti $t0, $v0,0
	j read
	
openfile3:
	la $a0, file3
	li $v0, 13
	li $a1, 0
	li $a2, 0
	syscall
	move $s0, $v0 #file descriptor in s0 register
	slti $t0, $v0,0
	j read
openfile5:
	la $a0, file5
	li $v0, 13
	li $a1, 0
	li $a2, 0
	syscall
	move $s0, $v0 #file descriptor in s0 register
	slti $t0, $v0,0
	j read

openfile2:
	la $a0, file2
	li $v0, 13
	li $a1, 0
	li $a2, 0
	syscall
	move $s0, $v0 #file descriptor in s0 register
	slti $t0, $v0,0
	j read
	
openfile: #opens “input.txt”. If there is a error it stores zero in $t0 register. Error checking executes in main.
	la $a0, file
	li $v0, 13
	li $a1, 0
	li $a2, 0
	syscall
	move $s0, $v0 #file descriptor in s0 register
	slti $t0, $v0,0
	j read

error: #error checking for opening file
	li $v0,4
	la $a0, message
	syscall
	li $v0, 10
	syscall

exitread: #terminates reading
	j init

read: #read input and stores into buffer.
	li $v0, 14
	move $a0, $s0
	la $a1, buffer
	li $a2, 44
	syscall
	j initialize
	
initialize: # initiliaze neccessary values which will be used parsing string.
	li $s0, 0 # index of array which will be used for readed string
	li $s1, 0 # index of second array which will be used for parsing
	li $s7, 0 # total number off integers which will be stored from file

fillArray: #fills integer arrays from buffer
	lb $t2, buffer($s0) #loading char to t2 register
	beq $t2, 0, flag1
	beq $t2, 44, atoiload # comma come
	sb $t2, temparray($s1) # loading char to temp array
	addi $s0, $s0, 1
	addi $s1, $s1, 1
	j fillArray

flag1:
	li $t9, -1
	j atoiload
	
atoiload:
	move $t0, $s1 #index of second array filled with integers
	li $t1, 1 # for pow 10
	li $t3, 0 # for store result,
	j atoi	
	
atoi: # convert string to integer
	beq $t0, $zero, reset
	addi $t0, $t0, -1
	lb $t4 , temparray($t0)
	addi $t4, $t4, -48
	mul $t2, $t1, $t4
	add $t3, $t3, $t2
	mul $t1, $t1, 10
	j atoi
	
reset: #resets temporary values
	li $s1, 0
	addi $s0, $s0, 1
	sw $t3, array($s7) #filling array
	addi $s7, $s7, 4
	beq $t9, -1, exitread
	j fillArray
	
#finding sequence
init: # initializes neccessary values
	li $t7, 0 #counter
	li $t0, 0 #i
	li $s3, 0 # longest length
	li $s4, 0 # temp length
	
findSeq: #starts first loop
	beq $t0, $s7, exitwithprint
	add $t1, $t0, 4 # t1 register holds j
	j secondLoop

copy: #copies largest sequence from temporary array
	beq $t6, $s4, findreset
	lw $t5, temp($t6)
	sw $t5, longest($t6)
	add $t6, $t6, 4
	j copy
	
findreset: #resets temporary array size.
	move $s3, $s4
	li $s4, 0
	j findSeq2

findSeq2: #prints inner sequences to terminal.
	li $t6, 0
	bgt $s4, $s3, copy
	li $v0, 4
	la $a0, string
	syscall
	li $v0, 1
	div $a0, $t7, 4
	syscall
	li $t7, 0
	li $v0, 4
	la $a0, endline
	syscall
	add $t1, $t1, 4
	li $s4, 0 # resetting temp length for second sequence
	j secondLoop

increment: #increments i value
	add $t0, $t0, 4 
	j findSeq
	
secondLoop: #executes second loop
	beq $t1, $s7, flag
	lw $s0, array($t0) # s0 hold max int
	lw $t9, array($t1) # t9 = array[j] 
	bgt $t9, $s0, loop3init #if condition
	add $t1, $t1, 4
	j secondLoop
	
loop3init: #executes third loop and prints some values of inner sequences.
	li $t7, 0
	lw $s0, array($t1)
	addi $t7, $t7, 8
	lw $t9, array($t0) #print array[i]
	move $a0, $t9
	jal print
	lw $a0, array($t1) #print array[j]
	jal print
	add $t2, $t1, 4 # t2 register holds k
	j loop3

loop3: # k loop
	beq $t2, $s7, findSeq2
	lw $t9, array($t2)
	bgt $t9, $s0, print2
	add $t2, $t2, 4
	j loop3
	
print2: #print 2 function prints first two values
	lw $a0, array($t2)
	lw $s0, array($t2)
	sw $s0, temp($s4)
	add $s4, $s4, 4
	li $v0, 1
	syscall
	add $t7, $t7, 4
	li $v0, 4
	la $a0, hyphen
	syscall
	add $t2, $t2, 4
	j loop3

flag:
	add $t0, $t0, 4
	j findSeq
print:#prints inner sequence
	sw $a0, temp($s4)
	add $s4, $s4, 4
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, hyphen
	syscall
	jr $ra	
exitwithprint: #executes print longest sequence.
	li $t0 , 0
	li $v0, 4
	la $a0, string2
	syscall
	j printLongest
	
terminate: #prints final messages and terminates program for reading other file
	li $v0, 4
	la $a0, string
	syscall
	li $v0, 1
	div $a0, $s3, 4
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	j factoryreset
	
printLongest: #prints longest sequence
	beq $t0, $s3, terminate
	lw $t1, longest($t0)
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 4
	la $a0, hyphen
	syscall
	add $t0, $t0 , 4
	j printLongest

factoryreset: #resets registers for reading other file
	add $s6, $s6, 1
	li $a2, 0
	li $t2, 0
	li $s3, 0
	li $s7, 0
	li $t9, 0
	j main
	
exitt: #end of the program
	li $v0, 10
	syscall
	
#### this part writed for writing file the longest sequence. I couldn't convert to integer to charachter so I couldn't accomplished this part.
findDigit: #finds the digit number of integer
	blt $t0, 10, itoaLoad
	add $t1, $t1, 1
	div $t0, $t0, 10
	j findDigit
	
itoaLoad:
	move $s1, $t1 # digit
	li $t0, 0
	j itoa
	
pow: #executes pow operation
	bgt $t0, $s1, exitPow
	mul $t2, $t2, 10 #t2 stores pow results
	add $t0, $t0 ,1	
	
itoa:
	li $t2, 1
	
exitPow:
	li $v0, 10 
	syscall