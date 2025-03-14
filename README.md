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

*Below is the snapshot of complete RISC-V CPU Core*  

<img width="959" alt="Final_CPU_Core" src="https://github.com/user-attachments/assets/0fece869-c289-458d-9d9f-ce16e0686aee" />
  
</details>

----------------------

* **Sandbox URL:** [RISC-V CPU Core](https://myth.makerchip.com/sandbox/0yPfNhRmk/0GZh1q0)
