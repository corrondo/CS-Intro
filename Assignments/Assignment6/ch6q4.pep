; Program name: ch6q4.pep
; Program reads sides lengths of a Rectangle from the keybord
; and then calculate and display the circumference and area
; Author: Watkins Federico
; Date: 10/11 2015

 
         BR main
H:       .BLOCK 2            ; Height of rectangle
W:       .BLOCK 2            ; Width of rectangel
Circm:   .BLOCK 2            ; Circumference of rectangle
Area:    .BLOCK 2            ; Area of rectangle
counter: .BLOCK 2            ; Loop counter
msgDsc:  .ASCII  "Enter the height and width of a rectangle and I will\nreturn its circumference and area:\n\x00"
msgH:    .ASCII  "Height= \x00"
msgW:    .ASCII  "Width= \x00"
msgCir:  .ASCII  "\nThe circumference of the rectangle is: \x00"
msgArea: .ASCII  "\n\nThe Area of the rectangle is:\n\x00"
fmt4:    .ASCII  "\n2 * (\x00"
fmt5:    .ASCII  " + \x00"
fmt6:    .ASCII  ") = \x00" 
fmt1:    .ASCII  " * \x00" 
fmt2:    .ASCII  " = \x00"
max:     .EQUATE 8
                             
main:    STRO    msgDsc,d         ; Prompt user for height and width
         STRO    msgH,d
         DECI    H,d
         STRO    msgW,d
         DECI    W,d                             
         LDA     0x0000, i        ; Set counter  to zero
         STA     counter,d

CirArea: LDX     Circm,d          ; Calculate circumference        
         ADDA    H,d 
         ADDA    W,d
         ASLA    
         STA     Circm,d                     
         STRO    msgCir,d         ; Feedback to user regarding the circumference
         STRO    fmt4,d           ; Output formating
         DECO    H,d
         STRO    fmt5,d
         DECO    W,d
         STRO    fmt6,d
         DECO    Circm,d          ; Report circumference to user
         STRO    msgArea,d        ; Feedback to user regarding the area
         DECO    H,d              ; Output formating
         STRO    fmt1,d
         DECO    W,d
         STRO    fmt2,d
                             
Loop:    LDX     counter,d        ; Check if counter < max 
         CPX     max,i
         BRGE    End              ; Branch to End if counter >= max
         LDA     H,d              ; Check if LSB of H == 0
         ANDA    0x0001,i
         CPA     0x0001,i
         BRNE    SndIter          ; Jump to second iteration if LSB of H == 0, 
         LDA     Area,d           ; Update Area if LSB of H == 1, 
         ADDA    W,d
         STA     Area,d 
 
SndIter: LDA     H,d              ; Shift H right once
         ASRA
         STA     H,d
         LDA     W,d              ; Shift W left once
         ASLA
         STA     W,d
         LDX     counter,d        ; Increment counter
         ADDX    0x0001,i
         STX     counter,d
         BR      Loop             ; Branch to Loop
                             
End:     DECO    Area,d           ; Report Area to user
         STOP                     ; Stop processing
         .END                     ; End of program