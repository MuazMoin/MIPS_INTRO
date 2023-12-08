.data

	jumptbl: .word case_0, case_1, case_2

.text

main:
	li $v0, 5 #Syscall-code 5 voor het inlezen van een integer
	syscall
	move $t0, $v0 # $t0 bevat nu de ingevoerde integer
	
	
	li $t1, 0 #a = 0 #Initialisatie van $t1 (a) naar 0
	
	li $t2, 0 #ondergrens
	li $t3, 3 #bovens
	
	blt $t0, $t2, default_case #Als ingevoerde waarde < ondergrens, ga naar default_case
	bgt $t0, $t3, default_case #Als ingevoerde waarde > bovengrens, ga naar default_case

	
	
	la $s0, jumptbl #Laad het adres van de jump table
   	mul $t3, $t0, 4    #Bereken de offset in de jump table (elk adres is 4 bytes)
    add $t0, $s0, $t3  #Voeg de offset toe aan het basisadres van de jump table
	lw $t0, 0($t0) #Laad het adres van de gewenste case in $t0

    
    jr $t0 #Spring naar het adres van de geselecteerde case

	

	
	
case_0:
   	li $t1, 9
    	j end
	
case_1:
   	li $t1, 6

case_2:
    	li $t1, 8
    	j end 

default_case:
    
   	li $t1, 7
   	j end 
   	
end: 
	li $v0, 1 #Syscall-code 1 voor het printen van een integer
	move $a0, $t1 #Laad de waarde van $t1 (a) in $a0 voor het printen
	syscall 
	
	li $v0, 10 #Syscall-code 10 voor het beëindigen van het programma
	syscall 