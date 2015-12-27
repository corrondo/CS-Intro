; Program name: ch6q5.pep
; Program prints out my first last name, major
; college and university names, and hobby 
; Author: Watkins Federico
; Date: 10/11/2015

         BR      Main                                                     ; Branch to main
msgFL:           .ASCII  "Name:\t\tFederico Watkins\n\n\x00"              ; message strings for output           
msgMj:           .ASCII  "Major:\t\tComputer Science Major\n\n\x00"                                                                                                           ; message string for output
msgCg:           .ASCII  "College:\t\tCollege of Engineering and Computing\n\n\x00"                                                                                                           ; message string for output
msgUnv:          .ASCII  "University:\tNova Southeastern University\n\n\x00"     
msgHb1:          .ASCII  "Hobby:\t\tI enjoy coding in various computer languages,\n\x00"         
msgHb2:          .ASCII  "\t\tWatching Mixed-Martial-Arts UFC events,\n\t\tPlaying 1v1 3D fighting video games\x00"                                                                                                  ; message string for output
;_______________________________________________________________________________________________  
Main:    STRO    msgFL,d          ; Output Strings
         STRO    msgMj,d
         STRO    msgCg,d
         STRO    msgUnv,d
         STRO    msgHb1,d
         STRO    msgHb2,d
         STOP                     ; Stop processing 
         .END                     ; End of program
        





















