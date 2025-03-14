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

### What is ABI?
ABI (application binary interface), as the name says, is an interface, that helps programs access system hardware and services. Some parts of architecture are accessible to Opearting System and some are accessible to Application Program, also called as User and System ISA and User ISA respectively.  
  
**System Call** is the method through which application programs access some of the ISA of hardware (mainly registers) and the interface that allows the application program to perform this is known as **Application Binary Interface**  
  
* RISC-V belongs to *little-endian* memory addressing system. In the RISC-V architecture, a little-endian system stores the least significant byte (LSB) of a multi-byte data type at the lowest memory address, while the most significant byte (MSB) is stored at the highest memory address  
* As discussed in Module 1, that there are 6 insruction formats in RISC-V architecture. The bit by bit description of each instruction format is shown in the below table:-  
 
![RISCV Instruction Types](https://github.com/user-attachments/assets/955e2ee7-c553-4971-b8f3-e5968f47157b)
 
  
* The ABI performs the System Call through available 32 registers. Each register has their respective ABI names. Following table shows the complete description of ABI Inetrface names of each register:-  

<img width="500" alt="ABI" src="https://github.com/user-attachments/assets/88120ab6-ae12-4fd7-8fd8-bc4efca3a901" />
  
  
### Lab 2(a): C Program using Assembly Language   
We will take the similar program what we did in Lab 1, ie to calculate the sum of numbers from 1 to N. The flowchat that needs to be followed to write the assembly language code of the sum program is as follows:-  

<img width="723" alt="Flowchart" src="https://github.com/user-attachments/assets/dd5a63b6-a9b6-41e6-9bce-5473795d0e28" />
 
  
Now, we will create two different files to code the mentioned flowchart. Using **sum1to9_ASS.c** file we will initialize the variables and pass the values to assembly language program  
```
#include<stdio.h>

extern int sum1to9_ASS (int x, int y);

int main()
{
	int result = 0;
	int count = 9;
	result = sum1to9_ASS(0x0, count+1);
	printf("Sum of number from 1 to %d is %d\n", count, result);
	return 0;
}
```  
  
  Create another file that has been called in the .c program file as **sum1to9_ASS.S** and write the assembly language code
  
```
.section .text
.global load
.type load, @function

load:
        add     a4, a0, zero //Initialize the sum register a4 with 0x0
        add     a2, a0, a1   //Store the count of 10 in register a2. Register a1 is loaded with ax0 from main
        add     a3, a0, zero //Initialize the intermediate sum regsiter a3 by 0x0

loop:
        add     a4, a3, a4   //Increament addition
        addi    a3, a3, 1    //Increament intermediate register by 1
        blt     a3, a2, loop //If a3 is less than a2, go to the branch named as <loop>
        add     a0, a4, zero //Store the final result to a0 register which will be read by main program
        ret  
```

Once done, now simply compile the code using riscv compiler and we will get the desired result  

![Assembly Output](https://github.com/user-attachments/assets/f35cb19b-2218-4f5a-9896-8db4e8406ec5)


</details>

------


<details>
<summary><b>Module 3: Digital Logic with TL-Verilog and Makerchip</b></summary>  

### What is Makerchip?
  
> Makerchip is a free, online integrated development environment (IDE) for digital logic design, primarily focused on Verilog and Transaction-Level Verilog (TL-Verilog), allowing users to code, compile, simulate, and debug designs directly in their browser  
  
### What is TL-Verilog?   
> TL-Verilog is a Verilog implementation of TL-X, a language extension defined as a wrapper to any HDL to extend it with transaction-level modeling. This makes it more powerful and has a significant code reduction as compared to other HDL languages

### Advantages of TL-Verilog over Verilog HDL?
> 1) Introduces simpler syntax unlike other HDL like System Verilog or Verilog, hence reduces the number of lines in a code resulting in fewer bugs.  
> 2) Is more flexible. Easier to optimize your logic without bugs.
> 3) Is “timing abstract” for pipelines, which makes retiming easy and safe.
> 4) Knows when signals are valid, which provides easier debug, cleaner design, better error checking, and automated clock gating.
> 5) Visual Debug (VIZ) is an additional feature to the Makerchip platform which makes the debugging process much easier.
> 6) It supports “Transactions” and a simpler form of design hierarchy.

### Lab 3(a): Combinational Logic
Here, firstly we will design few basic logic gates and then will try to design the circuit that performs mathenatical calculations like finding the value of longest side of right-angled triangle using Pythagoras Theorem. And at last we will be combining all the combinational logic to design the Calculator

* One of the greatest advantage I feel using TL-Verilog is that we don't have to apply test inputs to our design to verify the simulation, it automatically applies random stimulus.  

*Following are the snapshots that captures the design of combinational circuits on Makerchip platform using TL-Verilog* 

* **Inverter Circuit** 

<img width="959" alt="Ckt01_Inverter" src="https://github.com/user-attachments/assets/bd57d2d6-0c5a-44e5-976f-96f814081d5a" />  

  
* **AND Circuit**  

