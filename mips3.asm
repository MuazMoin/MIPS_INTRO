.data
 

    space: .asciiz " "      # Definieer  spatie
    newline: .asciiz "\n"   # Definieer een string met een nieuwe regel
.text
    main:
        li $v0, 5         # Syscall-code 5 voor het inlezen van een integer
        syscall
       
        move $t0, $v0     # $t0 heeft de ingevoerde integer (n)

        li $t1, 0          # Start van de piramide

    loop_1:
        li $t2, 1          # Reset $t2 naar 1 voor elke rij

    print_numbers:
        bgt $t2, $t1, end_rij  # Als $t2 > $t1, ga naar het einde van de rij

        li $v0, 1
        move $a0, $t2
        syscall

        li $v0, 4
        la $a0, space     # Laad het adres van de spatie in $a0
        syscall

        addi $t2, $t2, 1
        j print_numbers

    end_rij:
        li $v0, 4
        la $a0, newline    # Laad het adres van de nieuwe regel in $a0
        syscall

        addi $t1, $t1, 1   # Verhoog het aantal getallen voor de volgende rij

        bgt $t1, $t0, end_program

        j loop_1

    end_program:
        li $v0, 10         # Syscall-code 10 voor het beëindigen van het programma
        syscall


