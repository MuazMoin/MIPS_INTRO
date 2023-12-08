.data
pi: .float 3.14
	
.text

main:
	li $v0, 6 
	syscall
	mov.s $f1, $f0 #waarde in $f1 zetten
	
	l.s $f2, pi #waarde pi in $f2
	
	mul.s $f3, $f1, $f1 #radius kwadraat
	mul.s $f4, $f2, $f3 # radius kwadraat vermenigvuldigen met pi
	

	li  $v0, 2
	mov.s $f12, $f4 #$f12 print reg
	syscall
	
	
		
end:
	li $v0, 10 #prog exit
	syscall		