![Ckt02_AND](https://github.com/user-attachments/assets/3b82703e-9c68-4717-9ab2-862b93f732d7)


* **OR Circuit**  

![Ckt03_OR](https://github.com/user-attachments/assets/98a2ab28-c809-4579-b6f5-60d69109c392)


* **XOR Circuit**

![Ckt04_XOR](https://github.com/user-attachments/assets/5e2bbf9f-7e8f-4da0-889d-637c60617aaf)


* **Use of Vector (Arrays)**

<img width="959" alt="Ckt05_Vector" src="https://github.com/user-attachments/assets/2a63976f-7623-43e1-a13a-ae9e97b41f74" />  

  
* **Multiplexer Circuit**  

![Ckt06_Mux](https://github.com/user-attachments/assets/e8f84add-fde5-4e4f-a9db-7fd859b04e24)


* **Simple Calculator**  

> Here, ```$rand``` function is used to select any random value within the specified range 
 
<img width="959" alt="Ckt07_Calculator" src="https://github.com/user-attachments/assets/73810da4-72f3-48cd-a080-396865352f53" />


### Lab 3(b): Sequential Logic

Here, we will be using ```>>?``` operator which is known an ```ahead of``` operator. It helps to provide the value of specified signal '?' cycles before, which can be understood as a feedback path or the memory element that stores the last value executed on that signal

* **Free Running Counter** 

<img width="959" alt="Ckt08_FreeRunning" src="https://github.com/user-attachments/assets/74da4166-27ac-4dd3-abf1-cceb23066656" />  

  
* **Fibonacci Series**

> Here, don't confuse 21 with 15, as 15 is written in hexadecimal format which is actually ```0001_0101 = 16 + 4 + 1 = 21```

<img width="959" alt="Ckt09_Fibonacci" src="https://github.com/user-attachments/assets/e88bca0d-7c7c-435d-8654-3e2b4b916fa4" />  

  
* **Sequential Calculator: A real calculator that remembers the last result and use it for next calculation**

<img width="439" alt="Seq_Calci_BD" src="https://github.com/user-attachments/assets/4ac683ba-5223-4bee-b632-f755ae914487" />
 
<img width="959" alt="Ckt10_SeqCalci" src="https://github.com/user-attachments/assets/a241cae9-55e3-4b1d-b03b-609d64cc7d78" />  

  
* **Pythagoras Theorem**  

<img width="959" alt="Ckt11_Pythagoras" src="https://github.com/user-attachments/assets/f2a3a7de-4b5a-4096-839d-ce07a31305c7" />

* **Pipelined Logic:** Timing Abstract and Staging is one of the most powerful feature of TL-Verilog. Each pipelined stage is defined as ```@?``` and the codes written under this scope, falls in the same stage. Pipelining also helps to operate the circuit at high frequency as the computation of signals gets distributed in various stages.

* **Validity:** Validity is yet again one of most powerful feature of TL-Verilog. It is defined as ```?$valid``` and the codes falling under this scope is treated like when the signals are valid, it will execute else it will be treated as **Don't Care.** Validity provides Easier Debug, Cleaner Design, Better Error Checking and Automated Clock Gating

* **Cyclic Calculator with Validity**  

<img width="418" alt="Cyclic_Calci_BD" src="https://github.com/user-attachments/assets/700e66be-ba9f-4c26-963a-0aeeb731a2e9" />

<img width="959" alt="Ckt14_CycleCalciValidity" src="https://github.com/user-attachments/assets/e29ead03-6c8c-4095-895c-b6d79836ba60" />

</details>

---------------------

<details>
<summary><b>Module 4: Basic RISC-V CPU Microarhitecture</b></summary>

### Designing 3 Stage basic Processor which is based on Opcode Fetch, Decode and Execute

* **Fetch:** Program Counter store the address of instruction that needs to be fetch from the Memory. Processor fetches the instruction from the memory pointed at the address given by Program Counter.

<img width="959" alt="Ckt15_InstructionFetch" src="https://github.com/user-attachments/assets/a66f1387-1e34-48b1-afa6-20519af28350" />

  
* **Decode:** Once the instruction is fetched from the memory, then comes the procedure to understand what does that instruction mean? Decoder Block will come into picture which helps to identify the type of instruction.
```
//Decode Logic
$is_i_instr = $instr[6:2] ==? 5'b0000x || $instr[6:2] ==? 5'b001x0 || $instr[6:2] ==? 5'b11001;
       //$instr[6:2] ==? 5'b11100; //unused
         $is_s_instr = $instr[6:2] ==? 5'b0100x;
         $is_r_instr = $instr[6:2] ==? 5'b011x0 || $instr[6:2] ==? 5'b01011 || $instr[6:2] ==? 5'b10100;
         $is_u_instr = $instr[6:2] ==? 5'b0x101;
         $is_b_instr = $instr[6:2] ==? 5'b11000;
         $is_j_instr = $instr[6:2] ==? 5'b11011;
         
//Immediate Decode Logic
$imm[31:0] = $is_i_instr ? {{21{$instr[31]}},$instr[30:20]} :
         $is_s_instr ? {{21{$instr[31]}},$instr[30:25],$instr[11:7]} :
         $is_u_instr ? {$instr[31:12],12'b0} :
         $is_b_instr ? {{20{$instr[31]}},$instr[7],$instr[30:25],$instr[11:8],1'b0} :
         $is_j_instr ? {{12{$instr[31]}},$instr[19:12],$instr[20],$instr[30:25],$instr[24:21],1'b0} : 32'b0;
        
//Instruction Decode
         $opcode[6:0] = $instr[6:0];
         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
         $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
         $func3_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
         $func7_valid = $is_r_instr;
         
         ?$rs1_valid
            $rs1[4:0] = $instr[19:15];
         
         ?$rs2_valid
            $rs2[4:0] = $instr[24:20];
         
         ?$func3_valid
            $func3[2:0] = $instr[14:12];
         
         ?$func7_valid
            $func7[6:0] = $instr[31:25];
         
         ?$rd_valid
            $rd[4:0] = $instr[11:7];
```
* **Register File (RF) Read/Write:** At this stage there are two read operations and one write operation. Two read operation has been used because there two different Source Registers or you can say there are two different operands on which the operation has to be performed. Following are the signals in Regsiter File Read/Write  

> 1- ```$rf_rd_en1``` **Read Enable 1**: While performing read operation on first source register, this signal is logic high  
> 2- ```$rf_rd_en2``` **Read Enable 2**: While performing read operation on second source register, this signal is logic high  
> 3- ```$rf_rd_index1[4:0]``` **Read Address 1**: It contain the address from where the data has to be read  
> 4- ```$rf_rd_index2[4:0]``` **Read Address 2**: It contain the address from where the data has to be read  
> 5- ```$rf_wr_en``` **Write Enable**: While performing write operation on first source register, this signal is logic high  
> 6- ```$rf_wr_index[4:0]``` **Write Address**: It contain the address where data has to be written  
> 7- ```$rf_wr_data[31:0]``` **Write Data**: It contains the data that has to be written on Write Address  

* **Execute**: Once the data has been read from Source Registers, now comes the operation of execution based upon the Opcode. The execution operation is performed by **Arithmetic Logic Unit (ALU)**  
```
//ALU Operation
$sltu_result = $src1_value < $src2_value;
$sltiu_result = $src1_value < $imm;
         
$result[31:0] = $is_addi ? $src1_value + $imm :
     $is_add ? $src1_value + $src2_value : 
     $is_andi ? $src1_value & $imm :
     $is_xori ? $src1_value ^ $imm :
     $is_ori ? $src1_value | $imm :
     $is_slli ? $src1_value << $imm[5:0] : 
     $is_srli ? $src1_value >> $imm[5:0] :
     $is_and ? $src1_value & $src2_value :
     $is_xor ? $src1_value ^ $src2_value :
     $is_or ? $src1_value | $src2_value : 
     $is_sub ? $src1_value - $src2_value : 
     $is_sll ? $src1_value << $src2_value[4:0] : 
     $is_srl ? $src1_value >> $src2_value[4:0] :
     $is_sltu ? $src1_value < $src2_value :
     $is_lui ? {$imm[31:12],12'b0} :
     $is_auipc ? $pc + $imm : 
     $is_jal ? $pc + $imm :
     $is_jalr ? $pc + $imm :
     $is_srai ? {{32{$src1_value[31]}},$src1_value} >> $imm[4:0] :
     $is_sra ? {{32{$src1_value[31]}},$src1_value} >> $src2_value[4:0] :
     $is_slt ? ($src1_value[31] == $src2_value[31]) ? $sltu_result : {31'b0,$src1_value[31]} :
     $is_slti ? ($src1_value[31] == $imm[31]) ? $sltiu_result : {31'b0,$src1_value[31]} :
     $is_sltiu ? $src1_value < $imm : 32'bx;
```     
   
<img width="677" alt="Ckt18_ALU" src="https://github.com/user-attachments/assets/89ada2ab-ddfe-4b6e-95cd-03785e64e4e2" />  


    
* **Control Logic**: While decoding and executing, Branch Target Address is also updated. If any branch instruction is found, it's address will be hooked up in the Program Counter Multiplexer  
```
//Branching Instructions
$taken_br = $is_beq ? ($src1_value == $src2_value) :
     $is_bne ? ($src1_value != $src2_value) :
     $is_blt ? (($src1_value < $src2_value) ^ ($src1_value[31] != $src2_value[31])) :
     $is_bge ? (($src1_value >= $src2_value) ^ ($src1_value[31] != $src2_value[31])) :
     $is_bltu ? ($src1_value < $src2_value) :
     $is_bgeu ? ($src1_value >= $src2_value) : 1'b0;
$valid_taken_br = $valid && $taken_br;
```  

*Following is the snapshot after completing 3 stage RISC-V Core. At this point, our Visualization Diagram (VIZ) must be producing the result of summation which ultimately gets stored in register10*  

<img width="959" alt="Ckt19_3_Stage_RISCV" src="https://github.com/user-attachments/assets/972d2875-7e26-485c-8cb2-2d7231428268" />  

<img width="959" alt="Ckt16_SumVerified" src="https://github.com/user-attachments/assets/c14ca711-ecc9-45f2-8044-8643cb3455a5" />


</details> 

------------------

<details>  
<summary><b>Module 5: Complete Pipelined RISC-V CPU Microarchitecture</b></summary>  

* Now we want to increase the performance of our CPU and make it capable to operate at higher frequencies. So to acheive this functionality, we will use Pipelining of 5 stages. But, while executing the pipelining, two problems comes into the picture which is also known as **Hazards**    

There are two types of Harards:-
> 1- **Control Flow Hazard:** In pipelined processors, control flow hazards, also known as branch hazards, occur when the next instruction to be executed depends on the outcome of a previous instruction (like a conditional branch or jump), causing pipeline stalls and performance degradation.  

> 2- **Read After Write Hazard:** In RISC-V, a Read-After-Write (RAW) hazard occurs when an instruction needs to read a register before a previous instruction has finished writing to it. This can lead to incorrect data being read, and can be mitigated through techniques like pipeline stalling or forwarding. 

* **Solution for Read After Write Hazard** is to introduce Register File Bypass. Instead of taking the write data for next instruction, we will bypass the path and take the data that was read before write and make it input to the next instruction  
* The last step is to complete the ALU Instructions, Instruction Decode and add Load Instruction, Store Instruction, Jump Instructions.
* **Testcase:** Added test case to check fucntionality of load/store. Stored the summation of 1 to 9 on address 4 of Data Memory and loaded that value from Data Memory to r15  
```
*passed = |cpu/xreg[15]>>5$value == (1+2+3+4+5+6+7+8+9);
```  
  
*Following are the snapshots that shows the Load Operation, Store Operation and Summation operation after completing the design of RISC-V CPU Core Microarchitecture*   
```
SW r0, r10, 100
LW r15, r0, 100
```  

<img width="559" alt="Final1" src="https://github.com/user-attachments/assets/704d5b3c-9237-4c17-b922-2c1306255d41" />
 
<img width="570" alt="Final2" src="https://github.com/user-attachments/assets/1962d12c-149f-4d63-80df-51f1053472df" />
 
<img width="494" alt="Final3" src="https://github.com/user-attachments/assets/0c1bd5d7-77c6-4877-9865-a1ef2074b707" />

*Following is the snapshot that shows the final waveform of output*  

<img width="959" alt="Wave_Showing_Sum" src="https://github.com/user-attachments/assets/0cf587e6-0df7-4918-adba-96e6337e4257" />

*Following is the snapshot of complete RISC-V CPU Core*  

<img width="959" alt="Final_CPU_Core" src="https://github.com/user-attachments/assets/0fece869-c289-458d-9d9f-ce16e0686aee" />
  
</details>

----------------------

* **Sandbox URL:** [RISC-V CPU Core](https://myth.makerchip.com/sandbox/0yPfNhRmk/0GZh1q0)  
  
---------------------

<svg width="2279pt" height="4806pt" viewBox="-1139.5 -2402.75 2279 4805.5" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(0.9543978668385041) rotate(0) translate(-972.8288024860861 2440.3918927866357)">
<title>top.tlv</title>
<polygon fill="white" stroke="transparent" points="-4,4 -4,-4801.5 2275,-4801.5 2275,4 -4,4"></polygon>
<g id="id0" logical_entity="" class="cluster">
<title>cluster.</title>
<g id="a_id0"><a xlink:title="/top">
<path fill="#1090c0" stroke="black" stroke-width="2" d="M20,-8C20,-8 2251,-8 2251,-8 2257,-8 2263,-14 2263,-20 2263,-20 2263,-4630 2263,-4630 2263,-4636 2257,-4642 2251,-4642 2251,-4642 20,-4642 20,-4642 14,-4642 8,-4636 8,-4630 8,-4630 8,-20 8,-20 8,-14 14,-8 20,-8"></path>
<text text-anchor="middle" x="1135.5" y="-4598" font-family="Times,serif" font-size="50.00">/top</text>
</a>
</g>
</g>
<g id="id1" logical_entity="|cpu" class="cluster">
<title>cluster.|cpu</title>
<g id="a_id1"><a xlink:title="|cpu">
<path fill="orange" stroke="black" stroke-width="2.5" d="M28,-16C28,-16 2243,-16 2243,-16 2249,-16 2255,-22 2255,-28 2255,-28 2255,-4559 2255,-4559 2255,-4565 2249,-4571 2243,-4571 2243,-4571 28,-4571 28,-4571 22,-4571 16,-4565 16,-4559 16,-4559 16,-28 16,-28 16,-22 22,-16 28,-16"></path>
<text text-anchor="middle" x="1135.5" y="-4527" font-family="Times,serif" font-size="50.00">|cpu</text>
</a>
</g>
</g>
<g id="id562" logical_entity="|cpu@4" class="cluster">
<title>cluster.stage2</title>
<g id="a_id562"><a xlink:title="|cpu@2">
<polygon fill="#509050" stroke="black" stroke-width="1.5" points="1129,-1644 1129,-2888 1629,-2888 1629,-1644 1129,-1644"></polygon>
<text text-anchor="middle" x="1379" y="-2868" font-family="Times,serif" font-size="20.00">@2</text>
</a>
</g>
</g>
<g id="id563" logical_entity="|cpu@6" class="cluster">
<title>cluster.stage3</title>
<g id="a_id563"><a xlink:title="|cpu@3">
<polygon fill="darkgreen" stroke="black" stroke-width="1.5" points="1489,-2908 1489,-4058 1809,-4058 1809,-2908 1489,-2908"></polygon>
<text text-anchor="middle" x="1649" y="-4038" font-family="Times,serif" font-size="20.00">@3</text>
</a>
</g>
</g>
<g id="id561" logical_entity="|cpu@2" class="cluster">
<title>cluster.stage1</title>
<g id="a_id561"><a xlink:title="|cpu@1">
<polygon fill="darkgreen" stroke="black" stroke-width="1.5" points="316,-156 316,-1636 1179,-1636 1179,-156 316,-156"></polygon>
<text text-anchor="middle" x="747.5" y="-1616" font-family="Times,serif" font-size="20.00">@1</text>
</a>
</g>
</g>
<g id="id564" logical_entity="|cpu@8" class="cluster">
<title>cluster.stage4</title>
<g id="a_id564"><a xlink:title="|cpu@4">
<polygon fill="#509050" stroke="black" stroke-width="1.5" points="1759,-4066 1759,-4350 1995,-4350 1995,-4066 1759,-4066"></polygon>
<text text-anchor="middle" x="1877" y="-4330" font-family="Times,serif" font-size="20.00">@4</text>
</a>
</g>
</g>
<g id="id565" logical_entity="|cpu@10" class="cluster">
<title>cluster.stage5</title>
<g id="a_id565"><a xlink:title="|cpu@5">
<polygon fill="darkgreen" stroke="black" stroke-width="1.5" points="2071,-4332 2071,-4488 2247,-4488 2247,-4332 2071,-4332"></polygon>
<text text-anchor="middle" x="2159" y="-4468" font-family="Times,serif" font-size="20.00">@5</text>
</a>
</g>
</g>
<g id="id560" logical_entity="|cpu@0" class="cluster">
<title>cluster.stage0</title>
<g id="a_id560"><a xlink:title="|cpu@0">
<polygon fill="#509050" stroke="black" stroke-width="1.5" points="24,-980 24,-1119 184,-1119 184,-980 24,-980"></polygon>
<text text-anchor="middle" x="104" y="-1099" font-family="Times,serif" font-size="20.00">@0</text>
</a>
</g>
</g>
<g id="id566" logical_entity="|cpu/dmem" class="cluster">
<title>cluster.|cpu/dmem</title>
<g id="a_id566"><a xlink:title="|cpu/dmem[15:0]">
<polygon fill="orange" stroke="black" stroke-width="2" points="1917,-3928 1917,-4058 2245,-4058 2245,-3928 1917,-3928"></polygon>
<text text-anchor="middle" x="2081" y="-4022" font-family="Times,serif" font-size="40.00">/dmem[15:0]</text>
</a>
</g>
</g>
<g id="id579" logical_entity="|cpu@8" class="cluster">
<title>cluster.stage4</title>
<g id="a_id579"><a xlink:title="|cpu/dmem[15:0]@4">
<polygon fill="#509050" stroke="black" stroke-width="1.5" points="1925,-3936 1925,-3998 2121,-3998 2121,-3936 1925,-3936"></polygon>
<text text-anchor="middle" x="2023" y="-3978" font-family="Times,serif" font-size="20.00">@4</text>
</a>
</g>
</g>
<g id="id580" logical_entity="|cpu@10" class="cluster">
<title>cluster.stage5</title>
<g id="a_id580"><a xlink:title="|cpu/dmem[15:0]@5">
<polygon fill="darkgreen" stroke="black" stroke-width="1.5" points="2187,-3937 2187,-3997 2237,-3997 2237,-3937 2187,-3937"></polygon>
<text text-anchor="middle" x="2212" y="-3977" font-family="Times,serif" font-size="20.00">@5</text>
</a>
</g>
</g>
<g id="id581" logical_entity="|cpu/imem" class="cluster">
<title>cluster.|cpu/imem</title>
<g id="a_id581"><a xlink:title="|cpu/imem[9:0]">
<polygon fill="orange" stroke="black" stroke-width="2" points="212,-1644 212,-1774 451,-1774 451,-1644 212,-1644"></polygon>
<text text-anchor="middle" x="331.5" y="-1738" font-family="Times,serif" font-size="40.00">/imem[9:0]</text>
</a>
</g>
</g>
<g id="id584" logical_entity="|cpu@2" class="cluster">
<title>cluster.stage1</title>
<g id="a_id584"><a xlink:title="|cpu/imem[9:0]@1">
<polygon fill="darkgreen" stroke="black" stroke-width="1.5" points="296,-1652 296,-1714 366,-1714 366,-1652 296,-1652"></polygon>
<text text-anchor="middle" x="331" y="-1694" font-family="Times,serif" font-size="20.00">@1</text>
</a>
</g>
</g>
<g id="id585" logical_entity="|cpu/xreg" class="cluster">
<title>cluster.|cpu/xreg</title>
<g id="a_id585"><a xlink:title="|cpu/xreg[31:0]">
<polygon fill="orange" stroke="black" stroke-width="2" points="1731,-2770 1731,-2900 2119,-2900 2119,-2770 1731,-2770"></polygon>
<text text-anchor="middle" x="1925" y="-2864" font-family="Times,serif" font-size="40.00">/xreg[31:0]</text>
</a>
</g>
</g>
<g id="id601" logical_entity="|cpu@6" class="cluster">
<title>cluster.stage3</title>
<g id="a_id601"><a xlink:title="|cpu/xreg[31:0]@3">
<polygon fill="darkgreen" stroke="black" stroke-width="1.5" points="1739,-2778 1739,-2840 1899,-2840 1899,-2778 1739,-2778"></polygon>
<text text-anchor="middle" x="1819" y="-2820" font-family="Times,serif" font-size="20.00">@3</text>
</a>
</g>
</g>
<g id="id602" logical_entity="|cpu@8" class="cluster">
<title>cluster.stage4</title>
<g id="a_id602"><a xlink:title="|cpu/xreg[31:0]@4">
<polygon fill="#509050" stroke="black" stroke-width="1.5" points="1935,-2780 1935,-2840 1985,-2840 1985,-2780 1935,-2780"></polygon>
<text text-anchor="middle" x="1960" y="-2820" font-family="Times,serif" font-size="20.00">@4</text>
</a>
</g>
</g>
<g id="id603" logical_entity="|cpu@10" class="cluster">
<title>cluster.stage5</title>
<g id="a_id603"><a xlink:title="|cpu/xreg[31:0]@5">
<polygon fill="darkgreen" stroke="black" stroke-width="1.5" points="2061,-2780 2061,-2840 2111,-2840 2111,-2780 2061,-2780"></polygon>
<text text-anchor="middle" x="2086" y="-2820" font-family="Times,serif" font-size="20.00">@5</text>
</a>
</g>
</g>
<!-- |cpu$br_tgt_pc@2&#45;&gt;|cpu$br_tgt_pc@3 -->
<g id="id4" logical_entity="|cpu$br_tgt_pc" class="edge">
<title>|cpu$br_tgt_pc@2-&gt;|cpu$br_tgt_pc@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1582,-2849.68C1582,-2941.33 1582,-3339 1582,-3339 1582,-3339 1521.2,-3339 1521.2,-3339"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1521.2,-3335.5 1511.2,-3339 1521.2,-3342.5 1521.2,-3335.5"></polygon>
</g>
<!-- |cpu$br_tgt_pc@3&#45;&gt;|cpu$pc@0 -->
<g id="id322" logical_entity="|cpu$br_tgt_pc" class="edge">
<title>|cpu$br_tgt_pc@3-&gt;|cpu$pc@0</title>
<g id="a_id322"><a xlink:title="|cpu$br_tgt_pc>>3">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1496.91,-3339C1387.9,-3339 59,-3339 59,-3339 59,-3339 59,-1090.76 59,-1090.76"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="62.5,-1090.76 59,-1080.76 55.5,-1090.76 62.5,-1090.76"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_add@1 -->
<g id="id89" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_add@1</title>
<g id="a_id89"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M976,-960.19C976,-1011.13 976,-1192.25 976,-1192.25 976,-1192.25 1016.72,-1192.25 1016.72,-1192.25"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.72,-1195.75 1026.72,-1192.25 1016.72,-1188.75 1016.72,-1195.75"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_addi@1 -->
<g id="id95" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_addi@1</title>
<g id="a_id95"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M973,-960.2C973,-1015.85 973,-1228.5 973,-1228.5 973,-1228.5 1016.58,-1228.5 1016.58,-1228.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.58,-1232 1026.58,-1228.5 1016.58,-1225 1016.58,-1232"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_and@1 -->
<g id="id101" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_and@1</title>
<g id="a_id101"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M970,-960.38C970,-1022.25 970,-1277.75 970,-1277.75 970,-1277.75 1016.96,-1277.75 1016.96,-1277.75"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.96,-1281.25 1026.96,-1277.75 1016.96,-1274.25 1016.96,-1281.25"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_andi@1 -->
<g id="id107" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_andi@1</title>
<g id="a_id107"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M943,-933.82C943,-835.73 943,-223.25 943,-223.25 943,-223.25 1016.85,-223.25 1016.85,-223.25"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.85,-226.75 1026.85,-223.25 1016.85,-219.75 1016.85,-226.75"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_auipc@1 -->
<g id="id113" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_auipc@1</title>
<g id="a_id113"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M946,-933.77C946,-839.17 946,-269.33 946,-269.33 946,-269.33 1016.75,-269.33 1016.75,-269.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.75,-272.83 1026.75,-269.33 1016.75,-265.83 1016.75,-272.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_beq@1 -->
<g id="id121" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_beq@1</title>
<g id="a_id121"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M964,-960.39C964,-1031.68 964,-1363.5 964,-1363.5 964,-1363.5 1017,-1363.5 1017,-1363.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1017,-1367 1027,-1363.5 1017,-1360 1017,-1367"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_bge@1 -->
<g id="id127" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_bge@1</title>
<g id="a_id127"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M961,-960.2C961,-1035.23 961,-1404.62 961,-1404.62 961,-1404.62 1016.6,-1404.62 1016.6,-1404.62"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.6,-1408.13 1026.6,-1404.62 1016.6,-1401.13 1016.6,-1408.13"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_bgeu@1 -->
<g id="id133" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_bgeu@1</title>
<g id="a_id133"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M958,-960.21C958,-1040.58 958,-1460.5 958,-1460.5 958,-1460.5 1016.75,-1460.5 1016.75,-1460.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.75,-1464 1026.75,-1460.5 1016.75,-1457 1016.75,-1464"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_blt@1 -->
<g id="id139" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_blt@1</title>
<g id="a_id139"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M952,-960.28C952,-1048.19 952,-1542.8 952,-1542.8 952,-1542.8 1016.93,-1542.8 1016.93,-1542.8"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.93,-1546.3 1026.93,-1542.8 1016.93,-1539.3 1016.93,-1546.3"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_bltu@1 -->
<g id="id145" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_bltu@1</title>
<g id="a_id145"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M949,-960.14C949,-1051.62 949,-1590 949,-1590 949,-1590 1016.96,-1590 1016.96,-1590"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.96,-1593.5 1026.96,-1590 1016.96,-1586.5 1016.96,-1593.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_bne@1 -->
<g id="id151" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_bne@1</title>
<g id="a_id151"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M967,-960.04C967,-1025.28 967,-1313.25 967,-1313.25 967,-1313.25 1016.95,-1313.25 1016.95,-1313.25"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.95,-1316.75 1026.95,-1313.25 1016.95,-1309.75 1016.95,-1316.75"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_jal@1 -->
<g id="id163" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_jal@1</title>
<g id="a_id163"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M940,-933.77C940,-832.55 940,-184.75 940,-184.75 940,-184.75 1016.98,-184.75 1016.98,-184.75"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.98,-188.25 1026.98,-184.75 1016.98,-181.25 1016.98,-188.25"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_jalr@1 -->
<g id="id169" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_jalr@1</title>
<g id="a_id169"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M949,-933.76C949,-842.77 949,-313.33 949,-313.33 949,-313.33 1016.96,-313.33 1016.96,-313.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.96,-316.83 1026.96,-313.33 1016.96,-309.83 1016.96,-316.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_load@1 -->
<g id="id182" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_load@1</title>
<g id="a_id182"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M952,-933.86C952,-846.85 952,-357.33 952,-357.33 952,-357.33 1016.93,-357.33 1016.93,-357.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.93,-360.83 1026.93,-357.33 1016.93,-353.83 1016.93,-360.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_lui@1 -->
<g id="id188" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_lui@1</title>
<g id="a_id188"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M955,-933.78C955,-850.45 955,-401.33 955,-401.33 955,-401.33 1016.95,-401.33 1016.95,-401.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.95,-404.83 1026.95,-401.33 1016.95,-397.83 1016.95,-404.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_or@1 -->
<g id="id194" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_or@1</title>
<g id="a_id194"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M958,-933.84C958,-854.69 958,-445.33 958,-445.33 958,-445.33 1016.75,-445.33 1016.75,-445.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.75,-448.83 1026.75,-445.33 1016.75,-441.83 1016.75,-448.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_ori@1 -->
<g id="id200" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_ori@1</title>
<g id="a_id200"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M961,-933.8C961,-858.76 961,-489.33 961,-489.33 961,-489.33 1016.6,-489.33 1016.6,-489.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.6,-492.83 1026.6,-489.33 1016.6,-485.83 1016.6,-492.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_sb@1 -->
<g id="id214" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_sb@1</title>
<g id="a_id214"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M991.42,-944C1014.92,-944 1045,-944 1045,-944 1045,-944 1045,-943.44 1045,-943.44"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1048.5,-948.4 1045,-938.4 1041.5,-948.4 1048.5,-948.4"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_sh@1 -->
<g id="id216" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_sh@1</title>
<g id="a_id216"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M991.05,-950C1020.36,-950 1063,-950 1063,-950 1063,-950 1063,-950.56 1063,-950.56"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1059.5,-945.6 1063,-955.6 1066.5,-945.6 1059.5,-945.6"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_sll@1 -->
<g id="id222" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_sll@1</title>
<g id="a_id222"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M964,-933.71C964,-862.9 964,-533.33 964,-533.33 964,-533.33 1017,-533.33 1017,-533.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1017,-536.83 1027,-533.33 1017,-529.83 1017,-536.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_slli@1 -->
<g id="id228" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_slli@1</title>
<g id="a_id228"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M967,-933.84C967,-867.99 967,-577.33 967,-577.33 967,-577.33 1016.95,-577.33 1016.95,-577.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.95,-580.83 1026.95,-577.33 1016.95,-573.83 1016.95,-580.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_slt@1 -->
<g id="id234" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_slt@1</title>
<g id="a_id234"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M970,-933.65C970,-871.92 970,-617 970,-617 970,-617 1016.96,-617 1016.96,-617"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.96,-620.5 1026.96,-617 1016.96,-613.5 1016.96,-620.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_slti@1 -->
<g id="id240" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_slti@1</title>
<g id="a_id240"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M973,-933.97C973,-878.02 973,-661 973,-661 973,-661 1016.58,-661 1016.58,-661"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.58,-664.5 1026.58,-661 1016.58,-657.5 1016.58,-664.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_sltiu@1 -->
<g id="id246" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_sltiu@1</title>
<g id="a_id246"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M976,-933.99C976,-883.72 976,-705 976,-705 976,-705 1016.72,-705 1016.72,-705"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.72,-708.5 1026.72,-705 1016.72,-701.5 1016.72,-708.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_sltu@1 -->
<g id="id252" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_sltu@1</title>
<g id="a_id252"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M979,-933.7C979,-889.31 979,-749 979,-749 979,-749 1016.92,-749 1016.92,-749"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.92,-752.5 1026.92,-749 1016.92,-745.5 1016.92,-752.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_sra@1 -->
<g id="id258" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_sra@1</title>
<g id="a_id258"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M982,-933.98C982,-897.57 982,-797.33 982,-797.33 982,-797.33 1016.78,-797.33 1016.78,-797.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.78,-800.83 1026.78,-797.33 1016.78,-793.83 1016.78,-800.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_srai@1 -->
<g id="id264" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_srai@1</title>
<g id="a_id264"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M985,-933.62C985,-905.18 985,-841.33 985,-841.33 985,-841.33 1016.73,-841.33 1016.73,-841.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.73,-844.83 1026.73,-841.33 1016.73,-837.83 1016.73,-844.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_srl@1 -->
<g id="id270" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_srl@1</title>
<g id="a_id270"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M988,-933.92C988,-915.82 988,-885.33 988,-885.33 988,-885.33 1016.77,-885.33 1016.77,-885.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.77,-888.83 1026.77,-885.33 1016.77,-881.83 1016.77,-888.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_srli@1 -->
<g id="id276" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_srli@1</title>
<g id="a_id276"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M988,-960.22C988,-978.52 988,-1009.33 988,-1009.33 988,-1009.33 1016.77,-1009.33 1016.77,-1009.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.77,-1012.83 1026.77,-1009.33 1016.77,-1005.83 1016.77,-1012.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_sub@1 -->
<g id="id282" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_sub@1</title>
<g id="a_id282"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M985,-960.4C985,-988.18 985,-1049.5 985,-1049.5 985,-1049.5 1016.73,-1049.5 1016.73,-1049.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.73,-1053 1026.73,-1049.5 1016.73,-1046 1016.73,-1053"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_sw@1 -->
<g id="id284" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_sw@1</title>
<g id="a_id284"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M955,-960.26C955,-1043.87 955,-1494.5 955,-1494.5 955,-1494.5 1016.95,-1494.5 1016.95,-1494.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.95,-1498 1026.95,-1494.5 1016.95,-1491 1016.95,-1498"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_xor@1 -->
<g id="id292" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_xor@1</title>
<g id="a_id292"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M982,-960.11C982,-996.79 982,-1097.75 982,-1097.75 982,-1097.75 1016.78,-1097.75 1016.78,-1097.75"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.78,-1101.25 1026.78,-1097.75 1016.78,-1094.25 1016.78,-1101.25"></polygon>
</a>
</g>
</g>
<!-- |cpu$dec_bits@1&#45;&gt;|cpu$is_xori@1 -->
<g id="id298" logical_entity="|cpu$dec_bits" class="edge">
<title>|cpu$dec_bits@1-&gt;|cpu$is_xori@1</title>
<g id="a_id298"><a xlink:title="|cpu$dec_bits">
<path fill="none" stroke="purple" stroke-width="1.5" d="M979,-960.21C979,-1003.65 979,-1139.25 979,-1139.25 979,-1139.25 1016.92,-1139.25 1016.92,-1139.25"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1016.92,-1142.75 1026.92,-1139.25 1016.92,-1135.75 1016.92,-1142.75"></polygon>
</a>
</g>
</g>
<!-- |cpu$dmem_addr@4&#45;&gt;|cpu$dmem_rd_data@4 -->
<g id="id16" logical_entity="|cpu$dmem_addr" class="edge">
<title>|cpu$dmem_addr@4-&gt;|cpu$dmem_rd_data@4</title>
<g id="a_id16"><a xlink:title="|cpu$dmem_addr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1891.19,-4087C1923.77,-4087 1974,-4087 1974,-4087 1974,-4087 1974,-4264.36 1974,-4264.36"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1970.5,-4264.36 1974,-4274.36 1977.5,-4264.36 1970.5,-4264.36"></polygon>
</a>
</g>
</g>
<!-- |cpu$dmem_addr@4&#45;&gt;|cpu/dmem$wr@4 -->
<g id="id576" logical_entity="|cpu$dmem_addr" class="edge">
<title>|cpu$dmem_addr@4-&gt;|cpu/dmem$wr@4</title>
<g id="a_id576"><a xlink:title="|cpu$dmem_addr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1878,-4073.56C1878,-4039.42 1878,-3952 1878,-3952 1878,-3952 1922.7,-3952 1922.7,-3952"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1922.7,-3955.5 1932.7,-3952 1922.7,-3948.5 1922.7,-3955.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$dmem_rd_data@4&#45;&gt;|cpu$dmem_rd_data@5 -->
<g id="id15" logical_entity="|cpu$dmem_rd_data" class="edge">
<title>|cpu$dmem_rd_data@4-&gt;|cpu$dmem_rd_data@5</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1987.03,-4299.17C2024.05,-4299.17 2086,-4299.17 2086,-4299.17 2086,-4299.17 2086,-4329.94 2086,-4329.94"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="2082.5,-4329.94 2086,-4339.94 2089.5,-4329.94 2082.5,-4329.94"></polygon>
</g>
<!-- |cpu$dmem_rd_data@5&#45;&gt;|cpu$ld_data@5 -->
<g id="id305" logical_entity="|cpu$dmem_rd_data" class="edge">
<title>|cpu$dmem_rd_data@5-&gt;|cpu$ld_data@5</title>
<g id="a_id305"><a xlink:title="|cpu$dmem_rd_data">
<path fill="none" stroke="purple" stroke-width="1.5" d="M2093.14,-4347C2093.14,-4347 2174.93,-4347 2174.93,-4347"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="2174.93,-4350.5 2184.93,-4347 2174.93,-4343.5 2174.93,-4350.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$dmem_rd_en@4&#45;&gt;|cpu$dmem_rd_data@4 -->
<g id="id18" logical_entity="|cpu$dmem_rd_en" class="edge">
<title>|cpu$dmem_rd_en@4-&gt;|cpu$dmem_rd_data@4</title>
<g id="a_id18"><a xlink:title="|cpu$dmem_rd_en">
<path fill="none" stroke="#e04010" stroke-width="1.5" stroke-dasharray="1,5" d="M1891.25,-4192C1919.63,-4192 1960,-4192 1960,-4192 1960,-4192 1960,-4264.48 1960,-4264.48"></path>
<polygon fill="none" stroke="#e04010" stroke-width="1.5" points="1956.5,-4264.48 1960,-4274.48 1963.5,-4264.48 1956.5,-4264.48"></polygon>
</a>
</g>
</g>
<!-- |cpu$dmem_wr_data@4&#45;&gt;|cpu/dmem$value@4 -->
<g id="id572" logical_entity="|cpu$dmem_wr_data" class="edge">
<title>|cpu$dmem_wr_data@4-&gt;|cpu/dmem$value@4</title>
<g id="a_id572"><a xlink:title="|cpu$dmem_wr_data">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1891.24,-4247C1946.38,-4247 2066,-4247 2066,-4247 2066,-4247 2066,-3969.59 2066,-3969.59"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="2069.5,-3969.59 2066,-3959.59 2062.5,-3969.59 2069.5,-3969.59"></polygon>
</a>
</g>
</g>
<!-- |cpu$dmem_wr_en@4&#45;&gt;|cpu/dmem$wr@4 -->
<g id="id575" logical_entity="|cpu$dmem_wr_en" class="edge">
<title>|cpu$dmem_wr_en@4-&gt;|cpu/dmem$wr@4</title>
<g id="a_id575"><a xlink:title="|cpu$dmem_wr_en">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1891.18,-4137C1915.38,-4137 1947,-4137 1947,-4137 1947,-4137 1947,-3969.95 1947,-3969.95"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1950.5,-3969.95 1947,-3959.95 1943.5,-3969.95 1950.5,-3969.95"></polygon>
</a>
</g>
</g>
<!-- |cpu$func3@1&#45;&gt;|cpu$dec_bits@1 -->
<g id="id9" logical_entity="|cpu$func3" class="edge">
<title>|cpu$func3@1-&gt;|cpu$dec_bits@1</title>
<g id="a_id9"><a xlink:title="|cpu$func3">
<path fill="none" stroke="purple" stroke-width="1.5" d="M901.27,-1326C920.56,-1326 943,-1326 943,-1326 943,-1326 943,-970.05 943,-970.05"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="946.5,-970.05 943,-960.05 939.5,-970.05 946.5,-970.05"></polygon>
</a>
</g>
</g>
<!-- |cpu$func3_valid@1&#45;&gt;|cpu$func3@1 -->
<g id="id28" logical_entity="|cpu$func3_valid" class="edge">
<title>|cpu$func3_valid@1-&gt;|cpu$func3@1</title>
<g id="a_id28"><a xlink:title="|cpu$func3_valid">
<path fill="none" stroke="#e04010" stroke-width="1.5" stroke-dasharray="1,5" d="M811.05,-1431C840.36,-1431 883,-1431 883,-1431 883,-1431 883,-1343.55 883,-1343.55"></path>
<polygon fill="none" stroke="#e04010" stroke-width="1.5" points="886.5,-1343.55 883,-1333.55 879.5,-1343.55 886.5,-1343.55"></polygon>
</a>
</g>
</g>
<!-- |cpu$func7@1&#45;&gt;|cpu$dec_bits@1 -->
<g id="id8" logical_entity="|cpu$func7" class="edge">
<title>|cpu$func7@1-&gt;|cpu$dec_bits@1</title>
<g id="a_id8"><a xlink:title="|cpu$func7">
<path fill="none" stroke="purple" stroke-width="1.5" d="M901.22,-1455.5C921.61,-1455.5 946,-1455.5 946,-1455.5 946,-1455.5 946,-970.08 946,-970.08"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="949.5,-970.08 946,-960.08 942.5,-970.08 949.5,-970.08"></polygon>
</a>
</g>
</g>
<!-- |cpu$func7_valid@1&#45;&gt;|cpu$func7@1 -->
<g id="id36" logical_entity="|cpu$func7_valid" class="edge">
<title>|cpu$func7_valid@1-&gt;|cpu$func7@1</title>
<g id="a_id36"><a xlink:title="|cpu$func7_valid">
<path fill="none" stroke="#e04010" stroke-width="1.5" stroke-dasharray="1,5" d="M811,-1563C837.51,-1563 874,-1563 874,-1563 874,-1563 874,-1475.55 874,-1475.55"></path>
<polygon fill="none" stroke="#e04010" stroke-width="1.5" points="877.5,-1475.55 874,-1465.55 870.5,-1475.55 877.5,-1475.55"></polygon>
</a>
</g>
</g>
<!-- |cpu$imem_rd_addr@0&#45;&gt;|cpu$imem_rd_addr@1 -->
<g id="id41" logical_entity="|cpu$imem_rd_addr" class="edge">
<title>|cpu$imem_rd_addr@0-&gt;|cpu$imem_rd_addr@1</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M176.25,-1062C176.25,-1062 313.98,-1062 313.98,-1062"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="313.98,-1065.5 323.98,-1062 313.98,-1058.5 313.98,-1065.5"></polygon>
</g>
<!-- |cpu$imem_rd_addr@1&#45;&gt;|cpu$imem_rd_data@1 -->
<g id="id44" logical_entity="|cpu$imem_rd_addr" class="edge">
<title>|cpu$imem_rd_addr@1-&gt;|cpu$imem_rd_data@1</title>
<g id="a_id44"><a xlink:title="|cpu$imem_rd_addr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M338.04,-1065.83C370.59,-1065.83 505,-1065.83 505,-1065.83 505,-1065.83 505,-1135.07 505,-1135.07"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="501.5,-1135.07 505,-1145.07 508.5,-1135.07 501.5,-1135.07"></polygon>
</a>
</g>
</g>
<!-- |cpu$imem_rd_data@1&#45;&gt;|cpu$instr@1 -->
<g id="id83" logical_entity="|cpu$imem_rd_data" class="edge">
<title>|cpu$imem_rd_data@1-&gt;|cpu$instr@1</title>
<g id="a_id83"><a xlink:title="|cpu$imem_rd_data">
<path fill="none" stroke="purple" stroke-width="1.5" d="M514,-1182.52C514,-1211.68 514,-1265 514,-1265 514,-1265 567,-1265 567,-1265"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="567,-1268.5 577,-1265 567,-1261.5 567,-1268.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$imem_rd_en@0&#45;&gt;|cpu$imem_rd_en@1 -->
<g id="id49" logical_entity="|cpu$imem_rd_en" class="edge">
<title>|cpu$imem_rd_en@0-&gt;|cpu$imem_rd_en@1</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M176.25,-1007C176.25,-1007 313.98,-1007 313.98,-1007"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="313.98,-1010.5 323.98,-1007 313.98,-1003.5 313.98,-1010.5"></polygon>
</g>
<!-- |cpu$imem_rd_en@1&#45;&gt;|cpu$imem_rd_data@1 -->
<g id="id46" logical_entity="|cpu$imem_rd_en" class="edge">
<title>|cpu$imem_rd_en@1-&gt;|cpu$imem_rd_data@1</title>
<g id="a_id46"><a xlink:title="|cpu$imem_rd_en">
<path fill="none" stroke="#e04010" stroke-width="1.5" stroke-dasharray="1,5" d="M338.29,-1004.67C373.36,-1004.67 523,-1004.67 523,-1004.67 523,-1004.67 523,-1135.41 523,-1135.41"></path>
<polygon fill="none" stroke="#e04010" stroke-width="1.5" points="519.5,-1135.41 523,-1145.41 526.5,-1135.41 519.5,-1135.41"></polygon>
</a>
</g>
</g>
<!-- |cpu$imm@1&#45;&gt;|cpu$imm@2 -->
<g id="id53" logical_entity="|cpu$imm" class="edge">
<title>|cpu$imm@1-&gt;|cpu$imm@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M811.32,-1253.25C824.71,-1253.25 838,-1253.25 838,-1253.25 838,-1253.25 838,-2318 838,-2318 838,-2318 1486.97,-2318 1486.97,-2318"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1486.97,-2321.5 1496.97,-2318 1486.97,-2314.5 1486.97,-2321.5"></polygon>
</g>
<!-- |cpu$imm@2&#45;&gt;|cpu$br_tgt_pc@2 -->
<g id="id5" logical_entity="|cpu$imm" class="edge">
<title>|cpu$imm@2-&gt;|cpu$br_tgt_pc@2</title>
<g id="a_id5"><a xlink:title="|cpu$imm">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.1,-2315.5C1518.49,-2315.5 1529,-2315.5 1529,-2315.5 1529,-2315.5 1529,-2824 1529,-2824 1529,-2824 1556.81,-2824 1556.81,-2824"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1556.81,-2827.5 1566.81,-2824 1556.81,-2820.5 1556.81,-2827.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$imm@2&#45;&gt;|cpu$imm@3 -->
<g id="id55" logical_entity="|cpu$imm" class="edge">
<title>|cpu$imm@2-&gt;|cpu$imm@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.32,-2319C1516.3,-2319 1522,-2319 1522,-2319 1522,-2319 1522,-3019 1522,-3019 1522,-3019 1520.93,-3019 1520.93,-3019"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1521.32,-3015.5 1511.32,-3019 1521.32,-3022.5 1521.32,-3015.5"></polygon>
</g>
<!-- |cpu$imm@2&#45;&gt;|cpu$jalr_tgt_pc@2 -->
<g id="id302" logical_entity="|cpu$imm" class="edge">
<title>|cpu$imm@2-&gt;|cpu$jalr_tgt_pc@2</title>
<g id="a_id302"><a xlink:title="|cpu$imm">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.06,-2322.5C1532.28,-2322.5 1594,-2322.5 1594,-2322.5 1594,-2322.5 1594,-2747.38 1594,-2747.38"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1590.5,-2747.38 1594,-2757.38 1597.5,-2747.38 1590.5,-2747.38"></polygon>
</a>
</g>
</g>
<!-- |cpu$imm@3&#45;&gt;|cpu$result@3 -->
<g id="id428" logical_entity="|cpu$imm" class="edge">
<title>|cpu$imm@3-&gt;|cpu$result@3</title>
<g id="a_id428"><a xlink:title="|cpu$imm">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.11,-3022.5C1517.2,-3022.5 1525,-3022.5 1525,-3022.5 1525,-3022.5 1525,-3677.67 1525,-3677.67 1525,-3677.67 1675,-3677.67 1675,-3677.67 1675,-3677.67 1675,-3678.24 1675,-3678.24"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1671.5,-3673.4 1675,-3683.4 1678.5,-3673.4 1671.5,-3673.4"></polygon>
</a>
</g>
</g>
<!-- |cpu$imm@3&#45;&gt;|cpu$sltiu_result@3 -->
<g id="id485" logical_entity="|cpu$imm" class="edge">
<title>|cpu$imm@3-&gt;|cpu$sltiu_result@3</title>
<g id="a_id485"><a xlink:title="|cpu$imm">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.02,-3015.5C1528.39,-3015.5 1572,-3015.5 1572,-3015.5 1572,-3015.5 1572,-3821.97 1572,-3821.97"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1568.5,-3821.97 1572,-3831.97 1575.5,-3821.97 1568.5,-3821.97"></polygon>
</a>
</g>
</g>
<!-- |cpu$inc_pc@1&#45;&gt;|cpu$inc_pc@2 -->
<g id="id78" logical_entity="|cpu$inc_pc" class="edge">
<title>|cpu$inc_pc@1-&gt;|cpu$inc_pc@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M514,-1598.28C514,-1732.72 514,-2843 514,-2843 514,-2843 1126.92,-2843 1126.92,-2843"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.92,-2846.5 1136.92,-2843 1126.92,-2839.5 1126.92,-2846.5"></polygon>
</g>
<!-- |cpu$inc_pc@1&#45;&gt;|cpu$pc@0 -->
<g id="id326" logical_entity="|cpu$inc_pc" class="edge">
<title>|cpu$inc_pc@1-&gt;|cpu$pc@0</title>
<g id="a_id326"><a xlink:title="|cpu$inc_pc>>1">
<path fill="none" stroke="purple" stroke-width="1.5" d="M486.75,-1589.33C390.6,-1589.33 73,-1589.33 73,-1589.33 73,-1589.33 73,-1090.7 73,-1090.7"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="76.5,-1090.7 73,-1080.7 69.5,-1090.7 76.5,-1090.7"></polygon>
</a>
</g>
</g>
<!-- |cpu$inc_pc@2&#45;&gt;|cpu$inc_pc@3 -->
<g id="id80" logical_entity="|cpu$inc_pc" class="edge">
<title>|cpu$inc_pc@2-&gt;|cpu$inc_pc@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1144,-2850.24C1144,-2904.14 1144,-3240.67 1144,-3240.67 1144,-3240.67 1486.81,-3240.67 1486.81,-3240.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1486.81,-3244.17 1496.81,-3240.67 1486.81,-3237.17 1486.81,-3244.17"></polygon>
</g>
<!-- |cpu$inc_pc@3&#45;&gt;|cpu$pc@0 -->
<g id="id319" logical_entity="|cpu$inc_pc" class="edge">
<title>|cpu$inc_pc@3-&gt;|cpu$pc@0</title>
<g id="a_id319"><a xlink:title="|cpu$inc_pc>>3">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1496.95,-3245.33C1388.62,-3245.33 68,-3245.33 68,-3245.33 68,-3245.33 68,-1090.87 68,-1090.87"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="71.5,-1090.87 68,-1080.87 64.5,-1090.87 71.5,-1090.87"></polygon>
</a>
</g>
</g>
<!-- |cpu$instr@1&#45;&gt;|cpu$func3@1 -->
<g id="id27" logical_entity="|cpu$instr" class="edge">
<title>|cpu$instr@1-&gt;|cpu$func3@1</title>
<g id="a_id27"><a xlink:title="|cpu$instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M613,-1257.35C613,-1249.06 613,-1237 613,-1237 613,-1237 874,-1237 874,-1237 874,-1237 874,-1308.41 874,-1308.41"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="870.5,-1308.41 874,-1318.41 877.5,-1308.41 870.5,-1308.41"></polygon>
</a>
</g>
</g>
<!-- |cpu$instr@1&#45;&gt;|cpu$func7@1 -->
<g id="id35" logical_entity="|cpu$instr" class="edge">
<title>|cpu$instr@1-&gt;|cpu$func7@1</title>
<g id="a_id35"><a xlink:title="|cpu$instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M618,-1272.52C618,-1296.48 618,-1369.5 618,-1369.5 618,-1369.5 865,-1369.5 865,-1369.5 865,-1369.5 865,-1440.45 865,-1440.45"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="861.5,-1440.45 865,-1450.45 868.5,-1440.45 861.5,-1440.45"></polygon>
</a>
</g>
</g>
<!-- |cpu$instr@1&#45;&gt;|cpu$imm@1 -->
<g id="id75" logical_entity="|cpu$instr" class="edge">
<title>|cpu$instr@1-&gt;|cpu$imm@1</title>
<g id="a_id75"><a xlink:title="|cpu$instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M622,-1257.48C622,-1252.73 622,-1247.5 622,-1247.5 622,-1247.5 746.88,-1247.5 746.88,-1247.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="746.88,-1251 756.88,-1247.5 746.88,-1244 746.88,-1251"></polygon>
</a>
</g>
</g>
<!-- |cpu$instr@1&#45;&gt;|cpu$is_b_instr@1 -->
<g id="id115" logical_entity="|cpu$instr" class="edge">
<title>|cpu$instr@1-&gt;|cpu$is_b_instr@1</title>
<g id="a_id115"><a xlink:title="|cpu$instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M604,-1272.91C604,-1308.12 604,-1449 604,-1449 604,-1449 657,-1449 657,-1449"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="657,-1452.5 667,-1449 657,-1445.5 657,-1452.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$instr@1&#45;&gt;|cpu$is_i_instr@1 -->
<g id="id155" logical_entity="|cpu$instr" class="edge">
<title>|cpu$instr@1-&gt;|cpu$is_i_instr@1</title>
<g id="a_id155"><a xlink:title="|cpu$instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M611,-1272.68C611,-1300.45 611,-1394 611,-1394 611,-1394 656.82,-1394 656.82,-1394"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="656.82,-1397.5 666.82,-1394 656.82,-1390.5 656.82,-1397.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$instr@1&#45;&gt;|cpu$is_j_instr@1 -->
<g id="id157" logical_entity="|cpu$instr" class="edge">
<title>|cpu$instr@1-&gt;|cpu$is_j_instr@1</title>
<g id="a_id157"><a xlink:title="|cpu$instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M631,-1269C631,-1269 656.71,-1269 656.71,-1269"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="656.71,-1272.5 666.71,-1269 656.7,-1265.5 656.71,-1272.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$instr@1&#45;&gt;|cpu$is_r_instr@1 -->
<g id="id204" logical_entity="|cpu$instr" class="edge">
<title>|cpu$instr@1-&gt;|cpu$is_r_instr@1</title>
<g id="a_id204"><a xlink:title="|cpu$instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M591,-1272.79C591,-1319.11 591,-1556.25 591,-1556.25 591,-1556.25 656.94,-1556.25 656.94,-1556.25"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="656.94,-1559.75 666.94,-1556.25 656.94,-1552.75 656.94,-1559.75"></polygon>
</a>
</g>
</g>
<!-- |cpu$instr@1&#45;&gt;|cpu$is_s_instr@1 -->
<g id="id212" logical_entity="|cpu$instr" class="edge">
<title>|cpu$instr@1-&gt;|cpu$is_s_instr@1</title>
<g id="a_id212"><a xlink:title="|cpu$instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M598,-1272.68C598,-1313.59 598,-1504 598,-1504 598,-1504 656.75,-1504 656.75,-1504"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="656.75,-1507.5 666.75,-1504 656.75,-1500.5 656.75,-1507.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$instr@1&#45;&gt;|cpu$is_u_instr@1 -->
<g id="id286" logical_entity="|cpu$instr" class="edge">
<title>|cpu$instr@1-&gt;|cpu$is_u_instr@1</title>
<g id="a_id286"><a xlink:title="|cpu$instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M625,-1272.64C625,-1291.55 625,-1339 625,-1339 625,-1339 656.73,-1339 656.73,-1339"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="656.73,-1342.5 666.73,-1339 656.73,-1335.5 656.73,-1342.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$instr@1&#45;&gt;|cpu$opcode@1 -->
<g id="id307" logical_entity="|cpu$instr" class="edge">
<title>|cpu$instr@1-&gt;|cpu$opcode@1</title>
<g id="a_id307"><a xlink:title="|cpu$instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M604,-1257.32C604,-1220.36 604,-1062.67 604,-1062.67 604,-1062.67 836.88,-1062.67 836.88,-1062.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="836.88,-1066.17 846.88,-1062.67 836.88,-1059.17 836.88,-1066.17"></polygon>
</a>
</g>
</g>
<!-- |cpu$instr@1&#45;&gt;|cpu$rd@1 -->
<g id="id332" logical_entity="|cpu$instr" class="edge">
<title>|cpu$instr@1-&gt;|cpu$rd@1</title>
<g id="a_id332"><a xlink:title="|cpu$instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M584,-1272.77C584,-1322.37 584,-1592.5 584,-1592.5 584,-1592.5 836.98,-1592.5 836.98,-1592.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="836.98,-1596 846.98,-1592.5 836.98,-1589 836.98,-1596"></polygon>
</a>
</g>
</g>
<!-- |cpu$instr@1&#45;&gt;|cpu$rs1@1 -->
<g id="id463" logical_entity="|cpu$instr" class="edge">
<title>|cpu$instr@1-&gt;|cpu$rs1@1</title>
<g id="a_id463"><a xlink:title="|cpu$instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M586,-1257.41C586,-1160.51 586,-168.25 586,-168.25 586,-168.25 836.91,-168.25 836.91,-168.25"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="836.91,-171.75 846.91,-168.25 836.91,-164.75 836.91,-171.75"></polygon>
</a>
</g>
</g>
<!-- |cpu$instr@1&#45;&gt;|cpu$rs2@1 -->
<g id="id475" logical_entity="|cpu$instr" class="edge">
<title>|cpu$instr@1-&gt;|cpu$rs2@1</title>
<g id="a_id475"><a xlink:title="|cpu$instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M595,-1257.36C595,-1161.8 595,-202.5 595,-202.5 595,-202.5 836.99,-202.5 836.99,-202.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="836.99,-206 846.99,-202.5 836.99,-199 836.99,-206"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_add@1&#45;&gt;|cpu$is_add@2 -->
<g id="id86" logical_entity="|cpu$is_add" class="edge">
<title>|cpu$is_add@1-&gt;|cpu$is_add@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.02,-1189C1095.34,-1189 1110,-1189 1110,-1189 1110,-1189 1110,-2363 1110,-2363 1110,-2363 1126.79,-2363 1126.79,-2363"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.79,-2366.5 1136.79,-2363 1126.79,-2359.5 1126.79,-2366.5"></polygon>
</g>
<!-- |cpu$is_add@2&#45;&gt;|cpu$is_add@3 -->
<g id="id88" logical_entity="|cpu$is_add" class="edge">
<title>|cpu$is_add@2-&gt;|cpu$is_add@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.06,-2364C1172.28,-2364 1234,-2364 1234,-2364 1234,-2364 1234,-3723 1234,-3723 1234,-3723 1576.81,-3723 1576.81,-3723"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.81,-3726.5 1586.81,-3723 1576.81,-3719.5 1576.81,-3726.5"></polygon>
</g>
<!-- |cpu$is_add@3&#45;&gt;|cpu$result@3 -->
<g id="id358" logical_entity="|cpu$is_add" class="edge">
<title>|cpu$is_add@3-&gt;|cpu$result@3</title>
<g id="a_id358"><a xlink:title="|cpu$is_add">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.17,-3723C1619.38,-3723 1666,-3723 1666,-3723 1666,-3723 1666,-3708.75 1666,-3708.75"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1669.5,-3708.75 1666,-3698.75 1662.5,-3708.75 1669.5,-3708.75"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_addi@1&#45;&gt;|cpu$is_addi@2 -->
<g id="id92" logical_entity="|cpu$is_addi" class="edge">
<title>|cpu$is_addi@1-&gt;|cpu$is_addi@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.12,-1233C1094.16,-1233 1107,-1233 1107,-1233 1107,-1233 1107,-2395 1107,-2395 1107,-2395 1126.87,-2395 1126.87,-2395"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.87,-2398.5 1136.87,-2395 1126.87,-2391.5 1126.87,-2398.5"></polygon>
</g>
<!-- |cpu$is_addi@2&#45;&gt;|cpu$is_addi@3 -->
<g id="id94" logical_entity="|cpu$is_addi" class="edge">
<title>|cpu$is_addi@2-&gt;|cpu$is_addi@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.32,-2395C1161.05,-2395 1177,-2395 1177,-2395 1177,-2395 1177,-3755 1177,-3755 1177,-3755 1576.76,-3755 1576.76,-3755"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.76,-3758.5 1586.76,-3755 1576.76,-3751.5 1576.76,-3758.5"></polygon>
</g>
<!-- |cpu$is_addi@3&#45;&gt;|cpu$result@3 -->
<g id="id355" logical_entity="|cpu$is_addi" class="edge">
<title>|cpu$is_addi@3-&gt;|cpu$result@3</title>
<g id="a_id355"><a xlink:title="|cpu$is_addi">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.19,-3755C1621.01,-3755 1675,-3755 1675,-3755 1675,-3755 1675,-3708.85 1675,-3708.85"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1678.5,-3708.85 1675,-3698.85 1671.5,-3708.85 1678.5,-3708.85"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_and@1&#45;&gt;|cpu$is_and@2 -->
<g id="id98" logical_entity="|cpu$is_and" class="edge">
<title>|cpu$is_and@1-&gt;|cpu$is_and@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.08,-1277C1092.41,-1277 1103,-1277 1103,-1277 1103,-1277 1103,-2427 1103,-2427 1103,-2427 1126.86,-2427 1126.86,-2427"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.86,-2430.5 1136.86,-2427 1126.86,-2423.5 1126.86,-2430.5"></polygon>
</g>
<!-- |cpu$is_and@2&#45;&gt;|cpu$is_and@3 -->
<g id="id100" logical_entity="|cpu$is_and" class="edge">
<title>|cpu$is_and@2-&gt;|cpu$is_and@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.11,-2427C1170.17,-2427 1221,-2427 1221,-2427 1221,-2427 1221,-3787 1221,-3787 1221,-3787 1576.88,-3787 1576.88,-3787"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.88,-3790.5 1586.88,-3787 1576.88,-3783.5 1576.88,-3790.5"></polygon>
</g>
<!-- |cpu$is_and@3&#45;&gt;|cpu$result@3 -->
<g id="id376" logical_entity="|cpu$is_and" class="edge">
<title>|cpu$is_and@3-&gt;|cpu$result@3</title>
<g id="a_id376"><a xlink:title="|cpu$is_and">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.06,-3787C1622.28,-3787 1684,-3787 1684,-3787 1684,-3787 1684,-3708.53 1684,-3708.53"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1687.5,-3708.53 1684,-3698.53 1680.5,-3708.53 1687.5,-3708.53"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_andi@1&#45;&gt;|cpu$is_andi@2 -->
<g id="id104" logical_entity="|cpu$is_andi" class="edge">
<title>|cpu$is_andi@1-&gt;|cpu$is_andi@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.23,-221C1116.63,-221 1174,-221 1174,-221 1174,-221 1174,-1656.67 1174,-1656.67 1174,-1656.67 1161.26,-1656.67 1161.26,-1656.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1161.26,-1653.17 1151.26,-1656.67 1161.26,-1660.17 1161.26,-1653.17"></polygon>
</g>
<!-- |cpu$is_andi@2&#45;&gt;|cpu$is_andi@3 -->
<g id="id106" logical_entity="|cpu$is_andi" class="edge">
<title>|cpu$is_andi@2-&gt;|cpu$is_andi@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.36,-1661.33C1167.38,-1661.33 1204,-1661.33 1204,-1661.33 1204,-1661.33 1204,-2969 1204,-2969 1204,-2969 1594,-2969 1594,-2969 1594,-2969 1594,-2970.07 1594,-2970.07"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1590.5,-2969.68 1594,-2979.68 1597.5,-2969.68 1590.5,-2969.68"></polygon>
</g>
<!-- |cpu$is_andi@3&#45;&gt;|cpu$result@3 -->
<g id="id361" logical_entity="|cpu$is_andi" class="edge">
<title>|cpu$is_andi@3-&gt;|cpu$result@3</title>
<g id="a_id361"><a xlink:title="|cpu$is_andi">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.28,-2987C1608.02,-2987 1617,-2987 1617,-2987 1617,-2987 1617,-3673.78 1617,-3673.78 1617,-3673.78 1693,-3673.78 1693,-3673.78 1693,-3673.78 1693,-3674.72 1693,-3674.72"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1689.5,-3673.2 1693,-3683.2 1696.5,-3673.2 1689.5,-3673.2"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_auipc@1&#45;&gt;|cpu$is_auipc@2 -->
<g id="id110" logical_entity="|cpu$is_auipc" class="edge">
<title>|cpu$is_auipc@1-&gt;|cpu$is_auipc@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1026.96,-260.67C989.13,-260.67 925,-260.67 925,-260.67 925,-260.67 925,-1691 925,-1691 925,-1691 1126.71,-1691 1126.71,-1691"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.71,-1694.5 1136.71,-1691 1126.71,-1687.5 1126.71,-1694.5"></polygon>
</g>
<!-- |cpu$is_auipc@2&#45;&gt;|cpu$is_auipc@3 -->
<g id="id112" logical_entity="|cpu$is_auipc" class="edge">
<title>|cpu$is_auipc@2-&gt;|cpu$is_auipc@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.45,-1691.25C1166.9,-1691.25 1201,-1691.25 1201,-1691.25 1201,-1691.25 1201,-3001.25 1201,-3001.25 1201,-3001.25 1594,-3001.25 1594,-3001.25 1594,-3001.25 1594,-3002.3 1594,-3002.3"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1590.5,-3001.78 1594,-3011.78 1597.5,-3001.78 1590.5,-3001.78"></polygon>
</g>
<!-- |cpu$is_auipc@3&#45;&gt;|cpu$result@3 -->
<g id="id399" logical_entity="|cpu$is_auipc" class="edge">
<title>|cpu$is_auipc@3-&gt;|cpu$result@3</title>
<g id="a_id399"><a xlink:title="|cpu$is_auipc">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.11,-3019C1607.2,-3019 1615,-3019 1615,-3019 1615,-3019 1615,-3671.83 1615,-3671.83 1615,-3671.83 1687,-3671.83 1687,-3671.83 1687,-3671.83 1687,-3673.2 1687,-3673.2"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1683.5,-3673.2 1687,-3683.2 1690.5,-3673.2 1683.5,-3673.2"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_b_instr@1&#45;&gt;|cpu$func3_valid@1 -->
<g id="id33" logical_entity="|cpu$is_b_instr" class="edge">
<title>|cpu$is_b_instr@1-&gt;|cpu$func3_valid@1</title>
<g id="a_id33"><a xlink:title="|cpu$is_b_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721,-1436.7C721,-1436.7 746.71,-1436.7 746.71,-1436.7"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="746.71,-1440.2 756.71,-1436.7 746.7,-1433.2 746.71,-1440.2"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_b_instr@1&#45;&gt;|cpu$imm@1 -->
<g id="id65" logical_entity="|cpu$is_b_instr" class="edge">
<title>|cpu$is_b_instr@1-&gt;|cpu$imm@1</title>
<g id="a_id65"><a xlink:title="|cpu$is_b_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721.48,-1433.6C729.9,-1433.6 737,-1433.6 737,-1433.6 737,-1433.6 737,-1253.5 737,-1253.5 737,-1253.5 746.93,-1253.5 746.93,-1253.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="746.93,-1257 756.93,-1253.5 746.93,-1250 746.93,-1257"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_b_instr@1&#45;&gt;|cpu$rs1_valid@1 -->
<g id="id471" logical_entity="|cpu$is_b_instr" class="edge">
<title>|cpu$is_b_instr@1-&gt;|cpu$rs1_valid@1</title>
<g id="a_id471"><a xlink:title="|cpu$is_b_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721,-1459.5C747.51,-1459.5 784,-1459.5 784,-1459.5 784,-1459.5 784,-1459.94 784,-1459.94"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="780.5,-1453.92 784,-1463.92 787.5,-1453.92 780.5,-1453.92"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_b_instr@1&#45;&gt;|cpu$rs2_valid@1 -->
<g id="id482" logical_entity="|cpu$is_b_instr" class="edge">
<title>|cpu$is_b_instr@1-&gt;|cpu$rs2_valid@1</title>
<g id="a_id482"><a xlink:title="|cpu$is_b_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721.29,-1455C733.42,-1455 745,-1455 745,-1455 745,-1455 745,-1511.62 745,-1511.62 745,-1511.62 746.91,-1511.62 746.91,-1511.62"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="746.91,-1515.13 756.91,-1511.62 746.91,-1508.13 746.91,-1515.13"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_beq@1&#45;&gt;|cpu$is_beq@2 -->
<g id="id118" logical_entity="|cpu$is_beq" class="edge">
<title>|cpu$is_beq@1-&gt;|cpu$is_beq@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.31,-1365C1089.33,-1365 1096,-1365 1096,-1365 1096,-1365 1096,-2619 1096,-2619 1096,-2619 1126.92,-2619 1126.92,-2619"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.92,-2622.5 1136.92,-2619 1126.92,-2615.5 1126.92,-2622.5"></polygon>
</g>
<!-- |cpu$is_beq@2&#45;&gt;|cpu$is_beq@3 -->
<g id="id120" logical_entity="|cpu$is_beq" class="edge">
<title>|cpu$is_beq@2-&gt;|cpu$is_beq@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.28,-2619C1158.02,-2619 1167,-2619 1167,-2619 1167,-2619 1167,-3083 1167,-3083 1167,-3083 1486.96,-3083 1486.96,-3083"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1486.96,-3086.5 1496.96,-3083 1486.96,-3079.5 1486.96,-3086.5"></polygon>
</g>
<!-- |cpu$is_beq@3&#45;&gt;|cpu$taken_br@3 -->
<g id="id508" logical_entity="|cpu$is_beq" class="edge">
<title>|cpu$is_beq@3-&gt;|cpu$taken_br@3</title>
<g id="a_id508"><a xlink:title="|cpu$is_beq">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511,-3085.33C1514.5,-3085.33 1518,-3085.33 1518,-3085.33 1518,-3085.33 1518,-3971.56 1518,-3971.56 1518,-3971.56 1556.99,-3971.56 1556.99,-3971.56"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1556.99,-3975.06 1566.99,-3971.56 1556.99,-3968.06 1556.99,-3975.06"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_bge@1&#45;&gt;|cpu$is_bge@2 -->
<g id="id124" logical_entity="|cpu$is_bge" class="edge">
<title>|cpu$is_bge@1-&gt;|cpu$is_bge@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.21,-1409C1087.3,-1409 1092,-1409 1092,-1409 1092,-1409 1092,-2651 1092,-2651 1092,-2651 1126.77,-2651 1126.77,-2651"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.77,-2654.5 1136.77,-2651 1126.77,-2647.5 1126.77,-2654.5"></polygon>
</g>
<!-- |cpu$is_bge@2&#45;&gt;|cpu$is_bge@3 -->
<g id="id126" logical_entity="|cpu$is_bge" class="edge">
<title>|cpu$is_bge@2-&gt;|cpu$is_bge@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.45,-2651C1157.83,-2651 1166,-2651 1166,-2651 1166,-2651 1166,-3115 1166,-3115 1166,-3115 1486.94,-3115 1486.94,-3115"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1486.94,-3118.5 1496.94,-3115 1486.94,-3111.5 1486.94,-3118.5"></polygon>
</g>
<!-- |cpu$is_bge@3&#45;&gt;|cpu$taken_br@3 -->
<g id="id519" logical_entity="|cpu$is_bge" class="edge">
<title>|cpu$is_bge@3-&gt;|cpu$taken_br@3</title>
<g id="a_id519"><a xlink:title="|cpu$is_bge">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.11,-3117.33C1514.14,-3117.33 1517,-3117.33 1517,-3117.33 1517,-3117.33 1517,-3974.44 1517,-3974.44 1517,-3974.44 1556.64,-3974.44 1556.64,-3974.44"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1556.64,-3977.94 1566.64,-3974.44 1556.64,-3970.94 1556.64,-3977.94"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_bgeu@1&#45;&gt;|cpu$is_bgeu@2 -->
<g id="id130" logical_entity="|cpu$is_bgeu" class="edge">
<title>|cpu$is_bgeu@1-&gt;|cpu$is_bgeu@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.23,-1453C1085.75,-1453 1089,-1453 1089,-1453 1089,-1453 1089,-2683 1089,-2683 1089,-2683 1126.81,-2683 1126.81,-2683"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.81,-2686.5 1136.81,-2683 1126.81,-2679.5 1126.81,-2686.5"></polygon>
</g>
<!-- |cpu$is_bgeu@2&#45;&gt;|cpu$is_bgeu@3 -->
<g id="id132" logical_entity="|cpu$is_bgeu" class="edge">
<title>|cpu$is_bgeu@2-&gt;|cpu$is_bgeu@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.22,-2683C1156.95,-2683 1164,-2683 1164,-2683 1164,-2683 1164,-3147 1164,-3147 1164,-3147 1486.9,-3147 1486.9,-3147"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1486.9,-3150.5 1496.9,-3147 1486.9,-3143.5 1486.9,-3150.5"></polygon>
</g>
<!-- |cpu$is_bgeu@3&#45;&gt;|cpu$taken_br@3 -->
<g id="id527" logical_entity="|cpu$is_bgeu" class="edge">
<title>|cpu$is_bgeu@3-&gt;|cpu$taken_br@3</title>
<g id="a_id527"><a xlink:title="|cpu$is_bgeu">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.12,-3149.33C1513.7,-3149.33 1516,-3149.33 1516,-3149.33 1516,-3149.33 1516,-3977.33 1516,-3977.33 1516,-3977.33 1556.72,-3977.33 1556.72,-3977.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1556.72,-3980.83 1566.72,-3977.33 1556.72,-3973.83 1556.72,-3980.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_blt@1&#45;&gt;|cpu$is_blt@2 -->
<g id="id136" logical_entity="|cpu$is_blt" class="edge">
<title>|cpu$is_blt@1-&gt;|cpu$is_blt@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.2,-1541C1083.52,-1541 1085,-1541 1085,-1541 1085,-1541 1085,-2715 1085,-2715 1085,-2715 1126.77,-2715 1126.77,-2715"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.77,-2718.5 1136.77,-2715 1126.77,-2711.5 1126.77,-2718.5"></polygon>
</g>
<!-- |cpu$is_blt@2&#45;&gt;|cpu$is_blt@3 -->
<g id="id138" logical_entity="|cpu$is_blt" class="edge">
<title>|cpu$is_blt@2-&gt;|cpu$is_blt@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.29,-2715C1156.65,-2715 1163,-2715 1163,-2715 1163,-2715 1163,-3179 1163,-3179 1163,-3179 1486.88,-3179 1486.88,-3179"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1486.88,-3182.5 1496.88,-3179 1486.88,-3175.5 1486.88,-3182.5"></polygon>
</g>
<!-- |cpu$is_blt@3&#45;&gt;|cpu$taken_br@3 -->
<g id="id514" logical_entity="|cpu$is_blt" class="edge">
<title>|cpu$is_blt@3-&gt;|cpu$taken_br@3</title>
<g id="a_id514"><a xlink:title="|cpu$is_blt">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.03,-3181.33C1513.18,-3181.33 1515,-3181.33 1515,-3181.33 1515,-3181.33 1515,-3980.22 1515,-3980.22 1515,-3980.22 1556.81,-3980.22 1556.81,-3980.22"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1556.81,-3983.72 1566.81,-3980.22 1556.81,-3976.72 1556.81,-3983.72"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_bltu@1&#45;&gt;|cpu$is_bltu@2 -->
<g id="id142" logical_entity="|cpu$is_bltu" class="edge">
<title>|cpu$is_bltu@1-&gt;|cpu$is_bltu@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1054,-1598C1054,-1727.4 1054,-2779 1054,-2779 1054,-2779 1126.94,-2779 1126.94,-2779"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.94,-2782.5 1136.94,-2779 1126.94,-2775.5 1126.94,-2782.5"></polygon>
</g>
<!-- |cpu$is_bltu@2&#45;&gt;|cpu$is_bltu@3 -->
<g id="id144" logical_entity="|cpu$is_bltu" class="edge">
<title>|cpu$is_bltu@2-&gt;|cpu$is_bltu@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.31,-2779C1155.92,-2779 1161,-2779 1161,-2779 1161,-2779 1161,-3275 1161,-3275 1161,-3275 1486.84,-3275 1486.84,-3275"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1486.84,-3278.5 1496.84,-3275 1486.84,-3271.5 1486.84,-3278.5"></polygon>
</g>
<!-- |cpu$is_bltu@3&#45;&gt;|cpu$taken_br@3 -->
<g id="id524" logical_entity="|cpu$is_bltu" class="edge">
<title>|cpu$is_bltu@3-&gt;|cpu$taken_br@3</title>
<g id="a_id524"><a xlink:title="|cpu$is_bltu">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.27,-3275C1512.82,-3275 1514,-3275 1514,-3275 1514,-3275 1514,-3983.11 1514,-3983.11 1514,-3983.11 1556.92,-3983.11 1556.92,-3983.11"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1556.92,-3986.61 1566.92,-3983.11 1556.92,-3979.61 1556.92,-3986.61"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_bne@1&#45;&gt;|cpu$is_bne@2 -->
<g id="id148" logical_entity="|cpu$is_bne" class="edge">
<title>|cpu$is_bne@1-&gt;|cpu$is_bne@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.21,-1321C1090.69,-1321 1099,-1321 1099,-1321 1099,-1321 1099,-2491 1099,-2491 1099,-2491 1126.97,-2491 1126.97,-2491"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.97,-2494.5 1136.97,-2491 1126.97,-2487.5 1126.97,-2494.5"></polygon>
</g>
<!-- |cpu$is_bne@2&#45;&gt;|cpu$is_bne@3 -->
<g id="id150" logical_entity="|cpu$is_bne" class="edge">
<title>|cpu$is_bne@2-&gt;|cpu$is_bne@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.15,-2491C1201.61,-2491 1502,-2491 1502,-2491 1502,-2491 1502,-2905.86 1502,-2905.86"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1498.5,-2905.86 1502,-2915.86 1505.5,-2905.86 1498.5,-2905.86"></polygon>
</g>
<!-- |cpu$is_bne@3&#45;&gt;|cpu$taken_br@3 -->
<g id="id511" logical_entity="|cpu$is_bne" class="edge">
<title>|cpu$is_bne@3-&gt;|cpu$taken_br@3</title>
<g id="a_id511"><a xlink:title="|cpu$is_bne">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.29,-2927.2C1521.8,-2927.2 1540,-2927.2 1540,-2927.2 1540,-2927.2 1540,-3962.89 1540,-3962.89 1540,-3962.89 1556.68,-3962.89 1556.68,-3962.89"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1556.68,-3966.39 1566.68,-3962.89 1556.68,-3959.39 1556.68,-3966.39"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_i_instr@1&#45;&gt;|cpu$func3_valid@1 -->
<g id="id31" logical_entity="|cpu$is_i_instr" class="edge">
<title>|cpu$is_i_instr@1-&gt;|cpu$func3_valid@1</title>
<g id="a_id31"><a xlink:title="|cpu$is_i_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721,-1409.88C747.51,-1409.88 784,-1409.88 784,-1409.88 784,-1409.88 784,-1410.87 784,-1410.87"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="780.5,-1409.82 784,-1419.82 787.5,-1409.82 780.5,-1409.82"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_i_instr@1&#45;&gt;|cpu$imm@1 -->
<g id="id56" logical_entity="|cpu$is_i_instr" class="edge">
<title>|cpu$is_i_instr@1-&gt;|cpu$imm@1</title>
<g id="a_id56"><a xlink:title="|cpu$is_i_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721.34,-1382.5C728.38,-1382.5 734,-1382.5 734,-1382.5 734,-1382.5 734,-1251.5 734,-1251.5 734,-1251.5 746.95,-1251.5 746.95,-1251.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="746.95,-1255 756.95,-1251.5 746.95,-1248 746.95,-1255"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_i_instr@1&#45;&gt;|cpu$rd_valid@1 -->
<g id="id340" logical_entity="|cpu$is_i_instr" class="edge">
<title>|cpu$is_i_instr@1-&gt;|cpu$rd_valid@1</title>
<g id="a_id340"><a xlink:title="|cpu$is_i_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721,-1389C721,-1389 746.71,-1389 746.71,-1389"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="746.71,-1392.5 756.71,-1389 746.7,-1385.5 746.71,-1392.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_i_instr@1&#45;&gt;|cpu$rs1_valid@1 -->
<g id="id469" logical_entity="|cpu$is_i_instr" class="edge">
<title>|cpu$is_i_instr@1-&gt;|cpu$rs1_valid@1</title>
<g id="a_id469"><a xlink:title="|cpu$is_i_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721.12,-1407.25C734.16,-1407.25 747,-1407.25 747,-1407.25 747,-1407.25 747,-1472 747,-1472 747,-1472 747.97,-1472 747.97,-1472"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="746.72,-1475.5 756.72,-1472 746.72,-1468.5 746.72,-1475.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_j_instr@1&#45;&gt;|cpu$imm@1 -->
<g id="id70" logical_entity="|cpu$is_j_instr" class="edge">
<title>|cpu$is_j_instr@1-&gt;|cpu$imm@1</title>
<g id="a_id70"><a xlink:title="|cpu$is_j_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M694,-1265.13C694,-1257.08 694,-1249.5 694,-1249.5 694,-1249.5 747,-1249.5 747,-1249.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="747,-1253 757,-1249.5 747,-1246 747,-1253"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_j_instr@1&#45;&gt;|cpu$rd_valid@1 -->
<g id="id342" logical_entity="|cpu$is_j_instr" class="edge">
<title>|cpu$is_j_instr@1-&gt;|cpu$rd_valid@1</title>
<g id="a_id342"><a xlink:title="|cpu$is_j_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721.05,-1296.25C751.87,-1296.25 798,-1296.25 798,-1296.25 798,-1296.25 798,-1365.71 798,-1365.71"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="794.5,-1365.71 798,-1375.71 801.5,-1365.71 794.5,-1365.71"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_jal@1&#45;&gt;|cpu$is_jal@2 -->
<g id="id160" logical_entity="|cpu$is_jal" class="edge">
<title>|cpu$is_jal@1-&gt;|cpu$is_jal@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.41,-172.67C1142.6,-172.67 1285,-172.67 1285,-172.67 1285,-172.67 1285,-1723.2 1285,-1723.2 1285,-1723.2 1161.19,-1723.2 1161.19,-1723.2"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1161.19,-1719.7 1151.19,-1723.2 1161.19,-1726.7 1161.19,-1719.7"></polygon>
</g>
<!-- |cpu$is_jal@1&#45;&gt;|cpu$is_jump@1 -->
<g id="id175" logical_entity="|cpu$is_jal" class="edge">
<title>|cpu$is_jal@1-&gt;|cpu$is_jump@1</title>
<g id="a_id175"><a xlink:title="|cpu$is_jal">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.05,-181.33C1110.36,-181.33 1153,-181.33 1153,-181.33 1153,-181.33 1153,-1561.56 1153,-1561.56"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1149.5,-1561.56 1153,-1571.56 1156.5,-1561.56 1149.5,-1561.56"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_jal@2&#45;&gt;|cpu$is_jal@3 -->
<g id="id162" logical_entity="|cpu$is_jal" class="edge">
<title>|cpu$is_jal@2-&gt;|cpu$is_jal@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.31,-1728.3C1178.59,-1728.3 1273,-1728.3 1273,-1728.3 1273,-1728.3 1273,-3656.67 1273,-3656.67 1273,-3656.67 1577,-3656.67 1577,-3656.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1577,-3660.17 1587,-3656.67 1577,-3653.17 1577,-3660.17"></polygon>
</g>
<!-- |cpu$is_jal@3&#45;&gt;|cpu$pc@0 -->
<g id="id321" logical_entity="|cpu$is_jal" class="edge">
<title>|cpu$is_jal@3-&gt;|cpu$pc@0</title>
<g id="a_id321"><a xlink:title="|cpu$is_jal>>3">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1586.75,-3661.33C1472.52,-3661.33 46,-3661.33 46,-3661.33 46,-3661.33 46,-1090.89 46,-1090.89"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="49.5,-1090.89 46,-1080.89 42.5,-1090.89 49.5,-1090.89"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_jal@3&#45;&gt;|cpu$result@3 -->
<g id="id402" logical_entity="|cpu$is_jal" class="edge">
<title>|cpu$is_jal@3-&gt;|cpu$result@3</title>
<g id="a_id402"><a xlink:title="|cpu$is_jal">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.11,-3660.67C1604.14,-3660.67 1607,-3660.67 1607,-3660.67 1607,-3660.67 1607,-3692 1607,-3692 1607,-3692 1646.64,-3692 1646.64,-3692"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1646.64,-3695.5 1656.64,-3692 1646.64,-3688.5 1646.64,-3695.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_jalr@1&#45;&gt;|cpu$is_jalr@2 -->
<g id="id166" logical_entity="|cpu$is_jalr" class="edge">
<title>|cpu$is_jalr@1-&gt;|cpu$is_jalr@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1026.81,-304.67C985.84,-304.67 913,-304.67 913,-304.67 913,-304.67 913,-1755 913,-1755 913,-1755 1126.83,-1755 1126.83,-1755"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.83,-1758.5 1136.83,-1755 1126.83,-1751.5 1126.83,-1758.5"></polygon>
</g>
<!-- |cpu$is_jalr@1&#45;&gt;|cpu$is_jump@1 -->
<g id="id176" logical_entity="|cpu$is_jalr" class="edge">
<title>|cpu$is_jalr@1-&gt;|cpu$is_jump@1</title>
<g id="a_id176"><a xlink:title="|cpu$is_jalr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.42,-309C1104.92,-309 1135,-309 1135,-309 1135,-309 1135,-1561.96 1135,-1561.96"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1131.5,-1561.96 1135,-1571.96 1138.5,-1561.96 1131.5,-1561.96"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_jalr@2&#45;&gt;|cpu$is_jalr@3 -->
<g id="id168" logical_entity="|cpu$is_jalr" class="edge">
<title>|cpu$is_jalr@2-&gt;|cpu$is_jalr@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.26,-1756.67C1152.29,-1756.67 1153,-1756.67 1153,-1756.67 1153,-1756.67 1153,-3688.67 1153,-3688.67 1153,-3688.67 1576.71,-3688.67 1576.71,-3688.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.71,-3692.17 1586.71,-3688.67 1576.71,-3685.17 1576.71,-3692.17"></polygon>
</g>
<!-- |cpu$is_jalr@3&#45;&gt;|cpu$pc@0 -->
<g id="id324" logical_entity="|cpu$is_jalr" class="edge">
<title>|cpu$is_jalr@3-&gt;|cpu$pc@0</title>
<g id="a_id324"><a xlink:title="|cpu$is_jalr>>3">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1586.73,-3693.33C1472.13,-3693.33 41,-3693.33 41,-3693.33 41,-3693.33 41,-1090.52 41,-1090.52"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="44.5,-1090.52 41,-1080.52 37.5,-1090.52 44.5,-1090.52"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_jalr@3&#45;&gt;|cpu$result@3 -->
<g id="id405" logical_entity="|cpu$is_jalr" class="edge">
<title>|cpu$is_jalr@3-&gt;|cpu$result@3</title>
<g id="a_id405"><a xlink:title="|cpu$is_jalr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.06,-3694C1601.06,-3694 1646.71,-3694 1646.71,-3694"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1646.71,-3697.5 1656.71,-3694 1646.71,-3690.5 1646.71,-3697.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_jump@1&#45;&gt;|cpu$is_jump@2 -->
<g id="id172" logical_entity="|cpu$is_jump" class="edge">
<title>|cpu$is_jump@1-&gt;|cpu$is_jump@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1169,-1598.09C1169,-1643.19 1169,-1789.33 1169,-1789.33 1169,-1789.33 1161.1,-1789.33 1161.1,-1789.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1161.1,-1785.83 1151.1,-1789.33 1161.1,-1792.83 1161.1,-1785.83"></polygon>
</g>
<!-- |cpu$is_jump@2&#45;&gt;|cpu$is_jump@3 -->
<g id="id174" logical_entity="|cpu$is_jump" class="edge">
<title>|cpu$is_jump@2-&gt;|cpu$is_jump@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.2,-1784.67C1206.31,-1784.67 1559,-1784.67 1559,-1784.67 1559,-1784.67 1559,-3046.33 1559,-3046.33 1559,-3046.33 1576.92,-3046.33 1576.92,-3046.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.92,-3049.83 1586.92,-3046.33 1576.92,-3042.83 1576.92,-3049.83"></polygon>
</g>
<!-- |cpu$is_jump@3&#45;&gt;|cpu$valid_jump@3 -->
<g id="id545" logical_entity="|cpu$is_jump" class="edge">
<title>|cpu$is_jump@3-&gt;|cpu$valid_jump@3</title>
<g id="a_id545"><a xlink:title="|cpu$is_jump">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.06,-3051C1622.28,-3051 1684,-3051 1684,-3051 1684,-3051 1684,-3584.78 1684,-3584.78"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1680.5,-3584.78 1684,-3594.78 1687.5,-3584.78 1680.5,-3584.78"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_load@1&#45;&gt;|cpu$is_load@2 -->
<g id="id179" logical_entity="|cpu$is_load" class="edge">
<title>|cpu$is_load@1-&gt;|cpu$is_load@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1026.67,-348.67C983.66,-348.67 905,-348.67 905,-348.67 905,-348.67 905,-1819 905,-1819 905,-1819 1126.85,-1819 1126.85,-1819"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.85,-1822.5 1136.85,-1819 1126.85,-1815.5 1126.85,-1822.5"></polygon>
</g>
<!-- |cpu$is_load@2&#45;&gt;|cpu$is_load@3 -->
<g id="id181" logical_entity="|cpu$is_load" class="edge">
<title>|cpu$is_load@2-&gt;|cpu$is_load@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.15,-1819C1205.86,-1819 1556,-1819 1556,-1819 1556,-1819 1556,-3080.67 1556,-3080.67 1556,-3080.67 1576.67,-3080.67 1576.67,-3080.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.67,-3084.17 1586.67,-3080.67 1576.67,-3077.17 1576.67,-3084.17"></polygon>
</g>
<!-- |cpu$is_load@3&#45;&gt;|cpu$valid_load@3 -->
<g id="id552" logical_entity="|cpu$is_load" class="edge">
<title>|cpu$is_load@3-&gt;|cpu$valid_load@3</title>
<g id="a_id552"><a xlink:title="|cpu$is_load">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.1,-3083C1608.49,-3083 1619,-3083 1619,-3083 1619,-3083 1619,-3643.33 1619,-3643.33 1619,-3643.33 1646.81,-3643.33 1646.81,-3643.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1646.81,-3646.83 1656.81,-3643.33 1646.81,-3639.83 1646.81,-3646.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_lui@1&#45;&gt;|cpu$is_lui@2 -->
<g id="id185" logical_entity="|cpu$is_lui" class="edge">
<title>|cpu$is_lui@1-&gt;|cpu$is_lui@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1026.73,-392.67C984.72,-392.67 909,-392.67 909,-392.67 909,-392.67 909,-1851 909,-1851 909,-1851 1126.97,-1851 1126.97,-1851"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.97,-1854.5 1136.97,-1851 1126.97,-1847.5 1126.97,-1854.5"></polygon>
</g>
<!-- |cpu$is_lui@2&#45;&gt;|cpu$is_lui@3 -->
<g id="id187" logical_entity="|cpu$is_lui" class="edge">
<title>|cpu$is_lui@2-&gt;|cpu$is_lui@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.12,-1851C1205.56,-1851 1554,-1851 1554,-1851 1554,-1851 1554,-3112.67 1554,-3112.67 1554,-3112.67 1576.66,-3112.67 1576.66,-3112.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.66,-3116.17 1586.66,-3112.67 1576.66,-3109.17 1576.66,-3116.17"></polygon>
</g>
<!-- |cpu$is_lui@3&#45;&gt;|cpu$result@3 -->
<g id="id397" logical_entity="|cpu$is_lui" class="edge">
<title>|cpu$is_lui@3-&gt;|cpu$result@3</title>
<g id="a_id397"><a xlink:title="|cpu$is_lui">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.26,-3115C1633.61,-3115 1763,-3115 1763,-3115 1763,-3115 1763,-3689.5 1763,-3689.5 1763,-3689.5 1721.19,-3689.5 1721.19,-3689.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1721.19,-3686 1711.19,-3689.5 1721.19,-3693 1721.19,-3686"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_or@1&#45;&gt;|cpu$is_or@2 -->
<g id="id191" logical_entity="|cpu$is_or" class="edge">
<title>|cpu$is_or@1-&gt;|cpu$is_or@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1026.93,-436.67C987.01,-436.67 917,-436.67 917,-436.67 917,-436.67 917,-1883 917,-1883 917,-1883 1126.96,-1883 1126.96,-1883"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.96,-1886.5 1136.96,-1883 1126.96,-1879.5 1126.96,-1886.5"></polygon>
</g>
<!-- |cpu$is_or@2&#45;&gt;|cpu$is_or@3 -->
<g id="id193" logical_entity="|cpu$is_or" class="edge">
<title>|cpu$is_or@2-&gt;|cpu$is_or@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.06,-1883C1205.11,-1883 1551,-1883 1551,-1883 1551,-1883 1551,-3144.67 1551,-3144.67 1551,-3144.67 1576.9,-3144.67 1576.9,-3144.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.9,-3148.17 1586.9,-3144.67 1576.9,-3141.17 1576.9,-3148.17"></polygon>
</g>
<!-- |cpu$is_or@3&#45;&gt;|cpu$result@3 -->
<g id="id382" logical_entity="|cpu$is_or" class="edge">
<title>|cpu$is_or@3-&gt;|cpu$result@3</title>
<g id="a_id382"><a xlink:title="|cpu$is_or">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.18,-3147C1633.14,-3147 1761,-3147 1761,-3147 1761,-3147 1761,-3688.5 1761,-3688.5 1761,-3688.5 1721.36,-3688.5 1721.36,-3688.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1721.36,-3685 1711.36,-3688.5 1721.36,-3692 1721.36,-3685"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_ori@1&#45;&gt;|cpu$is_ori@2 -->
<g id="id197" logical_entity="|cpu$is_ori" class="edge">
<title>|cpu$is_ori@1-&gt;|cpu$is_ori@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1026.76,-480.67C987.85,-480.67 921,-480.67 921,-480.67 921,-480.67 921,-1915 921,-1915 921,-1915 1126.58,-1915 1126.58,-1915"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.58,-1918.5 1136.58,-1915 1126.58,-1911.5 1126.58,-1918.5"></polygon>
</g>
<!-- |cpu$is_ori@2&#45;&gt;|cpu$is_ori@3 -->
<g id="id199" logical_entity="|cpu$is_ori" class="edge">
<title>|cpu$is_ori@2-&gt;|cpu$is_ori@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.01,-1915C1204.66,-1915 1548,-1915 1548,-1915 1548,-1915 1548,-3176.67 1548,-3176.67 1548,-3176.67 1576.81,-3176.67 1576.81,-3176.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.81,-3180.17 1586.81,-3176.67 1576.81,-3173.17 1576.81,-3180.17"></polygon>
</g>
<!-- |cpu$is_ori@3&#45;&gt;|cpu$result@3 -->
<g id="id367" logical_entity="|cpu$is_ori" class="edge">
<title>|cpu$is_ori@3-&gt;|cpu$result@3</title>
<g id="a_id367"><a xlink:title="|cpu$is_ori">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.09,-3179C1632.67,-3179 1759,-3179 1759,-3179 1759,-3179 1759,-3687.5 1759,-3687.5 1759,-3687.5 1721.08,-3687.5 1721.08,-3687.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1721.08,-3684 1711.08,-3687.5 1721.08,-3691 1721.08,-3684"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_r_instr@1&#45;&gt;|cpu$func3_valid@1 -->
<g id="id30" logical_entity="|cpu$is_r_instr" class="edge">
<title>|cpu$is_r_instr@1-&gt;|cpu$func3_valid@1</title>
<g id="a_id30"><a xlink:title="|cpu$is_r_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721.3,-1547.4C736.35,-1547.4 752,-1547.4 752,-1547.4 752,-1547.4 752,-1442.9 752,-1442.9 752,-1442.9 752.47,-1442.9 752.47,-1442.9"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="746.72,-1446.4 756.72,-1442.9 746.72,-1439.4 746.72,-1446.4"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_r_instr@1&#45;&gt;|cpu$func7_valid@1 -->
<g id="id38" logical_entity="|cpu$is_r_instr" class="edge">
<title>|cpu$is_r_instr@1-&gt;|cpu$func7_valid@1</title>
<g id="a_id38"><a xlink:title="|cpu$is_r_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721,-1564.75C721,-1564.75 746.71,-1564.75 746.71,-1564.75"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="746.71,-1568.25 756.71,-1564.75 746.7,-1561.25 746.71,-1568.25"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_r_instr@1&#45;&gt;|cpu$rd_valid@1 -->
<g id="id339" logical_entity="|cpu$is_r_instr" class="edge">
<title>|cpu$is_r_instr@1-&gt;|cpu$rd_valid@1</title>
<g id="a_id339"><a xlink:title="|cpu$is_r_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721.09,-1545.1C731.97,-1545.1 742,-1545.1 742,-1545.1 742,-1545.1 742,-1395.5 742,-1395.5 742,-1395.5 746.69,-1395.5 746.69,-1395.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="746.69,-1399 756.69,-1395.5 746.69,-1392 746.69,-1399"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_r_instr@1&#45;&gt;|cpu$rs1_valid@1 -->
<g id="id468" logical_entity="|cpu$is_r_instr" class="edge">
<title>|cpu$is_r_instr@1-&gt;|cpu$rs1_valid@1</title>
<g id="a_id468"><a xlink:title="|cpu$is_r_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721.29,-1549.7C737.53,-1549.7 755,-1549.7 755,-1549.7 755,-1549.7 755,-1481 755,-1481 755,-1481 755.19,-1481 755.19,-1481"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="746.9,-1484.5 756.9,-1481 746.9,-1477.5 746.9,-1484.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_r_instr@1&#45;&gt;|cpu$rs2_valid@1 -->
<g id="id480" logical_entity="|cpu$is_r_instr" class="edge">
<title>|cpu$is_r_instr@1-&gt;|cpu$rs2_valid@1</title>
<g id="a_id480"><a xlink:title="|cpu$is_r_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M694,-1540.4C694,-1533.93 694,-1528.25 694,-1528.25 694,-1528.25 747,-1528.25 747,-1528.25"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="747,-1531.75 757,-1528.25 747,-1524.75 747,-1531.75"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_s_instr@1&#45;&gt;|cpu$func3_valid@1 -->
<g id="id32" logical_entity="|cpu$is_s_instr" class="edge">
<title>|cpu$is_s_instr@1-&gt;|cpu$func3_valid@1</title>
<g id="a_id32"><a xlink:title="|cpu$is_s_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721.02,-1503.5C735.34,-1503.5 750,-1503.5 750,-1503.5 750,-1503.5 750,-1439.8 750,-1439.8 750,-1439.8 750.69,-1439.8 750.69,-1439.8"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="746.88,-1443.3 756.88,-1439.8 746.88,-1436.3 746.88,-1443.3"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_s_instr@1&#45;&gt;|cpu$imm@1 -->
<g id="id59" logical_entity="|cpu$is_s_instr" class="edge">
<title>|cpu$is_s_instr@1-&gt;|cpu$imm@1</title>
<g id="a_id59"><a xlink:title="|cpu$is_s_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721.21,-1499C730.69,-1499 739,-1499 739,-1499 739,-1499 739,-1255.5 739,-1255.5 739,-1255.5 746.79,-1255.5 746.79,-1255.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="746.79,-1259 756.79,-1255.5 746.79,-1252 746.79,-1259"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_s_instr@1&#45;&gt;|cpu$is_s_instr@2 -->
<g id="id207" logical_entity="|cpu$is_s_instr" class="edge">
<title>|cpu$is_s_instr@1-&gt;|cpu$is_s_instr@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M721.23,-1518.88C722.95,-1518.88 724,-1518.88 724,-1518.88 724,-1518.88 724,-2811 724,-2811 724,-2811 1126.71,-2811 1126.71,-2811"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.71,-2814.5 1136.71,-2811 1126.71,-2807.5 1126.71,-2814.5"></polygon>
</g>
<!-- |cpu$is_s_instr@1&#45;&gt;|cpu$rs1_valid@1 -->
<g id="id470" logical_entity="|cpu$is_s_instr" class="edge">
<title>|cpu$is_s_instr@1-&gt;|cpu$rs1_valid@1</title>
<g id="a_id470"><a xlink:title="|cpu$is_s_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M694,-1485.2C694,-1480.37 694,-1476.5 694,-1476.5 694,-1476.5 747,-1476.5 747,-1476.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="747,-1480 757,-1476.5 747,-1473 747,-1480"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_s_instr@1&#45;&gt;|cpu$rs2_valid@1 -->
<g id="id481" logical_entity="|cpu$is_s_instr" class="edge">
<title>|cpu$is_s_instr@1-&gt;|cpu$rs2_valid@1</title>
<g id="a_id481"><a xlink:title="|cpu$is_s_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721,-1515.25C721,-1515.25 746.71,-1515.25 746.71,-1515.25"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="746.71,-1518.75 756.71,-1515.25 746.7,-1511.75 746.71,-1518.75"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_s_instr@2&#45;&gt;|cpu$is_s_instr@3 -->
<g id="id209" logical_entity="|cpu$is_s_instr" class="edge">
<title>|cpu$is_s_instr@2-&gt;|cpu$is_s_instr@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.32,-2806.83C1156.3,-2806.83 1162,-2806.83 1162,-2806.83 1162,-2806.83 1162,-3211 1162,-3211 1162,-3211 1486.86,-3211 1486.86,-3211"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1486.86,-3214.5 1496.86,-3211 1486.86,-3207.5 1486.86,-3214.5"></polygon>
</g>
<!-- |cpu$is_s_instr@3&#45;&gt;|cpu$is_s_instr@4 -->
<g id="id211" logical_entity="|cpu$is_s_instr" class="edge">
<title>|cpu$is_s_instr@3-&gt;|cpu$is_s_instr@4</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.26,-3213.33C1520.14,-3213.33 1534,-3213.33 1534,-3213.33 1534,-3213.33 1534,-4305 1534,-4305 1534,-4305 1756.82,-4305 1756.82,-4305"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1756.82,-4308.5 1766.82,-4305 1756.82,-4301.5 1756.82,-4308.5"></polygon>
</g>
<!-- |cpu$is_s_instr@4&#45;&gt;|cpu$dmem_wr_en@4 -->
<g id="id24" logical_entity="|cpu$is_s_instr" class="edge">
<title>|cpu$is_s_instr@4-&gt;|cpu$dmem_wr_en@4</title>
<g id="a_id24"><a xlink:title="|cpu$is_s_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1781.31,-4304.75C1785.92,-4304.75 1791,-4304.75 1791,-4304.75 1791,-4304.75 1791,-4147.33 1791,-4147.33 1791,-4147.33 1826.82,-4147.33 1826.82,-4147.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1826.82,-4150.83 1836.82,-4147.33 1826.82,-4143.83 1826.82,-4150.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_sll@1&#45;&gt;|cpu$is_sll@2 -->
<g id="id219" logical_entity="|cpu$is_sll" class="edge">
<title>|cpu$is_sll@1-&gt;|cpu$is_sll@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1026.88,-524.67C990.11,-524.67 929,-524.67 929,-524.67 929,-524.67 929,-1947 929,-1947 929,-1947 1126.85,-1947 1126.85,-1947"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.85,-1950.5 1136.85,-1947 1126.85,-1943.5 1126.85,-1950.5"></polygon>
</g>
<!-- |cpu$is_sll@2&#45;&gt;|cpu$is_sll@3 -->
<g id="id221" logical_entity="|cpu$is_sll" class="edge">
<title>|cpu$is_sll@2-&gt;|cpu$is_sll@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.3,-1947C1205.65,-1947 1545,-1947 1545,-1947 1545,-1947 1545,-3208.67 1545,-3208.67 1545,-3208.67 1576.77,-3208.67 1576.77,-3208.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.77,-3212.17 1586.77,-3208.67 1576.77,-3205.17 1576.77,-3212.17"></polygon>
</g>
<!-- |cpu$is_sll@3&#45;&gt;|cpu$result@3 -->
<g id="id388" logical_entity="|cpu$is_sll" class="edge">
<title>|cpu$is_sll@3-&gt;|cpu$result@3</title>
<g id="a_id388"><a xlink:title="|cpu$is_sll">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.38,-3211C1633.07,-3211 1756,-3211 1756,-3211 1756,-3211 1756,-3686.5 1756,-3686.5 1756,-3686.5 1721.22,-3686.5 1721.22,-3686.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1721.22,-3683 1711.22,-3686.5 1721.22,-3690 1721.22,-3683"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_slli@1&#45;&gt;|cpu$is_slli@2 -->
<g id="id225" logical_entity="|cpu$is_slli" class="edge">
<title>|cpu$is_slli@1-&gt;|cpu$is_slli@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1026.85,-568.67C991.17,-568.67 933,-568.67 933,-568.67 933,-568.67 933,-1979 933,-1979 933,-1979 1126.98,-1979 1126.98,-1979"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.98,-1982.5 1136.98,-1979 1126.98,-1975.5 1126.98,-1982.5"></polygon>
</g>
<!-- |cpu$is_slli@2&#45;&gt;|cpu$is_slli@3 -->
<g id="id227" logical_entity="|cpu$is_slli" class="edge">
<title>|cpu$is_slli@2-&gt;|cpu$is_slli@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.35,-1979C1212.68,-1979 1637,-1979 1637,-1979 1637,-1979 1637,-3240.67 1637,-3240.67 1637,-3240.67 1611.1,-3240.67 1611.1,-3240.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1611.1,-3237.17 1601.1,-3240.67 1611.1,-3244.17 1611.1,-3237.17"></polygon>
</g>
<!-- |cpu$is_slli@3&#45;&gt;|cpu$result@3 -->
<g id="id370" logical_entity="|cpu$is_slli" class="edge">
<title>|cpu$is_slli@3-&gt;|cpu$result@3</title>
<g id="a_id370"><a xlink:title="|cpu$is_slli">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.29,-3245.33C1632.59,-3245.33 1754,-3245.33 1754,-3245.33 1754,-3245.33 1754,-3685.5 1754,-3685.5 1754,-3685.5 1721.26,-3685.5 1721.26,-3685.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1721.26,-3682 1711.26,-3685.5 1721.26,-3689 1721.26,-3682"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_slt@1&#45;&gt;|cpu$is_slt@2 -->
<g id="id231" logical_entity="|cpu$is_slt" class="edge">
<title>|cpu$is_slt@1-&gt;|cpu$is_slt@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.03,-617C1118.05,-617 1180,-617 1180,-617 1180,-617 1180,-2008.67 1180,-2008.67 1180,-2008.67 1161.29,-2008.67 1161.29,-2008.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1161.29,-2005.17 1151.29,-2008.67 1161.29,-2012.17 1161.29,-2005.17"></polygon>
</g>
<!-- |cpu$is_slt@2&#45;&gt;|cpu$is_slt@3 -->
<g id="id233" logical_entity="|cpu$is_slt" class="edge">
<title>|cpu$is_slt@2-&gt;|cpu$is_slt@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.29,-2013.33C1212.12,-2013.33 1633,-2013.33 1633,-2013.33 1633,-2013.33 1633,-3272.67 1633,-3272.67 1633,-3272.67 1611.15,-3272.67 1611.15,-3272.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1611.15,-3269.17 1601.15,-3272.67 1611.15,-3276.17 1611.15,-3269.17"></polygon>
</g>
<!-- |cpu$is_slt@3&#45;&gt;|cpu$result@3 -->
<g id="id416" logical_entity="|cpu$is_slt" class="edge">
<title>|cpu$is_slt@3-&gt;|cpu$result@3</title>
<g id="a_id416"><a xlink:title="|cpu$is_slt">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.2,-3277.33C1632.11,-3277.33 1752,-3277.33 1752,-3277.33 1752,-3277.33 1752,-3684.5 1752,-3684.5 1752,-3684.5 1721.27,-3684.5 1721.27,-3684.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1721.27,-3681 1711.27,-3684.5 1721.27,-3688 1721.27,-3681"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_slti@1&#45;&gt;|cpu$is_slti@2 -->
<g id="id237" logical_entity="|cpu$is_slti" class="edge">
<title>|cpu$is_slti@1-&gt;|cpu$is_slti@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.04,-661C1118.87,-661 1183,-661 1183,-661 1183,-661 1183,-2040.67 1183,-2040.67 1183,-2040.67 1161.15,-2040.67 1161.15,-2040.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1161.15,-2037.17 1151.15,-2040.67 1161.15,-2044.17 1161.15,-2037.17"></polygon>
</g>
<!-- |cpu$is_slti@2&#45;&gt;|cpu$is_slti@3 -->
<g id="id239" logical_entity="|cpu$is_slti" class="edge">
<title>|cpu$is_slti@2-&gt;|cpu$is_slti@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.23,-2045.33C1211.56,-2045.33 1629,-2045.33 1629,-2045.33 1629,-2045.33 1629,-3304.67 1629,-3304.67 1629,-3304.67 1611.08,-3304.67 1611.08,-3304.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1611.08,-3301.17 1601.08,-3304.67 1611.08,-3308.17 1611.08,-3301.17"></polygon>
</g>
<!-- |cpu$is_slti@3&#45;&gt;|cpu$result@3 -->
<g id="id421" logical_entity="|cpu$is_slti" class="edge">
<title>|cpu$is_slti@3-&gt;|cpu$result@3</title>
<g id="a_id421"><a xlink:title="|cpu$is_slti">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.09,-3309.33C1630.45,-3309.33 1741,-3309.33 1741,-3309.33 1741,-3309.33 1741,-3697.5 1741,-3697.5 1741,-3697.5 1721.16,-3697.5 1721.16,-3697.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1721.16,-3694 1711.16,-3697.5 1721.16,-3701 1721.16,-3694"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_sltiu@1&#45;&gt;|cpu$is_sltiu@2 -->
<g id="id243" logical_entity="|cpu$is_sltiu" class="edge">
<title>|cpu$is_sltiu@1-&gt;|cpu$is_sltiu@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.03,-705C1119.65,-705 1186,-705 1186,-705 1186,-705 1186,-2072.67 1186,-2072.67 1186,-2072.67 1161.32,-2072.67 1161.32,-2072.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1161.32,-2069.17 1151.32,-2072.67 1161.32,-2076.17 1161.32,-2069.17"></polygon>
</g>
<!-- |cpu$is_sltiu@2&#45;&gt;|cpu$is_sltiu@3 -->
<g id="id245" logical_entity="|cpu$is_sltiu" class="edge">
<title>|cpu$is_sltiu@2-&gt;|cpu$is_sltiu@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.17,-2077.33C1211.01,-2077.33 1625,-2077.33 1625,-2077.33 1625,-2077.33 1625,-3336.67 1625,-3336.67 1625,-3336.67 1611.19,-3336.67 1611.19,-3336.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1611.19,-3333.17 1601.19,-3336.67 1611.19,-3340.17 1611.19,-3333.17"></polygon>
</g>
<!-- |cpu$is_sltiu@3&#45;&gt;|cpu$result@3 -->
<g id="id426" logical_entity="|cpu$is_sltiu" class="edge">
<title>|cpu$is_sltiu@3-&gt;|cpu$result@3</title>
<g id="a_id426"><a xlink:title="|cpu$is_sltiu">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.34,-3341.33C1630.68,-3341.33 1738,-3341.33 1738,-3341.33 1738,-3341.33 1738,-3696.5 1738,-3696.5 1738,-3696.5 1721.32,-3696.5 1721.32,-3696.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1721.32,-3693 1711.32,-3696.5 1721.32,-3700 1721.32,-3693"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_sltu@1&#45;&gt;|cpu$is_sltu@2 -->
<g id="id249" logical_entity="|cpu$is_sltu" class="edge">
<title>|cpu$is_sltu@1-&gt;|cpu$is_sltu@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.32,-749C1120.77,-749 1189,-749 1189,-749 1189,-749 1189,-2104.67 1189,-2104.67 1189,-2104.67 1161.03,-2104.67 1161.03,-2104.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1161.03,-2101.17 1151.03,-2104.67 1161.03,-2108.17 1161.03,-2101.17"></polygon>
</g>
<!-- |cpu$is_sltu@2&#45;&gt;|cpu$is_sltu@3 -->
<g id="id251" logical_entity="|cpu$is_sltu" class="edge">
<title>|cpu$is_sltu@2-&gt;|cpu$is_sltu@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.25,-2109.33C1155.48,-2109.33 1160,-2109.33 1160,-2109.33 1160,-2109.33 1160,-3371 1160,-3371 1160,-3371 1576.83,-3371 1576.83,-3371"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.83,-3374.5 1586.83,-3371 1576.83,-3367.5 1576.83,-3374.5"></polygon>
</g>
<!-- |cpu$is_sltu@3&#45;&gt;|cpu$result@3 -->
<g id="id394" logical_entity="|cpu$is_sltu" class="edge">
<title>|cpu$is_sltu@3-&gt;|cpu$result@3</title>
<g id="a_id394"><a xlink:title="|cpu$is_sltu">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.14,-3371C1629.66,-3371 1734,-3371 1734,-3371 1734,-3371 1734,-3695.5 1734,-3695.5 1734,-3695.5 1721.05,-3695.5 1721.05,-3695.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1721.05,-3692 1711.05,-3695.5 1721.05,-3699 1721.05,-3692"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_sra@1&#45;&gt;|cpu$is_sra@2 -->
<g id="id255" logical_entity="|cpu$is_sra" class="edge">
<title>|cpu$is_sra@1-&gt;|cpu$is_sra@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1026.84,-788.67C1012.15,-788.67 997,-788.67 997,-788.67 997,-788.67 997,-2139 997,-2139 997,-2139 1126.91,-2139 1126.91,-2139"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.91,-2142.5 1136.91,-2139 1126.91,-2135.5 1126.91,-2142.5"></polygon>
</g>
<!-- |cpu$is_sra@2&#45;&gt;|cpu$is_sra@3 -->
<g id="id257" logical_entity="|cpu$is_sra" class="edge">
<title>|cpu$is_sra@2-&gt;|cpu$is_sra@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.15,-2139C1155.01,-2139 1159,-2139 1159,-2139 1159,-2139 1159,-3403 1159,-3403 1159,-3403 1576.81,-3403 1576.81,-3403"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.81,-3406.5 1586.81,-3403 1576.81,-3399.5 1576.81,-3406.5"></polygon>
</g>
<!-- |cpu$is_sra@3&#45;&gt;|cpu$result@3 -->
<g id="id412" logical_entity="|cpu$is_sra" class="edge">
<title>|cpu$is_sra@3-&gt;|cpu$result@3</title>
<g id="a_id412"><a xlink:title="|cpu$is_sra">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.37,-3403C1629.82,-3403 1731,-3403 1731,-3403 1731,-3403 1731,-3694.5 1731,-3694.5 1731,-3694.5 1721.07,-3694.5 1721.07,-3694.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1721.07,-3691 1711.07,-3694.5 1721.07,-3698 1721.07,-3691"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_srai@1&#45;&gt;|cpu$is_srai@2 -->
<g id="id261" logical_entity="|cpu$is_srai" class="edge">
<title>|cpu$is_srai@1-&gt;|cpu$is_srai@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1026.78,-832.67C1014.2,-832.67 1002,-832.67 1002,-832.67 1002,-832.67 1002,-2171 1002,-2171 1002,-2171 1126.76,-2171 1126.76,-2171"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.76,-2174.5 1136.76,-2171 1126.76,-2167.5 1126.76,-2174.5"></polygon>
</g>
<!-- |cpu$is_srai@2&#45;&gt;|cpu$is_srai@3 -->
<g id="id263" logical_entity="|cpu$is_srai" class="edge">
<title>|cpu$is_srai@2-&gt;|cpu$is_srai@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.11,-2171C1154.14,-2171 1157,-2171 1157,-2171 1157,-2171 1157,-3435 1157,-3435 1157,-3435 1576.78,-3435 1576.78,-3435"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.78,-3438.5 1586.78,-3435 1576.78,-3431.5 1576.78,-3438.5"></polygon>
</g>
<!-- |cpu$is_srai@3&#45;&gt;|cpu$result@3 -->
<g id="id408" logical_entity="|cpu$is_srai" class="edge">
<title>|cpu$is_srai@3-&gt;|cpu$result@3</title>
<g id="a_id408"><a xlink:title="|cpu$is_srai">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.2,-3435C1629.04,-3435 1728,-3435 1728,-3435 1728,-3435 1728,-3693.5 1728,-3693.5 1728,-3693.5 1721.11,-3693.5 1721.11,-3693.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1721.11,-3690 1711.11,-3693.5 1721.11,-3697 1721.11,-3690"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_srl@1&#45;&gt;|cpu$is_srl@2 -->
<g id="id267" logical_entity="|cpu$is_srl" class="edge">
<title>|cpu$is_srl@1-&gt;|cpu$is_srl@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1026.93,-876.67C1016.48,-876.67 1007,-876.67 1007,-876.67 1007,-876.67 1007,-2203 1007,-2203 1007,-2203 1126.63,-2203 1126.63,-2203"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.63,-2206.5 1136.63,-2203 1126.63,-2199.5 1126.63,-2206.5"></polygon>
</g>
<!-- |cpu$is_srl@2&#45;&gt;|cpu$is_srl@3 -->
<g id="id269" logical_entity="|cpu$is_srl" class="edge">
<title>|cpu$is_srl@2-&gt;|cpu$is_srl@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.12,-2203C1153.7,-2203 1156,-2203 1156,-2203 1156,-2203 1156,-3467 1156,-3467 1156,-3467 1576.76,-3467 1576.76,-3467"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.76,-3470.5 1586.76,-3467 1576.76,-3463.5 1576.76,-3470.5"></polygon>
</g>
<!-- |cpu$is_srl@3&#45;&gt;|cpu$result@3 -->
<g id="id391" logical_entity="|cpu$is_srl" class="edge">
<title>|cpu$is_srl@3-&gt;|cpu$result@3</title>
<g id="a_id391"><a xlink:title="|cpu$is_srl">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.04,-3467C1628.25,-3467 1725,-3467 1725,-3467 1725,-3467 1725,-3692.5 1725,-3692.5 1725,-3692.5 1721.12,-3692.5 1721.12,-3692.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1721.12,-3689 1711.12,-3692.5 1721.12,-3696 1721.12,-3689"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_srli@1&#45;&gt;|cpu$is_srli@2 -->
<g id="id273" logical_entity="|cpu$is_srli" class="edge">
<title>|cpu$is_srli@1-&gt;|cpu$is_srli@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1026.69,-1019.75C1018.67,-1019.75 1012,-1019.75 1012,-1019.75 1012,-1019.75 1012,-2235 1012,-2235 1012,-2235 1126.9,-2235 1126.9,-2235"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.9,-2238.5 1136.9,-2235 1126.9,-2231.5 1126.9,-2238.5"></polygon>
</g>
<!-- |cpu$is_srli@2&#45;&gt;|cpu$is_srli@3 -->
<g id="id275" logical_entity="|cpu$is_srli" class="edge">
<title>|cpu$is_srli@2-&gt;|cpu$is_srli@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.03,-2232.67C1153.18,-2232.67 1155,-2232.67 1155,-2232.67 1155,-2232.67 1155,-3499 1155,-3499 1155,-3499 1576.75,-3499 1576.75,-3499"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.75,-3502.5 1586.75,-3499 1576.75,-3495.5 1576.75,-3502.5"></polygon>
</g>
<!-- |cpu$is_srli@3&#45;&gt;|cpu$result@3 -->
<g id="id373" logical_entity="|cpu$is_srli" class="edge">
<title>|cpu$is_srli@3-&gt;|cpu$result@3</title>
<g id="a_id373"><a xlink:title="|cpu$is_srli">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.19,-3499C1628.06,-3499 1721,-3499 1721,-3499 1721,-3499 1721,-3691.5 1721,-3691.5 1721,-3691.5 1720.03,-3691.5 1720.03,-3691.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1721.28,-3688 1711.28,-3691.5 1721.28,-3695 1721.28,-3688"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_sub@1&#45;&gt;|cpu$is_sub@2 -->
<g id="id279" logical_entity="|cpu$is_sub" class="edge">
<title>|cpu$is_sub@1-&gt;|cpu$is_sub@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1026.72,-1063C1021.18,-1063 1017,-1063 1017,-1063 1017,-1063 1017,-2267 1017,-2267 1017,-2267 1126.81,-2267 1126.81,-2267"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.81,-2270.5 1136.81,-2267 1126.81,-2263.5 1126.81,-2270.5"></polygon>
</g>
<!-- |cpu$is_sub@2&#45;&gt;|cpu$is_sub@3 -->
<g id="id281" logical_entity="|cpu$is_sub" class="edge">
<title>|cpu$is_sub@2-&gt;|cpu$is_sub@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.06,-2268.25C1165.7,-2268.25 1198,-2268.25 1198,-2268.25 1198,-2268.25 1198,-3531 1198,-3531 1198,-3531 1576.79,-3531 1576.79,-3531"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.79,-3534.5 1586.79,-3531 1576.79,-3527.5 1576.79,-3534.5"></polygon>
</g>
<!-- |cpu$is_sub@3&#45;&gt;|cpu$result@3 -->
<g id="id385" logical_entity="|cpu$is_sub" class="edge">
<title>|cpu$is_sub@3-&gt;|cpu$result@3</title>
<g id="a_id385"><a xlink:title="|cpu$is_sub">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.29,-3531C1606.65,-3531 1613,-3531 1613,-3531 1613,-3531 1613,-3686 1613,-3686 1613,-3686 1646.75,-3686 1646.75,-3686"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1646.75,-3689.5 1656.75,-3686 1646.75,-3682.5 1646.75,-3689.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_u_instr@1&#45;&gt;|cpu$imm@1 -->
<g id="id63" logical_entity="|cpu$is_u_instr" class="edge">
<title>|cpu$is_u_instr@1-&gt;|cpu$imm@1</title>
<g id="a_id63"><a xlink:title="|cpu$is_u_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721.36,-1327C743.5,-1327 771,-1327 771,-1327 771,-1327 771,-1270.64 771,-1270.64"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="774.5,-1270.64 771,-1260.64 767.5,-1270.64 774.5,-1270.64"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_u_instr@1&#45;&gt;|cpu$rd_valid@1 -->
<g id="id341" logical_entity="|cpu$is_u_instr" class="edge">
<title>|cpu$is_u_instr@1-&gt;|cpu$rd_valid@1</title>
<g id="a_id341"><a xlink:title="|cpu$is_u_instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M721,-1343C747.51,-1343 784,-1343 784,-1343 784,-1343 784,-1365.94 784,-1365.94"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="780.5,-1365.94 784,-1375.94 787.5,-1365.94 780.5,-1365.94"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_xor@1&#45;&gt;|cpu$is_xor@2 -->
<g id="id289" logical_entity="|cpu$is_xor" class="edge">
<title>|cpu$is_xor@1-&gt;|cpu$is_xor@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1026.72,-1107.5C1023.88,-1107.5 1022,-1107.5 1022,-1107.5 1022,-1107.5 1022,-2299 1022,-2299 1022,-2299 1126.73,-2299 1126.73,-2299"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.73,-2302.5 1136.73,-2299 1126.73,-2295.5 1126.73,-2302.5"></polygon>
</g>
<!-- |cpu$is_xor@2&#45;&gt;|cpu$is_xor@3 -->
<g id="id291" logical_entity="|cpu$is_xor" class="edge">
<title>|cpu$is_xor@2-&gt;|cpu$is_xor@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.09,-2295.75C1165.1,-2295.75 1195,-2295.75 1195,-2295.75 1195,-2295.75 1195,-3563 1195,-3563 1195,-3563 1576.73,-3563 1576.73,-3563"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.73,-3566.5 1586.73,-3563 1576.73,-3559.5 1576.73,-3566.5"></polygon>
</g>
<!-- |cpu$is_xor@3&#45;&gt;|cpu$result@3 -->
<g id="id379" logical_entity="|cpu$is_xor" class="edge">
<title>|cpu$is_xor@3-&gt;|cpu$result@3</title>
<g id="a_id379"><a xlink:title="|cpu$is_xor">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.31,-3563C1605.92,-3563 1611,-3563 1611,-3563 1611,-3563 1611,-3688 1611,-3688 1611,-3688 1646.82,-3688 1646.82,-3688"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1646.82,-3691.5 1656.82,-3688 1646.82,-3684.5 1646.82,-3691.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$is_xori@1&#45;&gt;|cpu$is_xori@2 -->
<g id="id295" logical_entity="|cpu$is_xori" class="edge">
<title>|cpu$is_xori@1-&gt;|cpu$is_xori@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1081.19,-1145C1097.07,-1145 1114,-1145 1114,-1145 1114,-1145 1114,-2331 1114,-2331 1114,-2331 1126.74,-2331 1126.74,-2331"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.74,-2334.5 1136.74,-2331 1126.74,-2327.5 1126.74,-2334.5"></polygon>
</g>
<!-- |cpu$is_xori@2&#45;&gt;|cpu$is_xori@3 -->
<g id="id297" logical_entity="|cpu$is_xori" class="edge">
<title>|cpu$is_xori@2-&gt;|cpu$is_xori@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.08,-2332C1164.43,-2332 1192,-2332 1192,-2332 1192,-2332 1192,-3595 1192,-3595 1192,-3595 1576.68,-3595 1576.68,-3595"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.68,-3598.5 1586.68,-3595 1576.68,-3591.5 1576.68,-3598.5"></polygon>
</g>
<!-- |cpu$is_xori@3&#45;&gt;|cpu$result@3 -->
<g id="id364" logical_entity="|cpu$is_xori" class="edge">
<title>|cpu$is_xori@3-&gt;|cpu$result@3</title>
<g id="a_id364"><a xlink:title="|cpu$is_xori">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.15,-3598.5C1605.01,-3598.5 1609,-3598.5 1609,-3598.5 1609,-3598.5 1609,-3690 1609,-3690 1609,-3690 1646.92,-3690 1646.92,-3690"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1646.92,-3693.5 1656.92,-3690 1646.92,-3686.5 1646.92,-3693.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$jalr_tgt_pc@2&#45;&gt;|cpu$jalr_tgt_pc@3 -->
<g id="id301" logical_entity="|cpu$jalr_tgt_pc" class="edge">
<title>|cpu$jalr_tgt_pc@2-&gt;|cpu$jalr_tgt_pc@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1566.9,-2790.25C1565.71,-2790.25 1565,-2790.25 1565,-2790.25 1565,-2790.25 1565,-3307 1565,-3307 1565,-3307 1521.48,-3307 1521.48,-3307"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1521.48,-3303.5 1511.48,-3307 1521.48,-3310.5 1521.48,-3303.5"></polygon>
</g>
<!-- |cpu$jalr_tgt_pc@3&#45;&gt;|cpu$pc@0 -->
<g id="id325" logical_entity="|cpu$jalr_tgt_pc" class="edge">
<title>|cpu$jalr_tgt_pc@3-&gt;|cpu$pc@0</title>
<g id="a_id325"><a xlink:title="|cpu$jalr_tgt_pc>>3">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1496.93,-3307C1388.3,-3307 64,-3307 64,-3307 64,-3307 64,-1090.65 64,-1090.65"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="67.5,-1090.65 64,-1080.65 60.5,-1090.65 67.5,-1090.65"></polygon>
</a>
</g>
</g>
<!-- |cpu$ld_data@5&#45;&gt;|cpu$rf_wr_data@3 -->
<g id="id450" logical_entity="|cpu$ld_data" class="edge">
<title>|cpu$ld_data@5-&gt;|cpu$rf_wr_data@3</title>
<g id="a_id450"><a xlink:title="|cpu$ld_data>>2">
<path fill="none" stroke="purple" stroke-width="1.5" d="M2184.84,-4360C2092.73,-4360 1798,-4360 1798,-4360 1798,-4360 1798,-3018.59 1798,-3018.59"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1801.5,-3018.59 1798,-3008.59 1794.5,-3018.59 1801.5,-3018.59"></polygon>
</a>
</g>
</g>
<!-- |cpu$opcode@1&#45;&gt;|cpu$dec_bits@1 -->
<g id="id10" logical_entity="|cpu$opcode" class="edge">
<title>|cpu$opcode@1-&gt;|cpu$dec_bits@1</title>
<g id="a_id10"><a xlink:title="|cpu$opcode">
<path fill="none" stroke="purple" stroke-width="1.5" d="M901.23,-1066.5C919.41,-1066.5 940,-1066.5 940,-1066.5 940,-1066.5 940,-970.25 940,-970.25"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="943.5,-970.25 940,-960.25 936.5,-970.25 943.5,-970.25"></polygon>
</a>
</g>
</g>
<!-- |cpu$pc@0&#45;&gt;|cpu$imem_rd_addr@0 -->
<g id="id42" logical_entity="|cpu$pc" class="edge">
<title>|cpu$pc@0-&gt;|cpu$imem_rd_addr@0</title>
<g id="a_id42"><a xlink:title="|cpu$pc">
<path fill="none" stroke="purple" stroke-width="1.5" d="M86,-1073C86,-1073 111.71,-1073 111.71,-1073"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="111.71,-1076.5 121.71,-1073 111.7,-1069.5 111.71,-1076.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$pc@0&#45;&gt;|cpu$pc@1 -->
<g id="id310" logical_entity="|cpu$pc" class="edge">
<title>|cpu$pc@0-&gt;|cpu$pc@1</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M82,-1080.58C82,-1086.6 82,-1094 82,-1094 82,-1094 313.82,-1094 313.82,-1094"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="313.82,-1097.5 323.82,-1094 313.82,-1090.5 313.82,-1097.5"></polygon>
</g>
<!-- |cpu$pc@1&#45;&gt;|cpu$inc_pc@1 -->
<g id="id81" logical_entity="|cpu$pc" class="edge">
<title>|cpu$pc@1-&gt;|cpu$inc_pc@1</title>
<g id="a_id81"><a xlink:title="|cpu$pc">
<path fill="none" stroke="purple" stroke-width="1.5" d="M338.11,-1094.5C344.2,-1094.5 352,-1094.5 352,-1094.5 352,-1094.5 352,-1580.67 352,-1580.67 352,-1580.67 476.88,-1580.67 476.88,-1580.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="476.88,-1584.17 486.88,-1580.67 476.88,-1577.17 476.88,-1584.17"></polygon>
</a>
</g>
</g>
<!-- |cpu$pc@1&#45;&gt;|cpu$pc@2 -->
<g id="id312" logical_entity="|cpu$pc" class="edge">
<title>|cpu$pc@1-&gt;|cpu$pc@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M338.25,-1091.25C392.19,-1091.25 729,-1091.25 729,-1091.25 729,-1091.25 729,-2350 729,-2350 729,-2350 1486.82,-2350 1486.82,-2350"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1486.82,-2353.5 1496.82,-2350 1486.82,-2346.5 1486.82,-2353.5"></polygon>
</g>
<!-- |cpu$pc@2&#45;&gt;|cpu$br_tgt_pc@2 -->
<g id="id6" logical_entity="|cpu$pc" class="edge">
<title>|cpu$pc@2-&gt;|cpu$br_tgt_pc@2</title>
<g id="a_id6"><a xlink:title="|cpu$pc">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1507,-2358.14C1507,-2417.73 1507,-2830 1507,-2830 1507,-2830 1556.95,-2830 1556.95,-2830"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1556.95,-2833.5 1566.95,-2830 1556.95,-2826.5 1556.95,-2833.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$pc@2&#45;&gt;|cpu$pc@3 -->
<g id="id314" logical_entity="|cpu$pc" class="edge">
<title>|cpu$pc@2-&gt;|cpu$pc@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.28,-2351C1518.02,-2351 1527,-2351 1527,-2351 1527,-2351 1527,-2951.5 1527,-2951.5 1527,-2951.5 1576.83,-2951.5 1576.83,-2951.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.83,-2955 1586.83,-2951.5 1576.83,-2948 1576.83,-2955"></polygon>
</g>
<!-- |cpu$pc@3&#45;&gt;|cpu$result@3 -->
<g id="id406" logical_entity="|cpu$pc" class="edge">
<title>|cpu$pc@3-&gt;|cpu$result@3</title>
<g id="a_id406"><a xlink:title="|cpu$pc">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.09,-2955C1615.1,-2955 1645,-2955 1645,-2955 1645,-2955 1645,-3667.94 1645,-3667.94 1645,-3667.94 1699,-3667.94 1699,-3667.94 1699,-3667.94 1699,-3673.45 1699,-3673.45"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1695.5,-3673.45 1699,-3683.45 1702.5,-3673.45 1695.5,-3673.45"></polygon>
</a>
</g>
</g>
<!-- |cpu$rd@1&#45;&gt;|cpu$rd@2 -->
<g id="id329" logical_entity="|cpu$rd" class="edge">
<title>|cpu$rd@1-&gt;|cpu$rd@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M874,-1597.51C874,-1682.45 874,-2459 874,-2459 874,-2459 1126.78,-2459 1126.78,-2459"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.78,-2462.5 1136.78,-2459 1126.78,-2455.5 1126.78,-2462.5"></polygon>
</g>
<!-- |cpu$rd@2&#45;&gt;|cpu$rd@3 -->
<g id="id331" logical_entity="|cpu$rd" class="edge">
<title>|cpu$rd@2-&gt;|cpu$rd@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.29,-2459C1204.1,-2459 1526,-2459 1526,-2459 1526,-2459 1526,-2924.4 1526,-2924.4 1526,-2924.4 1576.98,-2924.4 1576.98,-2924.4"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.98,-2927.9 1586.98,-2924.4 1576.98,-2920.9 1576.98,-2927.9"></polygon>
</g>
<!-- |cpu$rd@3&#45;&gt;|cpu$rf_wr_en@3 -->
<g id="id453" logical_entity="|cpu$rd" class="edge">
<title>|cpu$rd@3-&gt;|cpu$rf_wr_en@3</title>
<g id="a_id453"><a xlink:title="|cpu$rd">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.11,-2925.5C1620.17,-2925.5 1671,-2925.5 1671,-2925.5 1671,-2925.5 1671,-2932.42 1671,-2932.42"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1667.5,-2932.42 1671,-2942.42 1674.5,-2932.42 1667.5,-2932.42"></polygon>
</a>
</g>
</g>
<!-- |cpu$rd@3&#45;&gt;|cpu$rf_wr_index@3 -->
<g id="id458" logical_entity="|cpu$rd" class="edge">
<title>|cpu$rd@3-&gt;|cpu$rf_wr_index@3</title>
<g id="a_id458"><a xlink:title="|cpu$rd">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.28,-2921C1601.28,-2921 1736.79,-2921 1736.79,-2921"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1736.79,-2924.5 1746.79,-2921 1736.79,-2917.5 1736.79,-2924.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$rd@3&#45;&gt;|cpu$src1_value@2 -->
<g id="id493" logical_entity="|cpu$rd" class="edge">
<title>|cpu$rd@3-&gt;|cpu$src1_value@2</title>
<g id="a_id493"><a xlink:title="|cpu$rd>>1">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1586.94,-2921.6C1569.91,-2921.6 1528,-2921.6 1528,-2921.6 1528,-2921.6 1528,-2304.09 1528,-2304.09"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1531.5,-2304.09 1528,-2294.09 1524.5,-2304.09 1531.5,-2304.09"></polygon>
</a>
</g>
</g>
<!-- |cpu$rd@3&#45;&gt;|cpu$src2_value@2 -->
<g id="id503" logical_entity="|cpu$rd" class="edge">
<title>|cpu$rd@3-&gt;|cpu$src2_value@2</title>
<g id="a_id503"><a xlink:title="|cpu$rd>>1">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1586.9,-2918.8C1577.47,-2918.8 1562,-2918.8 1562,-2918.8 1562,-2918.8 1562,-2237 1562,-2237 1562,-2237 1541.3,-2237 1541.3,-2237"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1541.3,-2233.5 1531.3,-2237 1541.3,-2240.5 1541.3,-2233.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$rd_valid@1&#45;&gt;|cpu$rd@1 -->
<g id="id333" logical_entity="|cpu$rd_valid" class="edge">
<title>|cpu$rd_valid@1-&gt;|cpu$rd@1</title>
<g id="a_id333"><a xlink:title="|cpu$rd_valid">
<path fill="none" stroke="#e04010" stroke-width="1.5" stroke-dasharray="1,5" d="M811.08,-1384C826.59,-1384 843,-1384 843,-1384 843,-1384 843,-1587.5 843,-1587.5 843,-1587.5 843.38,-1587.5 843.38,-1587.5"></path>
<polygon fill="none" stroke="#e04010" stroke-width="1.5" points="836.8,-1591 846.8,-1587.5 836.8,-1584 836.8,-1591"></polygon>
</a>
</g>
</g>
<!-- |cpu$rd_valid@1&#45;&gt;|cpu$rd_valid@2 -->
<g id="id336" logical_entity="|cpu$rd_valid" class="edge">
<title>|cpu$rd_valid@1-&gt;|cpu$rd_valid@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M811.21,-1390C820.69,-1390 829,-1390 829,-1390 829,-1390 829,-2555 829,-2555 829,-2555 1126.83,-2555 1126.83,-2555"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.83,-2558.5 1136.83,-2555 1126.83,-2551.5 1126.83,-2558.5"></polygon>
</g>
<!-- |cpu$rd_valid@2&#45;&gt;|cpu$rd_valid@3 -->
<g id="id338" logical_entity="|cpu$rd_valid" class="edge">
<title>|cpu$rd_valid@2-&gt;|cpu$rd_valid@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.27,-2555C1152.82,-2555 1154,-2555 1154,-2555 1154,-2555 1154,-3627 1154,-3627 1154,-3627 1576.73,-3627 1576.73,-3627"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1576.73,-3630.5 1586.73,-3627 1576.73,-3623.5 1576.73,-3630.5"></polygon>
</g>
<!-- |cpu$rd_valid@3&#45;&gt;|cpu$rf_wr_en@3 -->
<g id="id454" logical_entity="|cpu$rd_valid" class="edge">
<title>|cpu$rd_valid@3-&gt;|cpu$rf_wr_en@3</title>
<g id="a_id454"><a xlink:title="|cpu$rd_valid">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1601.26,-3627.5C1602.29,-3627.5 1603,-3627.5 1603,-3627.5 1603,-3627.5 1603,-2972.5 1603,-2972.5 1603,-2972.5 1646.58,-2972.5 1646.58,-2972.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1646.58,-2976 1656.58,-2972.5 1646.58,-2969 1646.58,-2976"></polygon>
</a>
</g>
</g>
<!-- |cpu$reset@0&#45;&gt;|cpu$imem_rd_en@0 -->
<g id="id50" logical_entity="|cpu$reset" class="edge">
<title>|cpu$reset@0-&gt;|cpu$imem_rd_en@0</title>
<g id="a_id50"><a xlink:title="|cpu$reset">
<path fill="none" stroke="purple" stroke-width="1.5" d="M86,-1036.17C112.51,-1036.17 149,-1036.17 149,-1036.17 149,-1036.17 149,-1035.11 149,-1035.11"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="152.5,-1035.64 149,-1025.64 145.5,-1035.64 152.5,-1035.64"></polygon>
</a>
</g>
</g>
<!-- |cpu$reset@0&#45;&gt;|cpu$reset@1 -->
<g id="id345" logical_entity="|cpu$reset" class="edge">
<title>|cpu$reset@0-&gt;|cpu$reset@1</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M86.1,-1039.83C136.59,-1039.83 240,-1039.83 240,-1039.83 240,-1039.83 240,-1123.67 240,-1123.67 240,-1123.67 313.86,-1123.67 313.86,-1123.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="313.86,-1127.17 323.86,-1123.67 313.86,-1120.17 313.86,-1127.17"></polygon>
</g>
<!-- |cpu$reset@1&#45;&gt;|cpu$pc@0 -->
<g id="id315" logical_entity="|cpu$reset" class="edge">
<title>|cpu$reset@1-&gt;|cpu$pc@0</title>
<g id="a_id315"><a xlink:title="|cpu$reset>>1">
<path fill="none" stroke="purple" stroke-width="1.5" d="M323.94,-1128.33C282.92,-1128.33 77,-1128.33 77,-1128.33 77,-1128.33 77,-1090.69 77,-1090.69"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="80.5,-1090.69 77,-1080.69 73.5,-1090.69 80.5,-1090.69"></polygon>
</a>
</g>
</g>
<!-- |cpu$reset@1&#45;&gt;|cpu$reset@2 -->
<g id="id347" logical_entity="|cpu$reset" class="edge">
<title>|cpu$reset@1-&gt;|cpu$reset@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M338.21,-1125.5C391.88,-1125.5 727,-1125.5 727,-1125.5 727,-1125.5 727,-2747 727,-2747 727,-2747 1126.76,-2747 1126.76,-2747"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.76,-2750.5 1136.76,-2747 1126.76,-2743.5 1126.76,-2750.5"></polygon>
</g>
<!-- |cpu$reset@2&#45;&gt;|cpu$reset@3 -->
<g id="id349" logical_entity="|cpu$reset" class="edge">
<title>|cpu$reset@2-&gt;|cpu$reset@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.07,-2749.33C1158.15,-2749.33 1168,-2749.33 1168,-2749.33 1168,-2749.33 1168,-2955 1168,-2955 1168,-2955 1486.98,-2955 1486.98,-2955"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1486.98,-2958.5 1496.98,-2955 1486.98,-2951.5 1486.98,-2958.5"></polygon>
</g>
<!-- |cpu$reset@3&#45;&gt;|cpu$reset@4 -->
<g id="id351" logical_entity="|cpu$reset" class="edge">
<title>|cpu$reset@3-&gt;|cpu$reset@4</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.26,-2958.5C1511.72,-2958.5 1512,-2958.5 1512,-2958.5 1512,-2958.5 1512,-4273 1512,-4273 1512,-4273 1756.99,-4273 1756.99,-4273"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1756.99,-4276.5 1766.99,-4273 1756.99,-4269.5 1756.99,-4276.5"></polygon>
</g>
<!-- |cpu$reset@3&#45;&gt;|cpu/xreg$value@3 -->
<g id="id591" logical_entity="|cpu$reset" class="edge">
<title>|cpu$reset@3-&gt;|cpu/xreg$value@3</title>
<g id="a_id591"><a xlink:title="|cpu$reset">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.09,-2955C1519.09,-2955 1531,-2955 1531,-2955 1531,-2955 1531,-2809.67 1531,-2809.67 1531,-2809.67 1851,-2809.67 1851,-2809.67 1851,-2809.67 1851,-2808.88 1851,-2808.88"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1854.5,-2811.83 1851,-2801.83 1847.5,-2811.83 1854.5,-2811.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$reset@4&#45;&gt;|cpu/dmem$value@4 -->
<g id="id570" logical_entity="|cpu$reset" class="edge">
<title>|cpu$reset@4-&gt;|cpu/dmem$value@4</title>
<g id="a_id570"><a xlink:title="|cpu$reset">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1781.1,-4270.25C1826.37,-4270.25 2073,-4270.25 2073,-4270.25 2073,-4270.25 2073,-3969.55 2073,-3969.55"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="2076.5,-3969.55 2073,-3959.55 2069.5,-3969.55 2076.5,-3969.55"></polygon>
</a>
</g>
</g>
<!-- |cpu$result@3&#45;&gt;|cpu$result@4 -->
<g id="id354" logical_entity="|cpu$result" class="edge">
<title>|cpu$result@3-&gt;|cpu$result@4</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1711,-3690.5C1737.51,-3690.5 1774,-3690.5 1774,-3690.5 1774,-3690.5 1774,-4063.89 1774,-4063.89"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1770.5,-4063.89 1774,-4073.89 1777.5,-4063.89 1770.5,-4063.89"></polygon>
</g>
<!-- |cpu$result@3&#45;&gt;|cpu$rf_wr_data@3 -->
<g id="id449" logical_entity="|cpu$result" class="edge">
<title>|cpu$result@3-&gt;|cpu$rf_wr_data@3</title>
<g id="a_id449"><a xlink:title="|cpu$result">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1705,-3683.38C1705,-3677.33 1705,-3669.89 1705,-3669.89 1705,-3669.89 1750,-3669.89 1750,-3669.89 1750,-3669.89 1750,-3018.54 1750,-3018.54"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1753.5,-3018.54 1750,-3008.54 1746.5,-3018.54 1753.5,-3018.54"></polygon>
</a>
</g>
</g>
<!-- |cpu$result@3&#45;&gt;|cpu$src1_value@2 -->
<g id="id495" logical_entity="|cpu$result" class="edge">
<title>|cpu$result@3-&gt;|cpu$src1_value@2</title>
<g id="a_id495"><a xlink:title="|cpu$result>>1">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1663,-3683.38C1663,-3682.3 1663,-3681.56 1663,-3681.56 1663,-3681.56 1487,-3681.56 1487,-3681.56 1487,-3681.56 1487,-2304.41 1487,-2304.41"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1490.5,-2304.41 1487,-2294.41 1483.5,-2304.41 1490.5,-2304.41"></polygon>
</a>
</g>
</g>
<!-- |cpu$result@3&#45;&gt;|cpu$src2_value@2 -->
<g id="id505" logical_entity="|cpu$result" class="edge">
<title>|cpu$result@3-&gt;|cpu$src2_value@2</title>
<g id="a_id505"><a xlink:title="|cpu$result>>1">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1702,-3698.74C1702,-3702.93 1702,-3707.25 1702,-3707.25 1702,-3707.25 1543,-3707.25 1543,-3707.25 1543,-3707.25 1543,-2243.5 1543,-2243.5 1543,-2243.5 1541.09,-2243.5 1541.09,-2243.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1541.09,-2240 1531.09,-2243.5 1541.09,-2247 1541.09,-2240"></polygon>
</a>
</g>
</g>
<!-- |cpu$result@4&#45;&gt;|cpu$dmem_addr@4 -->
<g id="id12" logical_entity="|cpu$result" class="edge">
<title>|cpu$result@4-&gt;|cpu$dmem_addr@4</title>
<g id="a_id12"><a xlink:title="|cpu$result">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1781.06,-4081C1781.06,-4081 1826.71,-4081 1826.71,-4081"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1826.71,-4084.5 1836.71,-4081 1826.71,-4077.5 1826.71,-4084.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$rf_rd_data1@2&#45;&gt;|cpu$src1_value@2 -->
<g id="id496" logical_entity="|cpu$rf_rd_data1" class="edge">
<title>|cpu$rf_rd_data1@2-&gt;|cpu$src1_value@2</title>
<g id="a_id496"><a xlink:title="|cpu$rf_rd_data1">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1441,-2285.33C1441,-2285.33 1466.71,-2285.33 1466.71,-2285.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1466.71,-2288.83 1476.71,-2285.33 1466.7,-2281.83 1466.71,-2288.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$rf_rd_data2@2&#45;&gt;|cpu$src2_value@2 -->
<g id="id506" logical_entity="|cpu$rf_rd_data2" class="edge">
<title>|cpu$rf_rd_data2@2-&gt;|cpu$src2_value@2</title>
<g id="a_id506"><a xlink:title="|cpu$rf_rd_data2">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1405,-1753.63C1405,-1845.01 1405,-2241.5 1405,-2241.5 1405,-2241.5 1466.95,-2241.5 1466.95,-2241.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1466.95,-2245 1476.95,-2241.5 1466.95,-2238 1466.95,-2245"></polygon>
</a>
</g>
</g>
<!-- |cpu$rf_rd_en1@2&#45;&gt;|cpu$rf_rd_data1@2 -->
<g id="id432" logical_entity="|cpu$rf_rd_en1" class="edge">
<title>|cpu$rf_rd_en1@2-&gt;|cpu$rf_rd_data1@2</title>
<g id="a_id432"><a xlink:title="|cpu$rf_rd_en1">
<path fill="none" stroke="#e04010" stroke-width="1.5" stroke-dasharray="1,5" d="M1261.34,-2281C1261.34,-2281 1376.99,-2281 1376.99,-2281"></path>
<polygon fill="none" stroke="#e04010" stroke-width="1.5" points="1376.99,-2284.5 1386.99,-2281 1376.99,-2277.5 1376.99,-2284.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$rf_rd_en1@2&#45;&gt;|cpu$rf_rd_index1@2 -->
<g id="id443" logical_entity="|cpu$rf_rd_en1" class="edge">
<title>|cpu$rf_rd_en1@2-&gt;|cpu$rf_rd_index1@2</title>
<g id="a_id443"><a xlink:title="|cpu$rf_rd_en1">
<path fill="none" stroke="#e04010" stroke-width="1.5" stroke-dasharray="1,5" d="M1255,-2262.17C1255,-2256.14 1255,-2251 1255,-2251 1255,-2251 1286.73,-2251 1286.73,-2251"></path>
<polygon fill="none" stroke="#e04010" stroke-width="1.5" points="1286.73,-2254.5 1296.73,-2251 1286.73,-2247.5 1286.73,-2254.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$rf_rd_en2@2&#45;&gt;|cpu$rf_rd_data2@2 -->
<g id="id436" logical_entity="|cpu$rf_rd_en2" class="edge">
<title>|cpu$rf_rd_en2@2-&gt;|cpu$rf_rd_data2@2</title>
<g id="a_id436"><a xlink:title="|cpu$rf_rd_en2">
<path fill="none" stroke="#e04010" stroke-width="1.5" stroke-dasharray="1,5" d="M1248,-1721.6C1248,-1724.52 1248,-1726.6 1248,-1726.6 1248,-1726.6 1376.96,-1726.6 1376.96,-1726.6"></path>
<polygon fill="none" stroke="#e04010" stroke-width="1.5" points="1376.96,-1730.1 1386.96,-1726.6 1376.96,-1723.1 1376.96,-1730.1"></polygon>
</a>
</g>
</g>
<!-- |cpu$rf_rd_en2@2&#45;&gt;|cpu$rf_rd_index2@2 -->
<g id="id446" logical_entity="|cpu$rf_rd_en2" class="edge">
<title>|cpu$rf_rd_en2@2-&gt;|cpu$rf_rd_index2@2</title>
<g id="a_id446"><a xlink:title="|cpu$rf_rd_en2">
<path fill="none" stroke="#e04010" stroke-width="1.5" stroke-dasharray="1,5" d="M1261,-1700C1261,-1700 1286.71,-1700 1286.71,-1700"></path>
<polygon fill="none" stroke="#e04010" stroke-width="1.5" points="1286.71,-1703.5 1296.71,-1700 1286.7,-1696.5 1286.71,-1703.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$rf_rd_index1@2&#45;&gt;|cpu$rf_rd_data1@2 -->
<g id="id430" logical_entity="|cpu$rf_rd_index1" class="edge">
<title>|cpu$rf_rd_index1@2-&gt;|cpu$rf_rd_data1@2</title>
<g id="a_id430"><a xlink:title="|cpu$rf_rd_index1">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1351.05,-2255.75C1380.36,-2255.75 1423,-2255.75 1423,-2255.75 1423,-2255.75 1423,-2256.41 1423,-2256.41"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1419.5,-2252.38 1423,-2262.38 1426.5,-2252.38 1419.5,-2252.38"></polygon>
</a>
</g>
</g>
<!-- |cpu$rf_rd_index2@2&#45;&gt;|cpu$rf_rd_data2@2 -->
<g id="id434" logical_entity="|cpu$rf_rd_index2" class="edge">
<title>|cpu$rf_rd_index2@2-&gt;|cpu$rf_rd_data2@2</title>
<g id="a_id434"><a xlink:title="|cpu$rf_rd_index2">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1324,-1715.76C1324,-1720.81 1324,-1724.9 1324,-1724.9 1324,-1724.9 1377,-1724.9 1377,-1724.9"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1377,-1728.4 1387,-1724.9 1377,-1721.4 1377,-1728.4"></polygon>
</a>
</g>
</g>
<!-- |cpu$rf_wr_data@3&#45;&gt;|cpu/xreg$value@3 -->
<g id="id593" logical_entity="|cpu$rf_wr_data" class="edge">
<title>|cpu$rf_wr_data@3-&gt;|cpu/xreg$value@3</title>
<g id="a_id593"><a xlink:title="|cpu$rf_wr_data">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1801,-2990C1827.51,-2990 1864,-2990 1864,-2990 1864,-2990 1864,-2811.93 1864,-2811.93"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1867.5,-2811.93 1864,-2801.93 1860.5,-2811.93 1867.5,-2811.93"></polygon>
</a>
</g>
</g>
<!-- |cpu$rf_wr_en@3&#45;&gt;|cpu$rf_wr_data@3 -->
<g id="id451" logical_entity="|cpu$rf_wr_en" class="edge">
<title>|cpu$rf_wr_en@3-&gt;|cpu$rf_wr_data@3</title>
<g id="a_id451"><a xlink:title="|cpu$rf_wr_en">
<path fill="none" stroke="#e04010" stroke-width="1.5" stroke-dasharray="1,5" d="M1711,-2974.17C1711,-2974.17 1736.71,-2974.17 1736.71,-2974.17"></path>
<polygon fill="none" stroke="#e04010" stroke-width="1.5" points="1736.71,-2977.67 1746.71,-2974.17 1736.7,-2970.67 1736.71,-2977.67"></polygon>
</a>
</g>
</g>
<!-- |cpu$rf_wr_en@3&#45;&gt;|cpu$rf_wr_index@3 -->
<g id="id459" logical_entity="|cpu$rf_wr_en" class="edge">
<title>|cpu$rf_wr_en@3-&gt;|cpu$rf_wr_index@3</title>
<g id="a_id459"><a xlink:title="|cpu$rf_wr_en">
<path fill="none" stroke="#e04010" stroke-width="1.5" stroke-dasharray="1,5" d="M1711,-2948C1711,-2948 1736.71,-2948 1736.71,-2948"></path>
<polygon fill="none" stroke="#e04010" stroke-width="1.5" points="1736.71,-2951.5 1746.71,-2948 1736.7,-2944.5 1736.71,-2951.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$rf_wr_en@3&#45;&gt;|cpu$src1_value@2 -->
<g id="id492" logical_entity="|cpu$rf_wr_en" class="edge">
<title>|cpu$rf_wr_en@3-&gt;|cpu$src1_value@2</title>
<g id="a_id492"><a xlink:title="|cpu$rf_wr_en>>1">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1656.69,-2965.5C1610.75,-2965.5 1523,-2965.5 1523,-2965.5 1523,-2965.5 1523,-2304.06 1523,-2304.06"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1526.5,-2304.06 1523,-2294.06 1519.5,-2304.06 1526.5,-2304.06"></polygon>
</a>
</g>
</g>
<!-- |cpu$rf_wr_en@3&#45;&gt;|cpu$src2_value@2 -->
<g id="id502" logical_entity="|cpu$rf_wr_en" class="edge">
<title>|cpu$rf_wr_en@3-&gt;|cpu$src2_value@2</title>
<g id="a_id502"><a xlink:title="|cpu$rf_wr_en>>1">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1684,-2942.21C1684,-2827.87 1684,-2230.5 1684,-2230.5 1684,-2230.5 1541.34,-2230.5 1541.34,-2230.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1541.34,-2227 1531.34,-2230.5 1541.34,-2234 1541.34,-2227"></polygon>
</a>
</g>
</g>
<!-- |cpu$rf_wr_en@3&#45;&gt;|cpu/xreg$wr@3 -->
<g id="id596" logical_entity="|cpu$rf_wr_en" class="edge">
<title>|cpu$rf_wr_en@3-&gt;|cpu/xreg$wr@3</title>
<g id="a_id596"><a xlink:title="|cpu$rf_wr_en">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1698,-2942.3C1698,-2899.49 1698,-2798 1698,-2798 1698,-2798 1736.99,-2798 1736.99,-2798"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1736.99,-2801.5 1746.99,-2798 1736.99,-2794.5 1736.99,-2801.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$rf_wr_index@3&#45;&gt;|cpu/xreg$wr@3 -->
<g id="id598" logical_entity="|cpu$rf_wr_index" class="edge">
<title>|cpu$rf_wr_index@3-&gt;|cpu/xreg$wr@3</title>
<g id="a_id598"><a xlink:title="|cpu$rf_wr_index">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1774,-2916.28C1774,-2916.28 1774,-2811.68 1774,-2811.68"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1777.5,-2811.68 1774,-2801.68 1770.5,-2811.68 1777.5,-2811.68"></polygon>
</a>
</g>
</g>
<!-- |cpu$rs1@1&#45;&gt;|cpu$rs1@2 -->
<g id="id462" logical_entity="|cpu$rs1" class="edge">
<title>|cpu$rs1@1-&gt;|cpu$rs1@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M846.96,-172C805.76,-172 732,-172 732,-172 732,-172 732,-1744 732,-1744 732,-1744 1216.9,-1744 1216.9,-1744"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1216.9,-1747.5 1226.9,-1744 1216.9,-1740.5 1216.9,-1747.5"></polygon>
</g>
<!-- |cpu$rs1@2&#45;&gt;|cpu$rf_rd_index1@2 -->
<g id="id442" logical_entity="|cpu$rs1" class="edge">
<title>|cpu$rs1@2-&gt;|cpu$rf_rd_index1@2</title>
<g id="a_id442"><a xlink:title="|cpu$rs1">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1237,-1754.31C1237,-1815.31 1237,-2237.33 1237,-2237.33 1237,-2237.33 1286.95,-2237.33 1286.95,-2237.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1286.95,-2240.83 1296.95,-2237.33 1286.95,-2233.83 1286.95,-2240.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$rs1@2&#45;&gt;|cpu$src1_value@2 -->
<g id="id494" logical_entity="|cpu$rs1" class="edge">
<title>|cpu$rs1@2-&gt;|cpu$src1_value@2</title>
<g id="a_id494"><a xlink:title="|cpu$rs1">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1232,-1754.03C1232,-1756.8 1232,-1759.33 1232,-1759.33 1232,-1759.33 1465,-1759.33 1465,-1759.33 1465,-1759.33 1465,-2276.67 1465,-2276.67 1465,-2276.67 1466.91,-2276.67 1466.91,-2276.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1466.91,-2280.17 1476.91,-2276.67 1466.91,-2273.17 1466.91,-2280.17"></polygon>
</a>
</g>
</g>
<!-- |cpu$rs1_valid@1&#45;&gt;|cpu$rs1@1 -->
<g id="id464" logical_entity="|cpu$rs1_valid" class="edge">
<title>|cpu$rs1_valid@1-&gt;|cpu$rs1@1</title>
<g id="a_id464"><a xlink:title="|cpu$rs1_valid">
<path fill="none" stroke="#e04010" stroke-width="1.5" stroke-dasharray="1,5" d="M811.28,-1472C814.12,-1472 816,-1472 816,-1472 816,-1472 816,-175.75 816,-175.75 816,-175.75 836.7,-175.75 836.7,-175.75"></path>
<polygon fill="none" stroke="#e04010" stroke-width="1.5" points="836.7,-179.25 846.7,-175.75 836.7,-172.25 836.7,-179.25"></polygon>
</a>
</g>
</g>
<!-- |cpu$rs1_valid@1&#45;&gt;|cpu$rs1_valid@2 -->
<g id="id467" logical_entity="|cpu$rs1_valid" class="edge">
<title>|cpu$rs1_valid@1-&gt;|cpu$rs1_valid@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M811.12,-1478C818.74,-1478 825,-1478 825,-1478 825,-1478 825,-2587 825,-2587 825,-2587 1126.74,-2587 1126.74,-2587"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.74,-2590.5 1136.74,-2587 1126.74,-2583.5 1126.74,-2590.5"></polygon>
</g>
<!-- |cpu$rs1_valid@2&#45;&gt;|cpu$rf_rd_en1@2 -->
<g id="id438" logical_entity="|cpu$rs1_valid" class="edge">
<title>|cpu$rs1_valid@2-&gt;|cpu$rf_rd_en1@2</title>
<g id="a_id438"><a xlink:title="|cpu$rs1_valid">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.15,-2587C1174.64,-2587 1248,-2587 1248,-2587 1248,-2587 1248,-2309.68 1248,-2309.68"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1251.5,-2309.68 1248,-2299.68 1244.5,-2309.68 1251.5,-2309.68"></polygon>
</a>
</g>
</g>
<!-- |cpu$rs2@1&#45;&gt;|cpu$rs2@2 -->
<g id="id474" logical_entity="|cpu$rs2" class="edge">
<title>|cpu$rs2@1-&gt;|cpu$rs2@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M901.06,-202.75C984.78,-202.75 1234,-202.75 1234,-202.75 1234,-202.75 1234,-1641.85 1234,-1641.85"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1230.5,-1641.85 1234,-1651.85 1237.5,-1641.85 1230.5,-1641.85"></polygon>
</g>
<!-- |cpu$rs2@2&#45;&gt;|cpu$rf_rd_index2@2 -->
<g id="id445" logical_entity="|cpu$rs2" class="edge">
<title>|cpu$rs2@2-&gt;|cpu$rf_rd_index2@2</title>
<g id="a_id445"><a xlink:title="|cpu$rs2">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1241.06,-1661.33C1262.28,-1661.33 1324,-1661.33 1324,-1661.33 1324,-1661.33 1324,-1668.33 1324,-1668.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1320.5,-1668.33 1324,-1678.33 1327.5,-1668.33 1320.5,-1668.33"></polygon>
</a>
</g>
</g>
<!-- |cpu$rs2@2&#45;&gt;|cpu$src2_value@2 -->
<g id="id504" logical_entity="|cpu$rs2" class="edge">
<title>|cpu$rs2@2-&gt;|cpu$src2_value@2</title>
<g id="a_id504"><a xlink:title="|cpu$rs2">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1241.22,-1656.67C1284.16,-1656.67 1504,-1656.67 1504,-1656.67 1504,-1656.67 1504,-2213.79 1504,-2213.79"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1500.5,-2213.79 1504,-2223.79 1507.5,-2213.79 1500.5,-2213.79"></polygon>
</a>
</g>
</g>
<!-- |cpu$rs2_valid@1&#45;&gt;|cpu$rs2@1 -->
<g id="id476" logical_entity="|cpu$rs2_valid" class="edge">
<title>|cpu$rs2_valid@1-&gt;|cpu$rs2@1</title>
<g id="a_id476"><a xlink:title="|cpu$rs2_valid">
<path fill="none" stroke="#e04010" stroke-width="1.5" stroke-dasharray="1,5" d="M811.29,-1516C816.31,-1516 820,-1516 820,-1516 820,-1516 820,-207.5 820,-207.5 820,-207.5 836.68,-207.5 836.68,-207.5"></path>
<polygon fill="none" stroke="#e04010" stroke-width="1.5" points="836.68,-211 846.68,-207.5 836.68,-204 836.68,-211"></polygon>
</a>
</g>
</g>
<!-- |cpu$rs2_valid@1&#45;&gt;|cpu$rs2_valid@2 -->
<g id="id479" logical_entity="|cpu$rs2_valid" class="edge">
<title>|cpu$rs2_valid@1-&gt;|cpu$rs2_valid@2</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M811.05,-1522C822.83,-1522 834,-1522 834,-1522 834,-1522 834,-2523 834,-2523 834,-2523 1126.94,-2523 1126.94,-2523"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1126.94,-2526.5 1136.94,-2523 1126.94,-2519.5 1126.94,-2526.5"></polygon>
</g>
<!-- |cpu$rs2_valid@2&#45;&gt;|cpu$rf_rd_en2@2 -->
<g id="id440" logical_entity="|cpu$rs2_valid" class="edge">
<title>|cpu$rs2_valid@2-&gt;|cpu$rf_rd_en2@2</title>
<g id="a_id440"><a xlink:title="|cpu$rs2_valid">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1151.1,-2523C1158.8,-2523 1170,-2523 1170,-2523 1170,-2523 1170,-1707 1170,-1707 1170,-1707 1196.86,-1707 1196.86,-1707"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1196.86,-1710.5 1206.86,-1707 1196.86,-1703.5 1196.86,-1710.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$sltiu_result@3&#45;&gt;|cpu$result@3 -->
<g id="id424" logical_entity="|cpu$sltiu_result" class="edge">
<title>|cpu$sltiu_result@3-&gt;|cpu$result@3</title>
<g id="a_id424"><a xlink:title="|cpu$sltiu_result">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1605,-3831.78C1605,-3795.31 1605,-3696 1605,-3696 1605,-3696 1646.81,-3696 1646.81,-3696"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1646.81,-3699.5 1656.81,-3696 1646.81,-3692.5 1646.81,-3699.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$sltu_result@3&#45;&gt;|cpu$result@3 -->
<g id="id419" logical_entity="|cpu$sltu_result" class="edge">
<title>|cpu$sltu_result@3-&gt;|cpu$result@3</title>
<g id="a_id419"><a xlink:title="|cpu$sltu_result">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1621.05,-3889C1650.36,-3889 1693,-3889 1693,-3889 1693,-3889 1693,-3708.52 1693,-3708.52"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1696.5,-3708.52 1693,-3698.52 1689.5,-3708.52 1696.5,-3708.52"></polygon>
</a>
</g>
</g>
<!-- |cpu$src1_value@2&#45;&gt;|cpu$jalr_tgt_pc@2 -->
<g id="id303" logical_entity="|cpu$src1_value" class="edge">
<title>|cpu$src1_value@2-&gt;|cpu$jalr_tgt_pc@2</title>
<g id="a_id303"><a xlink:title="|cpu$src1_value">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1530,-2294.19C1530,-2371.72 1530,-2764.75 1530,-2764.75 1530,-2764.75 1556.86,-2764.75 1556.86,-2764.75"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1556.86,-2768.25 1566.86,-2764.75 1556.86,-2761.25 1556.86,-2768.25"></polygon>
</a>
</g>
</g>
<!-- |cpu$src1_value@2&#45;&gt;|cpu$src1_value@3 -->
<g id="id491" logical_entity="|cpu$src1_value" class="edge">
<title>|cpu$src1_value@2-&gt;|cpu$src1_value@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1513,-2294.08C1513,-2390.09 1513,-2982.33 1513,-2982.33 1513,-2982.33 1512.83,-2982.33 1512.83,-2982.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1521.26,-2978.83 1511.26,-2982.33 1521.26,-2985.83 1521.26,-2978.83"></polygon>
</g>
<!-- |cpu$src1_value@3&#45;&gt;|cpu$result@3 -->
<g id="id427" logical_entity="|cpu$src1_value" class="edge">
<title>|cpu$src1_value@3-&gt;|cpu$result@3</title>
<g id="a_id427"><a xlink:title="|cpu$src1_value">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.11,-2984.67C1517.2,-2984.67 1525,-2984.67 1525,-2984.67 1525,-2984.67 1525,-3679.61 1525,-3679.61 1525,-3679.61 1681,-3679.61 1681,-3679.61 1681,-3679.61 1681,-3680 1681,-3680"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1677.5,-3673.47 1681,-3683.47 1684.5,-3673.47 1677.5,-3673.47"></polygon>
</a>
</g>
</g>
<!-- |cpu$src1_value@3&#45;&gt;|cpu$sltiu_result@3 -->
<g id="id484" logical_entity="|cpu$src1_value" class="edge">
<title>|cpu$src1_value@3-&gt;|cpu$sltiu_result@3</title>
<g id="a_id484"><a xlink:title="|cpu$src1_value">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.27,-2991.67C1529.73,-2991.67 1577,-2991.67 1577,-2991.67 1577,-2991.67 1577,-3821.94 1577,-3821.94"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1573.5,-3821.94 1577,-3831.94 1580.5,-3821.94 1573.5,-3821.94"></polygon>
</a>
</g>
</g>
<!-- |cpu$src1_value@3&#45;&gt;|cpu$sltu_result@3 -->
<g id="id487" logical_entity="|cpu$src1_value" class="edge">
<title>|cpu$src1_value@3-&gt;|cpu$sltu_result@3</title>
<g id="a_id487"><a xlink:title="|cpu$src1_value">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.31,-2987C1515.92,-2987 1521,-2987 1521,-2987 1521,-2987 1521,-3884.67 1521,-3884.67 1521,-3884.67 1556.82,-3884.67 1556.82,-3884.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1556.82,-3888.17 1566.82,-3884.67 1556.82,-3881.17 1556.82,-3888.17"></polygon>
</a>
</g>
</g>
<!-- |cpu$src1_value@3&#45;&gt;|cpu$taken_br@3 -->
<g id="id528" logical_entity="|cpu$src1_value" class="edge">
<title>|cpu$src1_value@3-&gt;|cpu$taken_br@3</title>
<g id="a_id528"><a xlink:title="|cpu$src1_value">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.15,-2989.33C1515.01,-2989.33 1519,-2989.33 1519,-2989.33 1519,-2989.33 1519,-3965.78 1519,-3965.78 1519,-3965.78 1556.92,-3965.78 1556.92,-3965.78"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1556.92,-3969.28 1566.92,-3965.78 1556.92,-3962.28 1556.92,-3969.28"></polygon>
</a>
</g>
</g>
<!-- |cpu$src2_value@2&#45;&gt;|cpu$src2_value@3 -->
<g id="id499" logical_entity="|cpu$src2_value" class="edge">
<title>|cpu$src2_value@2-&gt;|cpu$src2_value@3</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1476.71,-2233C1464.58,-2233 1453,-2233 1453,-2233 1453,-2233 1453,-3051 1453,-3051 1453,-3051 1486.91,-3051 1486.91,-3051"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1486.91,-3054.5 1496.91,-3051 1486.91,-3047.5 1486.91,-3054.5"></polygon>
</g>
<!-- |cpu$src2_value@3&#45;&gt;|cpu$result@3 -->
<g id="id418" logical_entity="|cpu$src2_value" class="edge">
<title>|cpu$src2_value@3-&gt;|cpu$result@3</title>
<g id="a_id418"><a xlink:title="|cpu$src2_value">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.22,-3051C1516.95,-3051 1524,-3051 1524,-3051 1524,-3051 1524,-3675.72 1524,-3675.72 1524,-3675.72 1669,-3675.72 1669,-3675.72 1669,-3675.72 1669,-3676.49 1669,-3676.49"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1665.5,-3673.36 1669,-3683.36 1672.5,-3673.36 1665.5,-3673.36"></polygon>
</a>
</g>
</g>
<!-- |cpu$src2_value@3&#45;&gt;|cpu$sltu_result@3 -->
<g id="id488" logical_entity="|cpu$src2_value" class="edge">
<title>|cpu$src2_value@3-&gt;|cpu$sltu_result@3</title>
<g id="a_id488"><a xlink:title="|cpu$src2_value">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.25,-3053.33C1515.48,-3053.33 1520,-3053.33 1520,-3053.33 1520,-3053.33 1520,-3893.33 1520,-3893.33 1520,-3893.33 1556.87,-3893.33 1556.87,-3893.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1556.87,-3896.83 1566.87,-3893.33 1556.87,-3889.83 1556.87,-3896.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$src2_value@3&#45;&gt;|cpu$src2_value@4 -->
<g id="id501" logical_entity="|cpu$src2_value" class="edge">
<title>|cpu$src2_value@3-&gt;|cpu$src2_value@4</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511.32,-3048.67C1521.05,-3048.67 1537,-3048.67 1537,-3048.67 1537,-3048.67 1537,-4241 1537,-4241 1537,-4241 1756.91,-4241 1756.91,-4241"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1756.91,-4244.5 1766.91,-4241 1756.91,-4237.5 1756.91,-4244.5"></polygon>
</g>
<!-- |cpu$src2_value@3&#45;&gt;|cpu$taken_br@3 -->
<g id="id529" logical_entity="|cpu$src2_value" class="edge">
<title>|cpu$src2_value@3-&gt;|cpu$taken_br@3</title>
<g id="a_id529"><a xlink:title="|cpu$src2_value">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1511,-3055.67C1514.5,-3055.67 1518,-3055.67 1518,-3055.67 1518,-3055.67 1518,-3968.67 1518,-3968.67 1518,-3968.67 1556.99,-3968.67 1556.99,-3968.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1556.99,-3972.17 1566.99,-3968.67 1556.99,-3965.17 1556.99,-3972.17"></polygon>
</a>
</g>
</g>
<!-- |cpu$src2_value@4&#45;&gt;|cpu$dmem_wr_data@4 -->
<g id="id22" logical_entity="|cpu$src2_value" class="edge">
<title>|cpu$src2_value@4-&gt;|cpu$dmem_wr_data@4</title>
<g id="a_id22"><a xlink:title="|cpu$src2_value">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1781.06,-4241C1781.06,-4241 1826.71,-4241 1826.71,-4241"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1826.71,-4244.5 1836.71,-4241 1826.71,-4237.5 1826.71,-4244.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$taken_br@3&#45;&gt;|cpu$valid_taken_br@3 -->
<g id="id559" logical_entity="|cpu$taken_br" class="edge">
<title>|cpu$taken_br@3-&gt;|cpu$valid_taken_br@3</title>
<g id="a_id559"><a xlink:title="|cpu$taken_br">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1621,-3974.25C1621,-3974.25 1646.71,-3974.25 1646.71,-3974.25"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1646.71,-3977.75 1656.71,-3974.25 1646.7,-3970.75 1646.71,-3977.75"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid@3&#45;&gt;|cpu$rf_wr_data@3 -->
<g id="id448" logical_entity="|cpu$valid" class="edge">
<title>|cpu$valid@3-&gt;|cpu$rf_wr_data@3</title>
<g id="a_id448"><a xlink:title="|cpu$valid">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1621.1,-4016.5C1669.31,-4016.5 1765,-4016.5 1765,-4016.5 1765,-4016.5 1765,-3018.69 1765,-3018.69"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1768.5,-3018.69 1765,-3008.69 1761.5,-3018.69 1768.5,-3018.69"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid@3&#45;&gt;|cpu$rf_wr_en@3 -->
<g id="id455" logical_entity="|cpu$valid" class="edge">
<title>|cpu$valid@3-&gt;|cpu$rf_wr_en@3</title>
<g id="a_id455"><a xlink:title="|cpu$valid">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1621.07,-4007.5C1631.52,-4007.5 1641,-4007.5 1641,-4007.5 1641,-4007.5 1641,-2976 1641,-2976 1641,-2976 1646.52,-2976 1646.52,-2976"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1646.52,-2979.5 1656.52,-2976 1646.52,-2972.5 1646.52,-2979.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid@3&#45;&gt;|cpu$valid@4 -->
<g id="id532" logical_entity="|cpu$valid" class="edge">
<title>|cpu$valid@3-&gt;|cpu$valid@4</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1615,-4019.59C1615,-4043.08 1615,-4113 1615,-4113 1615,-4113 1756.75,-4113 1756.75,-4113"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1756.75,-4116.5 1766.75,-4113 1756.75,-4109.5 1756.75,-4116.5"></polygon>
</g>
<!-- |cpu$valid@3&#45;&gt;|cpu$valid_jump@3 -->
<g id="id544" logical_entity="|cpu$valid" class="edge">
<title>|cpu$valid@3-&gt;|cpu$valid_jump@3</title>
<g id="a_id544"><a xlink:title="|cpu$valid">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1621.18,-4010.5C1635.03,-4010.5 1649,-4010.5 1649,-4010.5 1649,-4010.5 1649,-3614 1649,-3614 1649,-3614 1649.78,-3614 1649.78,-3614"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1646.77,-3617.5 1656.77,-3614 1646.77,-3610.5 1646.77,-3617.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid@3&#45;&gt;|cpu$valid_load@3 -->
<g id="id551" logical_entity="|cpu$valid" class="edge">
<title>|cpu$valid@3-&gt;|cpu$valid_load@3</title>
<g id="a_id551"><a xlink:title="|cpu$valid">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1621.08,-4013.5C1636.59,-4013.5 1653,-4013.5 1653,-4013.5 1653,-4013.5 1653,-3656.33 1653,-3656.33 1653,-3656.33 1653.38,-3656.33 1653.38,-3656.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1646.8,-3659.83 1656.8,-3656.33 1646.8,-3652.83 1646.8,-3659.83"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid@3&#45;&gt;|cpu$valid_taken_br@3 -->
<g id="id558" logical_entity="|cpu$valid" class="edge">
<title>|cpu$valid@3-&gt;|cpu$valid_taken_br@3</title>
<g id="a_id558"><a xlink:title="|cpu$valid">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1594,-4004.3C1594,-3999.8 1594,-3995 1594,-3995 1594,-3995 1647,-3995 1647,-3995"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1647,-3998.5 1657,-3995 1647,-3991.5 1647,-3998.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid@4&#45;&gt;|cpu$dmem_wr_en@4 -->
<g id="id25" logical_entity="|cpu$valid" class="edge">
<title>|cpu$valid@4-&gt;|cpu$dmem_wr_en@4</title>
<g id="a_id25"><a xlink:title="|cpu$valid">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1774,-4120.25C1774,-4124.48 1774,-4129 1774,-4129 1774,-4129 1827,-4129 1827,-4129"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1827,-4132.5 1837,-4129 1827,-4125.5 1827,-4132.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid_jump@3&#45;&gt;|cpu$pc@0 -->
<g id="id323" logical_entity="|cpu$valid_jump" class="edge">
<title>|cpu$valid_jump@3-&gt;|cpu$pc@0</title>
<g id="a_id323"><a xlink:title="|cpu$valid_jump>>3">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1656.75,-3608C1443.81,-3608 55,-3608 55,-3608 55,-3608 55,-1090.73 55,-1090.73"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="58.5,-1090.73 55,-1080.73 51.5,-1090.73 58.5,-1090.73"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid_jump@3&#45;&gt;|cpu$valid_jump@4 -->
<g id="id541" logical_entity="|cpu$valid_jump" class="edge">
<title>|cpu$valid_jump@3-&gt;|cpu$valid_jump@4</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1711.12,-3608C1715.16,-3608 1718,-3608 1718,-3608 1718,-3608 1718,-4142.67 1718,-4142.67 1718,-4142.67 1756.68,-4142.67 1756.68,-4142.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1756.68,-4146.17 1766.68,-4142.67 1756.68,-4139.17 1756.68,-4146.17"></polygon>
</g>
<!-- |cpu$valid_jump@4&#45;&gt;|cpu$valid@3 -->
<g id="id537" logical_entity="|cpu$valid_jump" class="edge">
<title>|cpu$valid_jump@4-&gt;|cpu$valid@3</title>
<g id="a_id537"><a xlink:title="|cpu$valid_jump>>1">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1766.87,-4147.33C1735.09,-4147.33 1608,-4147.33 1608,-4147.33 1608,-4147.33 1608,-4029.66 1608,-4029.66"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1611.5,-4029.66 1608,-4019.66 1604.5,-4029.66 1611.5,-4029.66"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid_jump@4&#45;&gt;|cpu$valid_jump@5 -->
<g id="id543" logical_entity="|cpu$valid_jump" class="edge">
<title>|cpu$valid_jump@4-&gt;|cpu$valid_jump@5</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1781.11,-4142.67C1787.2,-4142.67 1795,-4142.67 1795,-4142.67 1795,-4142.67 1795,-4376.67 1795,-4376.67 1795,-4376.67 2068.81,-4376.67 2068.81,-4376.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="2068.81,-4380.17 2078.81,-4376.67 2068.81,-4373.17 2068.81,-4380.17"></polygon>
</g>
<!-- |cpu$valid_jump@5&#45;&gt;|cpu$valid@3 -->
<g id="id538" logical_entity="|cpu$valid_jump" class="edge">
<title>|cpu$valid_jump@5-&gt;|cpu$valid@3</title>
<g id="a_id538"><a xlink:title="|cpu$valid_jump>>2">
<path fill="none" stroke="purple" stroke-width="1.5" d="M2078.96,-4381.33C2018.43,-4381.33 1588,-4381.33 1588,-4381.33 1588,-4381.33 1588,-4029.71 1588,-4029.71"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1591.5,-4029.71 1588,-4019.71 1584.5,-4029.71 1591.5,-4029.71"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid_load@3&#45;&gt;|cpu$pc@0 -->
<g id="id318" logical_entity="|cpu$valid_load" class="edge">
<title>|cpu$valid_load@3-&gt;|cpu$pc@0</title>
<g id="a_id318"><a xlink:title="|cpu$valid_load>>3">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1656.66,-3647.67C1443.08,-3647.67 50,-3647.67 50,-3647.67 50,-3647.67 50,-1090.85 50,-1090.85"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="53.5,-1090.85 50,-1080.85 46.5,-1090.85 53.5,-1090.85"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid_load@3&#45;&gt;|cpu$valid_load@4 -->
<g id="id548" logical_entity="|cpu$valid_load" class="edge">
<title>|cpu$valid_load@3-&gt;|cpu$valid_load@4</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1711.2,-3652C1713.52,-3652 1715,-3652 1715,-3652 1715,-3652 1715,-4174.67 1715,-4174.67 1715,-4174.67 1756.77,-4174.67 1756.77,-4174.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1756.77,-4178.17 1766.77,-4174.67 1756.77,-4171.17 1756.77,-4178.17"></polygon>
</g>
<!-- |cpu$valid_load@4&#45;&gt;|cpu$dmem_rd_en@4 -->
<g id="id20" logical_entity="|cpu$valid_load" class="edge">
<title>|cpu$valid_load@4-&gt;|cpu$dmem_rd_en@4</title>
<g id="a_id20"><a xlink:title="|cpu$valid_load">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1781.06,-4180.5C1781.06,-4180.5 1826.71,-4180.5 1826.71,-4180.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1826.71,-4184 1836.71,-4180.5 1826.71,-4177 1826.71,-4184"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid_load@4&#45;&gt;|cpu$valid@3 -->
<g id="id535" logical_entity="|cpu$valid_load" class="edge">
<title>|cpu$valid_load@4-&gt;|cpu$valid@3</title>
<g id="a_id535"><a xlink:title="|cpu$valid_load>>1">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1766.57,-4179.33C1733.45,-4179.33 1601,-4179.33 1601,-4179.33 1601,-4179.33 1601,-4029.62 1601,-4029.62"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1604.5,-4029.62 1601,-4019.62 1597.5,-4029.62 1604.5,-4029.62"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid_load@4&#45;&gt;|cpu$valid_load@5 -->
<g id="id550" logical_entity="|cpu$valid_load" class="edge">
<title>|cpu$valid_load@4-&gt;|cpu$valid_load@5</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1781.03,-4177C1783.18,-4177 1785,-4177 1785,-4177 1785,-4177 1785,-4439.5 1785,-4439.5 1785,-4439.5 2068.86,-4439.5 2068.86,-4439.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="2068.86,-4443 2078.86,-4439.5 2068.86,-4436 2068.86,-4443"></polygon>
</g>
<!-- |cpu$valid_load@5&#45;&gt;|cpu$rf_wr_en@3 -->
<g id="id456" logical_entity="|cpu$valid_load" class="edge">
<title>|cpu$valid_load@5-&gt;|cpu$rf_wr_en@3</title>
<g id="a_id456"><a xlink:title="|cpu$valid_load>>2">
<path fill="none" stroke="purple" stroke-width="1.5" d="M2078.86,-4443C2029.74,-4443 1744,-4443 1744,-4443 1744,-4443 1744,-2976.83 1744,-2976.83 1744,-2976.83 1721.19,-2976.83 1721.19,-2976.83"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1721.19,-2973.33 1711.19,-2976.83 1721.19,-2980.33 1721.19,-2973.33"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid_load@5&#45;&gt;|cpu$valid@3 -->
<g id="id536" logical_entity="|cpu$valid_load" class="edge">
<title>|cpu$valid_load@5-&gt;|cpu$valid@3</title>
<g id="a_id536"><a xlink:title="|cpu$valid_load>>2">
<path fill="none" stroke="purple" stroke-width="1.5" d="M2078.76,-4446.5C2016.53,-4446.5 1574,-4446.5 1574,-4446.5 1574,-4446.5 1574,-4029.54 1574,-4029.54"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1577.5,-4029.54 1574,-4019.54 1570.5,-4029.54 1577.5,-4029.54"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid_taken_br@3&#45;&gt;|cpu$pc@0 -->
<g id="id316" logical_entity="|cpu$valid_taken_br" class="edge">
<title>|cpu$valid_taken_br@3-&gt;|cpu$pc@0</title>
<g id="a_id316"><a xlink:title="|cpu$valid_taken_br>>3">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1656.79,-3990.5C1442.65,-3990.5 37,-3990.5 37,-3990.5 37,-3990.5 37,-1090.86 37,-1090.86"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="40.5,-1090.86 37,-1080.86 33.5,-1090.86 40.5,-1090.86"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid_taken_br@3&#45;&gt;|cpu$valid_taken_br@4 -->
<g id="id555" logical_entity="|cpu$valid_taken_br" class="edge">
<title>|cpu$valid_taken_br@3-&gt;|cpu$valid_taken_br@4</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1684,-3999.85C1684,-4054.09 1684,-4206.67 1684,-4206.67 1684,-4206.67 1756.94,-4206.67 1756.94,-4206.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1756.94,-4210.17 1766.94,-4206.67 1756.94,-4203.17 1756.94,-4210.17"></polygon>
</g>
<!-- |cpu$valid_taken_br@4&#45;&gt;|cpu$valid@3 -->
<g id="id533" logical_entity="|cpu$valid_taken_br" class="edge">
<title>|cpu$valid_taken_br@4-&gt;|cpu$valid@3</title>
<g id="a_id533"><a xlink:title="|cpu$valid_taken_br>>1">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1766.72,-4211.33C1733.05,-4211.33 1594,-4211.33 1594,-4211.33 1594,-4211.33 1594,-4029.57 1594,-4029.57"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1597.5,-4029.57 1594,-4019.57 1590.5,-4029.57 1597.5,-4029.57"></polygon>
</a>
</g>
</g>
<!-- |cpu$valid_taken_br@4&#45;&gt;|cpu$valid_taken_br@5 -->
<g id="id557" logical_entity="|cpu$valid_taken_br" class="edge">
<title>|cpu$valid_taken_br@4-&gt;|cpu$valid_taken_br@5</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1781,-4206.25C1784.5,-4206.25 1788,-4206.25 1788,-4206.25 1788,-4206.25 1788,-4408.67 1788,-4408.67 1788,-4408.67 2068.93,-4408.67 2068.93,-4408.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="2068.93,-4412.17 2078.93,-4408.67 2068.93,-4405.17 2068.93,-4412.17"></polygon>
</g>
<!-- |cpu$valid_taken_br@5&#45;&gt;|cpu$valid@3 -->
<g id="id534" logical_entity="|cpu$valid_taken_br" class="edge">
<title>|cpu$valid_taken_br@5-&gt;|cpu$valid@3</title>
<g id="a_id534"><a xlink:title="|cpu$valid_taken_br>>2">
<path fill="none" stroke="purple" stroke-width="1.5" d="M2078.86,-4413.33C2017.48,-4413.33 1581,-4413.33 1581,-4413.33 1581,-4413.33 1581,-4029.66 1581,-4029.66"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1584.5,-4029.66 1581,-4019.66 1577.5,-4029.66 1584.5,-4029.66"></polygon>
</a>
</g>
</g>
<!-- |cpu/dmem$value@4&#45;&gt;|cpu/dmem$value@5 -->
<g id="id569" logical_entity="|cpu/dmem$value" class="edge">
<title>|cpu/dmem$value@4-&gt;|cpu/dmem$value@5</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M2113.03,-3949.67C2113.03,-3949.67 2194.81,-3949.67 2194.81,-3949.67"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="2194.81,-3953.17 2204.81,-3949.67 2194.81,-3946.17 2194.81,-3953.17"></polygon>
</g>
<!-- |cpu/dmem$value@5&#45;&gt;|cpu$dmem_rd_data@4 -->
<g id="id17" logical_entity="|cpu/dmem$value" class="edge">
<title>|cpu/dmem$value@5-&gt;|cpu$dmem_rd_data@4</title>
<g id="a_id17"><a xlink:title="|cpu/dmem$value>>1">
<path fill="none" stroke="purple" stroke-width="1.5" d="M2212,-3959.3C2212,-4008.27 2212,-4286.83 2212,-4286.83 2212,-4286.83 1997.45,-4286.83 1997.45,-4286.83"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1997.45,-4283.33 1987.45,-4286.83 1997.45,-4290.33 1997.45,-4283.33"></polygon>
</a>
</g>
</g>
<!-- |cpu/dmem$value@5&#45;&gt;|cpu/dmem$value@4 -->
<g id="id573" logical_entity="|cpu/dmem$value" class="edge">
<title>|cpu/dmem$value@5-&gt;|cpu/dmem$value@4</title>
<g id="a_id573"><a xlink:title="|cpu/dmem$value">
<path fill="none" stroke="purple" stroke-width="1.5" d="M2204.86,-3954.33C2204.86,-3954.33 2123.07,-3954.33 2123.07,-3954.33"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="2123.07,-3950.83 2113.07,-3954.33 2123.07,-3957.83 2123.07,-3950.83"></polygon>
</a>
</g>
</g>
<!-- |cpu/dmem$wr@4&#45;&gt;|cpu/dmem$value@4 -->
<g id="id571" logical_entity="|cpu/dmem$wr" class="edge">
<title>|cpu/dmem$wr@4-&gt;|cpu/dmem$value@4</title>
<g id="a_id571"><a xlink:title="|cpu/dmem$wr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1987.03,-3952C1987.03,-3952 2048.58,-3952 2048.58,-3952"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="2048.58,-3955.5 2058.58,-3952 2048.58,-3948.5 2048.58,-3955.5"></polygon>
</a>
</g>
</g>
<!-- |cpu/imem$instr@1&#45;&gt;|cpu$imem_rd_data@1 -->
<g id="id45" logical_entity="|cpu/imem$instr" class="edge">
<title>|cpu/imem$instr@1-&gt;|cpu$imem_rd_data@1</title>
<g id="a_id45"><a xlink:title="|cpu/imem$instr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M345,-1660.48C345,-1597.79 345,-1164 345,-1164 345,-1164 476.85,-1164 476.85,-1164"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="476.85,-1167.5 486.85,-1164 476.85,-1160.5 476.85,-1167.5"></polygon>
</a>
</g>
</g>
<!-- |cpu/xreg$value@3&#45;&gt;|cpu/xreg$value@4 -->
<g id="id588" logical_entity="|cpu/xreg$value" class="edge">
<title>|cpu/xreg$value@3-&gt;|cpu/xreg$value@4</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1891.25,-2792.5C1891.25,-2792.5 1942.85,-2792.5 1942.85,-2792.5"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1942.85,-2796 1952.85,-2792.5 1942.85,-2789 1942.85,-2796"></polygon>
</g>
<!-- |cpu/xreg$value@4&#45;&gt;|cpu$rf_rd_data1@2 -->
<g id="id431" logical_entity="|cpu/xreg$value" class="edge">
<title>|cpu/xreg$value@4-&gt;|cpu$rf_rd_data1@2</title>
<g id="a_id431"><a xlink:title="|cpu/xreg$value>>2">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1958,-2787.57C1958,-2773.57 1958,-2744.67 1958,-2744.67 1958,-2744.67 1414,-2744.67 1414,-2744.67 1414,-2744.67 1414,-2309.75 1414,-2309.75"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1417.5,-2309.75 1414,-2299.75 1410.5,-2309.75 1417.5,-2309.75"></polygon>
</a>
</g>
</g>
<!-- |cpu/xreg$value@4&#45;&gt;|cpu$rf_rd_data2@2 -->
<g id="id435" logical_entity="|cpu/xreg$value" class="edge">
<title>|cpu/xreg$value@4-&gt;|cpu$rf_rd_data2@2</title>
<g id="a_id435"><a xlink:title="|cpu/xreg$value>>2">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1963,-2787.95C1963,-2695.98 1963,-1735 1963,-1735 1963,-1735 1451.22,-1735 1451.22,-1735"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1451.23,-1731.5 1441.22,-1735 1451.22,-1738.5 1451.23,-1731.5"></polygon>
</a>
</g>
</g>
<!-- |cpu/xreg$value@4&#45;&gt;|cpu/xreg$value@3 -->
<g id="id594" logical_entity="|cpu/xreg$value" class="edge">
<title>|cpu/xreg$value@4-&gt;|cpu/xreg$value@3</title>
<g id="a_id594"><a xlink:title="|cpu/xreg$value">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1952.78,-2797C1952.78,-2797 1901.18,-2797 1901.18,-2797"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1901.18,-2793.5 1891.18,-2797 1901.18,-2800.5 1901.18,-2793.5"></polygon>
</a>
</g>
</g>
<!-- |cpu/xreg$value@4&#45;&gt;|cpu/xreg$value@5 -->
<g id="id590" logical_entity="|cpu/xreg$value" class="edge">
<title>|cpu/xreg$value@4-&gt;|cpu/xreg$value@5</title>
<path fill="none" stroke="purple" stroke-width="1.5" d="M1967.14,-2795C1967.14,-2795 2068.94,-2795 2068.94,-2795"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="2068.94,-2798.5 2078.94,-2795 2068.94,-2791.5 2068.94,-2798.5"></polygon>
</g>
<!-- |cpu/xreg$wr@3&#45;&gt;|cpu/xreg$value@3 -->
<g id="id592" logical_entity="|cpu/xreg$wr" class="edge">
<title>|cpu/xreg$wr@3-&gt;|cpu/xreg$value@3</title>
<g id="a_id592"><a xlink:title="|cpu/xreg$wr">
<path fill="none" stroke="purple" stroke-width="1.5" d="M1801,-2794C1801,-2794 1826.71,-2794 1826.71,-2794"></path>
<polygon fill="purple" stroke="purple" stroke-width="1.5" points="1826.71,-2797.5 1836.71,-2794 1826.7,-2790.5 1826.71,-2797.5"></polygon>
</a>
</g>
</g>
<!-- |cpu$br_tgt_pc@2 -->
<g id="id2" logical_entity="|cpu$br_tgt_pc" class="node">
<title>|cpu$br_tgt_pc@2</title>
<g id="a_id2"><a xlink:title="$br_tgt_pc[31:0] = $imm + $pc;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1621,-2849.5 1567,-2849.5 1567,-2812.5 1621,-2812.5 1621,-2849.5"></polygon>
<text text-anchor="middle" x="1594" y="-2839.5" font-family="Times,serif" font-size="10.00" fill="purple">$br_</text>
<text text-anchor="middle" x="1594" y="-2828.5" font-family="Times,serif" font-size="10.00" fill="purple"> tgt_</text>
<text text-anchor="middle" x="1594" y="-2817.5" font-family="Times,serif" font-size="10.00" fill="purple"> pc</text>
</a>
</g>
</g>
<!-- |cpu$br_tgt_pc@3 -->
<g id="id3" logical_entity="|cpu$br_tgt_pc" class="node">
<title>|cpu$br_tgt_pc@3</title>
<polygon fill="grey" stroke="purple" points="1511,-3346 1497,-3346 1497,-3332 1511,-3332 1511,-3346"></polygon>
</g>
<!-- |cpu$dec_bits@1 -->
<g id="id7" logical_entity="|cpu$dec_bits" class="node">
<title>|cpu$dec_bits@1</title>
<g id="a_id7"><a xlink:title="$dec_bits[10:0] = {$func7[5],$func3,$opcode};">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="991,-960 937,-960 937,-934 991,-934 991,-960"></polygon>
<text text-anchor="middle" x="964" y="-950" font-family="Times,serif" font-size="10.00" fill="purple">$dec_</text>
<text text-anchor="middle" x="964" y="-939" font-family="Times,serif" font-size="10.00" fill="purple"> bits</text>
</a>
</g>
</g>
<!-- |cpu$dmem_addr@4 -->
<g id="id11" logical_entity="|cpu$dmem_addr" class="node">
<title>|cpu$dmem_addr@4</title>
<g id="a_id11"><a xlink:title="$dmem_addr[3:0] = $result[5:2];">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1891,-4100 1837,-4100 1837,-4074 1891,-4074 1891,-4100"></polygon>
<text text-anchor="middle" x="1864" y="-4090" font-family="Times,serif" font-size="10.00" fill="purple">$dmem_</text>
<text text-anchor="middle" x="1864" y="-4079" font-family="Times,serif" font-size="10.00" fill="purple"> addr</text>
</a>
</g>
</g>
<!-- |cpu$dmem_rd_data@4 -->
<g id="id13" logical_entity="|cpu$dmem_rd_data" class="node">
<title>|cpu$dmem_rd_data@4</title>
<g id="a_id13"><a xlink:title="$dmem_rd_data[31:0] = /dmem[$dmem_addr]>>1$value;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1987,-4311.5 1933,-4311.5 1933,-4274.5 1987,-4274.5 1987,-4311.5"></polygon>
<text text-anchor="middle" x="1960" y="-4301.5" font-family="Times,serif" font-size="10.00" fill="purple">$dmem_</text>
<text text-anchor="middle" x="1960" y="-4290.5" font-family="Times,serif" font-size="10.00" fill="purple"> rd_</text>
<text text-anchor="middle" x="1960" y="-4279.5" font-family="Times,serif" font-size="10.00" fill="purple"> data</text>
</a>
</g>
</g>
<!-- |cpu$dmem_rd_data@5 -->
<g id="id14" logical_entity="|cpu$dmem_rd_data" class="node">
<title>|cpu$dmem_rd_data@5</title>
<polygon fill="grey" stroke="purple" points="2093,-4354 2079,-4354 2079,-4340 2093,-4340 2093,-4354"></polygon>
</g>
<!-- |cpu$dmem_rd_en@4 -->
<g id="id19" logical_entity="|cpu$dmem_rd_en" class="node">
<title>|cpu$dmem_rd_en@4</title>
<g id="a_id19"><a xlink:title="$dmem_rd_en = $valid_load;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1891,-4210.5 1837,-4210.5 1837,-4173.5 1891,-4173.5 1891,-4210.5"></polygon>
<text text-anchor="middle" x="1864" y="-4200.5" font-family="Times,serif" font-size="10.00" fill="purple">$dmem_</text>
<text text-anchor="middle" x="1864" y="-4189.5" font-family="Times,serif" font-size="10.00" fill="purple"> rd_</text>
<text text-anchor="middle" x="1864" y="-4178.5" font-family="Times,serif" font-size="10.00" fill="purple"> en</text>
</a>
</g>
</g>
<!-- |cpu$dmem_wr_data@4 -->
<g id="id21" logical_entity="|cpu$dmem_wr_data" class="node">
<title>|cpu$dmem_wr_data@4</title>
<g id="a_id21"><a xlink:title="$dmem_wr_data[31:0] = $src2_value[31:0];">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1891,-4265.5 1837,-4265.5 1837,-4228.5 1891,-4228.5 1891,-4265.5"></polygon>
<text text-anchor="middle" x="1864" y="-4255.5" font-family="Times,serif" font-size="10.00" fill="purple">$dmem_</text>
<text text-anchor="middle" x="1864" y="-4244.5" font-family="Times,serif" font-size="10.00" fill="purple"> wr_</text>
<text text-anchor="middle" x="1864" y="-4233.5" font-family="Times,serif" font-size="10.00" fill="purple"> data</text>
</a>
</g>
</g>
<!-- |cpu$dmem_wr_en@4 -->
<g id="id23" logical_entity="|cpu$dmem_wr_en" class="node">
<title>|cpu$dmem_wr_en@4</title>
<g id="a_id23"><a xlink:title="$dmem_wr_en = $is_s_instr &amp;&amp; $valid;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1891,-4155.5 1837,-4155.5 1837,-4118.5 1891,-4118.5 1891,-4155.5"></polygon>
<text text-anchor="middle" x="1864" y="-4145.5" font-family="Times,serif" font-size="10.00" fill="purple">$dmem_</text>
<text text-anchor="middle" x="1864" y="-4134.5" font-family="Times,serif" font-size="10.00" fill="purple"> wr_</text>
<text text-anchor="middle" x="1864" y="-4123.5" font-family="Times,serif" font-size="10.00" fill="purple"> en</text>
</a>
</g>
</g>
<!-- |cpu$func3@1 -->
<g id="id26" logical_entity="|cpu$func3" class="node">
<title>|cpu$func3@1</title>
<g id="a_id26"><a xlink:title="$func3[2:0] = $instr[14:12];">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="901,-1333.5 847,-1333.5 847,-1318.5 901,-1318.5 901,-1333.5"></polygon>
<text text-anchor="middle" x="874" y="-1323.5" font-family="Times,serif" font-size="10.00" fill="purple">$func3</text>
</a>
</g>
</g>
<!-- |cpu$func3_valid@1 -->
<g id="id29" logical_entity="|cpu$func3_valid" class="node">
<title>|cpu$func3_valid@1</title>
<g id="a_id29"><a xlink:title="$func3_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="811,-1446 757,-1446 757,-1420 811,-1420 811,-1446"></polygon>
<text text-anchor="middle" x="784" y="-1436" font-family="Times,serif" font-size="10.00" fill="purple">$func3_</text>
<text text-anchor="middle" x="784" y="-1425" font-family="Times,serif" font-size="10.00" fill="purple"> valid</text>
</a>
</g>
</g>
<!-- |cpu$func7@1 -->
<g id="id34" logical_entity="|cpu$func7" class="node">
<title>|cpu$func7@1</title>
<g id="a_id34"><a xlink:title="$func7[6:0] = $instr[31:25];">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="901,-1465.5 847,-1465.5 847,-1450.5 901,-1450.5 901,-1465.5"></polygon>
<text text-anchor="middle" x="874" y="-1455.5" font-family="Times,serif" font-size="10.00" fill="purple">$func7</text>
</a>
</g>
</g>
<!-- |cpu$func7_valid@1 -->
<g id="id37" logical_entity="|cpu$func7_valid" class="node">
<title>|cpu$func7_valid@1</title>
<g id="a_id37"><a xlink:title="$func7_valid = $is_r_instr;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="811,-1578 757,-1578 757,-1552 811,-1552 811,-1578"></polygon>
<text text-anchor="middle" x="784" y="-1568" font-family="Times,serif" font-size="10.00" fill="purple">$func7_</text>
<text text-anchor="middle" x="784" y="-1557" font-family="Times,serif" font-size="10.00" fill="purple"> valid</text>
</a>
</g>
</g>
<!-- |cpu$imem_rd_addr@0 -->
<g id="id39" logical_entity="|cpu$imem_rd_addr" class="node">
<title>|cpu$imem_rd_addr@0</title>
<g id="a_id39"><a xlink:title="$imem_rd_addr[4-1:0] = $pc[4+1:2];">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="176,-1080.5 122,-1080.5 122,-1043.5 176,-1043.5 176,-1080.5"></polygon>
<text text-anchor="middle" x="149" y="-1070.5" font-family="Times,serif" font-size="10.00" fill="purple">$imem_</text>
<text text-anchor="middle" x="149" y="-1059.5" font-family="Times,serif" font-size="10.00" fill="purple"> rd_</text>
<text text-anchor="middle" x="149" y="-1048.5" font-family="Times,serif" font-size="10.00" fill="purple"> addr</text>
</a>
</g>
</g>
<!-- |cpu$imem_rd_addr@1 -->
<g id="id40" logical_entity="|cpu$imem_rd_addr" class="node">
<title>|cpu$imem_rd_addr@1</title>
<polygon fill="grey" stroke="purple" points="338,-1069 324,-1069 324,-1055 338,-1055 338,-1069"></polygon>
</g>
<!-- |cpu$imem_rd_data@1 -->
<g id="id43" logical_entity="|cpu$imem_rd_data" class="node">
<title>|cpu$imem_rd_data@1</title>
<g id="a_id43"><a xlink:title="$imem_rd_data[31:0] = /imem[$imem_rd_addr]$instr;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="541,-1182.5 487,-1182.5 487,-1145.5 541,-1145.5 541,-1182.5"></polygon>
<text text-anchor="middle" x="514" y="-1172.5" font-family="Times,serif" font-size="10.00" fill="purple">$imem_</text>
<text text-anchor="middle" x="514" y="-1161.5" font-family="Times,serif" font-size="10.00" fill="purple"> rd_</text>
<text text-anchor="middle" x="514" y="-1150.5" font-family="Times,serif" font-size="10.00" fill="purple"> data</text>
</a>
</g>
</g>
<!-- |cpu$imem_rd_en@0 -->
<g id="id47" logical_entity="|cpu$imem_rd_en" class="node">
<title>|cpu$imem_rd_en@0</title>
<g id="a_id47"><a xlink:title="$imem_rd_en = !$reset;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="176,-1025.5 122,-1025.5 122,-988.5 176,-988.5 176,-1025.5"></polygon>
<text text-anchor="middle" x="149" y="-1015.5" font-family="Times,serif" font-size="10.00" fill="purple">$imem_</text>
<text text-anchor="middle" x="149" y="-1004.5" font-family="Times,serif" font-size="10.00" fill="purple"> rd_</text>
<text text-anchor="middle" x="149" y="-993.5" font-family="Times,serif" font-size="10.00" fill="purple"> en</text>
</a>
</g>
</g>
<!-- |cpu$imem_rd_en@1 -->
<g id="id48" logical_entity="|cpu$imem_rd_en" class="node">
<title>|cpu$imem_rd_en@1</title>
<polygon fill="grey" stroke="purple" points="338,-1014 324,-1014 324,-1000 338,-1000 338,-1014"></polygon>
</g>
<!-- |cpu$imm@1 -->
<g id="id51" logical_entity="|cpu$imm" class="node">
<title>|cpu$imm@1</title>
<g id="a_id51"><a xlink:title="$imm[31:0] = $is_i_instr ? {{21{$instr[31]}},$instr[30:20]} :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_s_instr ? {{21{$instr[31]}},$instr[30:25],$instr[11:7]} :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_u_instr ? {$instr[31:12],12'b0} :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_b_instr ? {{20{$instr[31]}},$instr[7],$instr[30:25],$instr[11:8],1'b0} :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_j_instr ? {{12{$instr[31]}},$instr[19:12],$instr[20],$instr[30:25],$instr[24:21],1'b0} : 32'b0;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="811,-1260.5 757,-1260.5 757,-1245.5 811,-1245.5 811,-1260.5"></polygon>
<text text-anchor="middle" x="784" y="-1250.5" font-family="Times,serif" font-size="10.00" fill="purple">$imm</text>
</a>
</g>
</g>
<!-- |cpu$imm@2 -->
<g id="id52" logical_entity="|cpu$imm" class="node">
<title>|cpu$imm@2</title>
<polygon fill="grey" stroke="purple" points="1511,-2326 1497,-2326 1497,-2312 1511,-2312 1511,-2326"></polygon>
</g>
<!-- |cpu$imm@3 -->
<g id="id54" logical_entity="|cpu$imm" class="node">
<title>|cpu$imm@3</title>
<polygon fill="grey" stroke="purple" points="1511,-3026 1497,-3026 1497,-3012 1511,-3012 1511,-3026"></polygon>
</g>
<!-- |cpu$inc_pc@1 -->
<g id="id76" logical_entity="|cpu$inc_pc" class="node">
<title>|cpu$inc_pc@1</title>
<g id="a_id76"><a xlink:title="$inc_pc[31:0] = $pc + 32'd4;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="541,-1598 487,-1598 487,-1572 541,-1572 541,-1598"></polygon>
<text text-anchor="middle" x="514" y="-1588" font-family="Times,serif" font-size="10.00" fill="purple">$inc_</text>
<text text-anchor="middle" x="514" y="-1577" font-family="Times,serif" font-size="10.00" fill="purple"> pc</text>
</a>
</g>
</g>
<!-- |cpu$inc_pc@2 -->
<g id="id77" logical_entity="|cpu$inc_pc" class="node">
<title>|cpu$inc_pc@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2850 1137,-2850 1137,-2836 1151,-2836 1151,-2850"></polygon>
</g>
<!-- |cpu$inc_pc@3 -->
<g id="id79" logical_entity="|cpu$inc_pc" class="node">
<title>|cpu$inc_pc@3</title>
<polygon fill="grey" stroke="purple" points="1511,-3250 1497,-3250 1497,-3236 1511,-3236 1511,-3250"></polygon>
</g>
<!-- |cpu$instr@1 -->
<g id="id82" logical_entity="|cpu$instr" class="node">
<title>|cpu$instr@1</title>
<g id="a_id82"><a xlink:title="$instr[31:0] = $imem_rd_data[31:0];">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="631,-1272.5 577,-1272.5 577,-1257.5 631,-1257.5 631,-1272.5"></polygon>
<text text-anchor="middle" x="604" y="-1262.5" font-family="Times,serif" font-size="10.00" fill="purple">$instr</text>
</a>
</g>
</g>
<!-- |cpu$is_add@1 -->
<g id="id84" logical_entity="|cpu$is_add" class="node">
<title>|cpu$is_add@1</title>
<g id="a_id84"><a xlink:title="$is_add = $dec_bits ==? 11'b0_000_0110011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-1202 1027,-1202 1027,-1176 1081,-1176 1081,-1202"></polygon>
<text text-anchor="middle" x="1054" y="-1192" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-1181" font-family="Times,serif" font-size="10.00" fill="purple"> add</text>
</a>
</g>
</g>
<!-- |cpu$is_add@2 -->
<g id="id85" logical_entity="|cpu$is_add" class="node">
<title>|cpu$is_add@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2370 1137,-2370 1137,-2356 1151,-2356 1151,-2370"></polygon>
</g>
<!-- |cpu$is_add@3 -->
<g id="id87" logical_entity="|cpu$is_add" class="node">
<title>|cpu$is_add@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3730 1587,-3730 1587,-3716 1601,-3716 1601,-3730"></polygon>
</g>
<!-- |cpu$is_addi@1 -->
<g id="id90" logical_entity="|cpu$is_addi" class="node">
<title>|cpu$is_addi@1</title>
<g id="a_id90"><a xlink:title="$is_addi = $dec_bits ==? 11'bx_000_0010011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-1246 1027,-1246 1027,-1220 1081,-1220 1081,-1246"></polygon>
<text text-anchor="middle" x="1054" y="-1236" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-1225" font-family="Times,serif" font-size="10.00" fill="purple"> addi</text>
</a>
</g>
</g>
<!-- |cpu$is_addi@2 -->
<g id="id91" logical_entity="|cpu$is_addi" class="node">
<title>|cpu$is_addi@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2402 1137,-2402 1137,-2388 1151,-2388 1151,-2402"></polygon>
</g>
<!-- |cpu$is_addi@3 -->
<g id="id93" logical_entity="|cpu$is_addi" class="node">
<title>|cpu$is_addi@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3762 1587,-3762 1587,-3748 1601,-3748 1601,-3762"></polygon>
</g>
<!-- |cpu$is_and@1 -->
<g id="id96" logical_entity="|cpu$is_and" class="node">
<title>|cpu$is_and@1</title>
<g id="a_id96"><a xlink:title="$is_and = $dec_bits ==? 11'b0_111_0110011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-1290 1027,-1290 1027,-1264 1081,-1264 1081,-1290"></polygon>
<text text-anchor="middle" x="1054" y="-1280" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-1269" font-family="Times,serif" font-size="10.00" fill="purple"> and</text>
</a>
</g>
</g>
<!-- |cpu$is_and@2 -->
<g id="id97" logical_entity="|cpu$is_and" class="node">
<title>|cpu$is_and@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2434 1137,-2434 1137,-2420 1151,-2420 1151,-2434"></polygon>
</g>
<!-- |cpu$is_and@3 -->
<g id="id99" logical_entity="|cpu$is_and" class="node">
<title>|cpu$is_and@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3794 1587,-3794 1587,-3780 1601,-3780 1601,-3794"></polygon>
</g>
<!-- |cpu$is_andi@1 -->
<g id="id102" logical_entity="|cpu$is_andi" class="node">
<title>|cpu$is_andi@1</title>
<g id="a_id102"><a xlink:title="$is_andi = $dec_bits ==? 11'bx_111_0010011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-234 1027,-234 1027,-208 1081,-208 1081,-234"></polygon>
<text text-anchor="middle" x="1054" y="-224" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-213" font-family="Times,serif" font-size="10.00" fill="purple"> andi</text>
</a>
</g>
</g>
<!-- |cpu$is_andi@2 -->
<g id="id103" logical_entity="|cpu$is_andi" class="node">
<title>|cpu$is_andi@2</title>
<polygon fill="grey" stroke="purple" points="1151,-1666 1137,-1666 1137,-1652 1151,-1652 1151,-1666"></polygon>
</g>
<!-- |cpu$is_andi@3 -->
<g id="id105" logical_entity="|cpu$is_andi" class="node">
<title>|cpu$is_andi@3</title>
<polygon fill="grey" stroke="purple" points="1601,-2994 1587,-2994 1587,-2980 1601,-2980 1601,-2994"></polygon>
</g>
<!-- |cpu$is_auipc@1 -->
<g id="id108" logical_entity="|cpu$is_auipc" class="node">
<title>|cpu$is_auipc@1</title>
<g id="a_id108"><a xlink:title="$is_auipc = $dec_bits ==? 11'bx_xxx_0010111;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-278 1027,-278 1027,-252 1081,-252 1081,-278"></polygon>
<text text-anchor="middle" x="1054" y="-268" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-257" font-family="Times,serif" font-size="10.00" fill="purple"> auipc</text>
</a>
</g>
</g>
<!-- |cpu$is_auipc@2 -->
<g id="id109" logical_entity="|cpu$is_auipc" class="node">
<title>|cpu$is_auipc@2</title>
<polygon fill="grey" stroke="purple" points="1151,-1698 1137,-1698 1137,-1684 1151,-1684 1151,-1698"></polygon>
</g>
<!-- |cpu$is_auipc@3 -->
<g id="id111" logical_entity="|cpu$is_auipc" class="node">
<title>|cpu$is_auipc@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3026 1587,-3026 1587,-3012 1601,-3012 1601,-3026"></polygon>
</g>
<!-- |cpu$is_b_instr@1 -->
<g id="id114" logical_entity="|cpu$is_b_instr" class="node">
<title>|cpu$is_b_instr@1</title>
<g id="a_id114"><a xlink:title="$is_b_instr = $instr[6:2] ==? 5'b11000;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="721,-1467.5 667,-1467.5 667,-1430.5 721,-1430.5 721,-1467.5"></polygon>
<text text-anchor="middle" x="694" y="-1457.5" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="694" y="-1446.5" font-family="Times,serif" font-size="10.00" fill="purple"> b_</text>
<text text-anchor="middle" x="694" y="-1435.5" font-family="Times,serif" font-size="10.00" fill="purple"> instr</text>
</a>
</g>
</g>
<!-- |cpu$is_beq@1 -->
<g id="id116" logical_entity="|cpu$is_beq" class="node">
<title>|cpu$is_beq@1</title>
<g id="a_id116"><a xlink:title="$is_beq = $dec_bits ==? 11'bx_000_1100011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-1378 1027,-1378 1027,-1352 1081,-1352 1081,-1378"></polygon>
<text text-anchor="middle" x="1054" y="-1368" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-1357" font-family="Times,serif" font-size="10.00" fill="purple"> beq</text>
</a>
</g>
</g>
<!-- |cpu$is_beq@2 -->
<g id="id117" logical_entity="|cpu$is_beq" class="node">
<title>|cpu$is_beq@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2626 1137,-2626 1137,-2612 1151,-2612 1151,-2626"></polygon>
</g>
<!-- |cpu$is_beq@3 -->
<g id="id119" logical_entity="|cpu$is_beq" class="node">
<title>|cpu$is_beq@3</title>
<polygon fill="grey" stroke="purple" points="1511,-3090 1497,-3090 1497,-3076 1511,-3076 1511,-3090"></polygon>
</g>
<!-- |cpu$is_bge@1 -->
<g id="id122" logical_entity="|cpu$is_bge" class="node">
<title>|cpu$is_bge@1</title>
<g id="a_id122"><a xlink:title="$is_bge = $dec_bits ==? 11'bx_101_1100011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-1422 1027,-1422 1027,-1396 1081,-1396 1081,-1422"></polygon>
<text text-anchor="middle" x="1054" y="-1412" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-1401" font-family="Times,serif" font-size="10.00" fill="purple"> bge</text>
</a>
</g>
</g>
<!-- |cpu$is_bge@2 -->
<g id="id123" logical_entity="|cpu$is_bge" class="node">
<title>|cpu$is_bge@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2658 1137,-2658 1137,-2644 1151,-2644 1151,-2658"></polygon>
</g>
<!-- |cpu$is_bge@3 -->
<g id="id125" logical_entity="|cpu$is_bge" class="node">
<title>|cpu$is_bge@3</title>
<polygon fill="grey" stroke="purple" points="1511,-3122 1497,-3122 1497,-3108 1511,-3108 1511,-3122"></polygon>
</g>
<!-- |cpu$is_bgeu@1 -->
<g id="id128" logical_entity="|cpu$is_bgeu" class="node">
<title>|cpu$is_bgeu@1</title>
<g id="a_id128"><a xlink:title="$is_bgeu = $dec_bits ==? 11'bx_111_1100011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-1466 1027,-1466 1027,-1440 1081,-1440 1081,-1466"></polygon>
<text text-anchor="middle" x="1054" y="-1456" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-1445" font-family="Times,serif" font-size="10.00" fill="purple"> bgeu</text>
</a>
</g>
</g>
<!-- |cpu$is_bgeu@2 -->
<g id="id129" logical_entity="|cpu$is_bgeu" class="node">
<title>|cpu$is_bgeu@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2690 1137,-2690 1137,-2676 1151,-2676 1151,-2690"></polygon>
</g>
<!-- |cpu$is_bgeu@3 -->
<g id="id131" logical_entity="|cpu$is_bgeu" class="node">
<title>|cpu$is_bgeu@3</title>
<polygon fill="grey" stroke="purple" points="1511,-3154 1497,-3154 1497,-3140 1511,-3140 1511,-3154"></polygon>
</g>
<!-- |cpu$is_blt@1 -->
<g id="id134" logical_entity="|cpu$is_blt" class="node">
<title>|cpu$is_blt@1</title>
<g id="a_id134"><a xlink:title="$is_blt = $dec_bits ==? 11'bx_100_1100011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-1554 1027,-1554 1027,-1528 1081,-1528 1081,-1554"></polygon>
<text text-anchor="middle" x="1054" y="-1544" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-1533" font-family="Times,serif" font-size="10.00" fill="purple"> blt</text>
</a>
</g>
</g>
<!-- |cpu$is_blt@2 -->
<g id="id135" logical_entity="|cpu$is_blt" class="node">
<title>|cpu$is_blt@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2722 1137,-2722 1137,-2708 1151,-2708 1151,-2722"></polygon>
</g>
<!-- |cpu$is_blt@3 -->
<g id="id137" logical_entity="|cpu$is_blt" class="node">
<title>|cpu$is_blt@3</title>
<polygon fill="grey" stroke="purple" points="1511,-3186 1497,-3186 1497,-3172 1511,-3172 1511,-3186"></polygon>
</g>
<!-- |cpu$is_bltu@1 -->
<g id="id140" logical_entity="|cpu$is_bltu" class="node">
<title>|cpu$is_bltu@1</title>
<g id="a_id140"><a xlink:title="$is_bltu = $dec_bits ==? 11'bx_110_1100011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-1598 1027,-1598 1027,-1572 1081,-1572 1081,-1598"></polygon>
<text text-anchor="middle" x="1054" y="-1588" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-1577" font-family="Times,serif" font-size="10.00" fill="purple"> bltu</text>
</a>
</g>
</g>
<!-- |cpu$is_bltu@2 -->
<g id="id141" logical_entity="|cpu$is_bltu" class="node">
<title>|cpu$is_bltu@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2786 1137,-2786 1137,-2772 1151,-2772 1151,-2786"></polygon>
</g>
<!-- |cpu$is_bltu@3 -->
<g id="id143" logical_entity="|cpu$is_bltu" class="node">
<title>|cpu$is_bltu@3</title>
<polygon fill="grey" stroke="purple" points="1511,-3282 1497,-3282 1497,-3268 1511,-3268 1511,-3282"></polygon>
</g>
<!-- |cpu$is_bne@1 -->
<g id="id146" logical_entity="|cpu$is_bne" class="node">
<title>|cpu$is_bne@1</title>
<g id="a_id146"><a xlink:title="$is_bne = $dec_bits ==? 11'bx_001_1100011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-1334 1027,-1334 1027,-1308 1081,-1308 1081,-1334"></polygon>
<text text-anchor="middle" x="1054" y="-1324" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-1313" font-family="Times,serif" font-size="10.00" fill="purple"> bne</text>
</a>
</g>
</g>
<!-- |cpu$is_bne@2 -->
<g id="id147" logical_entity="|cpu$is_bne" class="node">
<title>|cpu$is_bne@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2498 1137,-2498 1137,-2484 1151,-2484 1151,-2498"></polygon>
</g>
<!-- |cpu$is_bne@3 -->
<g id="id149" logical_entity="|cpu$is_bne" class="node">
<title>|cpu$is_bne@3</title>
<polygon fill="grey" stroke="purple" points="1511,-2930 1497,-2930 1497,-2916 1511,-2916 1511,-2930"></polygon>
</g>
<!-- |cpu$is_i_instr@1 -->
<g id="id152" logical_entity="|cpu$is_i_instr" class="node">
<title>|cpu$is_i_instr@1</title>
<g id="a_id152"><a xlink:title="$is_i_instr = $instr[6:2] ==? 5'b0000x || $instr[6:2] ==? 5'b001x0 || $instr[6:2] ==? 5'b11001;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="721,-1412.5 667,-1412.5 667,-1375.5 721,-1375.5 721,-1412.5"></polygon>
<text text-anchor="middle" x="694" y="-1402.5" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="694" y="-1391.5" font-family="Times,serif" font-size="10.00" fill="purple"> i_</text>
<text text-anchor="middle" x="694" y="-1380.5" font-family="Times,serif" font-size="10.00" fill="purple"> instr</text>
</a>
</g>
</g>
<!-- |cpu$is_j_instr@1 -->
<g id="id156" logical_entity="|cpu$is_j_instr" class="node">
<title>|cpu$is_j_instr@1</title>
<g id="a_id156"><a xlink:title="$is_j_instr = $instr[6:2] ==? 5'b11011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="721,-1302.5 667,-1302.5 667,-1265.5 721,-1265.5 721,-1302.5"></polygon>
<text text-anchor="middle" x="694" y="-1292.5" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="694" y="-1281.5" font-family="Times,serif" font-size="10.00" fill="purple"> j_</text>
<text text-anchor="middle" x="694" y="-1270.5" font-family="Times,serif" font-size="10.00" fill="purple"> instr</text>
</a>
</g>
</g>
<!-- |cpu$is_jal@1 -->
<g id="id158" logical_entity="|cpu$is_jal" class="node">
<title>|cpu$is_jal@1</title>
<g id="a_id158"><a xlink:title="$is_jal = $dec_bits ==? 11'bx_xxx_1101111;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-190 1027,-190 1027,-164 1081,-164 1081,-190"></polygon>
<text text-anchor="middle" x="1054" y="-180" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-169" font-family="Times,serif" font-size="10.00" fill="purple"> jal</text>
</a>
</g>
</g>
<!-- |cpu$is_jal@2 -->
<g id="id159" logical_entity="|cpu$is_jal" class="node">
<title>|cpu$is_jal@2</title>
<polygon fill="grey" stroke="purple" points="1151,-1730 1137,-1730 1137,-1716 1151,-1716 1151,-1730"></polygon>
</g>
<!-- |cpu$is_jal@3 -->
<g id="id161" logical_entity="|cpu$is_jal" class="node">
<title>|cpu$is_jal@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3666 1587,-3666 1587,-3652 1601,-3652 1601,-3666"></polygon>
</g>
<!-- |cpu$is_jalr@1 -->
<g id="id164" logical_entity="|cpu$is_jalr" class="node">
<title>|cpu$is_jalr@1</title>
<g id="a_id164"><a xlink:title="$is_jalr = $dec_bits ==? 11'bx_000_1100111;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-322 1027,-322 1027,-296 1081,-296 1081,-322"></polygon>
<text text-anchor="middle" x="1054" y="-312" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-301" font-family="Times,serif" font-size="10.00" fill="purple"> jalr</text>
</a>
</g>
</g>
<!-- |cpu$is_jalr@2 -->
<g id="id165" logical_entity="|cpu$is_jalr" class="node">
<title>|cpu$is_jalr@2</title>
<polygon fill="grey" stroke="purple" points="1151,-1762 1137,-1762 1137,-1748 1151,-1748 1151,-1762"></polygon>
</g>
<!-- |cpu$is_jalr@3 -->
<g id="id167" logical_entity="|cpu$is_jalr" class="node">
<title>|cpu$is_jalr@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3698 1587,-3698 1587,-3684 1601,-3684 1601,-3698"></polygon>
</g>
<!-- |cpu$is_jump@1 -->
<g id="id170" logical_entity="|cpu$is_jump" class="node">
<title>|cpu$is_jump@1</title>
<g id="a_id170"><a xlink:title="$is_jump = $is_jal || $is_jalr;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1171,-1598 1117,-1598 1117,-1572 1171,-1572 1171,-1598"></polygon>
<text text-anchor="middle" x="1144" y="-1588" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1144" y="-1577" font-family="Times,serif" font-size="10.00" fill="purple"> jump</text>
</a>
</g>
</g>
<!-- |cpu$is_jump@2 -->
<g id="id171" logical_entity="|cpu$is_jump" class="node">
<title>|cpu$is_jump@2</title>
<polygon fill="grey" stroke="purple" points="1151,-1794 1137,-1794 1137,-1780 1151,-1780 1151,-1794"></polygon>
</g>
<!-- |cpu$is_jump@3 -->
<g id="id173" logical_entity="|cpu$is_jump" class="node">
<title>|cpu$is_jump@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3058 1587,-3058 1587,-3044 1601,-3044 1601,-3058"></polygon>
</g>
<!-- |cpu$is_load@1 -->
<g id="id177" logical_entity="|cpu$is_load" class="node">
<title>|cpu$is_load@1</title>
<g id="a_id177"><a xlink:title="$is_load = $dec_bits ==? 11'bx_xxx_0000011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-366 1027,-366 1027,-340 1081,-340 1081,-366"></polygon>
<text text-anchor="middle" x="1054" y="-356" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-345" font-family="Times,serif" font-size="10.00" fill="purple"> load</text>
</a>
</g>
</g>
<!-- |cpu$is_load@2 -->
<g id="id178" logical_entity="|cpu$is_load" class="node">
<title>|cpu$is_load@2</title>
<polygon fill="grey" stroke="purple" points="1151,-1826 1137,-1826 1137,-1812 1151,-1812 1151,-1826"></polygon>
</g>
<!-- |cpu$is_load@3 -->
<g id="id180" logical_entity="|cpu$is_load" class="node">
<title>|cpu$is_load@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3090 1587,-3090 1587,-3076 1601,-3076 1601,-3090"></polygon>
</g>
<!-- |cpu$is_lui@1 -->
<g id="id183" logical_entity="|cpu$is_lui" class="node">
<title>|cpu$is_lui@1</title>
<g id="a_id183"><a xlink:title="$is_lui = $dec_bits ==? 11'bx_xxx_0110111;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-410 1027,-410 1027,-384 1081,-384 1081,-410"></polygon>
<text text-anchor="middle" x="1054" y="-400" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-389" font-family="Times,serif" font-size="10.00" fill="purple"> lui</text>
</a>
</g>
</g>
<!-- |cpu$is_lui@2 -->
<g id="id184" logical_entity="|cpu$is_lui" class="node">
<title>|cpu$is_lui@2</title>
<polygon fill="grey" stroke="purple" points="1151,-1858 1137,-1858 1137,-1844 1151,-1844 1151,-1858"></polygon>
</g>
<!-- |cpu$is_lui@3 -->
<g id="id186" logical_entity="|cpu$is_lui" class="node">
<title>|cpu$is_lui@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3122 1587,-3122 1587,-3108 1601,-3108 1601,-3122"></polygon>
</g>
<!-- |cpu$is_or@1 -->
<g id="id189" logical_entity="|cpu$is_or" class="node">
<title>|cpu$is_or@1</title>
<g id="a_id189"><a xlink:title="$is_or = $dec_bits ==? 11'b0_110_0110011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-454 1027,-454 1027,-428 1081,-428 1081,-454"></polygon>
<text text-anchor="middle" x="1054" y="-444" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-433" font-family="Times,serif" font-size="10.00" fill="purple"> or</text>
</a>
</g>
</g>
<!-- |cpu$is_or@2 -->
<g id="id190" logical_entity="|cpu$is_or" class="node">
<title>|cpu$is_or@2</title>
<polygon fill="grey" stroke="purple" points="1151,-1890 1137,-1890 1137,-1876 1151,-1876 1151,-1890"></polygon>
</g>
<!-- |cpu$is_or@3 -->
<g id="id192" logical_entity="|cpu$is_or" class="node">
<title>|cpu$is_or@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3154 1587,-3154 1587,-3140 1601,-3140 1601,-3154"></polygon>
</g>
<!-- |cpu$is_ori@1 -->
<g id="id195" logical_entity="|cpu$is_ori" class="node">
<title>|cpu$is_ori@1</title>
<g id="a_id195"><a xlink:title="$is_ori = $dec_bits ==? 11'bx_110_0010011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-498 1027,-498 1027,-472 1081,-472 1081,-498"></polygon>
<text text-anchor="middle" x="1054" y="-488" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-477" font-family="Times,serif" font-size="10.00" fill="purple"> ori</text>
</a>
</g>
</g>
<!-- |cpu$is_ori@2 -->
<g id="id196" logical_entity="|cpu$is_ori" class="node">
<title>|cpu$is_ori@2</title>
<polygon fill="grey" stroke="purple" points="1151,-1922 1137,-1922 1137,-1908 1151,-1908 1151,-1922"></polygon>
</g>
<!-- |cpu$is_ori@3 -->
<g id="id198" logical_entity="|cpu$is_ori" class="node">
<title>|cpu$is_ori@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3186 1587,-3186 1587,-3172 1601,-3172 1601,-3186"></polygon>
</g>
<!-- |cpu$is_r_instr@1 -->
<g id="id201" logical_entity="|cpu$is_r_instr" class="node">
<title>|cpu$is_r_instr@1</title>
<g id="a_id201"><a xlink:title="$is_r_instr = $instr[6:2] ==? 5'b011x0 || $instr[6:2] ==? 5'b01011 || $instr[6:2] ==? 5'b10100;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="721,-1577.5 667,-1577.5 667,-1540.5 721,-1540.5 721,-1577.5"></polygon>
<text text-anchor="middle" x="694" y="-1567.5" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="694" y="-1556.5" font-family="Times,serif" font-size="10.00" fill="purple"> r_</text>
<text text-anchor="middle" x="694" y="-1545.5" font-family="Times,serif" font-size="10.00" fill="purple"> instr</text>
</a>
</g>
</g>
<!-- |cpu$is_s_instr@1 -->
<g id="id205" logical_entity="|cpu$is_s_instr" class="node">
<title>|cpu$is_s_instr@1</title>
<g id="a_id205"><a xlink:title="$is_s_instr = $instr[6:2] ==? 5'b0100x;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="721,-1522.5 667,-1522.5 667,-1485.5 721,-1485.5 721,-1522.5"></polygon>
<text text-anchor="middle" x="694" y="-1512.5" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="694" y="-1501.5" font-family="Times,serif" font-size="10.00" fill="purple"> s_</text>
<text text-anchor="middle" x="694" y="-1490.5" font-family="Times,serif" font-size="10.00" fill="purple"> instr</text>
</a>
</g>
</g>
<!-- |cpu$is_s_instr@2 -->
<g id="id206" logical_entity="|cpu$is_s_instr" class="node">
<title>|cpu$is_s_instr@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2818 1137,-2818 1137,-2804 1151,-2804 1151,-2818"></polygon>
</g>
<!-- |cpu$is_s_instr@3 -->
<g id="id208" logical_entity="|cpu$is_s_instr" class="node">
<title>|cpu$is_s_instr@3</title>
<polygon fill="grey" stroke="purple" points="1511,-3218 1497,-3218 1497,-3204 1511,-3204 1511,-3218"></polygon>
</g>
<!-- |cpu$is_s_instr@4 -->
<g id="id210" logical_entity="|cpu$is_s_instr" class="node">
<title>|cpu$is_s_instr@4</title>
<polygon fill="grey" stroke="purple" points="1781,-4312 1767,-4312 1767,-4298 1781,-4298 1781,-4312"></polygon>
</g>
<!-- |cpu$is_sb@1 -->
<g id="id213" logical_entity="|cpu$is_sb" class="node">
<title>|cpu$is_sb@1</title>
<g id="a_id213"><a xlink:title="$is_sb = $dec_bits ==? 11'bx_000_0100011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-938 1027,-938 1027,-912 1081,-912 1081,-938"></polygon>
<text text-anchor="middle" x="1054" y="-928" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-917" font-family="Times,serif" font-size="10.00" fill="purple"> sb</text>
</a>
</g>
</g>
<!-- |cpu$is_sh@1 -->
<g id="id215" logical_entity="|cpu$is_sh" class="node">
<title>|cpu$is_sh@1</title>
<g id="a_id215"><a xlink:title="$is_sh = $dec_bits ==? 11'bx_001_0100011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-982 1027,-982 1027,-956 1081,-956 1081,-982"></polygon>
<text text-anchor="middle" x="1054" y="-972" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-961" font-family="Times,serif" font-size="10.00" fill="purple"> sh</text>
</a>
</g>
</g>
<!-- |cpu$is_sll@1 -->
<g id="id217" logical_entity="|cpu$is_sll" class="node">
<title>|cpu$is_sll@1</title>
<g id="a_id217"><a xlink:title="$is_sll = $dec_bits ==? 11'b0_001_0110011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-542 1027,-542 1027,-516 1081,-516 1081,-542"></polygon>
<text text-anchor="middle" x="1054" y="-532" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-521" font-family="Times,serif" font-size="10.00" fill="purple"> sll</text>
</a>
</g>
</g>
<!-- |cpu$is_sll@2 -->
<g id="id218" logical_entity="|cpu$is_sll" class="node">
<title>|cpu$is_sll@2</title>
<polygon fill="grey" stroke="purple" points="1151,-1954 1137,-1954 1137,-1940 1151,-1940 1151,-1954"></polygon>
</g>
<!-- |cpu$is_sll@3 -->
<g id="id220" logical_entity="|cpu$is_sll" class="node">
<title>|cpu$is_sll@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3218 1587,-3218 1587,-3204 1601,-3204 1601,-3218"></polygon>
</g>
<!-- |cpu$is_slli@1 -->
<g id="id223" logical_entity="|cpu$is_slli" class="node">
<title>|cpu$is_slli@1</title>
<g id="a_id223"><a xlink:title="$is_slli = $dec_bits ==? 11'b0_001_0010011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-586 1027,-586 1027,-560 1081,-560 1081,-586"></polygon>
<text text-anchor="middle" x="1054" y="-576" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-565" font-family="Times,serif" font-size="10.00" fill="purple"> slli</text>
</a>
</g>
</g>
<!-- |cpu$is_slli@2 -->
<g id="id224" logical_entity="|cpu$is_slli" class="node">
<title>|cpu$is_slli@2</title>
<polygon fill="grey" stroke="purple" points="1151,-1986 1137,-1986 1137,-1972 1151,-1972 1151,-1986"></polygon>
</g>
<!-- |cpu$is_slli@3 -->
<g id="id226" logical_entity="|cpu$is_slli" class="node">
<title>|cpu$is_slli@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3250 1587,-3250 1587,-3236 1601,-3236 1601,-3250"></polygon>
</g>
<!-- |cpu$is_slt@1 -->
<g id="id229" logical_entity="|cpu$is_slt" class="node">
<title>|cpu$is_slt@1</title>
<g id="a_id229"><a xlink:title="$is_slt = $dec_bits ==? 11'b0_010_0110011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-630 1027,-630 1027,-604 1081,-604 1081,-630"></polygon>
<text text-anchor="middle" x="1054" y="-620" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-609" font-family="Times,serif" font-size="10.00" fill="purple"> slt</text>
</a>
</g>
</g>
<!-- |cpu$is_slt@2 -->
<g id="id230" logical_entity="|cpu$is_slt" class="node">
<title>|cpu$is_slt@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2018 1137,-2018 1137,-2004 1151,-2004 1151,-2018"></polygon>
</g>
<!-- |cpu$is_slt@3 -->
<g id="id232" logical_entity="|cpu$is_slt" class="node">
<title>|cpu$is_slt@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3282 1587,-3282 1587,-3268 1601,-3268 1601,-3282"></polygon>
</g>
<!-- |cpu$is_slti@1 -->
<g id="id235" logical_entity="|cpu$is_slti" class="node">
<title>|cpu$is_slti@1</title>
<g id="a_id235"><a xlink:title="$is_slti = $dec_bits ==? 11'bx_010_0010011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-674 1027,-674 1027,-648 1081,-648 1081,-674"></polygon>
<text text-anchor="middle" x="1054" y="-664" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-653" font-family="Times,serif" font-size="10.00" fill="purple"> slti</text>
</a>
</g>
</g>
<!-- |cpu$is_slti@2 -->
<g id="id236" logical_entity="|cpu$is_slti" class="node">
<title>|cpu$is_slti@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2050 1137,-2050 1137,-2036 1151,-2036 1151,-2050"></polygon>
</g>
<!-- |cpu$is_slti@3 -->
<g id="id238" logical_entity="|cpu$is_slti" class="node">
<title>|cpu$is_slti@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3314 1587,-3314 1587,-3300 1601,-3300 1601,-3314"></polygon>
</g>
<!-- |cpu$is_sltiu@1 -->
<g id="id241" logical_entity="|cpu$is_sltiu" class="node">
<title>|cpu$is_sltiu@1</title>
<g id="a_id241"><a xlink:title="$is_sltiu = $dec_bits ==? 11'bx_011_0010011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-718 1027,-718 1027,-692 1081,-692 1081,-718"></polygon>
<text text-anchor="middle" x="1054" y="-708" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-697" font-family="Times,serif" font-size="10.00" fill="purple"> sltiu</text>
</a>
</g>
</g>
<!-- |cpu$is_sltiu@2 -->
<g id="id242" logical_entity="|cpu$is_sltiu" class="node">
<title>|cpu$is_sltiu@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2082 1137,-2082 1137,-2068 1151,-2068 1151,-2082"></polygon>
</g>
<!-- |cpu$is_sltiu@3 -->
<g id="id244" logical_entity="|cpu$is_sltiu" class="node">
<title>|cpu$is_sltiu@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3346 1587,-3346 1587,-3332 1601,-3332 1601,-3346"></polygon>
</g>
<!-- |cpu$is_sltu@1 -->
<g id="id247" logical_entity="|cpu$is_sltu" class="node">
<title>|cpu$is_sltu@1</title>
<g id="a_id247"><a xlink:title="$is_sltu = $dec_bits ==? 11'b0_011_0110011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-762 1027,-762 1027,-736 1081,-736 1081,-762"></polygon>
<text text-anchor="middle" x="1054" y="-752" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-741" font-family="Times,serif" font-size="10.00" fill="purple"> sltu</text>
</a>
</g>
</g>
<!-- |cpu$is_sltu@2 -->
<g id="id248" logical_entity="|cpu$is_sltu" class="node">
<title>|cpu$is_sltu@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2114 1137,-2114 1137,-2100 1151,-2100 1151,-2114"></polygon>
</g>
<!-- |cpu$is_sltu@3 -->
<g id="id250" logical_entity="|cpu$is_sltu" class="node">
<title>|cpu$is_sltu@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3378 1587,-3378 1587,-3364 1601,-3364 1601,-3378"></polygon>
</g>
<!-- |cpu$is_sra@1 -->
<g id="id253" logical_entity="|cpu$is_sra" class="node">
<title>|cpu$is_sra@1</title>
<g id="a_id253"><a xlink:title="$is_sra = $dec_bits ==? 11'b1_101_0110011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-806 1027,-806 1027,-780 1081,-780 1081,-806"></polygon>
<text text-anchor="middle" x="1054" y="-796" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-785" font-family="Times,serif" font-size="10.00" fill="purple"> sra</text>
</a>
</g>
</g>
<!-- |cpu$is_sra@2 -->
<g id="id254" logical_entity="|cpu$is_sra" class="node">
<title>|cpu$is_sra@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2146 1137,-2146 1137,-2132 1151,-2132 1151,-2146"></polygon>
</g>
<!-- |cpu$is_sra@3 -->
<g id="id256" logical_entity="|cpu$is_sra" class="node">
<title>|cpu$is_sra@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3410 1587,-3410 1587,-3396 1601,-3396 1601,-3410"></polygon>
</g>
<!-- |cpu$is_srai@1 -->
<g id="id259" logical_entity="|cpu$is_srai" class="node">
<title>|cpu$is_srai@1</title>
<g id="a_id259"><a xlink:title="$is_srai = $dec_bits ==? 11'b1_101_0010011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-850 1027,-850 1027,-824 1081,-824 1081,-850"></polygon>
<text text-anchor="middle" x="1054" y="-840" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-829" font-family="Times,serif" font-size="10.00" fill="purple"> srai</text>
</a>
</g>
</g>
<!-- |cpu$is_srai@2 -->
<g id="id260" logical_entity="|cpu$is_srai" class="node">
<title>|cpu$is_srai@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2178 1137,-2178 1137,-2164 1151,-2164 1151,-2178"></polygon>
</g>
<!-- |cpu$is_srai@3 -->
<g id="id262" logical_entity="|cpu$is_srai" class="node">
<title>|cpu$is_srai@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3442 1587,-3442 1587,-3428 1601,-3428 1601,-3442"></polygon>
</g>
<!-- |cpu$is_srl@1 -->
<g id="id265" logical_entity="|cpu$is_srl" class="node">
<title>|cpu$is_srl@1</title>
<g id="a_id265"><a xlink:title="$is_srl = $dec_bits ==? 11'b0_101_0110011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-894 1027,-894 1027,-868 1081,-868 1081,-894"></polygon>
<text text-anchor="middle" x="1054" y="-884" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-873" font-family="Times,serif" font-size="10.00" fill="purple"> srl</text>
</a>
</g>
</g>
<!-- |cpu$is_srl@2 -->
<g id="id266" logical_entity="|cpu$is_srl" class="node">
<title>|cpu$is_srl@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2210 1137,-2210 1137,-2196 1151,-2196 1151,-2210"></polygon>
</g>
<!-- |cpu$is_srl@3 -->
<g id="id268" logical_entity="|cpu$is_srl" class="node">
<title>|cpu$is_srl@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3474 1587,-3474 1587,-3460 1601,-3460 1601,-3474"></polygon>
</g>
<!-- |cpu$is_srli@1 -->
<g id="id271" logical_entity="|cpu$is_srli" class="node">
<title>|cpu$is_srli@1</title>
<g id="a_id271"><a xlink:title="$is_srli = $dec_bits ==? 11'b0_101_0010011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-1026 1027,-1026 1027,-1000 1081,-1000 1081,-1026"></polygon>
<text text-anchor="middle" x="1054" y="-1016" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-1005" font-family="Times,serif" font-size="10.00" fill="purple"> srli</text>
</a>
</g>
</g>
<!-- |cpu$is_srli@2 -->
<g id="id272" logical_entity="|cpu$is_srli" class="node">
<title>|cpu$is_srli@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2242 1137,-2242 1137,-2228 1151,-2228 1151,-2242"></polygon>
</g>
<!-- |cpu$is_srli@3 -->
<g id="id274" logical_entity="|cpu$is_srli" class="node">
<title>|cpu$is_srli@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3506 1587,-3506 1587,-3492 1601,-3492 1601,-3506"></polygon>
</g>
<!-- |cpu$is_sub@1 -->
<g id="id277" logical_entity="|cpu$is_sub" class="node">
<title>|cpu$is_sub@1</title>
<g id="a_id277"><a xlink:title="$is_sub = $dec_bits ==? 11'b1_000_0110011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-1070 1027,-1070 1027,-1044 1081,-1044 1081,-1070"></polygon>
<text text-anchor="middle" x="1054" y="-1060" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-1049" font-family="Times,serif" font-size="10.00" fill="purple"> sub</text>
</a>
</g>
</g>
<!-- |cpu$is_sub@2 -->
<g id="id278" logical_entity="|cpu$is_sub" class="node">
<title>|cpu$is_sub@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2274 1137,-2274 1137,-2260 1151,-2260 1151,-2274"></polygon>
</g>
<!-- |cpu$is_sub@3 -->
<g id="id280" logical_entity="|cpu$is_sub" class="node">
<title>|cpu$is_sub@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3538 1587,-3538 1587,-3524 1601,-3524 1601,-3538"></polygon>
</g>
<!-- |cpu$is_sw@1 -->
<g id="id283" logical_entity="|cpu$is_sw" class="node">
<title>|cpu$is_sw@1</title>
<g id="a_id283"><a xlink:title="$is_sw = $dec_bits ==? 11'bx_010_0100011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-1510 1027,-1510 1027,-1484 1081,-1484 1081,-1510"></polygon>
<text text-anchor="middle" x="1054" y="-1500" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-1489" font-family="Times,serif" font-size="10.00" fill="purple"> sw</text>
</a>
</g>
</g>
<!-- |cpu$is_u_instr@1 -->
<g id="id285" logical_entity="|cpu$is_u_instr" class="node">
<title>|cpu$is_u_instr@1</title>
<g id="a_id285"><a xlink:title="$is_u_instr = $instr[6:2] ==? 5'b0x101;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="721,-1357.5 667,-1357.5 667,-1320.5 721,-1320.5 721,-1357.5"></polygon>
<text text-anchor="middle" x="694" y="-1347.5" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="694" y="-1336.5" font-family="Times,serif" font-size="10.00" fill="purple"> u_</text>
<text text-anchor="middle" x="694" y="-1325.5" font-family="Times,serif" font-size="10.00" fill="purple"> instr</text>
</a>
</g>
</g>
<!-- |cpu$is_xor@1 -->
<g id="id287" logical_entity="|cpu$is_xor" class="node">
<title>|cpu$is_xor@1</title>
<g id="a_id287"><a xlink:title="$is_xor = $dec_bits ==? 11'b0_100_0110011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-1114 1027,-1114 1027,-1088 1081,-1088 1081,-1114"></polygon>
<text text-anchor="middle" x="1054" y="-1104" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-1093" font-family="Times,serif" font-size="10.00" fill="purple"> xor</text>
</a>
</g>
</g>
<!-- |cpu$is_xor@2 -->
<g id="id288" logical_entity="|cpu$is_xor" class="node">
<title>|cpu$is_xor@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2306 1137,-2306 1137,-2292 1151,-2292 1151,-2306"></polygon>
</g>
<!-- |cpu$is_xor@3 -->
<g id="id290" logical_entity="|cpu$is_xor" class="node">
<title>|cpu$is_xor@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3570 1587,-3570 1587,-3556 1601,-3556 1601,-3570"></polygon>
</g>
<!-- |cpu$is_xori@1 -->
<g id="id293" logical_entity="|cpu$is_xori" class="node">
<title>|cpu$is_xori@1</title>
<g id="a_id293"><a xlink:title="$is_xori = $dec_bits ==? 11'bx_100_0010011;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1081,-1158 1027,-1158 1027,-1132 1081,-1132 1081,-1158"></polygon>
<text text-anchor="middle" x="1054" y="-1148" font-family="Times,serif" font-size="10.00" fill="purple">$is_</text>
<text text-anchor="middle" x="1054" y="-1137" font-family="Times,serif" font-size="10.00" fill="purple"> xori</text>
</a>
</g>
</g>
<!-- |cpu$is_xori@2 -->
<g id="id294" logical_entity="|cpu$is_xori" class="node">
<title>|cpu$is_xori@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2338 1137,-2338 1137,-2324 1151,-2324 1151,-2338"></polygon>
</g>
<!-- |cpu$is_xori@3 -->
<g id="id296" logical_entity="|cpu$is_xori" class="node">
<title>|cpu$is_xori@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3602 1587,-3602 1587,-3588 1601,-3588 1601,-3602"></polygon>
</g>
<!-- |cpu$jalr_tgt_pc@2 -->
<g id="id299" logical_entity="|cpu$jalr_tgt_pc" class="node">
<title>|cpu$jalr_tgt_pc@2</title>
<g id="a_id299"><a xlink:title="$jalr_tgt_pc[31:0] = $imm + $src1_value;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1621,-2794.5 1567,-2794.5 1567,-2757.5 1621,-2757.5 1621,-2794.5"></polygon>
<text text-anchor="middle" x="1594" y="-2784.5" font-family="Times,serif" font-size="10.00" fill="purple">$jalr_</text>
<text text-anchor="middle" x="1594" y="-2773.5" font-family="Times,serif" font-size="10.00" fill="purple"> tgt_</text>
<text text-anchor="middle" x="1594" y="-2762.5" font-family="Times,serif" font-size="10.00" fill="purple"> pc</text>
</a>
</g>
</g>
<!-- |cpu$jalr_tgt_pc@3 -->
<g id="id300" logical_entity="|cpu$jalr_tgt_pc" class="node">
<title>|cpu$jalr_tgt_pc@3</title>
<polygon fill="grey" stroke="purple" points="1511,-3314 1497,-3314 1497,-3300 1511,-3300 1511,-3314"></polygon>
</g>
<!-- |cpu$ld_data@5 -->
<g id="id304" logical_entity="|cpu$ld_data" class="node">
<title>|cpu$ld_data@5</title>
<g id="a_id304"><a xlink:title="$ld_data[31:0] = $dmem_rd_data[31:0];">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="2239,-4366 2185,-4366 2185,-4340 2239,-4340 2239,-4366"></polygon>
<text text-anchor="middle" x="2212" y="-4356" font-family="Times,serif" font-size="10.00" fill="purple">$ld_</text>
<text text-anchor="middle" x="2212" y="-4345" font-family="Times,serif" font-size="10.00" fill="purple"> data</text>
</a>
</g>
</g>
<!-- |cpu$opcode@1 -->
<g id="id306" logical_entity="|cpu$opcode" class="node">
<title>|cpu$opcode@1</title>
<g id="a_id306"><a xlink:title="$opcode[6:0] = $instr[6:0];">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="901,-1074.5 847,-1074.5 847,-1059.5 901,-1059.5 901,-1074.5"></polygon>
<text text-anchor="middle" x="874" y="-1064.5" font-family="Times,serif" font-size="10.00" fill="purple">$opcode</text>
</a>
</g>
</g>
<!-- |cpu$pc@0 -->
<g id="id308" logical_entity="|cpu$pc" class="node">
<title>|cpu$pc@0</title>
<g id="a_id308"><a xlink:title="$pc[31:0] = >>1$reset ? 32'b0 :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>>3$valid_taken_br ? >>3$br_tgt_pc :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>>3$valid_load ? >>3$inc_pc :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(>>3$valid_jump &amp;&amp; >>3$is_jal) ? >>3$br_tgt_pc :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(>>3$valid_jump &amp;&amp; >>3$is_jalr) ? >>3$jalr_tgt_pc : >>1$inc_pc;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="86,-1080.5 32,-1080.5 32,-1065.5 86,-1065.5 86,-1080.5"></polygon>
<text text-anchor="middle" x="59" y="-1070.5" font-family="Times,serif" font-size="10.00" fill="purple">$pc</text>
</a>
</g>
</g>
<!-- |cpu$pc@1 -->
<g id="id309" logical_entity="|cpu$pc" class="node">
<title>|cpu$pc@1</title>
<polygon fill="grey" stroke="purple" points="338,-1101 324,-1101 324,-1087 338,-1087 338,-1101"></polygon>
</g>
<!-- |cpu$pc@2 -->
<g id="id311" logical_entity="|cpu$pc" class="node">
<title>|cpu$pc@2</title>
<polygon fill="grey" stroke="purple" points="1511,-2358 1497,-2358 1497,-2344 1511,-2344 1511,-2358"></polygon>
</g>
<!-- |cpu$pc@3 -->
<g id="id313" logical_entity="|cpu$pc" class="node">
<title>|cpu$pc@3</title>
<polygon fill="grey" stroke="purple" points="1601,-2962 1587,-2962 1587,-2948 1601,-2948 1601,-2962"></polygon>
</g>
<!-- |cpu$rd@1 -->
<g id="id327" logical_entity="|cpu$rd" class="node">
<title>|cpu$rd@1</title>
<g id="a_id327"><a xlink:title="$rd[4:0] = $instr[11:7];">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="901,-1597.5 847,-1597.5 847,-1582.5 901,-1582.5 901,-1597.5"></polygon>
<text text-anchor="middle" x="874" y="-1587.5" font-family="Times,serif" font-size="10.00" fill="purple">$rd</text>
</a>
</g>
</g>
<!-- |cpu$rd@2 -->
<g id="id328" logical_entity="|cpu$rd" class="node">
<title>|cpu$rd@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2466 1137,-2466 1137,-2452 1151,-2452 1151,-2466"></polygon>
</g>
<!-- |cpu$rd@3 -->
<g id="id330" logical_entity="|cpu$rd" class="node">
<title>|cpu$rd@3</title>
<polygon fill="grey" stroke="purple" points="1601,-2930 1587,-2930 1587,-2916 1601,-2916 1601,-2930"></polygon>
</g>
<!-- |cpu$rd_valid@1 -->
<g id="id334" logical_entity="|cpu$rd_valid" class="node">
<title>|cpu$rd_valid@1</title>
<g id="a_id334"><a xlink:title="$rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="811,-1402 757,-1402 757,-1376 811,-1376 811,-1402"></polygon>
<text text-anchor="middle" x="784" y="-1392" font-family="Times,serif" font-size="10.00" fill="purple">$rd_</text>
<text text-anchor="middle" x="784" y="-1381" font-family="Times,serif" font-size="10.00" fill="purple"> valid</text>
</a>
</g>
</g>
<!-- |cpu$rd_valid@2 -->
<g id="id335" logical_entity="|cpu$rd_valid" class="node">
<title>|cpu$rd_valid@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2562 1137,-2562 1137,-2548 1151,-2548 1151,-2562"></polygon>
</g>
<!-- |cpu$rd_valid@3 -->
<g id="id337" logical_entity="|cpu$rd_valid" class="node">
<title>|cpu$rd_valid@3</title>
<polygon fill="grey" stroke="purple" points="1601,-3634 1587,-3634 1587,-3620 1601,-3620 1601,-3634"></polygon>
</g>
<!-- |cpu$reset@0 -->
<g id="id343" logical_entity="|cpu$reset" class="node">
<title>|cpu$reset@0</title>
<g id="a_id343"><a xlink:title="$reset = *reset;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="86,-1047.5 32,-1047.5 32,-1032.5 86,-1032.5 86,-1047.5"></polygon>
<text text-anchor="middle" x="59" y="-1037.5" font-family="Times,serif" font-size="10.00" fill="purple">$reset</text>
</a>
</g>
</g>
<!-- |cpu$reset@1 -->
<g id="id344" logical_entity="|cpu$reset" class="node">
<title>|cpu$reset@1</title>
<polygon fill="grey" stroke="purple" points="338,-1133 324,-1133 324,-1119 338,-1119 338,-1133"></polygon>
</g>
<!-- |cpu$reset@2 -->
<g id="id346" logical_entity="|cpu$reset" class="node">
<title>|cpu$reset@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2754 1137,-2754 1137,-2740 1151,-2740 1151,-2754"></polygon>
</g>
<!-- |cpu$reset@3 -->
<g id="id348" logical_entity="|cpu$reset" class="node">
<title>|cpu$reset@3</title>
<polygon fill="grey" stroke="purple" points="1511,-2962 1497,-2962 1497,-2948 1511,-2948 1511,-2962"></polygon>
</g>
<!-- |cpu$reset@4 -->
<g id="id350" logical_entity="|cpu$reset" class="node">
<title>|cpu$reset@4</title>
<polygon fill="grey" stroke="purple" points="1781,-4280 1767,-4280 1767,-4266 1781,-4266 1781,-4280"></polygon>
</g>
<!-- |cpu$result@3 -->
<g id="id352" logical_entity="|cpu$result" class="node">
<title>|cpu$result@3</title>
<g id="a_id352"><a xlink:title="$result[31:0] = $is_addi ? $src1_value + $imm :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_add ? $src1_value + $src2_value : 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_andi ? $src1_value &amp; $imm :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_xori ? $src1_value ^ $imm :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_ori ? $src1_value | $imm :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_slli ? $src1_value << $imm[5:0] : 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_srli ? $src1_value >> $imm[5:0] :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_and ? $src1_value &amp; $src2_value :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_xor ? $src1_value ^ $src2_value :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_or ? $src1_value | $src2_value : 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_sub ? $src1_value - $src2_value : 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_sll ? $src1_value << $src2_value[4:0] : 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_srl ? $src1_value >> $src2_value[4:0] :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_sltu ? $src1_value < $src2_value :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_lui ? {$imm[31:12],12'b0} :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_auipc ? $pc + $imm : 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_jal ? $pc + $imm :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_jalr ? $pc + $imm :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_srai ? {{32{$src1_value[31]}},$src1_value} >> $imm[4:0] :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_sra ? {{32{$src1_value[31]}},$src1_value} >> $src2_value[4:0] :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_slt ? ($src1_value[31] == $src2_value[31]) ? $sltu_result : {31'b0,$src1_value[31]} :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_slti ? ($src1_value[31] == $imm[31]) ? $sltiu_result : {31'b0,$src1_value[31]} :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_sltiu ? $src1_value < $imm : 32'bx;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1711,-3698.5 1657,-3698.5 1657,-3683.5 1711,-3683.5 1711,-3698.5"></polygon>
<text text-anchor="middle" x="1684" y="-3688.5" font-family="Times,serif" font-size="10.00" fill="purple">$result</text>
</a>
</g>
</g>
<!-- |cpu$result@4 -->
<g id="id353" logical_entity="|cpu$result" class="node">
<title>|cpu$result@4</title>
<polygon fill="grey" stroke="purple" points="1781,-4088 1767,-4088 1767,-4074 1781,-4074 1781,-4088"></polygon>
</g>
<!-- |cpu$rf_rd_data1@2 -->
<g id="id429" logical_entity="|cpu$rf_rd_data1" class="node">
<title>|cpu$rf_rd_data1@2</title>
<g id="a_id429"><a xlink:title="$rf_rd_data1[31:0] = /xreg[$rf_rd_index1]>>2$value;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1441,-2299.5 1387,-2299.5 1387,-2262.5 1441,-2262.5 1441,-2299.5"></polygon>
<text text-anchor="middle" x="1414" y="-2289.5" font-family="Times,serif" font-size="10.00" fill="purple">$rf_</text>
<text text-anchor="middle" x="1414" y="-2278.5" font-family="Times,serif" font-size="10.00" fill="purple"> rd_</text>
<text text-anchor="middle" x="1414" y="-2267.5" font-family="Times,serif" font-size="10.00" fill="purple"> data1</text>
</a>
</g>
</g>
<!-- |cpu$rf_rd_data2@2 -->
<g id="id433" logical_entity="|cpu$rf_rd_data2" class="node">
<title>|cpu$rf_rd_data2@2</title>
<g id="a_id433"><a xlink:title="$rf_rd_data2[31:0] = /xreg[$rf_rd_index2]>>2$value;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1441,-1753.5 1387,-1753.5 1387,-1716.5 1441,-1716.5 1441,-1753.5"></polygon>
<text text-anchor="middle" x="1414" y="-1743.5" font-family="Times,serif" font-size="10.00" fill="purple">$rf_</text>
<text text-anchor="middle" x="1414" y="-1732.5" font-family="Times,serif" font-size="10.00" fill="purple"> rd_</text>
<text text-anchor="middle" x="1414" y="-1721.5" font-family="Times,serif" font-size="10.00" fill="purple"> data2</text>
</a>
</g>
</g>
<!-- |cpu$rf_rd_en1@2 -->
<g id="id437" logical_entity="|cpu$rf_rd_en1" class="node">
<title>|cpu$rf_rd_en1@2</title>
<g id="a_id437"><a xlink:title="$rf_rd_en1 = $rs1_valid ? 1'b1 : 1'b0;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1261,-2299.5 1207,-2299.5 1207,-2262.5 1261,-2262.5 1261,-2299.5"></polygon>
<text text-anchor="middle" x="1234" y="-2289.5" font-family="Times,serif" font-size="10.00" fill="purple">$rf_</text>
<text text-anchor="middle" x="1234" y="-2278.5" font-family="Times,serif" font-size="10.00" fill="purple"> rd_</text>
<text text-anchor="middle" x="1234" y="-2267.5" font-family="Times,serif" font-size="10.00" fill="purple"> en1</text>
</a>
</g>
</g>
<!-- |cpu$rf_rd_en2@2 -->
<g id="id439" logical_entity="|cpu$rf_rd_en2" class="node">
<title>|cpu$rf_rd_en2@2</title>
<g id="a_id439"><a xlink:title="$rf_rd_en2 = $rs2_valid ? 1'b1 : 1'b0;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1261,-1721.5 1207,-1721.5 1207,-1684.5 1261,-1684.5 1261,-1721.5"></polygon>
<text text-anchor="middle" x="1234" y="-1711.5" font-family="Times,serif" font-size="10.00" fill="purple">$rf_</text>
<text text-anchor="middle" x="1234" y="-1700.5" font-family="Times,serif" font-size="10.00" fill="purple"> rd_</text>
<text text-anchor="middle" x="1234" y="-1689.5" font-family="Times,serif" font-size="10.00" fill="purple"> en2</text>
</a>
</g>
</g>
<!-- |cpu$rf_rd_index1@2 -->
<g id="id441" logical_entity="|cpu$rf_rd_index1" class="node">
<title>|cpu$rf_rd_index1@2</title>
<g id="a_id441"><a xlink:title="$rf_rd_index1[4:0] = $rs1;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1351,-2261.5 1297,-2261.5 1297,-2224.5 1351,-2224.5 1351,-2261.5"></polygon>
<text text-anchor="middle" x="1324" y="-2251.5" font-family="Times,serif" font-size="10.00" fill="purple">$rf_</text>
<text text-anchor="middle" x="1324" y="-2240.5" font-family="Times,serif" font-size="10.00" fill="purple"> rd_</text>
<text text-anchor="middle" x="1324" y="-2229.5" font-family="Times,serif" font-size="10.00" fill="purple"> index1</text>
</a>
</g>
</g>
<!-- |cpu$rf_rd_index2@2 -->
<g id="id444" logical_entity="|cpu$rf_rd_index2" class="node">
<title>|cpu$rf_rd_index2@2</title>
<g id="a_id444"><a xlink:title="$rf_rd_index2[4:0] = $rs2;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1351,-1715.5 1297,-1715.5 1297,-1678.5 1351,-1678.5 1351,-1715.5"></polygon>
<text text-anchor="middle" x="1324" y="-1705.5" font-family="Times,serif" font-size="10.00" fill="purple">$rf_</text>
<text text-anchor="middle" x="1324" y="-1694.5" font-family="Times,serif" font-size="10.00" fill="purple"> rd_</text>
<text text-anchor="middle" x="1324" y="-1683.5" font-family="Times,serif" font-size="10.00" fill="purple"> index2</text>
</a>
</g>
</g>
<!-- |cpu$rf_wr_data@3 -->
<g id="id447" logical_entity="|cpu$rf_wr_data" class="node">
<title>|cpu$rf_wr_data@3</title>
<g id="a_id447"><a xlink:title="$rf_wr_data[31:0] = $valid ? $result : >>2$ld_data[31:0];">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1801,-3008.5 1747,-3008.5 1747,-2971.5 1801,-2971.5 1801,-3008.5"></polygon>
<text text-anchor="middle" x="1774" y="-2998.5" font-family="Times,serif" font-size="10.00" fill="purple">$rf_</text>
<text text-anchor="middle" x="1774" y="-2987.5" font-family="Times,serif" font-size="10.00" fill="purple"> wr_</text>
<text text-anchor="middle" x="1774" y="-2976.5" font-family="Times,serif" font-size="10.00" fill="purple"> data</text>
</a>
</g>
</g>
<!-- |cpu$rf_wr_en@3 -->
<g id="id452" logical_entity="|cpu$rf_wr_en" class="node">
<title>|cpu$rf_wr_en@3</title>
<g id="a_id452"><a xlink:title="$rf_wr_en = (($rd[4:0] != 5'b0) &amp;&amp; ($rd_valid) &amp;&amp; ($valid)) || >>2$valid_load;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1711,-2979.5 1657,-2979.5 1657,-2942.5 1711,-2942.5 1711,-2979.5"></polygon>
<text text-anchor="middle" x="1684" y="-2969.5" font-family="Times,serif" font-size="10.00" fill="purple">$rf_</text>
<text text-anchor="middle" x="1684" y="-2958.5" font-family="Times,serif" font-size="10.00" fill="purple"> wr_</text>
<text text-anchor="middle" x="1684" y="-2947.5" font-family="Times,serif" font-size="10.00" fill="purple"> en</text>
</a>
</g>
</g>
<!-- |cpu$rf_wr_index@3 -->
<g id="id457" logical_entity="|cpu$rf_wr_index" class="node">
<title>|cpu$rf_wr_index@3</title>
<g id="a_id457"><a xlink:title="$rf_wr_index[4:0] = $rd[4:0];">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1801,-2953.5 1747,-2953.5 1747,-2916.5 1801,-2916.5 1801,-2953.5"></polygon>
<text text-anchor="middle" x="1774" y="-2943.5" font-family="Times,serif" font-size="10.00" fill="purple">$rf_</text>
<text text-anchor="middle" x="1774" y="-2932.5" font-family="Times,serif" font-size="10.00" fill="purple"> wr_</text>
<text text-anchor="middle" x="1774" y="-2921.5" font-family="Times,serif" font-size="10.00" fill="purple"> index</text>
</a>
</g>
</g>
<!-- |cpu$rs1@1 -->
<g id="id460" logical_entity="|cpu$rs1" class="node">
<title>|cpu$rs1@1</title>
<g id="a_id460"><a xlink:title="$rs1[4:0] = $instr[19:15];">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="901,-179.5 847,-179.5 847,-164.5 901,-164.5 901,-179.5"></polygon>
<text text-anchor="middle" x="874" y="-169.5" font-family="Times,serif" font-size="10.00" fill="purple">$rs1</text>
</a>
</g>
</g>
<!-- |cpu$rs1@2 -->
<g id="id461" logical_entity="|cpu$rs1" class="node">
<title>|cpu$rs1@2</title>
<polygon fill="grey" stroke="purple" points="1241,-1754 1227,-1754 1227,-1740 1241,-1740 1241,-1754"></polygon>
</g>
<!-- |cpu$rs1_valid@1 -->
<g id="id465" logical_entity="|cpu$rs1_valid" class="node">
<title>|cpu$rs1_valid@1</title>
<g id="a_id465"><a xlink:title="$rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="811,-1490 757,-1490 757,-1464 811,-1464 811,-1490"></polygon>
<text text-anchor="middle" x="784" y="-1480" font-family="Times,serif" font-size="10.00" fill="purple">$rs1_</text>
<text text-anchor="middle" x="784" y="-1469" font-family="Times,serif" font-size="10.00" fill="purple"> valid</text>
</a>
</g>
</g>
<!-- |cpu$rs1_valid@2 -->
<g id="id466" logical_entity="|cpu$rs1_valid" class="node">
<title>|cpu$rs1_valid@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2594 1137,-2594 1137,-2580 1151,-2580 1151,-2594"></polygon>
</g>
<!-- |cpu$rs2@1 -->
<g id="id472" logical_entity="|cpu$rs2" class="node">
<title>|cpu$rs2@1</title>
<g id="a_id472"><a xlink:title="$rs2[4:0] = $instr[24:20];">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="901,-212.5 847,-212.5 847,-197.5 901,-197.5 901,-212.5"></polygon>
<text text-anchor="middle" x="874" y="-202.5" font-family="Times,serif" font-size="10.00" fill="purple">$rs2</text>
</a>
</g>
</g>
<!-- |cpu$rs2@2 -->
<g id="id473" logical_entity="|cpu$rs2" class="node">
<title>|cpu$rs2@2</title>
<polygon fill="grey" stroke="purple" points="1241,-1666 1227,-1666 1227,-1652 1241,-1652 1241,-1666"></polygon>
</g>
<!-- |cpu$rs2_valid@1 -->
<g id="id477" logical_entity="|cpu$rs2_valid" class="node">
<title>|cpu$rs2_valid@1</title>
<g id="a_id477"><a xlink:title="$rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="811,-1534 757,-1534 757,-1508 811,-1508 811,-1534"></polygon>
<text text-anchor="middle" x="784" y="-1524" font-family="Times,serif" font-size="10.00" fill="purple">$rs2_</text>
<text text-anchor="middle" x="784" y="-1513" font-family="Times,serif" font-size="10.00" fill="purple"> valid</text>
</a>
</g>
</g>
<!-- |cpu$rs2_valid@2 -->
<g id="id478" logical_entity="|cpu$rs2_valid" class="node">
<title>|cpu$rs2_valid@2</title>
<polygon fill="grey" stroke="purple" points="1151,-2530 1137,-2530 1137,-2516 1151,-2516 1151,-2530"></polygon>
</g>
<!-- |cpu$sltiu_result@3 -->
<g id="id483" logical_entity="|cpu$sltiu_result" class="node">
<title>|cpu$sltiu_result@3</title>
<g id="a_id483"><a xlink:title="$sltiu_result = $src1_value < $imm;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1621,-3858 1567,-3858 1567,-3832 1621,-3832 1621,-3858"></polygon>
<text text-anchor="middle" x="1594" y="-3848" font-family="Times,serif" font-size="10.00" fill="purple">$sltiu_</text>
<text text-anchor="middle" x="1594" y="-3837" font-family="Times,serif" font-size="10.00" fill="purple"> result</text>
</a>
</g>
</g>
<!-- |cpu$sltu_result@3 -->
<g id="id486" logical_entity="|cpu$sltu_result" class="node">
<title>|cpu$sltu_result@3</title>
<g id="a_id486"><a xlink:title="$sltu_result = $src1_value < $src2_value;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1621,-3902 1567,-3902 1567,-3876 1621,-3876 1621,-3902"></polygon>
<text text-anchor="middle" x="1594" y="-3892" font-family="Times,serif" font-size="10.00" fill="purple">$sltu_</text>
<text text-anchor="middle" x="1594" y="-3881" font-family="Times,serif" font-size="10.00" fill="purple"> result</text>
</a>
</g>
</g>
<!-- |cpu$src1_value@2 -->
<g id="id489" logical_entity="|cpu$src1_value" class="node">
<title>|cpu$src1_value@2</title>
<g id="a_id489"><a xlink:title="$src1_value[31:0] = ((>>1$rf_wr_en) &amp;&amp; (>>1$rd == $rs1)) ? >>1$result : $rf_rd_data1[31:0];">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1531,-2294 1477,-2294 1477,-2268 1531,-2268 1531,-2294"></polygon>
<text text-anchor="middle" x="1504" y="-2284" font-family="Times,serif" font-size="10.00" fill="purple">$src1_</text>
<text text-anchor="middle" x="1504" y="-2273" font-family="Times,serif" font-size="10.00" fill="purple"> value</text>
</a>
</g>
</g>
<!-- |cpu$src1_value@3 -->
<g id="id490" logical_entity="|cpu$src1_value" class="node">
<title>|cpu$src1_value@3</title>
<polygon fill="grey" stroke="purple" points="1511,-2994 1497,-2994 1497,-2980 1511,-2980 1511,-2994"></polygon>
</g>
<!-- |cpu$src2_value@2 -->
<g id="id497" logical_entity="|cpu$src2_value" class="node">
<title>|cpu$src2_value@2</title>
<g id="a_id497"><a xlink:title="$src2_value[31:0] = ((>>1$rf_wr_en) &amp;&amp; (>>1$rd == $rs2)) ? >>1$result : $rf_rd_data2[31:0];">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1531,-2250 1477,-2250 1477,-2224 1531,-2224 1531,-2250"></polygon>
<text text-anchor="middle" x="1504" y="-2240" font-family="Times,serif" font-size="10.00" fill="purple">$src2_</text>
<text text-anchor="middle" x="1504" y="-2229" font-family="Times,serif" font-size="10.00" fill="purple"> value</text>
</a>
</g>
</g>
<!-- |cpu$src2_value@3 -->
<g id="id498" logical_entity="|cpu$src2_value" class="node">
<title>|cpu$src2_value@3</title>
<polygon fill="grey" stroke="purple" points="1511,-3058 1497,-3058 1497,-3044 1511,-3044 1511,-3058"></polygon>
</g>
<!-- |cpu$src2_value@4 -->
<g id="id500" logical_entity="|cpu$src2_value" class="node">
<title>|cpu$src2_value@4</title>
<polygon fill="grey" stroke="purple" points="1781,-4248 1767,-4248 1767,-4234 1781,-4234 1781,-4248"></polygon>
</g>
<!-- |cpu$taken_br@3 -->
<g id="id507" logical_entity="|cpu$taken_br" class="node">
<title>|cpu$taken_br@3</title>
<g id="a_id507"><a xlink:title="$taken_br = $is_beq ? ($src1_value == $src2_value) :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_bne ? ($src1_value != $src2_value) :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_blt ? (($src1_value < $src2_value) ^ ($src1_value[31] != $src2_value[31])) :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_bge ? (($src1_value >= $src2_value) ^ ($src1_value[31] != $src2_value[31])) :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_bltu ? ($src1_value < $src2_value) :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$is_bgeu ? ($src1_value >= $src2_value) : 1'b0;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1621,-3986 1567,-3986 1567,-3960 1621,-3960 1621,-3986"></polygon>
<text text-anchor="middle" x="1594" y="-3976" font-family="Times,serif" font-size="10.00" fill="purple">$taken_</text>
<text text-anchor="middle" x="1594" y="-3965" font-family="Times,serif" font-size="10.00" fill="purple"> br</text>
</a>
</g>
</g>
<!-- |cpu$valid@3 -->
<g id="id530" logical_entity="|cpu$valid" class="node">
<title>|cpu$valid@3</title>
<g id="a_id530"><a xlink:title="$valid = !(>>1$valid_taken_br || >>2$valid_taken_br || >>1$valid_load || >>2$valid_load || >>1$valid_jump || >>2$valid_jump);">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1621,-4019.5 1567,-4019.5 1567,-4004.5 1621,-4004.5 1621,-4019.5"></polygon>
<text text-anchor="middle" x="1594" y="-4009.5" font-family="Times,serif" font-size="10.00" fill="purple">$valid</text>
</a>
</g>
</g>
<!-- |cpu$valid@4 -->
<g id="id531" logical_entity="|cpu$valid" class="node">
<title>|cpu$valid@4</title>
<polygon fill="grey" stroke="purple" points="1781,-4120 1767,-4120 1767,-4106 1781,-4106 1781,-4120"></polygon>
</g>
<!-- |cpu$valid_jump@3 -->
<g id="id539" logical_entity="|cpu$valid_jump" class="node">
<title>|cpu$valid_jump@3</title>
<g id="a_id539"><a xlink:title="$valid_jump = $valid &amp;&amp; $is_jump;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1711,-3621 1657,-3621 1657,-3595 1711,-3595 1711,-3621"></polygon>
<text text-anchor="middle" x="1684" y="-3611" font-family="Times,serif" font-size="10.00" fill="purple">$valid_</text>
<text text-anchor="middle" x="1684" y="-3600" font-family="Times,serif" font-size="10.00" fill="purple"> jump</text>
</a>
</g>
</g>
<!-- |cpu$valid_jump@4 -->
<g id="id540" logical_entity="|cpu$valid_jump" class="node">
<title>|cpu$valid_jump@4</title>
<polygon fill="grey" stroke="purple" points="1781,-4152 1767,-4152 1767,-4138 1781,-4138 1781,-4152"></polygon>
</g>
<!-- |cpu$valid_jump@5 -->
<g id="id542" logical_entity="|cpu$valid_jump" class="node">
<title>|cpu$valid_jump@5</title>
<polygon fill="grey" stroke="purple" points="2093,-4386 2079,-4386 2079,-4372 2093,-4372 2093,-4386"></polygon>
</g>
<!-- |cpu$valid_load@3 -->
<g id="id546" logical_entity="|cpu$valid_load" class="node">
<title>|cpu$valid_load@3</title>
<g id="a_id546"><a xlink:title="$valid_load = $valid &amp;&amp; $is_load;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1711,-3665 1657,-3665 1657,-3639 1711,-3639 1711,-3665"></polygon>
<text text-anchor="middle" x="1684" y="-3655" font-family="Times,serif" font-size="10.00" fill="purple">$valid_</text>
<text text-anchor="middle" x="1684" y="-3644" font-family="Times,serif" font-size="10.00" fill="purple"> load</text>
</a>
</g>
</g>
<!-- |cpu$valid_load@4 -->
<g id="id547" logical_entity="|cpu$valid_load" class="node">
<title>|cpu$valid_load@4</title>
<polygon fill="grey" stroke="purple" points="1781,-4184 1767,-4184 1767,-4170 1781,-4170 1781,-4184"></polygon>
</g>
<!-- |cpu$valid_load@5 -->
<g id="id549" logical_entity="|cpu$valid_load" class="node">
<title>|cpu$valid_load@5</title>
<polygon fill="grey" stroke="purple" points="2093,-4450 2079,-4450 2079,-4436 2093,-4436 2093,-4450"></polygon>
</g>
<!-- |cpu$valid_taken_br@3 -->
<g id="id553" logical_entity="|cpu$valid_taken_br" class="node">
<title>|cpu$valid_taken_br@3</title>
<g id="a_id553"><a xlink:title="$valid_taken_br = $valid &amp;&amp; $taken_br;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1711,-3999.5 1657,-3999.5 1657,-3962.5 1711,-3962.5 1711,-3999.5"></polygon>
<text text-anchor="middle" x="1684" y="-3989.5" font-family="Times,serif" font-size="10.00" fill="purple">$valid_</text>
<text text-anchor="middle" x="1684" y="-3978.5" font-family="Times,serif" font-size="10.00" fill="purple"> taken_</text>
<text text-anchor="middle" x="1684" y="-3967.5" font-family="Times,serif" font-size="10.00" fill="purple"> br</text>
</a>
</g>
</g>
<!-- |cpu$valid_taken_br@4 -->
<g id="id554" logical_entity="|cpu$valid_taken_br" class="node">
<title>|cpu$valid_taken_br@4</title>
<polygon fill="grey" stroke="purple" points="1781,-4216 1767,-4216 1767,-4202 1781,-4202 1781,-4216"></polygon>
</g>
<!-- |cpu$valid_taken_br@5 -->
<g id="id556" logical_entity="|cpu$valid_taken_br" class="node">
<title>|cpu$valid_taken_br@5</title>
<polygon fill="grey" stroke="purple" points="2093,-4418 2079,-4418 2079,-4404 2093,-4404 2093,-4418"></polygon>
</g>
<!-- |cpu/dmem$value@4 -->
<g id="id567" logical_entity="|cpu/dmem$value" class="node">
<title>|cpu/dmem$value@4</title>
<g id="a_id567"><a xlink:title="$value[31:0] = |cpu$reset ? &nbsp;&nbsp;#dmem :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$wr &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;? &nbsp;&nbsp;|cpu$dmem_wr_data :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$RETAIN;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="2113,-3959.5 2059,-3959.5 2059,-3944.5 2113,-3944.5 2113,-3959.5"></polygon>
<text text-anchor="middle" x="2086" y="-3949.5" font-family="Times,serif" font-size="10.00" fill="purple">$value</text>
</a>
</g>
</g>
<!-- |cpu/dmem$value@5 -->
<g id="id568" logical_entity="|cpu/dmem$value" class="node">
<title>|cpu/dmem$value@5</title>
<polygon fill="grey" stroke="purple" points="2219,-3959 2205,-3959 2205,-3945 2219,-3945 2219,-3959"></polygon>
</g>
<!-- |cpu/dmem$wr@4 -->
<g id="id574" logical_entity="|cpu/dmem$wr" class="node">
<title>|cpu/dmem$wr@4</title>
<g id="a_id574"><a xlink:title="$wr = |cpu$dmem_wr_en &amp;&amp; (|cpu$dmem_addr == #dmem);">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1987,-3959.5 1933,-3959.5 1933,-3944.5 1987,-3944.5 1987,-3959.5"></polygon>
<text text-anchor="middle" x="1960" y="-3949.5" font-family="Times,serif" font-size="10.00" fill="purple">$wr</text>
</a>
</g>
</g>
<!-- |cpu/imem$instr@1 -->
<g id="id582" logical_entity="|cpu/imem$instr" class="node">
<title>|cpu/imem$instr@1</title>
<g id="a_id582"><a xlink:title="$instr[31:0] = *instrs\[#imem\];">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="358,-1675.5 304,-1675.5 304,-1660.5 358,-1660.5 358,-1675.5"></polygon>
<text text-anchor="middle" x="331" y="-1665.5" font-family="Times,serif" font-size="10.00" fill="purple">$instr</text>
</a>
</g>
</g>
<!-- |cpu/xreg$value@3 -->
<g id="id586" logical_entity="|cpu/xreg$value" class="node">
<title>|cpu/xreg$value@3</title>
<g id="a_id586"><a xlink:title="$value[31:0] = |cpu$reset ? &nbsp;&nbsp;#xreg &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$wr &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;? &nbsp;&nbsp;|cpu$rf_wr_data :
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$RETAIN;">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1891,-2801.5 1837,-2801.5 1837,-2786.5 1891,-2786.5 1891,-2801.5"></polygon>
<text text-anchor="middle" x="1864" y="-2791.5" font-family="Times,serif" font-size="10.00" fill="purple">$value</text>
</a>
</g>
</g>
<!-- |cpu/xreg$value@4 -->
<g id="id587" logical_entity="|cpu/xreg$value" class="node">
<title>|cpu/xreg$value@4</title>
<polygon fill="grey" stroke="purple" points="1967,-2802 1953,-2802 1953,-2788 1967,-2788 1967,-2802"></polygon>
</g>
<!-- |cpu/xreg$value@5 -->
<g id="id589" logical_entity="|cpu/xreg$value" class="node">
<title>|cpu/xreg$value@5</title>
<polygon fill="grey" stroke="purple" points="2093,-2802 2079,-2802 2079,-2788 2093,-2788 2093,-2802"></polygon>
</g>
<!-- |cpu/xreg$wr@3 -->
<g id="id595" logical_entity="|cpu/xreg$wr" class="node">
<title>|cpu/xreg$wr@3</title>
<g id="a_id595"><a xlink:title="$wr = |cpu$rf_wr_en &amp;&amp; (|cpu$rf_wr_index != 5'b0) &amp;&amp; (|cpu$rf_wr_index == #xreg);">
<polygon fill="#ffffff" fill-opacity="0.690196" stroke="purple" points="1801,-2801.5 1747,-2801.5 1747,-2786.5 1801,-2786.5 1801,-2801.5"></polygon>
<text text-anchor="middle" x="1774" y="-2791.5" font-family="Times,serif" font-size="10.00" fill="purple">$wr</text>
</a>
</g>
</g>
<!-- *cyc_cnt -->
<g id="node196" class="node">
<title>*cyc_cnt</title>
<polygon fill="white" stroke="#00008b" points="86,-4665.5 32,-4665.5 32,-4650.5 86,-4650.5 86,-4665.5"></polygon>
<text text-anchor="middle" x="59" y="-4655.5" font-family="Times,serif" font-size="10.00" fill="#00008b">*cyc_cnt</text>
</g>
<!-- *failed -->
<g id="node197" class="node">
<title>*failed</title>
<polygon fill="white" stroke="#00008b" points="86,-4698.5 32,-4698.5 32,-4683.5 86,-4683.5 86,-4698.5"></polygon>
<text text-anchor="middle" x="59" y="-4688.5" font-family="Times,serif" font-size="10.00" fill="#00008b">*failed</text>
</g>
<!-- *instrs -->
<g id="node198" class="node">
<title>*instrs</title>
<polygon fill="white" stroke="#00008b" points="86,-4731.5 32,-4731.5 32,-4716.5 86,-4716.5 86,-4731.5"></polygon>
<text text-anchor="middle" x="59" y="-4721.5" font-family="Times,serif" font-size="10.00" fill="#00008b">*instrs</text>
</g>
<!-- *passed -->
<g id="node199" class="node">
<title>*passed</title>
<polygon fill="white" stroke="#00008b" points="86,-4764.5 32,-4764.5 32,-4749.5 86,-4749.5 86,-4764.5"></polygon>
<text text-anchor="middle" x="59" y="-4754.5" font-family="Times,serif" font-size="10.00" fill="#00008b">*passed</text>
</g>
<!-- *reset -->
<g id="node200" class="node">
<title>*reset</title>
<polygon fill="white" stroke="#00008b" points="86,-4797.5 32,-4797.5 32,-4782.5 86,-4782.5 86,-4797.5"></polygon>
<text text-anchor="middle" x="59" y="-4787.5" font-family="Times,serif" font-size="10.00" fill="#00008b">*reset</text>
</g>
</g>
</svg>
