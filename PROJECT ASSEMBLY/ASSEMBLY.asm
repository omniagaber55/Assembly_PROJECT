.MODEL LARGE
.STACK 1000H
.DATA
;TITLE
T DB 10,13,'  *               ONLINE TRAFFIC WEBSITE             *$'

;TYPE OF SERVICE 
CH0 DB ' Please select the number of your service: $'
CH1 DB 10,13,'  *             1.guideness services                 *$' 
CH2 DB 10,13,'  *             2.electronic services                *$'  

;GUIDNESS SERVICE
;OPTIONS
O1 DB 10,13,'  * 1.The rules of your lisence                      *$' 
O2 DB 10,13,'  * 2.The cost of electronic service                 *$'    
O3 DB 10,13,'  * 3.The procedures of change the properity         *$'
O4 DB 10,13,'  * 4.Inqure about the traffic violation             *$'
;rules of license
A0 DB 10,13,'  # The rules of getting a license:                  #$'
A1 DB 10,13,'  #  (1)He must be at least 18 years old.            #$'
A2 DB 10,13,'  #  (2)Provide a copy the graduation certificate.   #$'
A3 DB 10,13,'  #  (3)Provide a copy of national number.           #$'
A4 DB 10,13,'  #  (4)You must attend to the traffic unit.         #$'
;know the cost of electronic service
B0 DB 10,13,'  # The cost of electronic service:                  #$'
B1 DB 10,13,'  #  (1)Renew the license: 200 pounds.               #$'
B2 DB 10,13,'  #  (2)The violation: 120 pounds per one.           #$'
B3 DB 10,13,'  #  (3)Make a license for the first time:500 pounds.#$'
B4 DB 10,13,'  #  (4)Make a driving license: 400 pounds.          #$'
B5 DB 10,13,'  #  (5)Change the properity of vehicle: 600 pounds. #$'
;the procedures of change the properity
C0 DB 10,13,'  #The procedures of change the properity of vehicle:#$'
C1 DB 10,13,'  #(1)A copy of national id of the owner.            #$'
C2 DB 10,13,'  #(2)cost 600 pounds.                               #$'
C3 DB 10,13,'  #(3)The id of vehicle.                             #$'
;inqure about the traffic violation 
D0 DB 10,13,'  # Inqure about the traffic violation:              #$'
D1 DB 10,13,'  #  (1)The cost: 120 pounds per one.                #$'
D2 DB 10,13,'  #  (2)You must pay it with visa.                   #$'

;ELECTRONIC SERVICE
;ELECTRONIC SERVICE OPTIONS
O5 DB 10,13,'  * 1.Change the properity of the vehicle.           *$' 
O6 DB 10,13,'  * 2.Take an appointment in a traffic unit.         *$'    
O7 DB 10,13,'  * 3.Renew the driving license.                     *$'    
;CHANGE THE PROPERITY OF THE VEHICLE
H1 DB 10,13,'  # 1.Enter the name of the owner.           $' 
H2 DB 10,13,'  # 2.Enter the id of the owner.             $' 
H3 DB 10,13,'  # 3.Enter the name of the buyer.           $'
H4 DB 10,13,'  # 4.Enter the id of the buyer.             $'
H5 DB 10,13,'  # 5.Enter the id of vehicle.               $'
H6 DB 10,13,'  CHANGE THE PROPERITY IS DONE SUCCESSFULLY.         $'
;How to reserve an appointment in traffic violation
J1 DB 10,13,'  Enter the id of the car.                         $'
J2 DB 10,13,'  Move to traffic appointment.                     $'
J3 DB 10,13,'  Choose the service which you need.               $'
;service options
JO0  DB 10,13,'  You can attend after 24 hours.       $'
JO1 DB 10,13,'  Choose 1 to license a new car.                 $' 
JO2 DB 10,13,'  Chosse 2 to pass the driving license exam.     $'
;renew your driving lisence
K0 DB 10,13,'  # Renew your driving lisence:          $'
K1 DB 10,13,'  # Your name:        $'
K2 DB 10,13,'  # Your national id: $'
K3 DB 10,13,'  # Enter the number of passing the exam:$'   
K4 DB 10,13,'  # Done successfully $'     
;TRANSFER
Z0 DB 10,13,'  Enter 1 to return to the main page$'
Z1 DB 10,13,'  Enter 2 TO RETURN$'
Z2 DB 10,13,'  Enter any key to exit $'

