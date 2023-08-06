//Write an ARM assembly code that will convert a percentage grade to a letter grade. The letter grade should then be printed out to the terminal.

//If the percentage grade is >= 90, the program should print "Congratulations! You got an A." to the terminal.
//If the percentage grade is >= 75 && < 90, the program should print "Good job! You got a B." to the terminal.
//If the percentage grade is >= 50 && < 75, the program should print "Not bad, you got a C." to the terminal.
//Otherwise, the program should print "Sorry, you got an F." to the terminal. 
//Store the percentage grade in register R5. You should verify your program works in all cases. You will get bonus marks if your program can take in the percentage grade from the command line.
//Use constants (or macros) to store the comparison grades. For example, I should not see CMP R5, #90, in your code.

//Make sure you comment every line of code except trivial MOV statements. For example, MOV R5, #100 does not need a comment.

.global _start

.equ ascore, 90
.equ bscore, 75
.equ cscore, 50

_start:
    MOV R5, #99 //The percentage grade
    LDR R6, =ascore //Load the result at the memory address 'ascore' into R6
    LDR R7, =bscore
    LDR R8, =cscore

    // Check for grade A
    MOV R1, #90        // Load 90 into R1 (A grade boundary)
    CMP R5, R1         // Compare R5 with A grade boundary
    BGE congratulations      // Branch to congrats if R5 >= 90

    // Check for grade B
    MOV R1, #75        // Load 75 into R1 (B grade lower boundary)
    CMP R5, R1         // Compare R5 with B grade lower boundary
    BGE well_done      // Branch to good_job if R5 >= 75

    // Check for grade C
    MOV R1, #50        // Load 50 into R1 (C grade lower boundary)
    CMP R5, R1         // Compare R5 with C grade lower boundary
    BGE very_poor        // Branch to not_bad if R5 >= 50

    // If none of the conditions are met, grade F
    b print_f

congratulations:
    // Print "Congratulations! You got an A."
    ADD R1, R1, #0
    MOV R7, #4 // Syscall code for write
    SWI 0

well_done:
    // Print "well done! You got a B."
    MOV R7, #4 // Syscall code for write
    SWI 0

very_poor:
    // Print "very poor, you got a C."
    MOV R7, #4 // Syscall code for write
    SWI 0

print_f:
    // Print "Sorry, you got an F."
    MOV R7, #4 // Syscall code for write
    SWI 0

    LDR R1, =amessage 
    LDR R2, =alen
    MOV R7, #4
    SWI 0

    MOV R7, #1
    SWI 0

.data
amessage:
    .asciz "Congratulations, You got an A./n"
    .asciz "Good job! You got a B.\n"
    .asciz "Not bad, you got a C.\n"
    .asciz "Sorry, you got an F.\n"
alen = .-amessage
