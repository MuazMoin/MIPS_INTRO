.data
	output_str: .asciiz "This is my "
	output_str_2: .asciiz "-th MIPS-program\n"
	
	
.text

main:

	li $v0,	5	
	syscall		# Read int n from cmd
	
	move $t0, $v0   #Int from $v0 to $t0
	


	li $v0, 4
	la $a0, output_str #print "This is my " naar $a0 
	syscall
	

	li $v0, 1	#print_integer
	move $a0, $t0  #move waarde in $to naar $a0
	syscall
	
	li $v0, 4 #print_string
	la $a0, output_str_2  #print "-th MIPS-program\n"
	syscall
	