;SYMBOL0
SYM0 DB 10,13,'  *                                                  *$'
SYM1 DB 10,13,'  ****************************************************$'
;SYMBOL1
SYMBOL1 DB 10,13,'  ---------------------------------------------------- $'
;LINE
LINE DB 10,13,10,13,' $'

.CODE
MAIN PROC FAR
    MOV AX,@DATA
    MOV DS,AX
    
    ;TITLE
    title: 
        ;border 
    LEA DX,SYM1
    MOV AH,09H
    INT 21H
        ;border
    LEA DX,SYM0
    MOV AH,09H
    INT 21H   
        ;title
    LEA DX,T
    MOV AH,09H
    INT 21H 
        ;border
    LEA DX,SYM1
    MOV AH,9
    INT 21H
    
    ;NLINE
    LEA DX,LINE 
    MOV AH,09H
    INT 21H 
    
    ;TYPE OF SERVICE
    TSERVICE: 
        ;border
    LEA DX,SYM1
    MOV AH,09H
    INT 21H
        
    LEA DX,CH1
    MOV AH,09H
    INT 21H  
    
    LEA DX,CH2
    MOV AH,09H
    INT 21H 
        ;border
    LEA DX,SYM1
    MOV AH,09H
    INT 21H
    ;NLINE
    LEA DX,LINE 
    MOV AH,09H
    INT 21H
    ;CHOOSE THE SERVICE
    LEA DX,CH0
    MOV AH,09H
    INT 21H
    
    MOV AH,01H
    INT 21H
    MOV DL,AL
    SUB DL,48 
     
    CMP DL,1
    JE GSERVICE
    
    CMP DL,2
    JMP ESERVICE
    
    ;GUIDE SERVICE
    GSERVICE:
   ;NLINE
    LEA DX,LINE 
    MOV AH,09H
    INT 21H  
        ;border
    LEA DX,SYM1
    MOV AH,9
    INT 21H
        ;options
    LEA DX,O1
    MOV AH,9
    INT 21H 
    
    LEA DX,O2
    MOV AH,9
    INT 21H 
    
    LEA DX,O3
    MOV AH,9
    INT 21H 
    
    LEA DX,O4
    MOV AH,9
    INT 21H 
        ;border
    LEA DX,SYM1
    MOV AH,9
    INT 21H
    
    ;NLINE
    LEA DX,LINE 
    MOV AH,09H
    INT 21H 
    
    ;CHOOSE THE SERVICE
    LEA DX,CH0
    MOV AH,9
    INT 21H
    
    MOV AH,01H
    INT 21H
    MOV BL,AL
    SUB BL,48 
    ;NLINE
    LEA DX,LINE
    MOV AH,9
    INT 21H
    
    CMP BL,4
    JE D
   
    CMP BL,3
    JE C
   
    CMP BL,2
    JNE S1
    JMP B
    S1:
    CMP BL,1
    JMP A  
    
    ;inqure about the traffic violation 
    D:  
        ;border   
    LEA DX,SYMBOL1
    MOV AH,9
    INT 21H
    
    LEA DX,D0
    MOV AH,9
    INT 21H
    
    LEA DX,D1
    MOV AH,9
    INT 21H 
    
    LEA DX,D2
    MOV AH,9
    INT 21H 
        ;border
    LEA DX,SYMBOL1
    MOV AH,9
    INT 21H
    
    ;MOVE
    LEA DX,Z0
    MOV AH,9
    INT 21H
    
    LEA DX,Z2
    MOV AH,9
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,48
    P:
    CMP AL,1
    JNE Q
    JMP TITLE 
    Q:
    JMP EXIT  
   
    ;the procedures of change the properity
    C:  
        ;boeder   
    LEA DX,SYMBOL1
    MOV AH,9
    INT 21H
        ;the procedures
    LEA DX,C0
    MOV AH,9
    INT 21H
    
    LEA DX,C1
    MOV AH,9
    INT 21H 
    
    LEA DX,C2
    MOV AH,9
    INT 21H 
   
    LEA DX,C3
    MOV AH,9
    INT 21H 
        ;the border
    LEA DX,SYMBOL1
    MOV AH,9
    INT 21H
    
    ;MOVE
    LEA DX,Z0
    MOV AH,9
    INT 21H
    
    LEA DX,Z2
    MOV AH,9
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,48
    R:
    CMP AL,1
    JNE S
    JMP TITLE 
    S:
    JMP EXIT  
   
    ;The cost of electronic service
    B:
        ;border
    LEA DX,SYMBOL1
    MOV AH,9
    INT 21H
        ;the cost
    LEA DX,B0
    MOV AH,9
    INT 21H
    
    LEA DX,B1
    MOV AH,9
    INT 21H 
    
    LEA DX,B2
    MOV AH,9
    INT 21H 
   
    LEA DX,B3
    MOV AH,9
    INT 21H 
    
    LEA DX,B4
    MOV AH,9
    INT 21H
    
    LEA DX,B5
    MOV AH,9
    INT 21H
        ;border 
    LEA DX,SYMBOL1
    MOV AH,9
    INT 21H
    
    ;MOVE
    LEA DX,Z0
    MOV AH,9
    INT 21H
    
    LEA DX,Z2
    MOV AH,9
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,48
    U:
    CMP AL,1
    JNE V
    JMP TITLE 
    V:
    JMP EXIT  
    
     
    ;THE RULES OF LICENSE
    A: 
        ;border
    LEA DX,SYMBOL1
    MOV AH,9
    INT 21H
    
    LEA DX,A0
    MOV AH,9
    INT 21H
    
    LEA DX,A1
    MOV AH,9
    INT 21H 
    
    LEA DX,A2
    MOV AH,9
    INT 21H 
   
    LEA DX,A3
    MOV AH,9
    INT 21H
    
    LEA DX,A4
    MOV AH,9
    INT 21H
        ;border
    LEA DX,SYMBOL1
    MOV AH,9
    INT 21H 
        ;MOVE
    LEA DX,Z0
    MOV AH,9
    INT 21H
    
    LEA DX,Z2
    MOV AH,9
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,48
    X:
    CMP AL,1
    JNE Y
    JMP TITLE 
    Y:
    JMP EXIT  
    
    ;ELECTRONIC SERVICE
    ESERVICE:
    ;NLINE
    LEA DX,LINE 
    MOV AH,09H
    INT 21H 
        ;border
    LEA DX,SYM1
    MOV AH,9
    INT 21H
        ;options
    LEA DX,O5
    MOV AH,9
    INT 21H 
    
    LEA DX,O6
    MOV AH,9
    INT 21H 
    
    LEA DX,O7
    MOV AH,9
    INT 21H 
   
        ;border
    LEA DX,SYM1
    MOV AH,9
    INT 21H
    
    ;NLINE
    LEA DX,LINE 
    MOV AH,09H
    INT 21H 
    
    ;CHOOSE THE OPTION
    LEA DX,CH0
    MOV AH,9
    INT 21H
    
    MOV AH,01H
    INT 21H
    MOV BL,AL
    SUB BL,48   
    
    CMP BL,3
    JE K
    
    CMP BL,2
    JNE S2
    JMP J
    S2:
    CMP BL,1
    JMP H
    
    K:
    ;NLINE
    LEA DX,LINE 
    MOV AH,09H
    INT 21H
        ;border
    LEA DX,symbol1
    MOV AH,9
    INT 21H
    
    LEA DX,K0
    MOV AH,9
    INT 21H
    
    ;THE NAME
    LEA DX,K1
    MOV AH,9
    INT 21H    
     ;input
    MOV AH,1
    MOV BL,0
    L8:
    INT 21H
    INC BL
    CMP AL,' '
    JNE L8 
   
    MOV AH,2 
    MOV DL,BL
    INT 21H
    ;THE ID
    LEA DX,K2
    MOV AH,9
    INT 21H    
     ;input
    MOV AH,1
    MOV BL,0
    L9:
    INT 21H
    INC BL
    CMP AL,' '
    JNE L9 
   
    MOV AH,2 
    MOV DL,BL
    INT 21H
    
     ;the number of passing exam
     LEA DX,K3
    MOV AH,9
    INT 21H    
     ;input
    MOV AH,1
    MOV BL,0
    L10:
    INT 21H
    INC BL
    CMP AL,' '
    JNE L10 
   
    MOV AH,2 
    MOV DL,BL
    INT 21H
      ;border
    LEA DX,symbol1
    MOV AH,9
    INT 21H
    
    ;NLINE
    LEA DX,LINE 
    MOV AH,09H
    INT 21H
    
    LEA DX,k4
    MOV AH,9
    INT 21H
    
    ;MOVE
    LEA DX,Z0
    MOV AH,9
    INT 21H
    
    LEA DX,Z2
    MOV AH,9
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,48
    X4:
    CMP AL,1
    JNE Y4
    JMP TITLE 
    Y4:
    JMP EXIT 
    
    ;TAKE AN APPOINTENT
    J:
    ;NLINE
    LEA DX,LINE 
    MOV AH,09H
    INT 21H
        ;border
    LEA DX,symbol1
    MOV AH,9
    INT 21H
    
    LEA DX,J1
    MOV AH,9
    INT 21H    
     ;input
    MOV AH,1
    MOV BL,0
    L7:
    INT 21H
    INC BL
    CMP AL,' '
    JNE L7 
   
    MOV AH,2 
    MOV DL,BL
    INT 21H
    
    LEA DX,J2
    MOV AH,9
    INT 21H
    
    ;NLINE
    LEA DX,LINE 
    MOV AH,09H
    INT 21H
    ;CHOOSE THE OPTION
    LEA DX,CH0
    MOV AH,9
    INT 21H
    LEA DX,JO1
    MOV AH,9
    INT 21H
    
    LEA DX,JO2
    MOV AH,9
    INT 21H 
    
    MOV AH,01H
    INT 21H
    MOV BL,AL
    SUB BL,48 

       ;border
    LEA DX,symbol1
    MOV AH,9
    INT 21H
    
    LEA DX,JO0 
    MOV AH,9
    INT 21H
    
     ;NLINE
    LEA DX,LINE 
    MOV AH,09H
    INT 21H
   
    
    ;MOVE
    LEA DX,Z0
    MOV AH,9
    INT 21H
    
    LEA DX,Z2
    MOV AH,9
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,48
    X3:
    CMP AL,1
    JNE Y3
    JMP TITLE 
    Y3:
    JMP EXIT  
    
   
    
    ; CHANGE THE PROPERITY OF THE VEHICLE
    H:
      ;NLINE
    LEA DX,LINE 
    MOV AH,09H
    INT 21H
        ;border
    LEA DX,symbol1
    MOV AH,9
    INT 21H
    ;the name of the owner
    LEA DX,H1
    MOV AH,9
    INT 21H 
    ;INPUT
    MOV AH,1
    MOV BL,0
    L1:
    INT 21H
    INC BL
    CMP AL,' '
    JNE L1 
  
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    ;id of the owner
    LEA DX,H2
    MOV AH,9
    INT 21H
    ;input
    MOV AH,1
    MOV BL,0
    L2:
    INT 21H
    INC BL
    CMP AL,' '
    JNE L2 
   
    MOV AH,2 
    MOV DL,BL
    INT 21H
    
    ;the name of the buyer
    LEA DX,H3
    MOV AH,9
    INT 21H
    ;input
    MOV AH,1
    MOV BL,0
    L3:
    INT 21H
    INC BL
    CMP AL,' '
    JNE L3 
   
    MOV AH,2 
    MOV DL,BL
    INT 21H
    
    ;the id of the buyer
    LEA DX,H4
    MOV AH,9
    INT 21H
    ;input
    MOV AH,1
    MOV BL,0
    L4:
    INT 21H
    INC BL
    CMP AL,' '
    JNE L4 
    
    MOV AH,2 
    MOV DL,BL
    INT 21H
    
    ;the id of the vehicle
    LEA DX,H5
    MOV AH,9
    INT 21H
    ;input
    MOV AH,1
    MOV BL,0
    L5:
    INT 21H
    INC BL
    CMP AL,' '
    JNE L5 
   
    MOV AH,2 
    MOV DL,BL
    INT 21H
        ;border
    LEA DX,symbol1
    MOV AH,9
    INT 21H
    
    ;done
    LEA DX,H6
    MOV AH,09H
    INT 21H
    
     ;NLINE
    LEA DX,LINE 
    MOV AH,09H
    INT 21H
    
     ;MOVE
    LEA DX,Z0
    MOV AH,9
    INT 21H
    
    LEA DX,Z2
    MOV AH,9
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,48
    X0:
    CMP AL,1
    JNE Y0
    JMP TITLE 
    Y0:
    JMP EXIT  
    
    
    ;EXIT
    EXIT: 
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    