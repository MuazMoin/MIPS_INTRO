.data
	prime_string:  .asciiz "-- Prime --\n"
	noprime_string: .asciiz "-- No prime --\n"
	
	
.text

main:

	li $v0, 5 #read_int
	syscall
	move $t0, $v0 #waarde n naar $t0
	
	
	li, $t1, 1
	beq $t0, $zero, no_prime  #als waarde in $t0 gelijk is aan $zero, spring dan naar no_prime
	beq $t0, $t1, no_prime  #als waarde in $t0 gelijk is aan 1, spring dan naar no_prime
	
	li $t2, 2 

check_if_prime:
	blt $t2,$t0, deling #Als $t2 < $t0, ga naar het label 'deling'
	j prime #jump naar 'prime'
	

deling:	
	div $t0,$t2	#$t0 delen door #t2
	mfhi $t3 #rest opslagen in $t3
	
	beq $t3,$zero no_prime #als waarde in $t3 gelijk is aan $zero, spring dan naar no_prime
	addi $t2, $t2, 1 #voeg 1 toe aan de waarde in $t2
	j check_if_prime		#jump naar check_if_prime										

	
		
no_prime:
	li $v0, 4 #print_string
	la $a0, noprime_string #print "No prime"
	syscall
	j end

prime:					
	li $v0, 4 #print_string
	la, $a0, prime_string #print "Prime"
	syscall
	
		
end:
	li $v0, 10 #prog exit
	syscall		