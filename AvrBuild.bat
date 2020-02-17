@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "C:\Users\grego\Projects\avr\labels.tmp" -fI -W+ie -C V0E -o "C:\Users\grego\Projects\avr\demoproject.hex" -d "C:\Users\grego\Projects\avr\demoproject.obj" -e "C:\Users\grego\Projects\avr\demoproject.eep" -m "C:\Users\grego\Projects\avr\demoproject.map" "C:\Users\grego\Projects\avr\demoproject.asm"
