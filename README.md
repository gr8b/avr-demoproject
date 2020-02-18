# Demo project

Written for AVR microcontroller ATTiny12 using AVR Studio 4.19


docs: https://www.microchip.com/webdoc/avrassembler/avrassembler.wb_instruction_list.html

avr studio download: https://www.microchip.com/mplab/avr-support/avr-and-sam-downloads-archive

attiny12: http://www.allspectrum.com/semiconductors/micro-controllers/attiny12/doc1006.pdf

Instruction Set Summary
|Mnemonics |Operands |Description |Operation |Flags |#Clocks|
|----------|---------|------------|----------|------|-------|
ADD |Rd, Rr |Add two Registers |Rd ← Rd + Rr |Z,C,N,V,H |1
ADC |Rd, Rr |Add with Carry two Registers |Rd ← Rd + Rr + C |Z,C,N,V,H |1
SUB |Rd, Rr |Subtract two Registers |Rd ← Rd - Rr |Z,C,N,V,H |1
SUBI |Rd, K |Subtract Constant from Register |Rd ← Rd - K |Z,C,N,V,H |1
SBC |Rd, Rr |Subtract with Carry two Registers |Rd ← Rd - Rr - C |Z,C,N,V,H |1
SBCI |Rd, K |Subtract with Carry Constant from Reg. |Rd ← Rd - K - C |Z,C,N,V,H |1
AND |Rd, Rr |Logical AND Registers |Rd ← Rd • Rr |Z,N,V |1
ANDI |Rd, K |Logical AND Register and Constant |Rd ← Rd • K |Z,N,V |1
OR |Rd, Rr |Logical OR Registers |Rd ← Rd v Rr |Z,N,V |1
ORI |Rd, K |Logical OR Register and Constant |Rd ← Rd v K |Z,N,V |1
EOR |Rd, Rr |Exclusive OR Registers |Rd ← Rd⊕Rr |Z,N,V |1
COM |Rd |One’s Complement |Rd ← $FF - Rd |Z,C,N,V |1
NEG |Rd |Two’s Complement |Rd ← $00 - Rd |Z,C,N,V,H |1
SBR |Rd,K |Set Bit(s) in Register |Rd ← Rd v K |Z,N,V |1
CBR |Rd,K |Clear Bit(s) in Register |Rd ← Rd • (FFh - K) |Z,N,V |1
INC |Rd |Increment |Rd ← Rd + 1 |Z,N,V |1
DEC |Rd |Decrement |Rd ← Rd - 1 |Z,N,V |1
TST |Rd |Test for Zero or Minus |Rd ← Rd • Rd |Z,N,V |1
CLR |Rd |Clear Register |Rd ← Rd⊕Rd |Z,N,V |1
SER |Rd |Set Register |Rd ← $FF |None |1
RJMP |k |Relative Jump| PC ← PC + k + 1 |None |2
RCALL| k |Relative Subroutine Call| PC ← PC + k + 1| None| 3
RET ||Subroutine Return| PC ← STACK| None| 4
RETI ||Interrupt Return| PC ← STACK I| 4
CPSE |Rd,Rr |Compare, Skip if Equal if (Rd = Rr) |PC ← PC + 2 or 3 |None |1/2
CP |Rd,Rr |Compare |Rd - Rr |Z, N,V,C,H |1
CPC |Rd,Rr Compare with Carry Rd - Rr - C Z, N,V,C,H 1
CPI |Rd,K Compare Register with Immediate Rd - K Z, N,V,C,H 1
SBRC |Rr, b Skip if Bit in Register Cleared if (Rr(b)=0) PC ← PC + 2 or 3 None 1/2
SBRS |Rr, b Skip if Bit in Register is Set if (Rr(b)=1) PC ← PC + 2 or 3 None 1/2
SBIC |P, b Skip if Bit in I/O Register Cleared if (P(b)=0) PC ← PC + 2 or 3 None 1/2
SBIS |P, b Skip if Bit in I/O Register is Set if (P(b)=1) PC ← PC + 2 or 3 None 1/2
BRBS |s, k Branch if Status Flag Set if (SREG(s) = 1) then PC←PC + k + 1 None 1/2
BRBC |s, k Branch if Status Flag Cleared if (SREG(s) = 0) then PC←PC + k + 1 None 1/2
BREQ |k Branch if Equal if (Z = 1) then PC ← PC + k + 1 None 1/2
BRNE |k Branch if Not Equal if (Z = 0) then PC ← PC + k + 1 None 1/2
BRCS |k Branch if Carry Set if (C = 1) then PC ← PC + k + 1 None 1/2
BRCC |k Branch if Carry Cleared if (C = 0) then PC ← PC + k + 1 None 1/2
BRSH |k Branch if Same or Higher if (C = 0) then PC ← PC + k + 1 None 1/2
BRLO |k Branch if Lower if (C = 1) then PC ← PC + k + 1 None 1/2
BRMI |k Branch if Minus if (N = 1) then PC ← PC + k + 1 None 1/2
BRPL |k Branch if Plus if (N = 0) then PC ← PC + k + 1 None 1/2
BRGE |k Branch if Greater or Equal, Signed if (N ⊕ V= 0) then PC ← PC + k + 1 None 1/2
BRLT |k Branch if Less Than Zero, Signed if (N ⊕ V= 1) then PC ← PC + k + 1 None 1/2
BRHS |k Branch if Half Carry Flag Set if (H = 1) then PC ← PC + k + 1 None 1/2
BRHC |k Branch if Half Carry Flag Cleared if (H = 0) then PC ← PC + k + 1 None 1/2
BRTS |k Branch if T Flag Set if (T = 1) then PC ← PC + k + 1 None 1/2
BRTC |k Branch if T Flag Cleared if (T = 0) then PC ← PC + k + 1 None 1/2
BRVS |k Branch if Overflow Flag is Set if (V = 1) then PC ← PC + k + 1 None 1/2
BRVC |k Branch if Overflow Flag is Cleared if (V = 0) then PC ← PC + k + 1 None 1/2
BRIE |k Branch if Interrupt Enabled if ( I = 1) then PC ← PC + k + 1 None 1/2
BRID |k Branch if Interrupt Disabled if ( I = 0) then PC ← PC + k + 1 None 1/2
DATA TRANSFER INSTRUCTIONS
LD Rd,Z Load Register Indirect Rd ← (Z) None 2
ST Z,Rr Store Register Indirect (Z) ← Rr None 2
MOV Rd, Rr Move Between Registers Rd ← Rr None 1
LDI Rd, K Load Immediate Rd ← K None 1
IN Rd, P In Port Rd ← P None 1
OUT P, Rr Out Port P ← Rr None 1
LPM Load Program Memory R0 ← (Z) None 3
BIT AND BIT-TEST INSTRUCTIONS
SBI P,b Set Bit in I/O Register I/O(P,b) ← 1 None 2
CBI P,b Clear Bit in I/O Register I/O(P,b) ← 0 None 2
LSL Rd Logical Shift Left Rd(n+1) ← Rd(n), Rd(0) ← 0 Z,C,N,V 1
LSR Rd Logical Shift Right Rd(n) ← Rd(n+1), Rd(7) ← 0 Z,C,N,V 1
ROL Rd Rotate Left Through Carry Rd(0) ← C, Rd(n+1) ← Rd(n), C ← Rd(7) Z,C,N,V 1
ROR Rd Rotate Right Through Carry Rd(7) ← C, Rd(n) ← Rd(n+1), C ← Rd(0) Z,C,N,V 1
ASR Rd Arithmetic Shift Right Rd(n) ← Rd(n+1), n = 0..6 Z,C,N,V 1
SWAP Rd Swap Nibbles Rd(3..0) ← Rd(7..4), Rd(7..4) ← Rd(3..0) None 1
BSET s Flag Set SREG(s) ← 1 SREG(s) 1
BCLR s Flag Clear SREG(s) ← 0 SREG(s) 1
BST Rr, b Bit Store from Register to T T ← Rr(b) T 1
BLD Rd, b Bit load from T to Register Rd(b) ← T None 1
SEC Set Carry C ← 1 C1
CLC Clear Carry C ← 0 C 1
SEN Set Negative Flag N ← 1 N1
CLN Clear Negative Flag N ← 0 N 1
SEZ Set Zero Flag Z ← 1 Z1
CLZ Clear Zero Flag Z ← 0 Z 1
SEI Global Interrupt Enable I ← 1 I1
CLI Global Interrupt Disable I ← 0 I 1
SES Set Signed Test Flag S ← 1 S1
CLS Clear Signed Test Flag S ← 0 S 1
SEV Set Twos Complement Overflow V ← 1 V1
CLV Clear Twos Complement Overflow V ← 0 V 1
SET Set T in SREG T ← 1 T1
CLT Clear T in SREG T ← 0 T 1
SEH Set Half Carry Flag in SREG H ← 1 H1
CLH Clear Half Carry Flag in SREG H ← 0 H 1
NOP No Operation None 1
SLEEP Sleep (see specific descr. for Sleep function) None 1
WDR Watch Dog Reset (see specific descr. for WDR/timer) None 1