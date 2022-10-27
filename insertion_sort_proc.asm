.text
#-------------------------------------------
# Procedure: insertion_sort
# Argument: 
#	$a0: Base address of the array
#       $a1: Number of array element
# Return:
#       None
# Notes: Implement insertion sort, base array 
#        at $a0 will be sorted after the routine
#	 is done.
#-------------------------------------------

insertion_sort:
	# Caller RTE store (TBD)
	addi $sp, $sp, -20
	sw $fp, 20($sp)
	sw $ra, 16($sp)
	sw $a0, 12($sp)
	sw $a1, 8 ($sp)
	addi $fp, $sp, 20

	# Implement insertion sort (TBD)
	#i index: t1
	#j index: t2
	#j-1: t6
	#A[j] address: t3
	#A[j] value: a2
	#A[j-1] address: t4
	#A[j-1] value: a3
	#length of array: a1
	#base address: a0
	addi $t1, $zero, 1 #i = 1
	addi $t2, $zero, 0 #initialize int j; j = 0
	#addi $t6, $zero, 0 #initialize j-1
	
	#for loop
loop1: beq $t1, $a1, insertion_sort_end #i < length of array
       move $t2, $t1 #j = i
       mul $t3, $t2, 4 #address of A[j] = a0 + t2*4
       add $t3, $t3, $a0 #address of A[j]
       lw $a2, ($t3) #value at A[j]= a2
       subi $t6, $t2, 1 #j-1
       mul $t4, $t6, 4 #address of A[j-1] = a0 + t6*4
       add $t4, $t4, $a0 #address of A[j-1]
       lw $a3, ($t4) #value at A[j-1] = a3
       j loop2
       #while loop 
loop2: blez $t2, end_loop2 #while j > 0
       ble  $a3 $a2, end_loop2 #while A[j-1] > A[j]
       sw $a3, ($t3) #set A[j] to A[j-1]
       sw $a2, ($t4) #set A[j-1] to A[j]
       lw   $a2 ($t3) #store A[j] into j address
       lw   $a3, ($t4) #store A[j-1] into j-1 address
       addi  $t2, $t2, -1 #j=j-1
       mul $t3, $t2, 4 #address of A[j] = a0 + t2*4
       add $t3, $t3, $a0 #address of A[j]
       lw $a2, ($t3) #value at A[j]= a2
       subi $t6, $t2, 1 #j-1
       mul $t4, $t6, 4 #address of A[j-1] = a0 + t6*4
       add $t4, $t4, $a0 #address of A[j-1]
       lw $a3, ($t4) #value at A[j-1] = a3 #set address of A[j] to a0 + t2*4
       j loop2
       
end_loop2: 
	addi $t1, $t1, 1
	j loop1
       
	
insertion_sort_end:
	# Caller RTE restore (TBD)
	lw $fp, 20($sp)
	lw $ra, 16($sp)
	lw $a0, 12($sp)
	lw $a1, 8 ($sp)
	addi $sp, $sp, 20
	# Return to Caller
	jr	$ra
