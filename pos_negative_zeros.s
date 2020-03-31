#7o thema tou Iouniou 2017

	.text
	.globl __start
__start:
	  
	 li $s1, 0
	 li $s2, 0
	 li $s3, 0
	 li $s4, 44	

loop:	  jal print_endl  
	  li $v0, 5
	  syscall
	  move $s0, $v0
	  
	  beq $s0, $s4, Exit
	  
	  bgtz $s0, AddPos
	  bltz $s0, AddNeg
	  beqz $s0, AddZero	 	 

AddPos: add $s1, $s1, 1
		j out
AddNeg: add $s2, $s2, 1
		j out
AddZero: add $s3, $s3, 1
		j out	
	
out:     li $v0, 4
		 la $a0, pos
		 syscall
		 
		 li $v0, 1
		 move $a0, $s1
		 syscall
  		
		 jal print_endl
			
        li $v0, 4
         la $a0, negat
         syscall
		 
		 li $v0, 1
		 move $a0, $s2
		 syscall
		 
		 jal print_endl
		 
		 li $v0, 4
		 la $a0, zero
		 syscall
		 
		 li $v0, 1
		 move $a0, $s3
		 syscall
		 
		 jal print_endl 	
	
j loop

Exit: li $v0, 10
	  syscall
	  
print_endl: li $v0, 4
			la $a0, endl
			syscall
			jr $ra
			
.data
endl: .asciiz "\n"
pos: .asciiz "pos="
negat: .asciiz "neg="
zero: .asciiz "zero="  
