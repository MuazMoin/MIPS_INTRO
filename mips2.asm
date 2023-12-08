.data
	newline: .asciiz "\n"
	
	
.text
main:
	li $v0,	5	
	syscall		# Read int n from cmd
	
	move $t0, $v0
	
	li $t1, 1
	
FOR_LOOP_ENTRY:	
	bgt $t1, $t0, FOR_LOOP_EXIT	# if (i > n) then JUMP
	
	move $a0, $t1			# cout << i
	li $v0, 1
	syscall
	
	la $a0, newline			# cout << \n
	li $v0, 4
	syscall
	
	addi $t1, $t1, 1		# i = i + 1
	
	j FOR_LOOP_ENTRY
	
FOR_LOOP_EXIT:
	