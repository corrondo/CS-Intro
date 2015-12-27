; Program name: ch6q3.pep
; Program reads in the values of X and Y then displays the results as: X + Y =
; reads in the values of Z and W then displays the results as: Z + W =
; calculates the following formula and displays it as: (X + Y) - (Z - W) =
; Author: Watkins Federico
; Date: 10/11/2015

         BR      Main        ; Branch to main
Sum:     .WORD   0X0000      ; Set up Sum to zero
Sub:     .WORD   0X0000      ; Set up Sub to zero
Eqn:     .WORD   0X0000      ; Set up Eqn to zero
X: .BLOCK  2                 ; Set up a two byte block for X 
Y: .BLOCK  2                 ; Set up a two byte block for Y 
Z: .BLOCK  2                 ; Set up a two byte block for Z
W: .BLOCK  2                 ; Set up a two byte block for W 
msgAddXy:        .ASCII  "Assign a value to 'X' and 'Y' so that I may add them!\nand display them as follow:  X + Y = ?\n\n\x00"              ; message string for output           
msgX:            .ASCII  "X = \x00"                                                                                                           ; message string for output
msgY:            .ASCII  "Y = \x00"                                                                                                           ; message string for output
msgSubZw:        .ASCII  "Now assign a value to 'Z' and 'W' so that I may subtract them!\nand display them as follow:  Z - W = ?\n\n\x00"     ; message string for output
msgZ:            .ASCII  "Z = \x00"                                                                                                           ; message string for output
msgW:            .ASCII  "W = \x00"                                                                                                           ; message string for output
msgEq:           .ASCII  "Finally I will display the result to the following formula:\n(X + Y) - (Z - W) = ?\n\n\x00"                         ; message string for output
msgPos:          .ASCII  "\n\nI'm Awesome!\n\n\x00"                                                                                           ; message string for output

;_______________________________________________________________________________________________  
Main:    BR      MyAdd            ; Brance to MyAdd 
;_______________________________________________________________________________________________        
MyAdd:   STRO    msgAddXy,d       ; Output string
         STRO    msgX,d           ; Output string
         LDA     Sum,d            ; Load Sum to accumulator
         DECI    X,d              ; Store user input in variable X
         ADDA    X,d              ; Add variable X to variable in accumulator
         STRO    msgY,d           ; Output string
         DECI    Y,d              ; Store user input in variable Y
         ADDA    Y,d              ; Add variable Y to variable in accumulator
         STA     Sum,d            ; Assign new value to Sum
         BR      DspAdd           ; Branch to DspAdd
;_______________________________________________________________________________________________  
MySub:   STRO    msgSubZw,d       ; Output string
         STRO    msgZ,d           ; Output string
         LDA     Sub,d            ; Load Sub to accumulator
         DECI    Z,d              ; Store user input in variable Z
         ADDA    Z,d              ; Add variable Z to variable in accumulator
         STRO    msgW,d           ; Output string
         DECI    W,d              ; Store user input in variable W
         SUBA    W,d              ; Subtract variable Z from variable in accumulator
         STA     Sub,d            ; Assign new value to Sub
         BR      DspSub           ; Branch to DspSub

;_______________________________________________________________________________________________  
DspAdd:  DECO    X,d              ; Output value of variable X
         CHARO   ' ',i            ; Insert a space
         CHARO   '+',i            ; Insert plus sign
         CHARO   ' ',i            ; Insert a space
         DECO    Y,d              ; Output value of variable Y
         CHARO   ' ',i            ; Insert a space
         CHARO   '=',i            ; Insert equal sign
         CHARO   ' ',i            ; Insert a space
         DECO    Sum,d            ; Output value fo variable Sum
         CHARO   '\n',i           ; Insert new line
         CHARO   '\n',i           ; Repeat new line
         BR      MySub            ; Branch to MySub
;_______________________________________________________________________________________________ 
DspSub:  DECO    Z,d              ; Output value of variable Z
         CHARO   ' ',i            ; Insert a space    
         CHARO   '-',i            ; Insert minus sign
         CHARO   ' ',i            ; Insert a space
         DECO    W,d              ; Output value of variable W
         CHARO   ' ',i            ; Insert a space
         CHARO   '=',i            ; Insert equal sign
         CHARO   ' ',i            ; Insert a space
         DECO    Sub,d            ; Output value of variable Sub
         CHARO   '\n',i           ; Insert new line
         CHARO   '\n',i           ; Repeat new line
         BR      MyEqn            ; Brance to MyEqn
;_______________________________________________________________________________________________
MyEqn:   STRO    msgEq,d          ; Output string
         LDA     Eqn,d            ; Load Eqn to accumulator
         ADDA    Sum,d            ; Add variable Sum to variable in accumulator
         SUBA    Sub,d            ; Subtract variable Sub from variable in accumulator
         STA     Eqn,d            ; Assign new value to Eqn
         BR      DspEqn           ; Branch to DspEqn         
;_______________________________________________________________________________________________
DspEqn:  CHARO   '(',i            ; Insert open parenthesis
         DECO    X,d              ; Output value of variable X 
         CHARO   ' ',i            ; Insert a space
         CHARO   '+',i            ; Insert plus sign
         CHARO   ' ',i            ; Insert a space
         DECO    Y,d              ; Output value of variable Y
         CHARO   ')',i            ; Output close parenthesis
         CHARO   ' ',i            ; Output a space
         CHARO   '-',i            ; Output minus sign
         CHARO   ' ',i            ; Output a space
         CHARO   '(',i            ; Output open parenthesis
         DECO    Z,d              ; Output value of variable Z
         CHARO   ' ',i            ; Output a space
         CHARO   '-',i            ; Output minus sign
         CHARO   ' ',i            ; Output a space
         DECO    W,d              ; Output value of variable W
         CHARO   ')',i            ; Output close parenthesis
         CHARO   ' ',i            ; Output a space
         CHARO   '=',i            ; Output equal sign
         CHARO   ' ',i            ; Output a space
         DECO    Eqn,d            ; Output value of variable Eqn
         STRO    msgPos,d         ; Output string
         STOP                     ; Stop processing 
         .END                     ; End of program
        





















