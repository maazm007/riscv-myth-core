#  RISC-V based MYTH Workshop 2025

The “RISC-V based MYTH (Microprocessor for You in Thirty Hours)” workshop provides a structured introduction to RISC-V architecture, covering software-to-hardware concepts through hands-on labs. The workshop delves into combinational and sequential logic, pipeline implementation, and microarchitecture of a single-cycle RISC-V CPU. The instructor for this workshop is Kunal Ghosh Sir and Steeve Hoover Sir.

##  Basic Details

**Name:** Maaz Mahmood Siddique    
**Email ID:** maazms999@gmail.com  
**GitHub Profile:** [maazm007](https://github.com/maazm007?tab=repositories)  
**LinkedIN Profile:** [maazm-ece-vlsi](https://www.linkedin.com/in/maazms-ece-vlsi/)

------------------------------------------------------------------------

<details>
<summary><b>Module 1: Introduction to RISC-V ISA and GNU Toolchain compiler</b></summary>

### What is RISC-V GNU Toolchain?
> The RISC-V GNU Compiler Toolchain is a free and open source cross-compiler for C and C++. It supports two build modes: Generic ELF/Newlib and Linux-ELF/glibc. The toolchain can be used to create assembly instructions and sequences for execution in a simulator and target FPGA  

* **Flow** = For any instruction to run and execute on the hardware, there is a defined flow that needs to be followed:-

  > HLL(.c file) or Assembly Language Code --> RISC-V Compiler --> Machine Level Language (Binary Form) --> Core performs operation based upon Binary Code. There is an interface present between RISC-V ISA and Hardware is HDL. HDL is use to create RISC-V specifications
  
### WHAT IS RISC-V?
* RISC-V is an open-source instruction set architecture (ISA) that allows developers to develop processors for specific applications.  
* RISC-V is based on reduced instruction set computer principles and is the fifth generation of processors built on this concept.  
* RISC-V can also be understood as an alternative processor technology which is free and open, meaning that it does not require you to purchase the license of RISC-V to use it.  

### INSTRUCTIONS FORMAT IN RISC-V  
The instructions format of a processor is the way in which machine language instructions are structured and organized for a processor to execute. It is made up of series of 0s and 1s, each containing information about the location and operation of data.  

There are 6 instruction formats in RISC-V:  
1. R-format  
2. I-format  
3. S-format  
4. B-format *(conditional jump)*  
5. U-format  
6. J-format *(unconditional jump)*


### Lab 1(a): C program to compute sum from 1 to N

We have to follow the given steps to compile any **.c** file in our machine:  
1. Open the bash terminal and locate to the directory where you want to create your file. Then run the following command:

	```
	gedit sum_1ton.c
	```  
2. This will open the editor and allows you to write into the file that you have created. You have to write the C code of printing the sum of n numbers. Once you are done with your code, press ```Ctrl + S``` to save your file, and then press ```Ctrl + W``` to close the editor.  

```
#include<stdio.h>
int main()
{
    int sum = 0;
    int n;
    printf("Enter the number : ");
    scanf("%d",&n);
    for(int i = 1;i <= n;i++)
    {
        sum += i;
    }
    printf("The value of sum of %d numbers are %d\n",n,sum);
    return 0;
}
```

3. To execute the C code on your terminal, run the following command:

```
gcc sum_1ton.c
./a.out
```  
	
### Lab 1(b): RISC-V GCC Compile and Disassemble

Using the ```cat``` command, the entire C code will be displayed on the terminal. Now run the following command to compile the code in riscv64 gcc compiler:  

```
riscv64-unknown-elf-gcc -Os -mabi=lp64 -march=rv64i -o sum_1ton.o sum_1ton.c
```
Open a new terminal and run the given command:    

```
riscv64-unknown-elf-objdump -d sum_1ton.o | less
```
*Following are the snapshots that captures the working of above commands*

![Pic1](https://github.com/user-attachments/assets/2e121270-f7fe-4b94-883c-1781e8b61c74)  

![Pic2](https://github.com/user-attachments/assets/d76ffad5-0e06-4b94-b1e0-2951eb711223)


### Lab 1(c): SPIKE Simulation and Debugging
The target is to run the ```sum_1ton.c``` code using both ```gcc compiler``` and ```riscv compiler```, and both of the compiler must display the same output on the terminal. So to compile the code using **gcc compiler**, use the following command:  
```
gcc sum_1ton.c  
./a.out
```
And to compile the code using **riscv compiler**, use the following command:  
```
spike pk sum_1ton.o
```  
*Following are the snapshots that captures the working of above commands*   

![Pic3](https://github.com/user-attachments/assets/3b45afdf-5236-4f2c-80fe-50e0aa64fd8b)  

![Pic4](https://github.com/user-attachments/assets/b49863f4-9e89-4e56-bbce-3a60d61701d3)

### Lab 1(d): Integer Number Representation

* Fundamental Data Types

    > Byte = 8 bits  
    Word = 2 bytes = 16 bits  
    Double Word = 4 bytes = 32 bits  
    Quad Word = 8 bytes = 64 bits
* RISC-V double word can represent **0 to (2<sup>64 </sup> - 1)**, ie ```0 to 18,446,744,073,709,551,615``` unsigned numbers or postive numbers
* For n-bits, signed number ranges between **-(2<sup>n - 1</sup>) to (2<sup>n - 1</sup>) - 1**
> For example: if n = 4 bits, then total signed numbers that can be represented will range from -8 to 7
* RISC-V double word can represent ```-9,223,372,036,854,775,808 to 9,223,372,036,854,775,807``` signed numbers

```
#include<stdio.h>
#include<math.h>
int main()
{
	long long int max = (long long int)(pow(2,63) -1);
	long long int min = (long long int)(pow(2,63) * -1);
	printf("Highest Signed Number of 4 bits is %lld\n",max);
	printf("Lowest Signed Number of 4 bits is %lld\n",min);
	return 0;
}
```

*Following are the snapshots that captures the calculation of range of signed and unsigned numbers using riscv compiler*   

![Pic5](https://github.com/user-attachments/assets/5516a7fa-5b3c-47f7-b846-de2a97590e2f)  

![Pic6](https://github.com/user-attachments/assets/197f9d2f-73c2-4242-94d0-913e36ba0f80)



</details>

----------------

<details>
<summary><b>Module 2: Introduction to ABI and Basic Verification Flow</b></summary>
