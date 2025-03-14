.section .text
.global load
.type load, @function

load:
	add	a4, a0, zero //Initialize the sum register a4 with 0x0
	add 	a2, a0, a1   //Store the count of 10 in register a2. Register a1 is loaded with ax0 from main
	add	a3, a0, zero //Initialize the intermediate sum regsiter a3 by 0x0

loop:
	add 	a4, a3, a4   //Increament addition
	addi	a3, a3, 1    //Increament intermediate register by 1
	blt	a3, a2, loop //If a3 is less than a2, go to the branch named as <loop>
	add	a0, a4, zero //Store the final result to a0 register which will be read by main program
	ret
