--------------------------------------------------------------------
startup: ; startup
0801 : 0b __ __ INV
0802 : 08 __ __ PHP
0803 : 0a __ __ ASL
0804 : 00 __ __ BRK
0805 : 9e __ __ INV
0806 : 32 __ __ INV
0807 : 30 36 __ BMI $083f ; (startup + 62)
0809 : 31 00 __ AND ($00),y 
080b : 00 __ __ BRK
080c : 00 __ __ BRK
080d : ba __ __ TSX
080e : 8e fe 28 STX $28fe ; (spentry + 0)
0811 : a9 38 __ LDA #$38
0813 : 85 19 __ STA IP + 0 
0815 : a9 30 __ LDA #$30
0817 : 85 1a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 30 __ LDA #$30
081c : e9 30 __ SBC #$30
081e : f0 0f __ BEQ $082f ; (startup + 46)
0820 : aa __ __ TAX
0821 : a9 00 __ LDA #$00
0823 : a0 00 __ LDY #$00
0825 : 91 19 __ STA (IP + 0),y 
0827 : c8 __ __ INY
0828 : d0 fb __ BNE $0825 ; (startup + 36)
082a : e6 1a __ INC IP + 1 
082c : ca __ __ DEX
082d : d0 f6 __ BNE $0825 ; (startup + 36)
082f : 38 __ __ SEC
0830 : a9 38 __ LDA #$38
0832 : e9 38 __ SBC #$38
0834 : f0 08 __ BEQ $083e ; (startup + 61)
0836 : a8 __ __ TAY
0837 : a9 00 __ LDA #$00
0839 : 88 __ __ DEY
083a : 91 19 __ STA (IP + 0),y 
083c : d0 fb __ BNE $0839 ; (startup + 56)
083e : a2 f7 __ LDX #$f7
0840 : e0 f7 __ CPX #$f7
0842 : f0 07 __ BEQ $084b ; (startup + 74)
0844 : 95 00 __ STA $00,x 
0846 : e8 __ __ INX
0847 : e0 f7 __ CPX #$f7
0849 : d0 f9 __ BNE $0844 ; (startup + 67)
084b : a9 17 __ LDA #$17
084d : 85 23 __ STA SP + 0 
084f : a9 9f __ LDA #$9f
0851 : 85 24 __ STA SP + 1 
0853 : 20 80 08 JSR $0880 ; (main.s0 + 0)
0856 : a9 4c __ LDA #$4c
0858 : 85 54 __ STA $54 
085a : a9 00 __ LDA #$00
085c : 85 13 __ STA P6 
085e : a9 19 __ LDA #$19
0860 : 85 16 __ STA P9 
0862 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
.s0:
0880 : a9 03 __ LDA #$03
0882 : 85 0f __ STA P2 
0884 : 20 0a 09 JSR $090a ; (iocharmap.s0 + 0)
0887 : a9 00 __ LDA #$00
0889 : a2 22 __ LDX #$22
.l1014:
088b : 9d 18 9f STA $9f18,x 
088e : ca __ __ DEX
088f : d0 fa __ BNE $088b ; (main.l1014 + 0)
.l17:
0891 : c9 02 __ CMP #$02
0893 : 90 5b __ BCC $08f0 ; (main.s19 + 0)
.s18:
0895 : c9 03 __ CMP #$03
0897 : d0 11 __ BNE $08aa ; (main.s21 + 0)
.s11:
0899 : a9 ee __ LDA #$ee
089b : a0 02 __ LDY #$02
089d : 91 23 __ STA (SP + 0),y 
089f : a9 28 __ LDA #$28
08a1 : c8 __ __ INY
08a2 : 91 23 __ STA (SP + 0),y 
08a4 : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
08a7 : 4c d4 08 JMP $08d4 ; (main.s55 + 0)
.s21:
08aa : c9 04 __ CMP #$04
08ac : d0 0e __ BNE $08bc ; (main.s50 + 0)
.s13:
08ae : a9 1a __ LDA #$1a
08b0 : a0 02 __ LDY #$02
08b2 : 91 23 __ STA (SP + 0),y 
08b4 : a9 29 __ LDA #$29
08b6 : c8 __ __ INY
08b7 : 91 23 __ STA (SP + 0),y 
08b9 : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
.s50:
08bc : ad 30 9f LDA $9f30 ; (game + 23)
08bf : c9 04 __ CMP #$04
08c1 : f0 1c __ BEQ $08df ; (main.s3 + 0)
.l2:
08c3 : c9 02 __ CMP #$02
08c5 : d0 ca __ BNE $0891 ; (main.l17 + 0)
.s9:
08c7 : a9 19 __ LDA #$19
08c9 : 8d fe 9f STA $9ffe ; (sstack + 15)
08cc : a9 9f __ LDA #$9f
08ce : 8d ff 9f STA $9fff ; (sstack + 16)
08d1 : 20 c9 23 JSR $23c9 ; (playGame.s1000 + 0)
.s55:
08d4 : a9 00 __ LDA #$00
08d6 : 8d 30 9f STA $9f30 ; (game + 23)
08d9 : ad 30 9f LDA $9f30 ; (game + 23)
08dc : 4c c3 08 JMP $08c3 ; (main.l2 + 0)
.s3:
08df : a9 02 __ LDA #$02
08e1 : 85 0f __ STA P2 
08e3 : 20 0a 09 JSR $090a ; (iocharmap.s0 + 0)
08e6 : 20 f9 21 JSR $21f9 ; (clrscr.s0 + 0)
08e9 : a9 00 __ LDA #$00
08eb : 85 1b __ STA ACCU + 0 
08ed : 85 1c __ STA ACCU + 1 
.s1001:
08ef : 60 __ __ RTS
.s19:
08f0 : aa __ __ TAX
08f1 : a9 19 __ LDA #$19
08f3 : 8d fa 9f STA $9ffa ; (sstack + 11)
08f6 : a9 9f __ LDA #$9f
08f8 : 8d fb 9f STA $9ffb ; (sstack + 12)
08fb : 8a __ __ TXA
08fc : f0 06 __ BEQ $0904 ; (main.s5 + 0)
.s7:
08fe : 20 ae 22 JSR $22ae ; (processDifficultyMenu.s0 + 0)
0901 : 4c bc 08 JMP $08bc ; (main.s50 + 0)
.s5:
0904 : 20 2d 09 JSR $092d ; (processMainMenu.s0 + 0)
0907 : 4c bc 08 JMP $08bc ; (main.s50 + 0)
--------------------------------------------------------------------
iocharmap: ; iocharmap(enum IOCharMap_e)->void
.s0:
090a : a5 0f __ LDA P2 ; (chmap + 0)
090c : 8d ff 28 STA $28ff ; (giocharmap + 0)
090f : c9 02 __ CMP #$02
0911 : d0 04 __ BNE $0917 ; (iocharmap.s2 + 0)
.s1:
0913 : a0 8e __ LDY #$8e
0915 : d0 07 __ BNE $091e ; (iocharmap.s8 + 0)
.s2:
0917 : c9 03 __ CMP #$03
0919 : f0 01 __ BEQ $091c ; (iocharmap.s4 + 0)
.s1001:
091b : 60 __ __ RTS
.s4:
091c : a0 0e __ LDY #$0e
.s8:
091e : 84 0d __ STY P0 
0920 : a9 00 __ LDA #$00
0922 : 85 0e __ STA P1 
0924 : 4c 27 09 JMP $0927 ; (putch.s0 + 0)
--------------------------------------------------------------------
putch: ; putch(i16)->void
.s0:
0927 : a5 0d __ LDA P0 
0929 : 20 d2 ff JSR $ffd2 
.s1001:
092c : 60 __ __ RTS
--------------------------------------------------------------------
processMainMenu: ; processMainMenu(struct*)->void
.s0:
092d : 20 62 09 JSR $0962 ; (mainMenu.s1000 + 0)
0930 : a5 1b __ LDA ACCU + 0 
0932 : c9 01 __ CMP #$01
0934 : f0 0a __ BEQ $0940 ; (processMainMenu.s1008 + 0)
.s10:
0936 : 09 00 __ ORA #$00
0938 : f0 15 __ BEQ $094f ; (processMainMenu.s2 + 0)
.s11:
093a : c9 02 __ CMP #$02
093c : d0 10 __ BNE $094e ; (processMainMenu.s1001 + 0)
.s6:
093e : a9 04 __ LDA #$04
.s1008:
0940 : ae fa 9f LDX $9ffa ; (sstack + 11)
0943 : 86 45 __ STX T2 + 0 
0945 : ae fb 9f LDX $9ffb ; (sstack + 12)
0948 : 86 46 __ STX T2 + 1 
094a : a0 17 __ LDY #$17
094c : 91 45 __ STA (T2 + 0),y 
.s1001:
094e : 60 __ __ RTS
.s2:
094f : ad fa 9f LDA $9ffa ; (sstack + 11)
0952 : 85 13 __ STA P6 
0954 : ad fb 9f LDA $9ffb ; (sstack + 12)
0957 : 85 14 __ STA P7 
0959 : a9 02 __ LDA #$02
095b : a0 17 __ LDY #$17
095d : 91 13 __ STA (P6),y 
095f : 4c 09 22 JMP $2209 ; (initGame.s0 + 0)
--------------------------------------------------------------------
mainMenu: ; mainMenu()->enum
.s1000:
0962 : a5 53 __ LDA T0 + 0 
0964 : 8d 3b 9f STA $9f3b ; (difficultyMenu@stack + 0)
0967 : a5 54 __ LDA T0 + 1 
0969 : 8d 3c 9f STA $9f3c ; (difficultyMenu@stack + 1)
096c : a5 55 __ LDA T1 + 0 
096e : 8d 3d 9f STA $9f3d ; (difficultyMenu@stack + 2)
0971 : 38 __ __ SEC
0972 : a5 23 __ LDA SP + 0 
0974 : e9 08 __ SBC #$08
0976 : 85 23 __ STA SP + 0 
0978 : b0 02 __ BCS $097c ; (mainMenu.s0 + 0)
097a : c6 24 __ DEC SP + 1 
.s0:
097c : a2 5a __ LDX #$5a
.l1002:
097e : bd ff 2e LDA $2eff,x 
0981 : 9d 3e 9f STA $9f3e,x ; (difficultyMenu@stack + 3)
0984 : ca __ __ DEX
0985 : d0 f7 __ BNE $097e ; (mainMenu.l1002 + 0)
.s1003:
0987 : a9 8f __ LDA #$8f
0989 : a0 02 __ LDY #$02
098b : 91 23 __ STA (SP + 0),y 
098d : a9 16 __ LDA #$16
098f : c8 __ __ INY
0990 : 91 23 __ STA (SP + 0),y 
0992 : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
0995 : a9 2d __ LDA #$2d
0997 : 8d f7 9f STA $9ff7 ; (sstack + 8)
099a : a9 09 __ LDA #$09
099c : 8d f8 9f STA $9ff8 ; (sstack + 9)
099f : a9 00 __ LDA #$00
09a1 : 8d f9 9f STA $9ff9 ; (sstack + 10)
09a4 : 20 9a 16 JSR $169a ; (printLine.s1000 + 0)
09a7 : a9 1d __ LDA #$1d
09a9 : a0 02 __ LDY #$02
09ab : 91 23 __ STA (SP + 0),y 
09ad : a9 17 __ LDA #$17
09af : c8 __ __ INY
09b0 : 91 23 __ STA (SP + 0),y 
09b2 : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
.l23:
09b5 : a2 00 __ LDX #$00
09b7 : 18 __ __ CLC
.l1009:
09b8 : a9 30 __ LDA #$30
09ba : a0 02 __ LDY #$02
09bc : 91 23 __ STA (SP + 0),y 
09be : a9 17 __ LDA #$17
09c0 : c8 __ __ INY
09c1 : 91 23 __ STA (SP + 0),y 
09c3 : 8a __ __ TXA
09c4 : 69 01 __ ADC #$01
09c6 : 85 55 __ STA T1 + 0 
09c8 : c8 __ __ INY
09c9 : 91 23 __ STA (SP + 0),y 
09cb : a9 00 __ LDA #$00
09cd : c8 __ __ INY
09ce : 91 23 __ STA (SP + 0),y 
09d0 : bd fb 28 LDA $28fb,x ; (__multab30L + 0)
09d3 : 18 __ __ CLC
09d4 : 69 3f __ ADC #$3f
09d6 : c8 __ __ INY
09d7 : 91 23 __ STA (SP + 0),y 
09d9 : a9 9f __ LDA #$9f
09db : 69 00 __ ADC #$00
09dd : c8 __ __ INY
09de : 91 23 __ STA (SP + 0),y 
09e0 : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
09e3 : a5 55 __ LDA T1 + 0 
09e5 : aa __ __ TAX
09e6 : c9 03 __ CMP #$03
09e8 : 90 ce __ BCC $09b8 ; (mainMenu.l1009 + 0)
.s6:
09ea : a9 00 __ LDA #$00
09ec : 8d f7 9f STA $9ff7 ; (sstack + 8)
09ef : a9 22 __ LDA #$22
09f1 : 8d f8 9f STA $9ff8 ; (sstack + 9)
09f4 : 20 38 17 JSR $1738 ; (askForNumber.s1000 + 0)
09f7 : a5 1b __ LDA ACCU + 0 
09f9 : 85 53 __ STA T0 + 0 
09fb : a5 1c __ LDA ACCU + 1 
09fd : 85 54 __ STA T0 + 1 
09ff : a9 1b __ LDA #$1b
0a01 : a0 02 __ LDY #$02
0a03 : 91 23 __ STA (SP + 0),y 
0a05 : a9 17 __ LDA #$17
0a07 : c8 __ __ INY
0a08 : 91 23 __ STA (SP + 0),y 
0a0a : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
0a0d : a5 54 __ LDA T0 + 1 
0a0f : 30 a4 __ BMI $09b5 ; (mainMenu.l23 + 0)
.s1006:
0a11 : d0 04 __ BNE $0a17 ; (mainMenu.s7 + 0)
.s1005:
0a13 : a5 53 __ LDA T0 + 0 
0a15 : f0 9e __ BEQ $09b5 ; (mainMenu.l23 + 0)
.s7:
0a17 : a5 54 __ LDA T0 + 1 
0a19 : d0 9a __ BNE $09b5 ; (mainMenu.l23 + 0)
.s1004:
0a1b : a5 53 __ LDA T0 + 0 
0a1d : c9 04 __ CMP #$04
0a1f : b0 94 __ BCS $09b5 ; (mainMenu.l23 + 0)
.s2:
0a21 : 38 __ __ SEC
0a22 : e9 01 __ SBC #$01
0a24 : 85 1b __ STA ACCU + 0 
.s1001:
0a26 : 18 __ __ CLC
0a27 : a5 23 __ LDA SP + 0 
0a29 : 69 08 __ ADC #$08
0a2b : 85 23 __ STA SP + 0 
0a2d : 90 02 __ BCC $0a31 ; (mainMenu.s1001 + 11)
0a2f : e6 24 __ INC SP + 1 
0a31 : ad 3b 9f LDA $9f3b ; (difficultyMenu@stack + 0)
0a34 : 85 53 __ STA T0 + 0 
0a36 : ad 3c 9f LDA $9f3c ; (difficultyMenu@stack + 1)
0a39 : 85 54 __ STA T0 + 1 
0a3b : ad 3d 9f LDA $9f3d ; (difficultyMenu@stack + 2)
0a3e : 85 55 __ STA T1 + 0 
0a40 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
0a41 : a9 01 __ LDA #$01
0a43 : 8d f6 9f STA $9ff6 ; (sstack + 7)
0a46 : a9 9f __ LDA #$9f
0a48 : 8d f0 9f STA $9ff0 ; (sstack + 1)
0a4b : a9 9f __ LDA #$9f
0a4d : 8d f1 9f STA $9ff1 ; (sstack + 2)
0a50 : a0 02 __ LDY #$02
0a52 : b1 23 __ LDA (SP + 0),y 
0a54 : 8d f2 9f STA $9ff2 ; (sstack + 3)
0a57 : c8 __ __ INY
0a58 : b1 23 __ LDA (SP + 0),y 
0a5a : 8d f3 9f STA $9ff3 ; (sstack + 4)
0a5d : 18 __ __ CLC
0a5e : a5 23 __ LDA SP + 0 
0a60 : 69 04 __ ADC #$04
0a62 : 8d f4 9f STA $9ff4 ; (sstack + 5)
0a65 : a5 24 __ LDA SP + 1 
0a67 : 69 00 __ ADC #$00
0a69 : 8d f5 9f STA $9ff5 ; (sstack + 6)
0a6c : 4c 6f 0a JMP $0a6f ; (sformat.s1000 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s1000:
0a6f : a2 05 __ LDX #$05
0a71 : b5 53 __ LDA T1 + 0,x 
0a73 : 9d d1 9f STA $9fd1,x ; (sformat@stack + 0)
0a76 : ca __ __ DEX
0a77 : 10 f8 __ BPL $0a71 ; (sformat.s1000 + 2)
.s0:
0a79 : a9 00 __ LDA #$00
0a7b : 85 50 __ STA T0 + 0 
0a7d : ad f2 9f LDA $9ff2 ; (sstack + 3)
0a80 : 85 53 __ STA T1 + 0 
0a82 : ad f3 9f LDA $9ff3 ; (sstack + 4)
0a85 : 85 54 __ STA T1 + 1 
0a87 : ad f0 9f LDA $9ff0 ; (sstack + 1)
0a8a : 85 55 __ STA T2 + 0 
0a8c : ad f1 9f LDA $9ff1 ; (sstack + 2)
0a8f : 85 56 __ STA T2 + 1 
.l1:
0a91 : a0 00 __ LDY #$00
0a93 : b1 53 __ LDA (T1 + 0),y 
0a95 : d0 37 __ BNE $0ace ; (sformat.s2 + 0)
.s3:
0a97 : a4 50 __ LDY T0 + 0 
0a99 : 91 55 __ STA (T2 + 0),y 
0a9b : 98 __ __ TYA
0a9c : f0 1d __ BEQ $0abb ; (sformat.s1058 + 0)
.s112:
0a9e : ad f6 9f LDA $9ff6 ; (sstack + 7)
0aa1 : d0 0d __ BNE $0ab0 ; (sformat.s115 + 0)
.s116:
0aa3 : 18 __ __ CLC
0aa4 : a5 55 __ LDA T2 + 0 
0aa6 : 65 50 __ ADC T0 + 0 
0aa8 : aa __ __ TAX
0aa9 : a5 56 __ LDA T2 + 1 
0aab : 69 00 __ ADC #$00
0aad : 4c bf 0a JMP $0abf ; (sformat.s1001 + 0)
.s115:
0ab0 : a5 55 __ LDA T2 + 0 
0ab2 : 85 0d __ STA P0 
0ab4 : a5 56 __ LDA T2 + 1 
0ab6 : 85 0e __ STA P1 
0ab8 : 20 bb 0e JSR $0ebb ; (puts.s0 + 0)
.s1058:
0abb : a5 56 __ LDA T2 + 1 
0abd : a6 55 __ LDX T2 + 0 
.s1001:
0abf : 86 1b __ STX ACCU + 0 ; (buff + 1)
0ac1 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0ac3 : a2 05 __ LDX #$05
0ac5 : bd d1 9f LDA $9fd1,x ; (sformat@stack + 0)
0ac8 : 95 53 __ STA T1 + 0,x 
0aca : ca __ __ DEX
0acb : 10 f8 __ BPL $0ac5 ; (sformat.s1001 + 6)
0acd : 60 __ __ RTS
.s2:
0ace : c9 25 __ CMP #$25
0ad0 : f0 3e __ BEQ $0b10 ; (sformat.s4 + 0)
.s5:
0ad2 : a4 50 __ LDY T0 + 0 
0ad4 : 91 55 __ STA (T2 + 0),y 
0ad6 : e6 53 __ INC T1 + 0 
0ad8 : d0 02 __ BNE $0adc ; (sformat.s1087 + 0)
.s1086:
0ada : e6 54 __ INC T1 + 1 
.s1087:
0adc : c8 __ __ INY
0add : 84 50 __ STY T0 + 0 
0adf : 98 __ __ TYA
0ae0 : c0 28 __ CPY #$28
0ae2 : 90 ad __ BCC $0a91 ; (sformat.l1 + 0)
.s106:
0ae4 : 85 57 __ STA T5 + 0 
0ae6 : a9 00 __ LDA #$00
0ae8 : 85 50 __ STA T0 + 0 
0aea : ad f6 9f LDA $9ff6 ; (sstack + 7)
0aed : f0 14 __ BEQ $0b03 ; (sformat.s110 + 0)
.s109:
0aef : a5 55 __ LDA T2 + 0 
0af1 : 85 0d __ STA P0 
0af3 : a5 56 __ LDA T2 + 1 
0af5 : 85 0e __ STA P1 
0af7 : a9 00 __ LDA #$00
0af9 : a4 57 __ LDY T5 + 0 
0afb : 91 0d __ STA (P0),y 
0afd : 20 bb 0e JSR $0ebb ; (puts.s0 + 0)
0b00 : 4c 91 0a JMP $0a91 ; (sformat.l1 + 0)
.s110:
0b03 : 18 __ __ CLC
0b04 : a5 55 __ LDA T2 + 0 
0b06 : 65 57 __ ADC T5 + 0 
0b08 : 85 55 __ STA T2 + 0 
0b0a : 90 85 __ BCC $0a91 ; (sformat.l1 + 0)
.s1089:
0b0c : e6 56 __ INC T2 + 1 
0b0e : b0 81 __ BCS $0a91 ; (sformat.l1 + 0)
.s4:
0b10 : a5 50 __ LDA T0 + 0 
0b12 : f0 27 __ BEQ $0b3b ; (sformat.s9 + 0)
.s7:
0b14 : 84 50 __ STY T0 + 0 
0b16 : 85 57 __ STA T5 + 0 
0b18 : ad f6 9f LDA $9ff6 ; (sstack + 7)
0b1b : f0 13 __ BEQ $0b30 ; (sformat.s11 + 0)
.s10:
0b1d : a5 55 __ LDA T2 + 0 
0b1f : 85 0d __ STA P0 
0b21 : a5 56 __ LDA T2 + 1 
0b23 : 85 0e __ STA P1 
0b25 : 98 __ __ TYA
0b26 : a4 57 __ LDY T5 + 0 
0b28 : 91 0d __ STA (P0),y 
0b2a : 20 bb 0e JSR $0ebb ; (puts.s0 + 0)
0b2d : 4c 3b 0b JMP $0b3b ; (sformat.s9 + 0)
.s11:
0b30 : 18 __ __ CLC
0b31 : a5 55 __ LDA T2 + 0 
0b33 : 65 57 __ ADC T5 + 0 
0b35 : 85 55 __ STA T2 + 0 
0b37 : 90 02 __ BCC $0b3b ; (sformat.s9 + 0)
.s1084:
0b39 : e6 56 __ INC T2 + 1 
.s9:
0b3b : a9 0a __ LDA #$0a
0b3d : 8d da 9f STA $9fda ; (si + 3)
0b40 : a9 00 __ LDA #$00
0b42 : 8d db 9f STA $9fdb ; (si + 4)
0b45 : 8d dc 9f STA $9fdc ; (si + 5)
0b48 : 8d dd 9f STA $9fdd ; (si + 6)
0b4b : 8d de 9f STA $9fde ; (si + 7)
0b4e : a0 01 __ LDY #$01
0b50 : b1 53 __ LDA (T1 + 0),y 
0b52 : aa __ __ TAX
0b53 : a9 20 __ LDA #$20
0b55 : 8d d7 9f STA $9fd7 ; (si + 0)
0b58 : a9 00 __ LDA #$00
0b5a : 8d d8 9f STA $9fd8 ; (si + 1)
0b5d : a9 ff __ LDA #$ff
0b5f : 8d d9 9f STA $9fd9 ; (si + 2)
0b62 : 18 __ __ CLC
0b63 : a5 53 __ LDA T1 + 0 
0b65 : 69 02 __ ADC #$02
.l14:
0b67 : 85 53 __ STA T1 + 0 
0b69 : 90 02 __ BCC $0b6d ; (sformat.s1071 + 0)
.s1070:
0b6b : e6 54 __ INC T1 + 1 
.s1071:
0b6d : 8a __ __ TXA
0b6e : e0 2b __ CPX #$2b
0b70 : d0 08 __ BNE $0b7a ; (sformat.s17 + 0)
.s16:
0b72 : a9 01 __ LDA #$01
0b74 : 8d dc 9f STA $9fdc ; (si + 5)
0b77 : 4c ae 0e JMP $0eae ; (sformat.s260 + 0)
.s17:
0b7a : c9 30 __ CMP #$30
0b7c : d0 06 __ BNE $0b84 ; (sformat.s20 + 0)
.s19:
0b7e : 8d d7 9f STA $9fd7 ; (si + 0)
0b81 : 4c ae 0e JMP $0eae ; (sformat.s260 + 0)
.s20:
0b84 : e0 23 __ CPX #$23
0b86 : d0 08 __ BNE $0b90 ; (sformat.s23 + 0)
.s22:
0b88 : a9 01 __ LDA #$01
0b8a : 8d de 9f STA $9fde ; (si + 7)
0b8d : 4c ae 0e JMP $0eae ; (sformat.s260 + 0)
.s23:
0b90 : e0 2d __ CPX #$2d
0b92 : d0 08 __ BNE $0b9c ; (sformat.s15 + 0)
.s25:
0b94 : a9 01 __ LDA #$01
0b96 : 8d dd 9f STA $9fdd ; (si + 6)
0b99 : 4c ae 0e JMP $0eae ; (sformat.s260 + 0)
.s15:
0b9c : 85 57 __ STA T5 + 0 
0b9e : e0 30 __ CPX #$30
0ba0 : 90 57 __ BCC $0bf9 ; (sformat.s31 + 0)
.s32:
0ba2 : e0 3a __ CPX #$3a
0ba4 : b0 53 __ BCS $0bf9 ; (sformat.s31 + 0)
.s29:
0ba6 : a9 00 __ LDA #$00
0ba8 : 85 44 __ STA T6 + 0 
0baa : 85 45 __ STA T6 + 1 
0bac : e0 3a __ CPX #$3a
0bae : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
0bb0 : b0 40 __ BCS $0bf2 ; (sformat.s1069 + 0)
.l34:
0bb2 : a5 44 __ LDA T6 + 0 
0bb4 : 0a __ __ ASL
0bb5 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0bb7 : a5 45 __ LDA T6 + 1 
0bb9 : 2a __ __ ROL
0bba : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0bbc : 2a __ __ ROL
0bbd : aa __ __ TAX
0bbe : 18 __ __ CLC
0bbf : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0bc1 : 65 44 __ ADC T6 + 0 
0bc3 : 85 44 __ STA T6 + 0 
0bc5 : 8a __ __ TXA
0bc6 : 65 45 __ ADC T6 + 1 
0bc8 : 06 44 __ ASL T6 + 0 
0bca : 2a __ __ ROL
0bcb : a8 __ __ TAY
0bcc : 18 __ __ CLC
0bcd : a5 44 __ LDA T6 + 0 
0bcf : 65 57 __ ADC T5 + 0 
0bd1 : 90 01 __ BCC $0bd4 ; (sformat.s1081 + 0)
.s1080:
0bd3 : c8 __ __ INY
.s1081:
0bd4 : 38 __ __ SEC
0bd5 : e9 30 __ SBC #$30
0bd7 : 85 44 __ STA T6 + 0 
0bd9 : 98 __ __ TYA
0bda : e9 00 __ SBC #$00
0bdc : 85 45 __ STA T6 + 1 
0bde : a0 00 __ LDY #$00
0be0 : b1 53 __ LDA (T1 + 0),y 
0be2 : 85 57 __ STA T5 + 0 
0be4 : e6 53 __ INC T1 + 0 
0be6 : d0 02 __ BNE $0bea ; (sformat.s1083 + 0)
.s1082:
0be8 : e6 54 __ INC T1 + 1 
.s1083:
0bea : c9 30 __ CMP #$30
0bec : 90 04 __ BCC $0bf2 ; (sformat.s1069 + 0)
.s36:
0bee : c9 3a __ CMP #$3a
0bf0 : 90 c0 __ BCC $0bb2 ; (sformat.l34 + 0)
.s1069:
0bf2 : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0bf4 : a5 44 __ LDA T6 + 0 
0bf6 : 8d d8 9f STA $9fd8 ; (si + 1)
.s31:
0bf9 : a5 57 __ LDA T5 + 0 
0bfb : c9 2e __ CMP #$2e
0bfd : d0 55 __ BNE $0c54 ; (sformat.s39 + 0)
.s37:
0bff : a9 00 __ LDA #$00
0c01 : 85 44 __ STA T6 + 0 
0c03 : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
.l239:
0c05 : 85 45 __ STA T6 + 1 
0c07 : a0 00 __ LDY #$00
0c09 : b1 53 __ LDA (T1 + 0),y 
0c0b : 85 57 __ STA T5 + 0 
0c0d : e6 53 __ INC T1 + 0 
0c0f : d0 02 __ BNE $0c13 ; (sformat.s1073 + 0)
.s1072:
0c11 : e6 54 __ INC T1 + 1 
.s1073:
0c13 : c9 30 __ CMP #$30
0c15 : 90 04 __ BCC $0c1b ; (sformat.s1061 + 0)
.s43:
0c17 : c9 3a __ CMP #$3a
0c19 : 90 0c __ BCC $0c27 ; (sformat.s41 + 0)
.s1061:
0c1b : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0c1d : a5 44 __ LDA T6 + 0 
0c1f : 8d d9 9f STA $9fd9 ; (si + 2)
0c22 : a5 57 __ LDA T5 + 0 
0c24 : 4c 54 0c JMP $0c54 ; (sformat.s39 + 0)
.s41:
0c27 : a5 44 __ LDA T6 + 0 
0c29 : 0a __ __ ASL
0c2a : 85 1b __ STA ACCU + 0 ; (buff + 1)
0c2c : a5 45 __ LDA T6 + 1 
0c2e : 2a __ __ ROL
0c2f : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0c31 : 2a __ __ ROL
0c32 : aa __ __ TAX
0c33 : 18 __ __ CLC
0c34 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0c36 : 65 44 __ ADC T6 + 0 
0c38 : 85 44 __ STA T6 + 0 
0c3a : 8a __ __ TXA
0c3b : 65 45 __ ADC T6 + 1 
0c3d : 06 44 __ ASL T6 + 0 
0c3f : 2a __ __ ROL
0c40 : a8 __ __ TAY
0c41 : 18 __ __ CLC
0c42 : a5 44 __ LDA T6 + 0 
0c44 : 65 57 __ ADC T5 + 0 
0c46 : 90 01 __ BCC $0c49 ; (sformat.s1079 + 0)
.s1078:
0c48 : c8 __ __ INY
.s1079:
0c49 : 38 __ __ SEC
0c4a : e9 30 __ SBC #$30
0c4c : 85 44 __ STA T6 + 0 
0c4e : 98 __ __ TYA
0c4f : e9 00 __ SBC #$00
0c51 : 4c 05 0c JMP $0c05 ; (sformat.l239 + 0)
.s39:
0c54 : c9 64 __ CMP #$64
0c56 : d0 05 __ BNE $0c5d ; (sformat.s45 + 0)
.s44:
0c58 : a9 01 __ LDA #$01
0c5a : 4c 72 0e JMP $0e72 ; (sformat.s257 + 0)
.s45:
0c5d : c9 75 __ CMP #$75
0c5f : d0 03 __ BNE $0c64 ; (sformat.s48 + 0)
0c61 : 4c 70 0e JMP $0e70 ; (sformat.s287 + 0)
.s48:
0c64 : c9 78 __ CMP #$78
0c66 : d0 0d __ BNE $0c75 ; (sformat.s51 + 0)
.s50:
0c68 : a9 10 __ LDA #$10
0c6a : 8d da 9f STA $9fda ; (si + 3)
0c6d : a9 00 __ LDA #$00
0c6f : 8d db 9f STA $9fdb ; (si + 4)
0c72 : 4c 70 0e JMP $0e70 ; (sformat.s287 + 0)
.s51:
0c75 : c9 6c __ CMP #$6c
0c77 : d0 03 __ BNE $0c7c ; (sformat.s54 + 0)
0c79 : 4c f3 0d JMP $0df3 ; (sformat.s53 + 0)
.s54:
0c7c : c9 66 __ CMP #$66
0c7e : f0 08 __ BEQ $0c88 ; (sformat.s65 + 0)
.s69:
0c80 : c9 67 __ CMP #$67
0c82 : f0 04 __ BEQ $0c88 ; (sformat.s65 + 0)
.s68:
0c84 : c9 65 __ CMP #$65
0c86 : d0 4d __ BNE $0cd5 ; (sformat.s66 + 0)
.s65:
0c88 : a5 55 __ LDA T2 + 0 
0c8a : 85 13 __ STA P6 
0c8c : a5 56 __ LDA T2 + 1 
0c8e : 85 14 __ STA P7 
0c90 : a5 57 __ LDA T5 + 0 
0c92 : 8d ef 9f STA $9fef ; (sstack + 0)
0c95 : a9 d7 __ LDA #$d7
0c97 : 85 11 __ STA P4 
0c99 : a9 9f __ LDA #$9f
0c9b : 85 12 __ STA P5 
0c9d : ad f4 9f LDA $9ff4 ; (sstack + 5)
0ca0 : 85 57 __ STA T5 + 0 
0ca2 : ad f5 9f LDA $9ff5 ; (sstack + 6)
0ca5 : 85 58 __ STA T5 + 1 
0ca7 : a0 00 __ LDY #$00
0ca9 : b1 57 __ LDA (T5 + 0),y 
0cab : 85 15 __ STA P8 
0cad : c8 __ __ INY
0cae : b1 57 __ LDA (T5 + 0),y 
0cb0 : 85 16 __ STA P9 
0cb2 : c8 __ __ INY
0cb3 : b1 57 __ LDA (T5 + 0),y 
0cb5 : 85 17 __ STA P10 
0cb7 : c8 __ __ INY
0cb8 : b1 57 __ LDA (T5 + 0),y 
0cba : 85 18 __ STA P11 
0cbc : 20 b8 11 JSR $11b8 ; (nformf.s0 + 0)
0cbf : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0cc1 : 85 50 __ STA T0 + 0 
0cc3 : 18 __ __ CLC
0cc4 : a5 57 __ LDA T5 + 0 
0cc6 : 69 04 __ ADC #$04
0cc8 : 8d f4 9f STA $9ff4 ; (sstack + 5)
0ccb : a5 58 __ LDA T5 + 1 
0ccd : 69 00 __ ADC #$00
0ccf : 8d f5 9f STA $9ff5 ; (sstack + 6)
0cd2 : 4c 91 0a JMP $0a91 ; (sformat.l1 + 0)
.s66:
0cd5 : c9 73 __ CMP #$73
0cd7 : f0 53 __ BEQ $0d2c ; (sformat.s70 + 0)
.s71:
0cd9 : c9 63 __ CMP #$63
0cdb : f0 1f __ BEQ $0cfc ; (sformat.s100 + 0)
.s101:
0cdd : 09 00 __ ORA #$00
0cdf : d0 03 __ BNE $0ce4 ; (sformat.s103 + 0)
0ce1 : 4c 91 0a JMP $0a91 ; (sformat.l1 + 0)
.s103:
0ce4 : 18 __ __ CLC
0ce5 : a5 55 __ LDA T2 + 0 
0ce7 : 65 50 __ ADC T0 + 0 
0ce9 : 85 44 __ STA T6 + 0 
0ceb : a5 56 __ LDA T2 + 1 
0ced : 69 00 __ ADC #$00
0cef : 85 45 __ STA T6 + 1 
0cf1 : a5 57 __ LDA T5 + 0 
.s1056:
0cf3 : a0 00 __ LDY #$00
0cf5 : 91 44 __ STA (T6 + 0),y 
0cf7 : e6 50 __ INC T0 + 0 
0cf9 : 4c 91 0a JMP $0a91 ; (sformat.l1 + 0)
.s100:
0cfc : ad f4 9f LDA $9ff4 ; (sstack + 5)
0cff : 85 57 __ STA T5 + 0 
0d01 : 18 __ __ CLC
0d02 : 69 02 __ ADC #$02
0d04 : 8d f4 9f STA $9ff4 ; (sstack + 5)
0d07 : ad f5 9f LDA $9ff5 ; (sstack + 6)
0d0a : 85 58 __ STA T5 + 1 
0d0c : 69 00 __ ADC #$00
0d0e : 8d f5 9f STA $9ff5 ; (sstack + 6)
0d11 : 18 __ __ CLC
0d12 : a5 55 __ LDA T2 + 0 
0d14 : 65 50 __ ADC T0 + 0 
0d16 : 85 44 __ STA T6 + 0 
0d18 : a5 56 __ LDA T2 + 1 
0d1a : 69 00 __ ADC #$00
0d1c : 85 45 __ STA T6 + 1 
0d1e : a0 01 __ LDY #$01
0d20 : b1 57 __ LDA (T5 + 0),y 
0d22 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0d24 : 88 __ __ DEY
0d25 : b1 57 __ LDA (T5 + 0),y 
0d27 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0d29 : 4c f3 0c JMP $0cf3 ; (sformat.s1056 + 0)
.s70:
0d2c : ad f4 9f LDA $9ff4 ; (sstack + 5)
0d2f : 85 57 __ STA T5 + 0 
0d31 : 18 __ __ CLC
0d32 : 69 02 __ ADC #$02
0d34 : 8d f4 9f STA $9ff4 ; (sstack + 5)
0d37 : ad f5 9f LDA $9ff5 ; (sstack + 6)
0d3a : 85 58 __ STA T5 + 1 
0d3c : 69 00 __ ADC #$00
0d3e : 8d f5 9f STA $9ff5 ; (sstack + 6)
0d41 : a0 00 __ LDY #$00
0d43 : 84 52 __ STY T3 + 0 
0d45 : b1 57 __ LDA (T5 + 0),y 
0d47 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0d49 : c8 __ __ INY
0d4a : b1 57 __ LDA (T5 + 0),y 
0d4c : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0d4e : 85 58 __ STA T5 + 1 
0d50 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0d52 : 85 57 __ STA T5 + 0 
0d54 : ad d8 9f LDA $9fd8 ; (si + 1)
0d57 : f0 0c __ BEQ $0d65 ; (sformat.s75 + 0)
.s1062:
0d59 : 88 __ __ DEY
0d5a : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0d5c : f0 05 __ BEQ $0d63 ; (sformat.s1063 + 0)
.l77:
0d5e : c8 __ __ INY
0d5f : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0d61 : d0 fb __ BNE $0d5e ; (sformat.l77 + 0)
.s1063:
0d63 : 84 52 __ STY T3 + 0 
.s75:
0d65 : ad dd 9f LDA $9fdd ; (si + 6)
0d68 : d0 19 __ BNE $0d83 ; (sformat.s81 + 0)
.s1066:
0d6a : a6 52 __ LDX T3 + 0 
0d6c : ec d8 9f CPX $9fd8 ; (si + 1)
0d6f : a4 50 __ LDY T0 + 0 
0d71 : b0 0c __ BCS $0d7f ; (sformat.s1067 + 0)
.l83:
0d73 : ad d7 9f LDA $9fd7 ; (si + 0)
0d76 : 91 55 __ STA (T2 + 0),y 
0d78 : e8 __ __ INX
0d79 : ec d8 9f CPX $9fd8 ; (si + 1)
0d7c : c8 __ __ INY
0d7d : 90 f4 __ BCC $0d73 ; (sformat.l83 + 0)
.s1067:
0d7f : 86 52 __ STX T3 + 0 
0d81 : 84 50 __ STY T0 + 0 
.s81:
0d83 : ad f6 9f LDA $9ff6 ; (sstack + 7)
0d86 : d0 37 __ BNE $0dbf ; (sformat.s85 + 0)
.l91:
0d88 : a0 00 __ LDY #$00
0d8a : b1 57 __ LDA (T5 + 0),y 
0d8c : f0 0f __ BEQ $0d9d ; (sformat.s247 + 0)
.s92:
0d8e : a4 50 __ LDY T0 + 0 
0d90 : 91 55 __ STA (T2 + 0),y 
0d92 : e6 50 __ INC T0 + 0 
0d94 : e6 57 __ INC T5 + 0 
0d96 : d0 f0 __ BNE $0d88 ; (sformat.l91 + 0)
.s1076:
0d98 : e6 58 __ INC T5 + 1 
0d9a : 4c 88 0d JMP $0d88 ; (sformat.l91 + 0)
.s247:
0d9d : ad dd 9f LDA $9fdd ; (si + 6)
0da0 : d0 03 __ BNE $0da5 ; (sformat.s1064 + 0)
0da2 : 4c 91 0a JMP $0a91 ; (sformat.l1 + 0)
.s1064:
0da5 : a6 52 __ LDX T3 + 0 
0da7 : ec d8 9f CPX $9fd8 ; (si + 1)
0daa : a4 50 __ LDY T0 + 0 
0dac : b0 0c __ BCS $0dba ; (sformat.s1065 + 0)
.l98:
0dae : ad d7 9f LDA $9fd7 ; (si + 0)
0db1 : 91 55 __ STA (T2 + 0),y 
0db3 : e8 __ __ INX
0db4 : ec d8 9f CPX $9fd8 ; (si + 1)
0db7 : c8 __ __ INY
0db8 : 90 f4 __ BCC $0dae ; (sformat.l98 + 0)
.s1065:
0dba : 84 50 __ STY T0 + 0 
0dbc : 4c 91 0a JMP $0a91 ; (sformat.l1 + 0)
.s85:
0dbf : a5 50 __ LDA T0 + 0 
0dc1 : f0 22 __ BEQ $0de5 ; (sformat.s90 + 0)
.s88:
0dc3 : a5 55 __ LDA T2 + 0 
0dc5 : 85 0d __ STA P0 
0dc7 : a5 56 __ LDA T2 + 1 
0dc9 : 85 0e __ STA P1 
0dcb : a9 00 __ LDA #$00
0dcd : a4 50 __ LDY T0 + 0 
0dcf : 91 0d __ STA (P0),y 
0dd1 : 20 bb 0e JSR $0ebb ; (puts.s0 + 0)
0dd4 : a5 57 __ LDA T5 + 0 
0dd6 : 85 0d __ STA P0 
0dd8 : a5 58 __ LDA T5 + 1 
0dda : 85 0e __ STA P1 
0ddc : 20 bb 0e JSR $0ebb ; (puts.s0 + 0)
0ddf : a9 00 __ LDA #$00
0de1 : 85 50 __ STA T0 + 0 
0de3 : f0 b8 __ BEQ $0d9d ; (sformat.s247 + 0)
.s90:
0de5 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0de7 : 85 0d __ STA P0 
0de9 : a5 1c __ LDA ACCU + 1 ; (fmt + 0)
0deb : 85 0e __ STA P1 
0ded : 20 bb 0e JSR $0ebb ; (puts.s0 + 0)
0df0 : 4c 9d 0d JMP $0d9d ; (sformat.s247 + 0)
.s53:
0df3 : ad f4 9f LDA $9ff4 ; (sstack + 5)
0df6 : 85 57 __ STA T5 + 0 
0df8 : 18 __ __ CLC
0df9 : 69 04 __ ADC #$04
0dfb : 8d f4 9f STA $9ff4 ; (sstack + 5)
0dfe : ad f5 9f LDA $9ff5 ; (sstack + 6)
0e01 : 85 58 __ STA T5 + 1 
0e03 : 69 00 __ ADC #$00
0e05 : 8d f5 9f STA $9ff5 ; (sstack + 6)
0e08 : a0 00 __ LDY #$00
0e0a : b1 53 __ LDA (T1 + 0),y 
0e0c : aa __ __ TAX
0e0d : e6 53 __ INC T1 + 0 
0e0f : d0 02 __ BNE $0e13 ; (sformat.s1075 + 0)
.s1074:
0e11 : e6 54 __ INC T1 + 1 
.s1075:
0e13 : b1 57 __ LDA (T5 + 0),y 
0e15 : 85 46 __ STA T7 + 0 
0e17 : a0 01 __ LDY #$01
0e19 : b1 57 __ LDA (T5 + 0),y 
0e1b : 85 47 __ STA T7 + 1 
0e1d : c8 __ __ INY
0e1e : b1 57 __ LDA (T5 + 0),y 
0e20 : 85 48 __ STA T7 + 2 
0e22 : c8 __ __ INY
0e23 : b1 57 __ LDA (T5 + 0),y 
0e25 : a8 __ __ TAY
0e26 : 8a __ __ TXA
0e27 : e0 64 __ CPX #$64
0e29 : d0 04 __ BNE $0e2f ; (sformat.s57 + 0)
.s56:
0e2b : a9 01 __ LDA #$01
0e2d : d0 17 __ BNE $0e46 ; (sformat.s258 + 0)
.s57:
0e2f : c9 75 __ CMP #$75
0e31 : f0 11 __ BEQ $0e44 ; (sformat.s288 + 0)
.s60:
0e33 : c9 78 __ CMP #$78
0e35 : f0 03 __ BEQ $0e3a ; (sformat.s62 + 0)
0e37 : 4c 91 0a JMP $0a91 ; (sformat.l1 + 0)
.s62:
0e3a : a9 10 __ LDA #$10
0e3c : 8d da 9f STA $9fda ; (si + 3)
0e3f : a9 00 __ LDA #$00
0e41 : 8d db 9f STA $9fdb ; (si + 4)
.s288:
0e44 : a9 00 __ LDA #$00
.s258:
0e46 : 84 14 __ STY P7 
0e48 : 85 15 __ STA P8 
0e4a : a5 55 __ LDA T2 + 0 
0e4c : 85 0f __ STA P2 
0e4e : a5 56 __ LDA T2 + 1 
0e50 : 85 10 __ STA P3 
0e52 : a5 46 __ LDA T7 + 0 
0e54 : 85 11 __ STA P4 
0e56 : a5 47 __ LDA T7 + 1 
0e58 : 85 12 __ STA P5 
0e5a : a5 48 __ LDA T7 + 2 
0e5c : 85 13 __ STA P6 
0e5e : a9 d7 __ LDA #$d7
0e60 : 85 0d __ STA P0 
0e62 : a9 9f __ LDA #$9f
0e64 : 85 0e __ STA P1 
0e66 : 20 45 10 JSR $1045 ; (nforml.s0 + 0)
.s1059:
0e69 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0e6b : 85 50 __ STA T0 + 0 
0e6d : 4c 91 0a JMP $0a91 ; (sformat.l1 + 0)
.s287:
0e70 : a9 00 __ LDA #$00
.s257:
0e72 : 85 13 __ STA P6 
0e74 : a5 55 __ LDA T2 + 0 
0e76 : 85 0f __ STA P2 
0e78 : a5 56 __ LDA T2 + 1 
0e7a : 85 10 __ STA P3 
0e7c : ad f4 9f LDA $9ff4 ; (sstack + 5)
0e7f : 85 50 __ STA T0 + 0 
0e81 : ad f5 9f LDA $9ff5 ; (sstack + 6)
0e84 : 85 51 __ STA T0 + 1 
0e86 : a0 00 __ LDY #$00
0e88 : b1 50 __ LDA (T0 + 0),y 
0e8a : 85 11 __ STA P4 
0e8c : c8 __ __ INY
0e8d : b1 50 __ LDA (T0 + 0),y 
0e8f : 85 12 __ STA P5 
0e91 : 18 __ __ CLC
0e92 : a5 50 __ LDA T0 + 0 
0e94 : 69 02 __ ADC #$02
0e96 : 8d f4 9f STA $9ff4 ; (sstack + 5)
0e99 : a5 51 __ LDA T0 + 1 
0e9b : 69 00 __ ADC #$00
0e9d : 8d f5 9f STA $9ff5 ; (sstack + 6)
0ea0 : a9 d7 __ LDA #$d7
0ea2 : 85 0d __ STA P0 
0ea4 : a9 9f __ LDA #$9f
0ea6 : 85 0e __ STA P1 
0ea8 : 20 10 0f JSR $0f10 ; (nformi.s0 + 0)
0eab : 4c 69 0e JMP $0e69 ; (sformat.s1059 + 0)
.s260:
0eae : a0 00 __ LDY #$00
0eb0 : b1 53 __ LDA (T1 + 0),y 
0eb2 : aa __ __ TAX
0eb3 : 18 __ __ CLC
0eb4 : a5 53 __ LDA T1 + 0 
0eb6 : 69 01 __ ADC #$01
0eb8 : 4c 67 0b JMP $0b67 ; (sformat.l14 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
0ebb : a0 00 __ LDY #$00
0ebd : b1 0d __ LDA (P0),y 
0ebf : f0 0b __ BEQ $0ecc ; (puts.s1001 + 0)
0ec1 : 20 cd 0e JSR $0ecd ; (putpch + 0)
0ec4 : e6 0d __ INC P0 
0ec6 : d0 f3 __ BNE $0ebb ; (puts.s0 + 0)
0ec8 : e6 0e __ INC P1 
0eca : d0 ef __ BNE $0ebb ; (puts.s0 + 0)
.s1001:
0ecc : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
0ecd : ae ff 28 LDX $28ff ; (giocharmap + 0)
0ed0 : e0 01 __ CPX #$01
0ed2 : 90 26 __ BCC $0efa ; (putpch + 45)
0ed4 : c9 0a __ CMP #$0a
0ed6 : d0 02 __ BNE $0eda ; (putpch + 13)
0ed8 : a9 0d __ LDA #$0d
0eda : c9 09 __ CMP #$09
0edc : f0 1f __ BEQ $0efd ; (putpch + 48)
0ede : e0 02 __ CPX #$02
0ee0 : 90 18 __ BCC $0efa ; (putpch + 45)
0ee2 : c9 41 __ CMP #$41
0ee4 : 90 14 __ BCC $0efa ; (putpch + 45)
0ee6 : c9 7b __ CMP #$7b
0ee8 : b0 10 __ BCS $0efa ; (putpch + 45)
0eea : c9 61 __ CMP #$61
0eec : b0 04 __ BCS $0ef2 ; (putpch + 37)
0eee : c9 5b __ CMP #$5b
0ef0 : b0 08 __ BCS $0efa ; (putpch + 45)
0ef2 : 49 20 __ EOR #$20
0ef4 : e0 03 __ CPX #$03
0ef6 : f0 02 __ BEQ $0efa ; (putpch + 45)
0ef8 : 29 df __ AND #$df
0efa : 4c d2 ff JMP $ffd2 
0efd : 38 __ __ SEC
0efe : 20 f0 ff JSR $fff0 
0f01 : 98 __ __ TYA
0f02 : 29 03 __ AND #$03
0f04 : 49 03 __ EOR #$03
0f06 : aa __ __ TAX
0f07 : a9 20 __ LDA #$20
0f09 : 20 d2 ff JSR $ffd2 
0f0c : ca __ __ DEX
0f0d : 10 fa __ BPL $0f09 ; (putpch + 60)
0f0f : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
0f10 : a9 00 __ LDA #$00
0f12 : 85 43 __ STA T0 + 0 
0f14 : a5 13 __ LDA P6 ; (s + 0)
0f16 : f0 13 __ BEQ $0f2b ; (nformi.s182 + 0)
.s4:
0f18 : 24 12 __ BIT P5 ; (v + 1)
0f1a : 10 0f __ BPL $0f2b ; (nformi.s182 + 0)
.s1:
0f1c : 38 __ __ SEC
0f1d : a9 00 __ LDA #$00
0f1f : e5 11 __ SBC P4 ; (v + 0)
0f21 : 85 11 __ STA P4 ; (v + 0)
0f23 : a9 00 __ LDA #$00
0f25 : e5 12 __ SBC P5 ; (v + 1)
0f27 : 85 12 __ STA P5 ; (v + 1)
0f29 : e6 43 __ INC T0 + 0 
.s182:
0f2b : a9 10 __ LDA #$10
0f2d : 85 44 __ STA T2 + 0 
0f2f : a5 11 __ LDA P4 ; (v + 0)
0f31 : 05 12 __ ORA P5 ; (v + 1)
0f33 : f0 46 __ BEQ $0f7b ; (nformi.s7 + 0)
.s42:
0f35 : a0 03 __ LDY #$03
0f37 : b1 0d __ LDA (P0),y ; (si + 0)
0f39 : 85 45 __ STA T4 + 0 
0f3b : c8 __ __ INY
0f3c : b1 0d __ LDA (P0),y ; (si + 0)
0f3e : 85 46 __ STA T4 + 1 
.l6:
0f40 : a5 11 __ LDA P4 ; (v + 0)
0f42 : 85 1b __ STA ACCU + 0 
0f44 : a5 12 __ LDA P5 ; (v + 1)
0f46 : 85 1c __ STA ACCU + 1 
0f48 : a5 45 __ LDA T4 + 0 
0f4a : 85 03 __ STA WORK + 0 
0f4c : a5 46 __ LDA T4 + 1 
0f4e : 85 04 __ STA WORK + 1 
0f50 : 20 29 2c JSR $2c29 ; (divmod + 0)
0f53 : a5 06 __ LDA WORK + 3 
0f55 : 30 08 __ BMI $0f5f ; (nformi.s78 + 0)
.s1019:
0f57 : d0 0a __ BNE $0f63 ; (nformi.s77 + 0)
.s1018:
0f59 : a5 05 __ LDA WORK + 2 
0f5b : c9 0a __ CMP #$0a
0f5d : b0 04 __ BCS $0f63 ; (nformi.s77 + 0)
.s78:
0f5f : a9 30 __ LDA #$30
0f61 : d0 02 __ BNE $0f65 ; (nformi.s79 + 0)
.s77:
0f63 : a9 37 __ LDA #$37
.s79:
0f65 : 18 __ __ CLC
0f66 : 65 05 __ ADC WORK + 2 
0f68 : c6 44 __ DEC T2 + 0 
0f6a : a6 44 __ LDX T2 + 0 
0f6c : 9d df 9f STA $9fdf,x ; (buffer + 0)
0f6f : a5 1b __ LDA ACCU + 0 
0f71 : 85 11 __ STA P4 ; (v + 0)
0f73 : a5 1c __ LDA ACCU + 1 
0f75 : 85 12 __ STA P5 ; (v + 1)
0f77 : 05 11 __ ORA P4 ; (v + 0)
0f79 : d0 c5 __ BNE $0f40 ; (nformi.l6 + 0)
.s7:
0f7b : a0 02 __ LDY #$02
0f7d : b1 0d __ LDA (P0),y ; (si + 0)
0f7f : c9 ff __ CMP #$ff
0f81 : d0 04 __ BNE $0f87 ; (nformi.s80 + 0)
.s81:
0f83 : a9 0f __ LDA #$0f
0f85 : d0 05 __ BNE $0f8c ; (nformi.s1026 + 0)
.s80:
0f87 : 38 __ __ SEC
0f88 : a9 10 __ LDA #$10
0f8a : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
0f8c : a8 __ __ TAY
0f8d : c4 44 __ CPY T2 + 0 
0f8f : b0 0d __ BCS $0f9e ; (nformi.s10 + 0)
.s9:
0f91 : a9 30 __ LDA #$30
.l1027:
0f93 : c6 44 __ DEC T2 + 0 
0f95 : a6 44 __ LDX T2 + 0 
0f97 : 9d df 9f STA $9fdf,x ; (buffer + 0)
0f9a : c4 44 __ CPY T2 + 0 
0f9c : 90 f5 __ BCC $0f93 ; (nformi.l1027 + 0)
.s10:
0f9e : a0 07 __ LDY #$07
0fa0 : b1 0d __ LDA (P0),y ; (si + 0)
0fa2 : f0 20 __ BEQ $0fc4 ; (nformi.s13 + 0)
.s14:
0fa4 : a0 04 __ LDY #$04
0fa6 : b1 0d __ LDA (P0),y ; (si + 0)
0fa8 : d0 1a __ BNE $0fc4 ; (nformi.s13 + 0)
.s1013:
0faa : 88 __ __ DEY
0fab : b1 0d __ LDA (P0),y ; (si + 0)
0fad : c9 10 __ CMP #$10
0faf : d0 13 __ BNE $0fc4 ; (nformi.s13 + 0)
.s11:
0fb1 : a9 58 __ LDA #$58
0fb3 : a6 44 __ LDX T2 + 0 
0fb5 : 9d de 9f STA $9fde,x ; (si + 7)
0fb8 : 8a __ __ TXA
0fb9 : 18 __ __ CLC
0fba : 69 fe __ ADC #$fe
0fbc : 85 44 __ STA T2 + 0 
0fbe : aa __ __ TAX
0fbf : a9 30 __ LDA #$30
0fc1 : 9d df 9f STA $9fdf,x ; (buffer + 0)
.s13:
0fc4 : a9 00 __ LDA #$00
0fc6 : 85 1b __ STA ACCU + 0 
0fc8 : a5 43 __ LDA T0 + 0 
0fca : f0 06 __ BEQ $0fd2 ; (nformi.s16 + 0)
.s15:
0fcc : c6 44 __ DEC T2 + 0 
0fce : a9 2d __ LDA #$2d
0fd0 : d0 0a __ BNE $0fdc ; (nformi.s1025 + 0)
.s16:
0fd2 : a0 05 __ LDY #$05
0fd4 : b1 0d __ LDA (P0),y ; (si + 0)
0fd6 : f0 09 __ BEQ $0fe1 ; (nformi.s163 + 0)
.s18:
0fd8 : c6 44 __ DEC T2 + 0 
0fda : a9 2b __ LDA #$2b
.s1025:
0fdc : a6 44 __ LDX T2 + 0 
0fde : 9d df 9f STA $9fdf,x ; (buffer + 0)
.s163:
0fe1 : a0 06 __ LDY #$06
0fe3 : b1 0d __ LDA (P0),y ; (si + 0)
0fe5 : d0 33 __ BNE $101a ; (nformi.s24 + 0)
.l30:
0fe7 : a0 01 __ LDY #$01
0fe9 : b1 0d __ LDA (P0),y ; (si + 0)
0feb : 18 __ __ CLC
0fec : 65 44 __ ADC T2 + 0 
0fee : b0 04 __ BCS $0ff4 ; (nformi.s31 + 0)
.s1006:
0ff0 : c9 11 __ CMP #$11
0ff2 : 90 0d __ BCC $1001 ; (nformi.s33 + 0)
.s31:
0ff4 : c6 44 __ DEC T2 + 0 
0ff6 : a0 00 __ LDY #$00
0ff8 : b1 0d __ LDA (P0),y ; (si + 0)
0ffa : a6 44 __ LDX T2 + 0 
0ffc : 9d df 9f STA $9fdf,x ; (buffer + 0)
0fff : b0 e6 __ BCS $0fe7 ; (nformi.l30 + 0)
.s33:
1001 : a6 44 __ LDX T2 + 0 
1003 : e0 10 __ CPX #$10
1005 : b0 0e __ BCS $1015 ; (nformi.s23 + 0)
.s34:
1007 : 88 __ __ DEY
.l1022:
1008 : bd df 9f LDA $9fdf,x ; (buffer + 0)
100b : 91 0f __ STA (P2),y ; (str + 0)
100d : e8 __ __ INX
100e : e0 10 __ CPX #$10
1010 : c8 __ __ INY
1011 : 90 f5 __ BCC $1008 ; (nformi.l1022 + 0)
.s1023:
1013 : 84 1b __ STY ACCU + 0 
.s23:
1015 : a9 00 __ LDA #$00
1017 : 85 1c __ STA ACCU + 1 
.s1001:
1019 : 60 __ __ RTS
.s24:
101a : a6 44 __ LDX T2 + 0 
101c : e0 10 __ CPX #$10
101e : b0 1a __ BCS $103a ; (nformi.l27 + 0)
.s25:
1020 : a0 00 __ LDY #$00
.l1020:
1022 : bd df 9f LDA $9fdf,x ; (buffer + 0)
1025 : 91 0f __ STA (P2),y ; (str + 0)
1027 : e8 __ __ INX
1028 : e0 10 __ CPX #$10
102a : c8 __ __ INY
102b : 90 f5 __ BCC $1022 ; (nformi.l1020 + 0)
.s1021:
102d : 84 1b __ STY ACCU + 0 
102f : b0 09 __ BCS $103a ; (nformi.l27 + 0)
.s28:
1031 : 88 __ __ DEY
1032 : b1 0d __ LDA (P0),y ; (si + 0)
1034 : a4 1b __ LDY ACCU + 0 
1036 : 91 0f __ STA (P2),y ; (str + 0)
1038 : e6 1b __ INC ACCU + 0 
.l27:
103a : a5 1b __ LDA ACCU + 0 
103c : a0 01 __ LDY #$01
103e : d1 0d __ CMP (P0),y ; (si + 0)
1040 : 90 ef __ BCC $1031 ; (nformi.s28 + 0)
1042 : 4c 15 10 JMP $1015 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
1045 : a9 00 __ LDA #$00
1047 : 85 43 __ STA T0 + 0 
1049 : a5 15 __ LDA P8 ; (s + 0)
104b : f0 21 __ BEQ $106e ; (nforml.s182 + 0)
.s4:
104d : a5 14 __ LDA P7 ; (v + 3)
104f : f0 1d __ BEQ $106e ; (nforml.s182 + 0)
.s1032:
1051 : 10 1b __ BPL $106e ; (nforml.s182 + 0)
.s1:
1053 : 38 __ __ SEC
1054 : a9 00 __ LDA #$00
1056 : e5 11 __ SBC P4 ; (v + 0)
1058 : 85 11 __ STA P4 ; (v + 0)
105a : a9 00 __ LDA #$00
105c : e5 12 __ SBC P5 ; (v + 1)
105e : 85 12 __ STA P5 ; (v + 1)
1060 : a9 00 __ LDA #$00
1062 : e5 13 __ SBC P6 ; (v + 2)
1064 : 85 13 __ STA P6 ; (v + 2)
1066 : a9 00 __ LDA #$00
1068 : e5 14 __ SBC P7 ; (v + 3)
106a : 85 14 __ STA P7 ; (v + 3)
106c : e6 43 __ INC T0 + 0 
.s182:
106e : a9 10 __ LDA #$10
1070 : 85 44 __ STA T2 + 0 
1072 : a5 14 __ LDA P7 ; (v + 3)
1074 : d0 0c __ BNE $1082 ; (nforml.s42 + 0)
.s1024:
1076 : a5 13 __ LDA P6 ; (v + 2)
1078 : d0 08 __ BNE $1082 ; (nforml.s42 + 0)
.s1025:
107a : a5 12 __ LDA P5 ; (v + 1)
107c : d0 04 __ BNE $1082 ; (nforml.s42 + 0)
.s1026:
107e : c5 11 __ CMP P4 ; (v + 0)
1080 : b0 0e __ BCS $1090 ; (nforml.s7 + 0)
.s42:
1082 : a0 03 __ LDY #$03
1084 : b1 0d __ LDA (P0),y ; (si + 0)
1086 : 85 45 __ STA T5 + 0 
1088 : c8 __ __ INY
1089 : b1 0d __ LDA (P0),y ; (si + 0)
108b : 85 46 __ STA T5 + 1 
108d : 4c 5a 11 JMP $115a ; (nforml.l6 + 0)
.s7:
1090 : a0 02 __ LDY #$02
1092 : b1 0d __ LDA (P0),y ; (si + 0)
1094 : c9 ff __ CMP #$ff
1096 : d0 04 __ BNE $109c ; (nforml.s80 + 0)
.s81:
1098 : a9 0f __ LDA #$0f
109a : d0 05 __ BNE $10a1 ; (nforml.s1039 + 0)
.s80:
109c : 38 __ __ SEC
109d : a9 10 __ LDA #$10
109f : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
10a1 : a8 __ __ TAY
10a2 : c4 44 __ CPY T2 + 0 
10a4 : b0 0d __ BCS $10b3 ; (nforml.s10 + 0)
.s9:
10a6 : a9 30 __ LDA #$30
.l1040:
10a8 : c6 44 __ DEC T2 + 0 
10aa : a6 44 __ LDX T2 + 0 
10ac : 9d df 9f STA $9fdf,x ; (buffer + 0)
10af : c4 44 __ CPY T2 + 0 
10b1 : 90 f5 __ BCC $10a8 ; (nforml.l1040 + 0)
.s10:
10b3 : a0 07 __ LDY #$07
10b5 : b1 0d __ LDA (P0),y ; (si + 0)
10b7 : f0 20 __ BEQ $10d9 ; (nforml.s13 + 0)
.s14:
10b9 : a0 04 __ LDY #$04
10bb : b1 0d __ LDA (P0),y ; (si + 0)
10bd : d0 1a __ BNE $10d9 ; (nforml.s13 + 0)
.s1013:
10bf : 88 __ __ DEY
10c0 : b1 0d __ LDA (P0),y ; (si + 0)
10c2 : c9 10 __ CMP #$10
10c4 : d0 13 __ BNE $10d9 ; (nforml.s13 + 0)
.s11:
10c6 : a9 58 __ LDA #$58
10c8 : a6 44 __ LDX T2 + 0 
10ca : 9d de 9f STA $9fde,x ; (si + 7)
10cd : 8a __ __ TXA
10ce : 18 __ __ CLC
10cf : 69 fe __ ADC #$fe
10d1 : 85 44 __ STA T2 + 0 
10d3 : aa __ __ TAX
10d4 : a9 30 __ LDA #$30
10d6 : 9d df 9f STA $9fdf,x ; (buffer + 0)
.s13:
10d9 : a9 00 __ LDA #$00
10db : 85 1b __ STA ACCU + 0 
10dd : a5 43 __ LDA T0 + 0 
10df : f0 06 __ BEQ $10e7 ; (nforml.s16 + 0)
.s15:
10e1 : c6 44 __ DEC T2 + 0 
10e3 : a9 2d __ LDA #$2d
10e5 : d0 0a __ BNE $10f1 ; (nforml.s1038 + 0)
.s16:
10e7 : a0 05 __ LDY #$05
10e9 : b1 0d __ LDA (P0),y ; (si + 0)
10eb : f0 09 __ BEQ $10f6 ; (nforml.s163 + 0)
.s18:
10ed : c6 44 __ DEC T2 + 0 
10ef : a9 2b __ LDA #$2b
.s1038:
10f1 : a6 44 __ LDX T2 + 0 
10f3 : 9d df 9f STA $9fdf,x ; (buffer + 0)
.s163:
10f6 : a0 06 __ LDY #$06
10f8 : b1 0d __ LDA (P0),y ; (si + 0)
10fa : d0 33 __ BNE $112f ; (nforml.s24 + 0)
.l30:
10fc : a0 01 __ LDY #$01
10fe : b1 0d __ LDA (P0),y ; (si + 0)
1100 : 18 __ __ CLC
1101 : 65 44 __ ADC T2 + 0 
1103 : b0 04 __ BCS $1109 ; (nforml.s31 + 0)
.s1006:
1105 : c9 11 __ CMP #$11
1107 : 90 0d __ BCC $1116 ; (nforml.s33 + 0)
.s31:
1109 : c6 44 __ DEC T2 + 0 
110b : a0 00 __ LDY #$00
110d : b1 0d __ LDA (P0),y ; (si + 0)
110f : a6 44 __ LDX T2 + 0 
1111 : 9d df 9f STA $9fdf,x ; (buffer + 0)
1114 : b0 e6 __ BCS $10fc ; (nforml.l30 + 0)
.s33:
1116 : a6 44 __ LDX T2 + 0 
1118 : e0 10 __ CPX #$10
111a : b0 0e __ BCS $112a ; (nforml.s23 + 0)
.s34:
111c : 88 __ __ DEY
.l1035:
111d : bd df 9f LDA $9fdf,x ; (buffer + 0)
1120 : 91 0f __ STA (P2),y ; (str + 0)
1122 : e8 __ __ INX
1123 : e0 10 __ CPX #$10
1125 : c8 __ __ INY
1126 : 90 f5 __ BCC $111d ; (nforml.l1035 + 0)
.s1036:
1128 : 84 1b __ STY ACCU + 0 
.s23:
112a : a9 00 __ LDA #$00
112c : 85 1c __ STA ACCU + 1 
.s1001:
112e : 60 __ __ RTS
.s24:
112f : a6 44 __ LDX T2 + 0 
1131 : e0 10 __ CPX #$10
1133 : b0 1a __ BCS $114f ; (nforml.l27 + 0)
.s25:
1135 : a0 00 __ LDY #$00
.l1033:
1137 : bd df 9f LDA $9fdf,x ; (buffer + 0)
113a : 91 0f __ STA (P2),y ; (str + 0)
113c : e8 __ __ INX
113d : e0 10 __ CPX #$10
113f : c8 __ __ INY
1140 : 90 f5 __ BCC $1137 ; (nforml.l1033 + 0)
.s1034:
1142 : 84 1b __ STY ACCU + 0 
1144 : b0 09 __ BCS $114f ; (nforml.l27 + 0)
.s28:
1146 : 88 __ __ DEY
1147 : b1 0d __ LDA (P0),y ; (si + 0)
1149 : a4 1b __ LDY ACCU + 0 
114b : 91 0f __ STA (P2),y ; (str + 0)
114d : e6 1b __ INC ACCU + 0 
.l27:
114f : a5 1b __ LDA ACCU + 0 
1151 : a0 01 __ LDY #$01
1153 : d1 0d __ CMP (P0),y ; (si + 0)
1155 : 90 ef __ BCC $1146 ; (nforml.s28 + 0)
1157 : 4c 2a 11 JMP $112a ; (nforml.s23 + 0)
.l6:
115a : a5 11 __ LDA P4 ; (v + 0)
115c : 85 1b __ STA ACCU + 0 
115e : a5 12 __ LDA P5 ; (v + 1)
1160 : 85 1c __ STA ACCU + 1 
1162 : a5 13 __ LDA P6 ; (v + 2)
1164 : 85 1d __ STA ACCU + 2 
1166 : a5 14 __ LDA P7 ; (v + 3)
1168 : 85 1e __ STA ACCU + 3 
116a : a5 45 __ LDA T5 + 0 
116c : 85 03 __ STA WORK + 0 
116e : a5 46 __ LDA T5 + 1 
1170 : 85 04 __ STA WORK + 1 
1172 : a9 00 __ LDA #$00
1174 : 85 05 __ STA WORK + 2 
1176 : 85 06 __ STA WORK + 3 
1178 : 20 9f 2d JSR $2d9f ; (divmod32 + 0)
117b : a5 08 __ LDA WORK + 5 
117d : 30 08 __ BMI $1187 ; (nforml.s78 + 0)
.s1023:
117f : d0 0a __ BNE $118b ; (nforml.s77 + 0)
.s1022:
1181 : a5 07 __ LDA WORK + 4 
1183 : c9 0a __ CMP #$0a
1185 : b0 04 __ BCS $118b ; (nforml.s77 + 0)
.s78:
1187 : a9 30 __ LDA #$30
1189 : d0 02 __ BNE $118d ; (nforml.s79 + 0)
.s77:
118b : a9 37 __ LDA #$37
.s79:
118d : 18 __ __ CLC
118e : 65 07 __ ADC WORK + 4 
1190 : c6 44 __ DEC T2 + 0 
1192 : a6 44 __ LDX T2 + 0 
1194 : 9d df 9f STA $9fdf,x ; (buffer + 0)
1197 : a5 1b __ LDA ACCU + 0 
1199 : 85 11 __ STA P4 ; (v + 0)
119b : a5 1c __ LDA ACCU + 1 
119d : 85 12 __ STA P5 ; (v + 1)
119f : a5 1d __ LDA ACCU + 2 
11a1 : 85 13 __ STA P6 ; (v + 2)
11a3 : a5 1e __ LDA ACCU + 3 
11a5 : 85 14 __ STA P7 ; (v + 3)
11a7 : d0 b1 __ BNE $115a ; (nforml.l6 + 0)
.s1018:
11a9 : a5 13 __ LDA P6 ; (v + 2)
11ab : d0 ad __ BNE $115a ; (nforml.l6 + 0)
.s1019:
11ad : a5 12 __ LDA P5 ; (v + 1)
11af : d0 a9 __ BNE $115a ; (nforml.l6 + 0)
.s1020:
11b1 : c5 11 __ CMP P4 ; (v + 0)
11b3 : 90 a5 __ BCC $115a ; (nforml.l6 + 0)
11b5 : 4c 90 10 JMP $1090 ; (nforml.s7 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->i16
.s0:
11b8 : a5 15 __ LDA P8 ; (f + 0)
11ba : 85 43 __ STA T1 + 0 
11bc : a5 16 __ LDA P9 ; (f + 1)
11be : 85 44 __ STA T1 + 1 
11c0 : a5 17 __ LDA P10 ; (f + 2)
11c2 : 85 45 __ STA T1 + 2 
11c4 : a5 18 __ LDA P11 ; (f + 3)
11c6 : 29 7f __ AND #$7f
11c8 : 05 17 __ ORA P10 ; (f + 2)
11ca : 05 16 __ ORA P9 ; (f + 1)
11cc : 05 15 __ ORA P8 ; (f + 0)
11ce : f0 21 __ BEQ $11f1 ; (nformf.s2 + 0)
.s1075:
11d0 : 24 18 __ BIT P11 ; (f + 3)
11d2 : 10 1d __ BPL $11f1 ; (nformf.s2 + 0)
.s1:
11d4 : a9 2d __ LDA #$2d
11d6 : a0 00 __ LDY #$00
11d8 : 91 13 __ STA (P6),y ; (str + 0)
11da : a5 18 __ LDA P11 ; (f + 3)
11dc : 49 80 __ EOR #$80
11de : 85 18 __ STA P11 ; (f + 3)
11e0 : 85 10 __ STA P3 
11e2 : a5 15 __ LDA P8 ; (f + 0)
11e4 : 85 0d __ STA P0 
11e6 : a5 16 __ LDA P9 ; (f + 1)
11e8 : 85 0e __ STA P1 
11ea : a5 17 __ LDA P10 ; (f + 2)
11ec : 85 0f __ STA P2 
11ee : 4c 66 16 JMP $1666 ; (nformf.s207 + 0)
.s2:
11f1 : a5 15 __ LDA P8 ; (f + 0)
11f3 : 85 0d __ STA P0 
11f5 : a5 16 __ LDA P9 ; (f + 1)
11f7 : 85 0e __ STA P1 
11f9 : a5 17 __ LDA P10 ; (f + 2)
11fb : 85 0f __ STA P2 
11fd : a5 18 __ LDA P11 ; (f + 3)
11ff : 85 10 __ STA P3 
1201 : a0 05 __ LDY #$05
1203 : b1 11 __ LDA (P4),y ; (si + 0)
1205 : f0 09 __ BEQ $1210 ; (nformf.s3 + 0)
.s4:
1207 : a9 2b __ LDA #$2b
1209 : a0 00 __ LDY #$00
120b : 91 13 __ STA (P6),y ; (str + 0)
120d : 4c 66 16 JMP $1666 ; (nformf.s207 + 0)
.s3:
1210 : 20 7e 16 JSR $167e ; (isinf.s0 + 0)
1213 : aa __ __ TAX
1214 : a9 00 __ LDA #$00
1216 : 85 48 __ STA T3 + 0 
1218 : 8a __ __ TXA
1219 : f0 0b __ BEQ $1226 ; (nformf.s8 + 0)
.s160:
121b : a9 01 __ LDA #$01
121d : 85 4a __ STA T5 + 0 
121f : a9 02 __ LDA #$02
1221 : a0 00 __ LDY #$00
1223 : 4c 4a 16 JMP $164a ; (nformf.s7 + 0)
.s8:
1226 : a0 02 __ LDY #$02
1228 : b1 11 __ LDA (P4),y ; (si + 0)
122a : c9 ff __ CMP #$ff
122c : d0 02 __ BNE $1230 ; (nformf.s128 + 0)
.s129:
122e : a9 06 __ LDA #$06
.s128:
1230 : 86 4a __ STX T5 + 0 
1232 : 86 4b __ STX T5 + 1 
1234 : 85 49 __ STA T4 + 0 
1236 : 85 47 __ STA T2 + 0 
1238 : a5 18 __ LDA P11 ; (f + 3)
123a : 85 46 __ STA T1 + 3 
123c : 29 7f __ AND #$7f
123e : 05 17 __ ORA P10 ; (f + 2)
1240 : 05 16 __ ORA P9 ; (f + 1)
1242 : 05 15 __ ORA P8 ; (f + 0)
1244 : f0 03 __ BEQ $1249 ; (nformf.s12 + 0)
1246 : 4c 4b 15 JMP $154b ; (nformf.s13 + 0)
.s12:
1249 : ad ef 9f LDA $9fef ; (sstack + 0)
124c : c9 65 __ CMP #$65
124e : d0 04 __ BNE $1254 ; (nformf.s1003 + 0)
.s1002:
1250 : a9 01 __ LDA #$01
1252 : d0 02 __ BNE $1256 ; (nformf.s1004 + 0)
.s1003:
1254 : a9 00 __ LDA #$00
.s1004:
1256 : 85 4e __ STA T9 + 0 
1258 : a6 49 __ LDX T4 + 0 
125a : e8 __ __ INX
125b : 86 4c __ STX T8 + 0 
125d : ad ef 9f LDA $9fef ; (sstack + 0)
1260 : c9 67 __ CMP #$67
1262 : d0 13 __ BNE $1277 ; (nformf.s24 + 0)
.s22:
1264 : a5 4b __ LDA T5 + 1 
1266 : 30 08 __ BMI $1270 ; (nformf.s25 + 0)
.s1046:
1268 : d0 06 __ BNE $1270 ; (nformf.s25 + 0)
.s1045:
126a : a5 4a __ LDA T5 + 0 
126c : c9 04 __ CMP #$04
126e : 90 07 __ BCC $1277 ; (nformf.s24 + 0)
.s25:
1270 : a9 01 __ LDA #$01
1272 : 85 4e __ STA T9 + 0 
1274 : 4c c2 14 JMP $14c2 ; (nformf.s30 + 0)
.s24:
1277 : a5 4e __ LDA T9 + 0 
1279 : f0 03 __ BEQ $127e ; (nformf.s32 + 0)
127b : 4c c2 14 JMP $14c2 ; (nformf.s30 + 0)
.s32:
127e : 24 4b __ BIT T5 + 1 
1280 : 10 3e __ BPL $12c0 ; (nformf.s34 + 0)
.s33:
1282 : a5 43 __ LDA T1 + 0 
1284 : 85 1b __ STA ACCU + 0 
1286 : a5 44 __ LDA T1 + 1 
1288 : 85 1c __ STA ACCU + 1 
128a : a5 45 __ LDA T1 + 2 
128c : 85 1d __ STA ACCU + 2 
128e : a5 46 __ LDA T1 + 3 
1290 : 85 1e __ STA ACCU + 3 
.l1082:
1292 : e6 4a __ INC T5 + 0 
1294 : d0 02 __ BNE $1298 ; (nformf.s1092 + 0)
.s1091:
1296 : e6 4b __ INC T5 + 1 
.s1092:
1298 : a9 00 __ LDA #$00
129a : 85 03 __ STA WORK + 0 
129c : 85 04 __ STA WORK + 1 
129e : a9 20 __ LDA #$20
12a0 : 85 05 __ STA WORK + 2 
12a2 : a9 41 __ LDA #$41
12a4 : 85 06 __ STA WORK + 3 
12a6 : 20 5a 29 JSR $295a ; (freg + 20)
12a9 : 20 41 2b JSR $2b41 ; (fdiv + 0)
12ac : 24 4b __ BIT T5 + 1 
12ae : 30 e2 __ BMI $1292 ; (nformf.l1082 + 0)
.s1083:
12b0 : a5 1e __ LDA ACCU + 3 
12b2 : 85 46 __ STA T1 + 3 
12b4 : a5 1d __ LDA ACCU + 2 
12b6 : 85 45 __ STA T1 + 2 
12b8 : a5 1c __ LDA ACCU + 1 
12ba : 85 44 __ STA T1 + 1 
12bc : a5 1b __ LDA ACCU + 0 
12be : 85 43 __ STA T1 + 0 
.s34:
12c0 : 18 __ __ CLC
12c1 : a5 49 __ LDA T4 + 0 
12c3 : 65 4a __ ADC T5 + 0 
12c5 : 18 __ __ CLC
12c6 : 69 01 __ ADC #$01
12c8 : 85 4c __ STA T8 + 0 
12ca : c9 07 __ CMP #$07
12cc : 90 14 __ BCC $12e2 ; (nformf.s35 + 0)
.s36:
12ce : ad 72 2f LDA $2f72 ; (fround5 + 24)
12d1 : 85 1b __ STA ACCU + 0 
12d3 : ad 73 2f LDA $2f73 ; (fround5 + 25)
12d6 : 85 1c __ STA ACCU + 1 
12d8 : ad 74 2f LDA $2f74 ; (fround5 + 26)
12db : 85 1d __ STA ACCU + 2 
12dd : ad 75 2f LDA $2f75 ; (fround5 + 27)
12e0 : b0 15 __ BCS $12f7 ; (nformf.s231 + 0)
.s35:
12e2 : 0a __ __ ASL
12e3 : 0a __ __ ASL
12e4 : aa __ __ TAX
12e5 : bd 56 2f LDA $2f56,x 
12e8 : 85 1b __ STA ACCU + 0 
12ea : bd 57 2f LDA $2f57,x 
12ed : 85 1c __ STA ACCU + 1 
12ef : bd 58 2f LDA $2f58,x 
12f2 : 85 1d __ STA ACCU + 2 
12f4 : bd 59 2f LDA $2f59,x 
.s231:
12f7 : 85 1e __ STA ACCU + 3 
12f9 : a2 43 __ LDX #$43
12fb : 20 4a 29 JSR $294a ; (freg + 4)
12fe : 20 8b 29 JSR $298b ; (faddsub + 0)
1301 : a5 1c __ LDA ACCU + 1 
1303 : 85 16 __ STA P9 ; (f + 1)
1305 : a5 1d __ LDA ACCU + 2 
1307 : 85 17 __ STA P10 ; (f + 2)
1309 : a6 1b __ LDX ACCU + 0 
130b : a5 1e __ LDA ACCU + 3 
130d : 85 18 __ STA P11 ; (f + 3)
130f : 30 33 __ BMI $1344 ; (nformf.s31 + 0)
.s1028:
1311 : c9 41 __ CMP #$41
1313 : d0 06 __ BNE $131b ; (nformf.s1032 + 0)
.s1029:
1315 : a5 17 __ LDA P10 ; (f + 2)
1317 : c9 20 __ CMP #$20
1319 : f0 02 __ BEQ $131d ; (nformf.s38 + 0)
.s1032:
131b : 90 27 __ BCC $1344 ; (nformf.s31 + 0)
.s38:
131d : a9 00 __ LDA #$00
131f : 85 03 __ STA WORK + 0 
1321 : 85 04 __ STA WORK + 1 
1323 : a9 20 __ LDA #$20
1325 : 85 05 __ STA WORK + 2 
1327 : a9 41 __ LDA #$41
1329 : 85 06 __ STA WORK + 3 
132b : 20 5a 29 JSR $295a ; (freg + 20)
132e : 20 41 2b JSR $2b41 ; (fdiv + 0)
1331 : a5 1c __ LDA ACCU + 1 
1333 : 85 16 __ STA P9 ; (f + 1)
1335 : a5 1d __ LDA ACCU + 2 
1337 : 85 17 __ STA P10 ; (f + 2)
1339 : a5 1e __ LDA ACCU + 3 
133b : 85 18 __ STA P11 ; (f + 3)
133d : a6 49 __ LDX T4 + 0 
133f : ca __ __ DEX
1340 : 86 47 __ STX T2 + 0 
1342 : a6 1b __ LDX ACCU + 0 
.s31:
1344 : 38 __ __ SEC
1345 : a5 4c __ LDA T8 + 0 
1347 : e5 47 __ SBC T2 + 0 
1349 : 85 49 __ STA T4 + 0 
134b : a9 14 __ LDA #$14
134d : c5 4c __ CMP T8 + 0 
134f : b0 02 __ BCS $1353 ; (nformf.s49 + 0)
.s47:
1351 : 85 4c __ STA T8 + 0 
.s49:
1353 : a5 49 __ LDA T4 + 0 
1355 : d0 08 __ BNE $135f ; (nformf.s236 + 0)
.s50:
1357 : a9 30 __ LDA #$30
1359 : a4 48 __ LDY T3 + 0 
135b : 91 13 __ STA (P6),y ; (str + 0)
135d : e6 48 __ INC T3 + 0 
.s236:
135f : a9 00 __ LDA #$00
1361 : 85 47 __ STA T2 + 0 
1363 : c5 49 __ CMP T4 + 0 
1365 : d0 08 __ BNE $136f ; (nformf.l59 + 0)
.l57:
1367 : a9 2e __ LDA #$2e
1369 : a4 48 __ LDY T3 + 0 
136b : 91 13 __ STA (P6),y ; (str + 0)
136d : e6 48 __ INC T3 + 0 
.l59:
136f : a5 47 __ LDA T2 + 0 
1371 : c9 07 __ CMP #$07
1373 : 90 04 __ BCC $1379 ; (nformf.s61 + 0)
.s60:
1375 : a9 30 __ LDA #$30
1377 : b0 55 __ BCS $13ce ; (nformf.s170 + 0)
.s61:
1379 : 86 1b __ STX ACCU + 0 
137b : 86 43 __ STX T1 + 0 
137d : a5 16 __ LDA P9 ; (f + 1)
137f : 85 1c __ STA ACCU + 1 
1381 : 85 44 __ STA T1 + 1 
1383 : a5 17 __ LDA P10 ; (f + 2)
1385 : 85 1d __ STA ACCU + 2 
1387 : 85 45 __ STA T1 + 2 
1389 : a5 18 __ LDA P11 ; (f + 3)
138b : 85 1e __ STA ACCU + 3 
138d : 85 46 __ STA T1 + 3 
138f : 20 d7 2c JSR $2cd7 ; (f32_to_i16 + 0)
1392 : a5 1b __ LDA ACCU + 0 
1394 : 85 4f __ STA T11 + 0 
1396 : 20 19 2d JSR $2d19 ; (sint16_to_float + 0)
1399 : a2 43 __ LDX #$43
139b : 20 4a 29 JSR $294a ; (freg + 4)
139e : a5 1e __ LDA ACCU + 3 
13a0 : 49 80 __ EOR #$80
13a2 : 85 1e __ STA ACCU + 3 
13a4 : 20 8b 29 JSR $298b ; (faddsub + 0)
13a7 : a9 00 __ LDA #$00
13a9 : 85 03 __ STA WORK + 0 
13ab : 85 04 __ STA WORK + 1 
13ad : a9 20 __ LDA #$20
13af : 85 05 __ STA WORK + 2 
13b1 : a9 41 __ LDA #$41
13b3 : 85 06 __ STA WORK + 3 
13b5 : 20 5a 29 JSR $295a ; (freg + 20)
13b8 : 20 72 2a JSR $2a72 ; (fmul + 0)
13bb : a5 1c __ LDA ACCU + 1 
13bd : 85 16 __ STA P9 ; (f + 1)
13bf : a5 1d __ LDA ACCU + 2 
13c1 : 85 17 __ STA P10 ; (f + 2)
13c3 : a5 1e __ LDA ACCU + 3 
13c5 : 85 18 __ STA P11 ; (f + 3)
13c7 : 18 __ __ CLC
13c8 : a5 4f __ LDA T11 + 0 
13ca : 69 30 __ ADC #$30
13cc : a6 1b __ LDX ACCU + 0 
.s170:
13ce : a4 48 __ LDY T3 + 0 
13d0 : 91 13 __ STA (P6),y ; (str + 0)
13d2 : e6 48 __ INC T3 + 0 
13d4 : e6 47 __ INC T2 + 0 
13d6 : a5 47 __ LDA T2 + 0 
13d8 : c5 4c __ CMP T8 + 0 
13da : b0 07 __ BCS $13e3 ; (nformf.s56 + 0)
.s54:
13dc : c5 49 __ CMP T4 + 0 
13de : d0 8f __ BNE $136f ; (nformf.l59 + 0)
13e0 : 4c 67 13 JMP $1367 ; (nformf.l57 + 0)
.s56:
13e3 : a5 4e __ LDA T9 + 0 
13e5 : f0 62 __ BEQ $1449 ; (nformf.s9 + 0)
.s63:
13e7 : a9 45 __ LDA #$45
13e9 : a4 48 __ LDY T3 + 0 
13eb : 91 13 __ STA (P6),y ; (str + 0)
13ed : c8 __ __ INY
13ee : 24 4b __ BIT T5 + 1 
13f0 : 30 06 __ BMI $13f8 ; (nformf.s66 + 0)
.s67:
13f2 : a9 2b __ LDA #$2b
13f4 : 91 13 __ STA (P6),y ; (str + 0)
13f6 : b0 11 __ BCS $1409 ; (nformf.s68 + 0)
.s66:
13f8 : a9 2d __ LDA #$2d
13fa : 91 13 __ STA (P6),y ; (str + 0)
13fc : 38 __ __ SEC
13fd : a9 00 __ LDA #$00
13ff : e5 4a __ SBC T5 + 0 
1401 : 85 4a __ STA T5 + 0 
1403 : a9 00 __ LDA #$00
1405 : e5 4b __ SBC T5 + 1 
1407 : 85 4b __ STA T5 + 1 
.s68:
1409 : a5 4a __ LDA T5 + 0 
140b : 85 1b __ STA ACCU + 0 
140d : a5 4b __ LDA T5 + 1 
140f : 85 1c __ STA ACCU + 1 
1411 : a9 0a __ LDA #$0a
1413 : 85 03 __ STA WORK + 0 
1415 : a9 00 __ LDA #$00
1417 : 85 04 __ STA WORK + 1 
1419 : 20 ef 2b JSR $2bef ; (divs16 + 0)
141c : 18 __ __ CLC
141d : a5 1b __ LDA ACCU + 0 
141f : 69 30 __ ADC #$30
1421 : a4 48 __ LDY T3 + 0 
1423 : c8 __ __ INY
1424 : c8 __ __ INY
1425 : 91 13 __ STA (P6),y ; (str + 0)
1427 : a5 4a __ LDA T5 + 0 
1429 : 85 1b __ STA ACCU + 0 
142b : a5 4b __ LDA T5 + 1 
142d : 85 1c __ STA ACCU + 1 
142f : a9 0a __ LDA #$0a
1431 : 85 03 __ STA WORK + 0 
1433 : a9 00 __ LDA #$00
1435 : 85 04 __ STA WORK + 1 
1437 : 20 ae 2c JSR $2cae ; (mods16 + 0)
143a : 18 __ __ CLC
143b : a5 05 __ LDA WORK + 2 
143d : 69 30 __ ADC #$30
143f : a4 48 __ LDY T3 + 0 
1441 : c8 __ __ INY
1442 : c8 __ __ INY
1443 : c8 __ __ INY
1444 : 91 13 __ STA (P6),y ; (str + 0)
1446 : c8 __ __ INY
1447 : 84 48 __ STY T3 + 0 
.s9:
1449 : a5 48 __ LDA T3 + 0 
144b : a0 01 __ LDY #$01
144d : d1 11 __ CMP (P4),y ; (si + 0)
144f : b0 5b __ BCS $14ac ; (nformf.s1001 + 0)
.s69:
1451 : a0 06 __ LDY #$06
1453 : b1 11 __ LDA (P4),y ; (si + 0)
1455 : f0 05 __ BEQ $145c ; (nformf.s73 + 0)
.s72:
1457 : a5 48 __ LDA T3 + 0 
1459 : aa __ __ TAX
145a : 90 57 __ BCC $14b3 ; (nformf.l75 + 0)
.s73:
145c : a5 48 __ LDA T3 + 0 
145e : f0 2d __ BEQ $148d ; (nformf.s82 + 0)
.s90:
1460 : a9 01 __ LDA #$01
1462 : 85 47 __ STA T2 + 0 
1464 : a6 48 __ LDX T3 + 0 
1466 : 38 __ __ SEC
.l1080:
1467 : a0 01 __ LDY #$01
1469 : b1 11 __ LDA (P4),y ; (si + 0)
146b : e5 47 __ SBC T2 + 0 
146d : 85 4c __ STA T8 + 0 
146f : a9 ff __ LDA #$ff
1471 : 65 14 __ ADC P7 ; (str + 1)
1473 : 85 4d __ STA T8 + 1 
1475 : 8a __ __ TXA
1476 : 38 __ __ SEC
1477 : e5 47 __ SBC T2 + 0 
1479 : 85 1b __ STA ACCU + 0 
147b : a9 ff __ LDA #$ff
147d : 65 14 __ ADC P7 ; (str + 1)
147f : 85 1c __ STA ACCU + 1 
1481 : a4 13 __ LDY P6 ; (str + 0)
1483 : b1 1b __ LDA (ACCU + 0),y 
1485 : 91 4c __ STA (T8 + 0),y 
1487 : e6 47 __ INC T2 + 0 
1489 : e4 47 __ CPX T2 + 0 
148b : b0 da __ BCS $1467 ; (nformf.l1080 + 0)
.s82:
148d : a9 00 __ LDA #$00
148f : 85 47 __ STA T2 + 0 
1491 : 90 08 __ BCC $149b ; (nformf.l83 + 0)
.s84:
1493 : a9 20 __ LDA #$20
1495 : a4 47 __ LDY T2 + 0 
1497 : 91 13 __ STA (P6),y ; (str + 0)
1499 : e6 47 __ INC T2 + 0 
.l83:
149b : a0 01 __ LDY #$01
149d : b1 11 __ LDA (P4),y ; (si + 0)
149f : 38 __ __ SEC
14a0 : e5 48 __ SBC T3 + 0 
14a2 : 90 ef __ BCC $1493 ; (nformf.s84 + 0)
.s1007:
14a4 : c5 47 __ CMP T2 + 0 
14a6 : 90 02 __ BCC $14aa ; (nformf.s74 + 0)
.s1084:
14a8 : d0 e9 __ BNE $1493 ; (nformf.s84 + 0)
.s74:
14aa : b1 11 __ LDA (P4),y ; (si + 0)
.s1001:
14ac : 85 1b __ STA ACCU + 0 
14ae : a9 00 __ LDA #$00
14b0 : 85 1c __ STA ACCU + 1 
14b2 : 60 __ __ RTS
.l75:
14b3 : a0 01 __ LDY #$01
14b5 : d1 11 __ CMP (P4),y ; (si + 0)
14b7 : b0 f1 __ BCS $14aa ; (nformf.s74 + 0)
.s76:
14b9 : a8 __ __ TAY
14ba : a9 20 __ LDA #$20
14bc : 91 13 __ STA (P6),y ; (str + 0)
14be : e8 __ __ INX
14bf : 8a __ __ TXA
14c0 : 90 f1 __ BCC $14b3 ; (nformf.l75 + 0)
.s30:
14c2 : a5 4c __ LDA T8 + 0 
14c4 : c9 07 __ CMP #$07
14c6 : 90 14 __ BCC $14dc ; (nformf.s41 + 0)
.s42:
14c8 : ad 72 2f LDA $2f72 ; (fround5 + 24)
14cb : 85 1b __ STA ACCU + 0 
14cd : ad 73 2f LDA $2f73 ; (fround5 + 25)
14d0 : 85 1c __ STA ACCU + 1 
14d2 : ad 74 2f LDA $2f74 ; (fround5 + 26)
14d5 : 85 1d __ STA ACCU + 2 
14d7 : ad 75 2f LDA $2f75 ; (fround5 + 27)
14da : b0 15 __ BCS $14f1 ; (nformf.s222 + 0)
.s41:
14dc : 0a __ __ ASL
14dd : 0a __ __ ASL
14de : aa __ __ TAX
14df : bd 56 2f LDA $2f56,x 
14e2 : 85 1b __ STA ACCU + 0 
14e4 : bd 57 2f LDA $2f57,x 
14e7 : 85 1c __ STA ACCU + 1 
14e9 : bd 58 2f LDA $2f58,x 
14ec : 85 1d __ STA ACCU + 2 
14ee : bd 59 2f LDA $2f59,x 
.s222:
14f1 : 85 1e __ STA ACCU + 3 
14f3 : a2 43 __ LDX #$43
14f5 : 20 4a 29 JSR $294a ; (freg + 4)
14f8 : 20 8b 29 JSR $298b ; (faddsub + 0)
14fb : a5 1c __ LDA ACCU + 1 
14fd : 85 16 __ STA P9 ; (f + 1)
14ff : a5 1d __ LDA ACCU + 2 
1501 : 85 17 __ STA P10 ; (f + 2)
1503 : a6 1b __ LDX ACCU + 0 
1505 : a5 1e __ LDA ACCU + 3 
1507 : 85 18 __ STA P11 ; (f + 3)
1509 : 10 03 __ BPL $150e ; (nformf.s1038 + 0)
150b : 4c 44 13 JMP $1344 ; (nformf.s31 + 0)
.s1038:
150e : c9 41 __ CMP #$41
1510 : d0 06 __ BNE $1518 ; (nformf.s1042 + 0)
.s1039:
1512 : a5 17 __ LDA P10 ; (f + 2)
1514 : c9 20 __ CMP #$20
1516 : f0 05 __ BEQ $151d ; (nformf.s44 + 0)
.s1042:
1518 : b0 03 __ BCS $151d ; (nformf.s44 + 0)
151a : 4c 44 13 JMP $1344 ; (nformf.s31 + 0)
.s44:
151d : a9 00 __ LDA #$00
151f : 85 03 __ STA WORK + 0 
1521 : 85 04 __ STA WORK + 1 
1523 : a9 20 __ LDA #$20
1525 : 85 05 __ STA WORK + 2 
1527 : a9 41 __ LDA #$41
1529 : 85 06 __ STA WORK + 3 
152b : 20 5a 29 JSR $295a ; (freg + 20)
152e : 20 41 2b JSR $2b41 ; (fdiv + 0)
1531 : a5 1c __ LDA ACCU + 1 
1533 : 85 16 __ STA P9 ; (f + 1)
1535 : a5 1d __ LDA ACCU + 2 
1537 : 85 17 __ STA P10 ; (f + 2)
1539 : a5 1e __ LDA ACCU + 3 
153b : 85 18 __ STA P11 ; (f + 3)
153d : a6 1b __ LDX ACCU + 0 
153f : e6 4a __ INC T5 + 0 
1541 : f0 03 __ BEQ $1546 ; (nformf.s1089 + 0)
1543 : 4c 44 13 JMP $1344 ; (nformf.s31 + 0)
.s1089:
1546 : e6 4b __ INC T5 + 1 
1548 : 4c 44 13 JMP $1344 ; (nformf.s31 + 0)
.s13:
154b : a5 18 __ LDA P11 ; (f + 3)
154d : 30 59 __ BMI $15a8 ; (nformf.l17 + 0)
.l1068:
154f : c9 44 __ CMP #$44
1551 : f0 03 __ BEQ $1556 ; (nformf.s1069 + 0)
1553 : 4c 45 16 JMP $1645 ; (nformf.s1072 + 0)
.s1069:
1556 : a5 45 __ LDA T1 + 2 
1558 : c9 7a __ CMP #$7a
155a : f0 03 __ BEQ $155f ; (nformf.s1070 + 0)
155c : 4c 45 16 JMP $1645 ; (nformf.s1072 + 0)
.s1070:
155f : a5 44 __ LDA T1 + 1 
1561 : d0 04 __ BNE $1567 ; (nformf.s1079 + 0)
.s1071:
1563 : a5 43 __ LDA T1 + 0 
1565 : f0 02 __ BEQ $1569 ; (nformf.s14 + 0)
.s1079:
1567 : a5 43 __ LDA T1 + 0 
.s14:
1569 : 85 1b __ STA ACCU + 0 
156b : a5 44 __ LDA T1 + 1 
156d : 85 1c __ STA ACCU + 1 
156f : a5 45 __ LDA T1 + 2 
1571 : 85 1d __ STA ACCU + 2 
1573 : a5 46 __ LDA T1 + 3 
1575 : 85 1e __ STA ACCU + 3 
1577 : a9 00 __ LDA #$00
1579 : 85 03 __ STA WORK + 0 
157b : 85 04 __ STA WORK + 1 
157d : a9 7a __ LDA #$7a
157f : 85 05 __ STA WORK + 2 
1581 : a9 44 __ LDA #$44
1583 : 85 06 __ STA WORK + 3 
1585 : 20 5a 29 JSR $295a ; (freg + 20)
1588 : 20 41 2b JSR $2b41 ; (fdiv + 0)
158b : a5 1b __ LDA ACCU + 0 
158d : 85 43 __ STA T1 + 0 
158f : a5 1c __ LDA ACCU + 1 
1591 : 85 44 __ STA T1 + 1 
1593 : a5 1d __ LDA ACCU + 2 
1595 : 85 45 __ STA T1 + 2 
1597 : 18 __ __ CLC
1598 : a5 4a __ LDA T5 + 0 
159a : 69 03 __ ADC #$03
159c : 85 4a __ STA T5 + 0 
159e : 90 02 __ BCC $15a2 ; (nformf.s1094 + 0)
.s1093:
15a0 : e6 4b __ INC T5 + 1 
.s1094:
15a2 : a5 1e __ LDA ACCU + 3 
15a4 : 85 46 __ STA T1 + 3 
15a6 : 10 a7 __ BPL $154f ; (nformf.l1068 + 0)
.l17:
15a8 : a9 00 __ LDA #$00
15aa : 85 1b __ STA ACCU + 0 
15ac : 85 1c __ STA ACCU + 1 
15ae : a9 7a __ LDA #$7a
15b0 : 85 1d __ STA ACCU + 2 
15b2 : a9 44 __ LDA #$44
15b4 : 85 1e __ STA ACCU + 3 
15b6 : a2 43 __ LDX #$43
15b8 : 20 4a 29 JSR $294a ; (freg + 4)
15bb : 20 72 2a JSR $2a72 ; (fmul + 0)
15be : a5 1b __ LDA ACCU + 0 
15c0 : 85 43 __ STA T1 + 0 
15c2 : a5 1c __ LDA ACCU + 1 
15c4 : 85 44 __ STA T1 + 1 
15c6 : a5 1d __ LDA ACCU + 2 
15c8 : 85 45 __ STA T1 + 2 
15ca : a5 1e __ LDA ACCU + 3 
15cc : 85 46 __ STA T1 + 3 
15ce : 38 __ __ SEC
15cf : a5 4a __ LDA T5 + 0 
15d1 : e9 03 __ SBC #$03
15d3 : 85 4a __ STA T5 + 0 
15d5 : b0 02 __ BCS $15d9 ; (nformf.s16 + 0)
.s1085:
15d7 : c6 4b __ DEC T5 + 1 
.s16:
15d9 : a5 46 __ LDA T1 + 3 
15db : 30 cb __ BMI $15a8 ; (nformf.l17 + 0)
.s1060:
15dd : c9 3f __ CMP #$3f
15df : d0 06 __ BNE $15e7 ; (nformf.s1064 + 0)
.s1061:
15e1 : a5 45 __ LDA T1 + 2 
15e3 : c9 80 __ CMP #$80
15e5 : f0 02 __ BEQ $15e9 ; (nformf.s19 + 0)
.s1064:
15e7 : 90 bf __ BCC $15a8 ; (nformf.l17 + 0)
.s19:
15e9 : a5 46 __ LDA T1 + 3 
15eb : c9 41 __ CMP #$41
15ed : d0 51 __ BNE $1640 ; (nformf.l1056 + 0)
.s1053:
15ef : a5 45 __ LDA T1 + 2 
15f1 : c9 20 __ CMP #$20
15f3 : d0 4b __ BNE $1640 ; (nformf.l1056 + 0)
.s1054:
15f5 : a5 44 __ LDA T1 + 1 
15f7 : d0 04 __ BNE $15fd ; (nformf.l1078 + 0)
.s1055:
15f9 : a5 43 __ LDA T1 + 0 
15fb : f0 02 __ BEQ $15ff ; (nformf.l20 + 0)
.l1078:
15fd : a5 43 __ LDA T1 + 0 
.l20:
15ff : 85 1b __ STA ACCU + 0 
1601 : a5 44 __ LDA T1 + 1 
1603 : 85 1c __ STA ACCU + 1 
1605 : a5 45 __ LDA T1 + 2 
1607 : 85 1d __ STA ACCU + 2 
1609 : a5 46 __ LDA T1 + 3 
160b : 85 1e __ STA ACCU + 3 
160d : a9 00 __ LDA #$00
160f : 85 03 __ STA WORK + 0 
1611 : 85 04 __ STA WORK + 1 
1613 : a9 20 __ LDA #$20
1615 : 85 05 __ STA WORK + 2 
1617 : a9 41 __ LDA #$41
1619 : 85 06 __ STA WORK + 3 
161b : 20 5a 29 JSR $295a ; (freg + 20)
161e : 20 41 2b JSR $2b41 ; (fdiv + 0)
1621 : a5 1b __ LDA ACCU + 0 
1623 : 85 43 __ STA T1 + 0 
1625 : a5 1c __ LDA ACCU + 1 
1627 : 85 44 __ STA T1 + 1 
1629 : a5 1d __ LDA ACCU + 2 
162b : 85 45 __ STA T1 + 2 
162d : e6 4a __ INC T5 + 0 
162f : d0 02 __ BNE $1633 ; (nformf.s1088 + 0)
.s1087:
1631 : e6 4b __ INC T5 + 1 
.s1088:
1633 : a5 1e __ LDA ACCU + 3 
1635 : 85 46 __ STA T1 + 3 
1637 : 10 03 __ BPL $163c ; (nformf.s1052 + 0)
1639 : 4c 49 12 JMP $1249 ; (nformf.s12 + 0)
.s1052:
163c : c9 41 __ CMP #$41
163e : f0 af __ BEQ $15ef ; (nformf.s1053 + 0)
.l1056:
1640 : b0 bb __ BCS $15fd ; (nformf.l1078 + 0)
1642 : 4c 49 12 JMP $1249 ; (nformf.s12 + 0)
.s1072:
1645 : 90 92 __ BCC $15d9 ; (nformf.s16 + 0)
1647 : 4c 67 15 JMP $1567 ; (nformf.s1079 + 0)
.s7:
164a : 85 1b __ STA ACCU + 0 
164c : a9 49 __ LDA #$49
164e : 91 13 __ STA (P6),y ; (str + 0)
1650 : a9 4e __ LDA #$4e
1652 : a4 4a __ LDY T5 + 0 
1654 : 91 13 __ STA (P6),y ; (str + 0)
1656 : a9 46 __ LDA #$46
1658 : a4 1b __ LDY ACCU + 0 
165a : 91 13 __ STA (P6),y ; (str + 0)
165c : 18 __ __ CLC
165d : a5 48 __ LDA T3 + 0 
165f : 69 03 __ ADC #$03
1661 : 85 48 __ STA T3 + 0 
1663 : 4c 49 14 JMP $1449 ; (nformf.s9 + 0)
.s207:
1666 : 20 7e 16 JSR $167e ; (isinf.s0 + 0)
1669 : aa __ __ TAX
166a : a9 01 __ LDA #$01
166c : 85 48 __ STA T3 + 0 
166e : 8a __ __ TXA
166f : d0 03 __ BNE $1674 ; (nformf.s158 + 0)
1671 : 4c 26 12 JMP $1226 ; (nformf.s8 + 0)
.s158:
1674 : a9 02 __ LDA #$02
1676 : 85 4a __ STA T5 + 0 
1678 : a9 03 __ LDA #$03
167a : a0 01 __ LDY #$01
167c : d0 cc __ BNE $164a ; (nformf.s7 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
.s0:
167e : 06 0f __ ASL P2 ; (f + 2)
1680 : a5 10 __ LDA P3 ; (f + 3)
1682 : 29 7f __ AND #$7f
1684 : 2a __ __ ROL
1685 : c9 ff __ CMP #$ff
1687 : d0 03 __ BNE $168c ; (isinf.s1003 + 0)
.s1002:
1689 : a9 01 __ LDA #$01
168b : 60 __ __ RTS
.s1003:
168c : a9 00 __ LDA #$00
.s1001:
168e : 60 __ __ RTS
--------------------------------------------------------------------
168f : __ __ __ BYT 4d 61 69 6e 20 4d 65 6e 75 0a 00                : Main Menu..
--------------------------------------------------------------------
printLine: ; printLine(u8,i16)->void
.s1000:
169a : a5 53 __ LDA T0 + 0 
169c : 8d 99 9f STA $9f99 ; (printLine@stack + 0)
169f : a5 54 __ LDA T0 + 1 
16a1 : 8d 9a 9f STA $9f9a ; (printLine@stack + 1)
16a4 : a5 55 __ LDA T2 + 0 
16a6 : 8d 9b 9f STA $9f9b ; (printLine@stack + 2)
16a9 : 38 __ __ SEC
16aa : a5 23 __ LDA SP + 0 ; (length + 1)
16ac : e9 06 __ SBC #$06
16ae : 85 23 __ STA SP + 0 ; (length + 1)
16b0 : b0 02 __ BCS $16b4 ; (printLine.s0 + 0)
16b2 : c6 24 __ DEC SP + 1 
.s0:
16b4 : ad f8 9f LDA $9ff8 ; (sstack + 9)
16b7 : 85 53 __ STA T0 + 0 
16b9 : ad f9 9f LDA $9ff9 ; (sstack + 10)
16bc : 30 31 __ BMI $16ef ; (printLine.s4 + 0)
.s1002:
16be : 85 54 __ STA T0 + 1 
16c0 : 05 53 __ ORA T0 + 0 
16c2 : f0 2b __ BEQ $16ef ; (printLine.s4 + 0)
.s5:
16c4 : ad f7 9f LDA $9ff7 ; (sstack + 8)
16c7 : 85 55 __ STA T2 + 0 
.l2:
16c9 : a9 18 __ LDA #$18
16cb : a0 02 __ LDY #$02
16cd : 91 23 __ STA (SP + 0),y ; (length + 1)
16cf : a9 17 __ LDA #$17
16d1 : c8 __ __ INY
16d2 : 91 23 __ STA (SP + 0),y ; (length + 1)
16d4 : a5 55 __ LDA T2 + 0 
16d6 : c8 __ __ INY
16d7 : 91 23 __ STA (SP + 0),y ; (length + 1)
16d9 : a9 00 __ LDA #$00
16db : c8 __ __ INY
16dc : 91 23 __ STA (SP + 0),y ; (length + 1)
16de : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
16e1 : a5 53 __ LDA T0 + 0 
16e3 : d0 02 __ BNE $16e7 ; (printLine.s1004 + 0)
.s1003:
16e5 : c6 54 __ DEC T0 + 1 
.s1004:
16e7 : c6 53 __ DEC T0 + 0 
16e9 : d0 de __ BNE $16c9 ; (printLine.l2 + 0)
.s1005:
16eb : a5 54 __ LDA T0 + 1 
16ed : d0 da __ BNE $16c9 ; (printLine.l2 + 0)
.s4:
16ef : a9 1b __ LDA #$1b
16f1 : a0 02 __ LDY #$02
16f3 : 91 23 __ STA (SP + 0),y ; (length + 1)
16f5 : a9 17 __ LDA #$17
16f7 : c8 __ __ INY
16f8 : 91 23 __ STA (SP + 0),y ; (length + 1)
16fa : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
.s1001:
16fd : 18 __ __ CLC
16fe : a5 23 __ LDA SP + 0 ; (length + 1)
1700 : 69 06 __ ADC #$06
1702 : 85 23 __ STA SP + 0 ; (length + 1)
1704 : 90 02 __ BCC $1708 ; (printLine.s1001 + 11)
1706 : e6 24 __ INC SP + 1 
1708 : ad 99 9f LDA $9f99 ; (printLine@stack + 0)
170b : 85 53 __ STA T0 + 0 
170d : ad 9a 9f LDA $9f9a ; (printLine@stack + 1)
1710 : 85 54 __ STA T0 + 1 
1712 : ad 9b 9f LDA $9f9b ; (printLine@stack + 2)
1715 : 85 55 __ STA T2 + 0 
1717 : 60 __ __ RTS
--------------------------------------------------------------------
1718 : __ __ __ BYT 25 63 00                                        : %c.
--------------------------------------------------------------------
171b : __ __ __ BYT 0a 00                                           : ..
--------------------------------------------------------------------
171d : __ __ __ BYT 57 65 6c 63 6f 6d 65 20 74 6f 20 48 69 2d 4c 6f : Welcome to Hi-Lo
172d : __ __ __ BYT 21 0a 00                                        : !..
--------------------------------------------------------------------
1730 : __ __ __ BYT 25 64 2e 20 25 73 0a 00                         : %d. %s..
--------------------------------------------------------------------
askForNumber: ; askForNumber(const u8*)->i16
.s1000:
1738 : 38 __ __ SEC
1739 : a5 23 __ LDA SP + 0 
173b : e9 06 __ SBC #$06
173d : 85 23 __ STA SP + 0 
173f : b0 02 __ BCS $1743 ; (askForNumber.s0 + 0)
1741 : c6 24 __ DEC SP + 1 
.s0:
1743 : a9 00 __ LDA #$00
1745 : 8d 9d 9f STA $9f9d ; (printLine@stack + 4)
1748 : 8d 9e 9f STA $9f9e ; (printLine@stack + 5)
174b : a9 a1 __ LDA #$a1
174d : a0 02 __ LDY #$02
174f : 91 23 __ STA (SP + 0),y 
1751 : a9 17 __ LDA #$17
1753 : c8 __ __ INY
1754 : 91 23 __ STA (SP + 0),y 
1756 : ad f7 9f LDA $9ff7 ; (sstack + 8)
1759 : c8 __ __ INY
175a : 91 23 __ STA (SP + 0),y 
175c : ad f8 9f LDA $9ff8 ; (sstack + 9)
175f : c8 __ __ INY
1760 : 91 23 __ STA (SP + 0),y 
1762 : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
1765 : a9 f6 __ LDA #$f6
1767 : a0 02 __ LDY #$02
1769 : 91 23 __ STA (SP + 0),y 
176b : a9 21 __ LDA #$21
176d : c8 __ __ INY
176e : 91 23 __ STA (SP + 0),y 
1770 : a9 9d __ LDA #$9d
1772 : c8 __ __ INY
1773 : 91 23 __ STA (SP + 0),y 
1775 : a9 9f __ LDA #$9f
1777 : c8 __ __ INY
1778 : 91 23 __ STA (SP + 0),y 
177a : 20 a4 17 JSR $17a4 ; (scanf.s0 + 0)
177d : a9 1b __ LDA #$1b
177f : a0 02 __ LDY #$02
1781 : 91 23 __ STA (SP + 0),y 
1783 : a9 17 __ LDA #$17
1785 : c8 __ __ INY
1786 : 91 23 __ STA (SP + 0),y 
1788 : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
178b : ad 9d 9f LDA $9f9d ; (printLine@stack + 4)
178e : 85 1b __ STA ACCU + 0 
1790 : ad 9e 9f LDA $9f9e ; (printLine@stack + 5)
1793 : 85 1c __ STA ACCU + 1 
.s1001:
1795 : 18 __ __ CLC
1796 : a5 23 __ LDA SP + 0 
1798 : 69 06 __ ADC #$06
179a : 85 23 __ STA SP + 0 
179c : 90 02 __ BCC $17a0 ; (askForNumber.s1001 + 11)
179e : e6 24 __ INC SP + 1 
17a0 : 60 __ __ RTS
--------------------------------------------------------------------
17a1 : __ __ __ BYT 25 73 00                                        : %s.
--------------------------------------------------------------------
scanf: ; scanf(const u8*)->i16
.s0:
17a4 : a0 02 __ LDY #$02
17a6 : b1 23 __ LDA (SP + 0),y 
17a8 : 85 11 __ STA P4 
17aa : c8 __ __ INY
17ab : b1 23 __ LDA (SP + 0),y 
17ad : 85 12 __ STA P5 
17af : a9 af __ LDA #$af
17b1 : 85 13 __ STA P6 
17b3 : a9 21 __ LDA #$21
17b5 : 85 14 __ STA P7 
17b7 : a9 00 __ LDA #$00
17b9 : 85 15 __ STA P8 
17bb : 85 16 __ STA P9 
17bd : 18 __ __ CLC
17be : a5 23 __ LDA SP + 0 
17c0 : 69 04 __ ADC #$04
17c2 : 85 17 __ STA P10 
17c4 : a5 24 __ LDA SP + 1 
17c6 : 69 00 __ ADC #$00
17c8 : 85 18 __ STA P11 
17ca : 4c cd 17 JMP $17cd ; (fpscanf.s1000 + 0)
--------------------------------------------------------------------
fpscanf: ; fpscanf(const u8*,i16(*)(void*)*,void*,void**)->i16
.s1000:
17cd : 38 __ __ SEC
17ce : a5 23 __ LDA SP + 0 
17d0 : e9 3c __ SBC #$3c
17d2 : 85 23 __ STA SP + 0 
17d4 : b0 02 __ BCS $17d8 ; (fpscanf.s1000 + 11)
17d6 : c6 24 __ DEC SP + 1 
17d8 : a0 19 __ LDY #$19
17da : a2 15 __ LDX #$15
17dc : b5 53 __ LDA T0 + 0,x 
17de : 91 23 __ STA (SP + 0),y 
17e0 : 88 __ __ DEY
17e1 : ca __ __ DEX
17e2 : 10 f8 __ BPL $17dc ; (fpscanf.s1000 + 15)
.s0:
17e4 : a5 15 __ LDA P8 ; (fparam + 0)
17e6 : a0 02 __ LDY #$02
17e8 : 91 23 __ STA (SP + 0),y 
17ea : a5 16 __ LDA P9 ; (fparam + 1)
17ec : c8 __ __ INY
17ed : 91 23 __ STA (SP + 0),y 
17ef : a9 00 __ LDA #$00
17f1 : 85 53 __ STA T0 + 0 
17f3 : 85 54 __ STA T0 + 1 
17f5 : a5 13 __ LDA P6 ; (ffunc + 0)
17f7 : 85 1b __ STA ACCU + 0 
17f9 : a5 14 __ LDA P7 ; (ffunc + 1)
17fb : 85 1c __ STA ACCU + 1 
17fd : 20 fd 21 JSR $21fd ; (bcexec + 0)
1800 : a5 1b __ LDA ACCU + 0 
1802 : f0 56 __ BEQ $185a ; (fpscanf.s3 + 0)
.s214:
1804 : 85 55 __ STA T1 + 0 
1806 : a9 01 __ LDA #$01
1808 : 85 57 __ STA T3 + 0 
180a : a9 00 __ LDA #$00
180c : 85 58 __ STA T3 + 1 
.l4:
180e : a5 11 __ LDA P4 ; (fmt + 0)
1810 : 85 59 __ STA T4 + 0 
1812 : 18 __ __ CLC
1813 : 69 01 __ ADC #$01
1815 : 85 11 __ STA P4 ; (fmt + 0)
1817 : a5 12 __ LDA P5 ; (fmt + 1)
1819 : 85 5a __ STA T4 + 1 
181b : 69 00 __ ADC #$00
181d : 85 12 __ STA P5 ; (fmt + 1)
181f : a0 00 __ LDY #$00
1821 : b1 59 __ LDA (T4 + 0),y 
1823 : f0 35 __ BEQ $185a ; (fpscanf.s3 + 0)
.s2:
1825 : c9 20 __ CMP #$20
1827 : d0 03 __ BNE $182c ; (fpscanf.s200 + 0)
1829 : 4c 81 20 JMP $2081 ; (fpscanf.s7 + 0)
.s200:
182c : c9 25 __ CMP #$25
182e : f0 4a __ BEQ $187a ; (fpscanf.s20 + 0)
.s194:
1830 : a5 55 __ LDA T1 + 0 
1832 : d1 59 __ CMP (T4 + 0),y 
1834 : d0 24 __ BNE $185a ; (fpscanf.s3 + 0)
.s175:
1836 : a5 15 __ LDA P8 ; (fparam + 0)
1838 : a0 02 __ LDY #$02
183a : 91 23 __ STA (SP + 0),y 
183c : a5 16 __ LDA P9 ; (fparam + 1)
183e : c8 __ __ INY
183f : 91 23 __ STA (SP + 0),y 
1841 : a5 13 __ LDA P6 ; (ffunc + 0)
1843 : 85 1b __ STA ACCU + 0 
1845 : a5 14 __ LDA P7 ; (ffunc + 1)
1847 : 85 1c __ STA ACCU + 1 
1849 : 20 fd 21 JSR $21fd ; (bcexec + 0)
184c : a5 1b __ LDA ACCU + 0 
184e : 85 55 __ STA T1 + 0 
1850 : e6 57 __ INC T3 + 0 
1852 : d0 02 __ BNE $1856 ; (fpscanf.s372 + 0)
.s1153:
1854 : e6 58 __ INC T3 + 1 
.s372:
1856 : a5 55 __ LDA T1 + 0 
1858 : d0 b4 __ BNE $180e ; (fpscanf.l4 + 0)
.s3:
185a : a5 53 __ LDA T0 + 0 
185c : 85 1b __ STA ACCU + 0 
185e : a5 54 __ LDA T0 + 1 
1860 : 85 1c __ STA ACCU + 1 
.s1001:
1862 : a0 19 __ LDY #$19
1864 : a2 15 __ LDX #$15
1866 : b1 23 __ LDA (SP + 0),y 
1868 : 95 53 __ STA T0 + 0,x 
186a : 88 __ __ DEY
186b : ca __ __ DEX
186c : 10 f8 __ BPL $1866 ; (fpscanf.s1001 + 4)
186e : 18 __ __ CLC
186f : a5 23 __ LDA SP + 0 
1871 : 69 3c __ ADC #$3c
1873 : 85 23 __ STA SP + 0 
1875 : 90 02 __ BCC $1879 ; (fpscanf.s1001 + 23)
1877 : e6 24 __ INC SP + 1 
1879 : 60 __ __ RTS
.s20:
187a : 84 5d __ STY T6 + 0 
187c : 18 __ __ CLC
187d : a5 59 __ LDA T4 + 0 
187f : 69 02 __ ADC #$02
1881 : 85 11 __ STA P4 ; (fmt + 0)
1883 : a5 5a __ LDA T4 + 1 
1885 : 69 00 __ ADC #$00
1887 : 85 12 __ STA P5 ; (fmt + 1)
1889 : a9 ff __ LDA #$ff
188b : 85 5b __ STA T5 + 0 
188d : a9 7f __ LDA #$7f
188f : 85 5c __ STA T5 + 1 
1891 : a9 0a __ LDA #$0a
1893 : 85 5e __ STA T7 + 0 
1895 : c8 __ __ INY
1896 : 84 56 __ STY T2 + 0 
1898 : b1 59 __ LDA (T4 + 0),y 
189a : c9 2a __ CMP #$2a
189c : d0 03 __ BNE $18a1 ; (fpscanf.s23 + 0)
189e : 4c 63 20 JMP $2063 ; (fpscanf.s21 + 0)
.s23:
18a1 : 85 45 __ STA T11 + 0 
18a3 : a9 00 __ LDA #$00
18a5 : 85 60 __ STA T9 + 0 
18a7 : b1 59 __ LDA (T4 + 0),y 
18a9 : c9 30 __ CMP #$30
18ab : 90 6a __ BCC $1917 ; (fpscanf.s26 + 0)
.s27:
18ad : a5 45 __ LDA T11 + 0 
18af : c9 3a __ CMP #$3a
18b1 : b0 64 __ BCS $1917 ; (fpscanf.s26 + 0)
.s24:
18b3 : a5 11 __ LDA P4 ; (fmt + 0)
18b5 : 85 59 __ STA T4 + 0 
18b7 : 69 01 __ ADC #$01
18b9 : aa __ __ TAX
18ba : a5 12 __ LDA P5 ; (fmt + 1)
18bc : 85 5a __ STA T4 + 1 
18be : 69 00 __ ADC #$00
18c0 : 85 12 __ STA P5 ; (fmt + 1)
18c2 : 38 __ __ SEC
18c3 : a5 45 __ LDA T11 + 0 
18c5 : e9 30 __ SBC #$30
18c7 : 85 5b __ STA T5 + 0 
18c9 : a9 00 __ LDA #$00
18cb : e9 00 __ SBC #$00
.l444:
18cd : 85 5c __ STA T5 + 1 
18cf : a0 00 __ LDY #$00
18d1 : b1 59 __ LDA (T4 + 0),y 
18d3 : 85 45 __ STA T11 + 0 
18d5 : c9 30 __ CMP #$30
18d7 : 90 3c __ BCC $1915 ; (fpscanf.s1122 + 0)
.s31:
18d9 : c9 3a __ CMP #$3a
18db : b0 38 __ BCS $1915 ; (fpscanf.s1122 + 0)
.s29:
18dd : 86 59 __ STX T4 + 0 
18df : 8a __ __ TXA
18e0 : 69 01 __ ADC #$01
18e2 : aa __ __ TAX
18e3 : a5 12 __ LDA P5 ; (fmt + 1)
18e5 : 85 5a __ STA T4 + 1 
18e7 : 69 00 __ ADC #$00
18e9 : 85 12 __ STA P5 ; (fmt + 1)
18eb : a5 5b __ LDA T5 + 0 
18ed : 0a __ __ ASL
18ee : 85 1b __ STA ACCU + 0 
18f0 : a5 5c __ LDA T5 + 1 
18f2 : 2a __ __ ROL
18f3 : 06 1b __ ASL ACCU + 0 
18f5 : 2a __ __ ROL
18f6 : a8 __ __ TAY
18f7 : 18 __ __ CLC
18f8 : a5 1b __ LDA ACCU + 0 
18fa : 65 5b __ ADC T5 + 0 
18fc : 85 5b __ STA T5 + 0 
18fe : 98 __ __ TYA
18ff : 65 5c __ ADC T5 + 1 
1901 : 06 5b __ ASL T5 + 0 
1903 : 2a __ __ ROL
1904 : a8 __ __ TAY
1905 : 38 __ __ SEC
1906 : a5 45 __ LDA T11 + 0 
1908 : e9 30 __ SBC #$30
190a : 18 __ __ CLC
190b : 65 5b __ ADC T5 + 0 
190d : 85 5b __ STA T5 + 0 
190f : 98 __ __ TYA
1910 : 69 00 __ ADC #$00
1912 : 4c cd 18 JMP $18cd ; (fpscanf.l444 + 0)
.s1122:
1915 : 86 11 __ STX P4 ; (fmt + 0)
.s26:
1917 : a5 45 __ LDA T11 + 0 
1919 : c9 6c __ CMP #$6c
191b : d0 03 __ BNE $1920 ; (fpscanf.s34 + 0)
191d : 4c 49 20 JMP $2049 ; (fpscanf.s32 + 0)
.s34:
1920 : c9 67 __ CMP #$67
1922 : d0 03 __ BNE $1927 ; (fpscanf.s177 + 0)
1924 : 4c 1f 1c JMP $1c1f ; (fpscanf.s82 + 0)
.s177:
1927 : c9 67 __ CMP #$67
1929 : b0 03 __ BCS $192e ; (fpscanf.s178 + 0)
192b : 4c 13 1c JMP $1c13 ; (fpscanf.s179 + 0)
.s178:
192e : c9 73 __ CMP #$73
1930 : d0 03 __ BNE $1935 ; (fpscanf.s186 + 0)
1932 : 4c a3 1b JMP $1ba3 ; (fpscanf.s139 + 0)
.s186:
1935 : b0 03 __ BCS $193a ; (fpscanf.s187 + 0)
1937 : 4c 80 1b JMP $1b80 ; (fpscanf.s188 + 0)
.s187:
193a : c9 75 __ CMP #$75
193c : f0 0b __ BEQ $1949 ; (fpscanf.s478 + 0)
.s191:
193e : c9 78 __ CMP #$78
1940 : f0 03 __ BEQ $1945 ; (fpscanf.s38 + 0)
1942 : 4c 56 18 JMP $1856 ; (fpscanf.s372 + 0)
.s38:
1945 : a9 10 __ LDA #$10
1947 : 85 5e __ STA T7 + 0 
.s478:
1949 : a9 00 __ LDA #$00
194b : 85 56 __ STA T2 + 0 
.s41:
194d : a5 55 __ LDA T1 + 0 
194f : c9 2d __ CMP #$2d
1951 : d0 1c __ BNE $196f ; (fpscanf.s43 + 0)
.s42:
1953 : a5 15 __ LDA P8 ; (fparam + 0)
1955 : a0 02 __ LDY #$02
1957 : 91 23 __ STA (SP + 0),y 
1959 : a5 16 __ LDA P9 ; (fparam + 1)
195b : c8 __ __ INY
195c : 91 23 __ STA (SP + 0),y 
195e : a5 13 __ LDA P6 ; (ffunc + 0)
1960 : 85 1b __ STA ACCU + 0 
1962 : a5 14 __ LDA P7 ; (ffunc + 1)
1964 : 85 1c __ STA ACCU + 1 
1966 : 20 fd 21 JSR $21fd ; (bcexec + 0)
1969 : a9 01 __ LDA #$01
196b : 85 5f __ STA T8 + 0 
196d : d0 20 __ BNE $198f ; (fpscanf.s1114 + 0)
.s43:
196f : a9 00 __ LDA #$00
1971 : 85 5f __ STA T8 + 0 
1973 : a5 55 __ LDA T1 + 0 
1975 : c9 2b __ CMP #$2b
1977 : d0 1e __ BNE $1997 ; (fpscanf.s44 + 0)
.s45:
1979 : a5 15 __ LDA P8 ; (fparam + 0)
197b : a0 02 __ LDY #$02
197d : 91 23 __ STA (SP + 0),y 
197f : a5 16 __ LDA P9 ; (fparam + 1)
1981 : c8 __ __ INY
1982 : 91 23 __ STA (SP + 0),y 
1984 : a5 13 __ LDA P6 ; (ffunc + 0)
1986 : 85 1b __ STA ACCU + 0 
1988 : a5 14 __ LDA P7 ; (ffunc + 1)
198a : 85 1c __ STA ACCU + 1 
198c : 20 fd 21 JSR $21fd ; (bcexec + 0)
.s1114:
198f : e6 57 __ INC T3 + 0 
1991 : d0 02 __ BNE $1995 ; (fpscanf.s1144 + 0)
.s1143:
1993 : e6 58 __ INC T3 + 1 
.s1144:
1995 : a5 1b __ LDA ACCU + 0 
.s44:
1997 : 85 0d __ STA P0 
1999 : 20 c0 20 JSR $20c0 ; (hexch.s0 + 0)
199c : a5 1c __ LDA ACCU + 1 
199e : 10 03 __ BPL $19a3 ; (fpscanf.s48 + 0)
19a0 : 4c 5a 18 JMP $185a ; (fpscanf.s3 + 0)
.s48:
19a3 : 85 5a __ STA T4 + 1 
19a5 : a5 1b __ LDA ACCU + 0 
19a7 : 85 59 __ STA T4 + 0 
19a9 : a5 15 __ LDA P8 ; (fparam + 0)
19ab : a0 02 __ LDY #$02
19ad : 91 23 __ STA (SP + 0),y 
19af : a5 16 __ LDA P9 ; (fparam + 1)
19b1 : c8 __ __ INY
19b2 : 91 23 __ STA (SP + 0),y 
19b4 : a5 13 __ LDA P6 ; (ffunc + 0)
19b6 : 85 1b __ STA ACCU + 0 
19b8 : a5 14 __ LDA P7 ; (ffunc + 1)
19ba : 85 1c __ STA ACCU + 1 
19bc : 20 fd 21 JSR $21fd ; (bcexec + 0)
19bf : a5 1b __ LDA ACCU + 0 
19c1 : 85 55 __ STA T1 + 0 
19c3 : a5 57 __ LDA T3 + 0 
19c5 : 85 5b __ STA T5 + 0 
19c7 : 18 __ __ CLC
19c8 : 69 01 __ ADC #$01
19ca : 85 57 __ STA T3 + 0 
19cc : a5 58 __ LDA T3 + 1 
19ce : 85 5c __ STA T5 + 1 
19d0 : 69 00 __ ADC #$00
19d2 : 85 58 __ STA T3 + 1 
19d4 : a5 59 __ LDA T4 + 0 
19d6 : 05 5a __ ORA T4 + 1 
19d8 : d0 09 __ BNE $19e3 ; (fpscanf.s53 + 0)
.s54:
19da : a5 1b __ LDA ACCU + 0 
19dc : c9 78 __ CMP #$78
19de : d0 03 __ BNE $19e3 ; (fpscanf.s53 + 0)
19e0 : 4c 4b 1b JMP $1b4b ; (fpscanf.s51 + 0)
.s53:
19e3 : a5 5d __ LDA T6 + 0 
19e5 : f0 11 __ BEQ $19f8 ; (fpscanf.l68 + 0)
.s55:
19e7 : a5 59 __ LDA T4 + 0 
19e9 : 85 61 __ STA T12 + 0 
19eb : a5 5a __ LDA T4 + 1 
19ed : 85 62 __ STA T12 + 1 
19ef : a9 00 __ LDA #$00
19f1 : 85 63 __ STA T12 + 2 
19f3 : 85 64 __ STA T12 + 3 
19f5 : 4c 92 1a JMP $1a92 ; (fpscanf.l58 + 0)
.l68:
19f8 : a5 55 __ LDA T1 + 0 
19fa : 85 0d __ STA P0 
19fc : 20 c0 20 JSR $20c0 ; (hexch.s0 + 0)
19ff : a5 1c __ LDA ACCU + 1 
1a01 : 10 49 __ BPL $1a4c ; (fpscanf.s69 + 0)
.s70:
1a03 : a5 60 __ LDA T9 + 0 
1a05 : f0 03 __ BEQ $1a0a ; (fpscanf.s71 + 0)
1a07 : 4c 56 18 JMP $1856 ; (fpscanf.s372 + 0)
.s71:
1a0a : a5 5f __ LDA T8 + 0 
1a0c : f0 11 __ BEQ $1a1f ; (fpscanf.s480 + 0)
.s77:
1a0e : a5 56 __ LDA T2 + 0 
1a10 : f0 0d __ BEQ $1a1f ; (fpscanf.s480 + 0)
.s74:
1a12 : 38 __ __ SEC
1a13 : a9 00 __ LDA #$00
1a15 : e5 59 __ SBC T4 + 0 
1a17 : 85 59 __ STA T4 + 0 
1a19 : a9 00 __ LDA #$00
1a1b : e5 5a __ SBC T4 + 1 
1a1d : 85 5a __ STA T4 + 1 
.s480:
1a1f : a0 00 __ LDY #$00
1a21 : b1 17 __ LDA (P10),y ; (params + 0)
1a23 : 85 5b __ STA T5 + 0 
1a25 : c8 __ __ INY
1a26 : b1 17 __ LDA (P10),y ; (params + 0)
1a28 : 85 5c __ STA T5 + 1 
1a2a : a5 59 __ LDA T4 + 0 
1a2c : 88 __ __ DEY
1a2d : 91 5b __ STA (T5 + 0),y 
1a2f : a5 5a __ LDA T4 + 1 
.s1113:
1a31 : a0 01 __ LDY #$01
1a33 : 91 5b __ STA (T5 + 0),y 
.s483:
1a35 : 18 __ __ CLC
1a36 : a5 17 __ LDA P10 ; (params + 0)
1a38 : 69 02 __ ADC #$02
1a3a : 85 17 __ STA P10 ; (params + 0)
1a3c : 90 02 __ BCC $1a40 ; (fpscanf.s1134 + 0)
.s1133:
1a3e : e6 18 __ INC P11 ; (params + 1)
.s1134:
1a40 : e6 53 __ INC T0 + 0 
1a42 : f0 03 __ BEQ $1a47 ; (fpscanf.s1135 + 0)
1a44 : 4c 56 18 JMP $1856 ; (fpscanf.s372 + 0)
.s1135:
1a47 : e6 54 __ INC T0 + 1 
1a49 : 4c 56 18 JMP $1856 ; (fpscanf.s372 + 0)
.s69:
1a4c : 85 5c __ STA T5 + 1 
1a4e : a5 1b __ LDA ACCU + 0 
1a50 : 85 5b __ STA T5 + 0 
1a52 : a5 15 __ LDA P8 ; (fparam + 0)
1a54 : a0 02 __ LDY #$02
1a56 : 91 23 __ STA (SP + 0),y 
1a58 : a5 16 __ LDA P9 ; (fparam + 1)
1a5a : c8 __ __ INY
1a5b : 91 23 __ STA (SP + 0),y 
1a5d : a5 13 __ LDA P6 ; (ffunc + 0)
1a5f : 85 1b __ STA ACCU + 0 
1a61 : a5 14 __ LDA P7 ; (ffunc + 1)
1a63 : 85 1c __ STA ACCU + 1 
1a65 : 20 fd 21 JSR $21fd ; (bcexec + 0)
1a68 : a5 1b __ LDA ACCU + 0 
1a6a : 85 55 __ STA T1 + 0 
1a6c : a5 59 __ LDA T4 + 0 
1a6e : 85 1b __ STA ACCU + 0 
1a70 : a5 5a __ LDA T4 + 1 
1a72 : 85 1c __ STA ACCU + 1 
1a74 : a5 5e __ LDA T7 + 0 
1a76 : 20 26 29 JSR $2926 ; (mul16by8 + 0)
1a79 : 18 __ __ CLC
1a7a : a5 05 __ LDA WORK + 2 
1a7c : 65 5b __ ADC T5 + 0 
1a7e : 85 59 __ STA T4 + 0 
1a80 : a5 06 __ LDA WORK + 3 
1a82 : 65 5c __ ADC T5 + 1 
1a84 : 85 5a __ STA T4 + 1 
1a86 : e6 57 __ INC T3 + 0 
1a88 : f0 03 __ BEQ $1a8d ; (fpscanf.s1147 + 0)
1a8a : 4c f8 19 JMP $19f8 ; (fpscanf.l68 + 0)
.s1147:
1a8d : e6 58 __ INC T3 + 1 
1a8f : 4c f8 19 JMP $19f8 ; (fpscanf.l68 + 0)
.l58:
1a92 : a5 55 __ LDA T1 + 0 
1a94 : 85 0d __ STA P0 
1a96 : 20 c0 20 JSR $20c0 ; (hexch.s0 + 0)
1a99 : a5 1c __ LDA ACCU + 1 
1a9b : 10 4a __ BPL $1ae7 ; (fpscanf.s59 + 0)
.s60:
1a9d : a5 60 __ LDA T9 + 0 
1a9f : f0 03 __ BEQ $1aa4 ; (fpscanf.s61 + 0)
1aa1 : 4c 56 18 JMP $1856 ; (fpscanf.s372 + 0)
.s61:
1aa4 : a5 5f __ LDA T8 + 0 
1aa6 : f0 1d __ BEQ $1ac5 ; (fpscanf.s1111 + 0)
.s67:
1aa8 : a5 56 __ LDA T2 + 0 
1aaa : f0 19 __ BEQ $1ac5 ; (fpscanf.s1111 + 0)
.s64:
1aac : 38 __ __ SEC
1aad : a9 00 __ LDA #$00
1aaf : e5 61 __ SBC T12 + 0 
1ab1 : 85 61 __ STA T12 + 0 
1ab3 : a9 00 __ LDA #$00
1ab5 : e5 62 __ SBC T12 + 1 
1ab7 : 85 62 __ STA T12 + 1 
1ab9 : a9 00 __ LDA #$00
1abb : e5 63 __ SBC T12 + 2 
1abd : 85 63 __ STA T12 + 2 
1abf : a9 00 __ LDA #$00
1ac1 : e5 64 __ SBC T12 + 3 
.s1112:
1ac3 : 85 64 __ STA T12 + 3 
.s1111:
1ac5 : a0 00 __ LDY #$00
1ac7 : b1 17 __ LDA (P10),y ; (params + 0)
1ac9 : 85 59 __ STA T4 + 0 
1acb : c8 __ __ INY
1acc : b1 17 __ LDA (P10),y ; (params + 0)
1ace : 85 5a __ STA T4 + 1 
1ad0 : a5 61 __ LDA T12 + 0 
1ad2 : 88 __ __ DEY
1ad3 : 91 59 __ STA (T4 + 0),y 
1ad5 : a5 62 __ LDA T12 + 1 
1ad7 : c8 __ __ INY
1ad8 : 91 59 __ STA (T4 + 0),y 
1ada : a5 63 __ LDA T12 + 2 
1adc : c8 __ __ INY
1add : 91 59 __ STA (T4 + 0),y 
1adf : a5 64 __ LDA T12 + 3 
1ae1 : c8 __ __ INY
.s1110:
1ae2 : 91 59 __ STA (T4 + 0),y 
1ae4 : 4c 35 1a JMP $1a35 ; (fpscanf.s483 + 0)
.s59:
1ae7 : 85 5a __ STA T4 + 1 
1ae9 : a5 1b __ LDA ACCU + 0 
1aeb : 85 59 __ STA T4 + 0 
1aed : a5 15 __ LDA P8 ; (fparam + 0)
1aef : a0 02 __ LDY #$02
1af1 : 91 23 __ STA (SP + 0),y 
1af3 : a5 16 __ LDA P9 ; (fparam + 1)
1af5 : c8 __ __ INY
1af6 : 91 23 __ STA (SP + 0),y 
1af8 : a5 13 __ LDA P6 ; (ffunc + 0)
1afa : 85 1b __ STA ACCU + 0 
1afc : a5 14 __ LDA P7 ; (ffunc + 1)
1afe : 85 1c __ STA ACCU + 1 
1b00 : 20 fd 21 JSR $21fd ; (bcexec + 0)
1b03 : a5 1b __ LDA ACCU + 0 
1b05 : 85 55 __ STA T1 + 0 
1b07 : a5 5e __ LDA T7 + 0 
1b09 : 85 1b __ STA ACCU + 0 
1b0b : a9 00 __ LDA #$00
1b0d : 85 1c __ STA ACCU + 1 
1b0f : 85 1d __ STA ACCU + 2 
1b11 : 85 1e __ STA ACCU + 3 
1b13 : a5 61 __ LDA T12 + 0 
1b15 : 85 03 __ STA WORK + 0 
1b17 : a5 62 __ LDA T12 + 1 
1b19 : 85 04 __ STA WORK + 1 
1b1b : a5 63 __ LDA T12 + 2 
1b1d : 85 05 __ STA WORK + 2 
1b1f : a5 64 __ LDA T12 + 3 
1b21 : 85 06 __ STA WORK + 3 
1b23 : 20 64 2d JSR $2d64 ; (mul32 + 0)
1b26 : 18 __ __ CLC
1b27 : a5 59 __ LDA T4 + 0 
1b29 : 65 07 __ ADC WORK + 4 
1b2b : 85 61 __ STA T12 + 0 
1b2d : a5 5a __ LDA T4 + 1 
1b2f : 65 08 __ ADC WORK + 5 
1b31 : 85 62 __ STA T12 + 1 
1b33 : a9 00 __ LDA #$00
1b35 : 65 09 __ ADC WORK + 6 
1b37 : 85 63 __ STA T12 + 2 
1b39 : a9 00 __ LDA #$00
1b3b : 65 0a __ ADC WORK + 7 
1b3d : 85 64 __ STA T12 + 3 
1b3f : e6 57 __ INC T3 + 0 
1b41 : f0 03 __ BEQ $1b46 ; (fpscanf.s1145 + 0)
1b43 : 4c 92 1a JMP $1a92 ; (fpscanf.l58 + 0)
.s1145:
1b46 : e6 58 __ INC T3 + 1 
1b48 : 4c 92 1a JMP $1a92 ; (fpscanf.l58 + 0)
.s51:
1b4b : a5 15 __ LDA P8 ; (fparam + 0)
1b4d : a0 02 __ LDY #$02
1b4f : 91 23 __ STA (SP + 0),y 
1b51 : a5 16 __ LDA P9 ; (fparam + 1)
1b53 : c8 __ __ INY
1b54 : 91 23 __ STA (SP + 0),y 
1b56 : a5 13 __ LDA P6 ; (ffunc + 0)
1b58 : 85 1b __ STA ACCU + 0 
1b5a : a5 14 __ LDA P7 ; (ffunc + 1)
1b5c : 85 1c __ STA ACCU + 1 
1b5e : 20 fd 21 JSR $21fd ; (bcexec + 0)
1b61 : a5 1b __ LDA ACCU + 0 
1b63 : 85 55 __ STA T1 + 0 
1b65 : 18 __ __ CLC
1b66 : a5 5b __ LDA T5 + 0 
1b68 : 69 02 __ ADC #$02
1b6a : 85 57 __ STA T3 + 0 
1b6c : a5 5c __ LDA T5 + 1 
1b6e : 69 00 __ ADC #$00
1b70 : 85 58 __ STA T3 + 1 
1b72 : a9 10 __ LDA #$10
1b74 : 85 5e __ STA T7 + 0 
1b76 : a5 5d __ LDA T6 + 0 
1b78 : d0 03 __ BNE $1b7d ; (fpscanf.s51 + 50)
1b7a : 4c f8 19 JMP $19f8 ; (fpscanf.l68 + 0)
1b7d : 4c e7 19 JMP $19e7 ; (fpscanf.s55 + 0)
.s188:
1b80 : c9 69 __ CMP #$69
1b82 : d0 03 __ BNE $1b87 ; (fpscanf.s189 + 0)
1b84 : 4c 4d 19 JMP $194d ; (fpscanf.s41 + 0)
.s189:
1b87 : c9 6e __ CMP #$6e
1b89 : f0 03 __ BEQ $1b8e ; (fpscanf.s36 + 0)
1b8b : 4c 56 18 JMP $1856 ; (fpscanf.s372 + 0)
.s36:
1b8e : a0 00 __ LDY #$00
1b90 : b1 17 __ LDA (P10),y ; (params + 0)
1b92 : 85 5b __ STA T5 + 0 
1b94 : c8 __ __ INY
1b95 : b1 17 __ LDA (P10),y ; (params + 0)
1b97 : 85 5c __ STA T5 + 1 
1b99 : a5 57 __ LDA T3 + 0 
1b9b : 88 __ __ DEY
1b9c : 91 5b __ STA (T5 + 0),y 
1b9e : a5 58 __ LDA T3 + 1 
1ba0 : 4c 31 1a JMP $1a31 ; (fpscanf.s1113 + 0)
.s139:
1ba3 : a0 00 __ LDY #$00
1ba5 : b1 17 __ LDA (P10),y ; (params + 0)
1ba7 : 85 59 __ STA T4 + 0 
1ba9 : c8 __ __ INY
1baa : b1 17 __ LDA (P10),y ; (params + 0)
1bac : 85 5a __ STA T4 + 1 
1bae : a5 5c __ LDA T5 + 1 
1bb0 : 30 56 __ BMI $1c08 ; (fpscanf.s142 + 0)
.s1028:
1bb2 : 05 5b __ ORA T5 + 0 
1bb4 : f0 52 __ BEQ $1c08 ; (fpscanf.s142 + 0)
.l144:
1bb6 : a5 55 __ LDA T1 + 0 
1bb8 : f0 4e __ BEQ $1c08 ; (fpscanf.s142 + 0)
.s143:
1bba : c9 20 __ CMP #$20
1bbc : f0 4a __ BEQ $1c08 ; (fpscanf.s142 + 0)
.s151:
1bbe : c9 09 __ CMP #$09
1bc0 : f0 46 __ BEQ $1c08 ; (fpscanf.s142 + 0)
.s150:
1bc2 : c9 0a __ CMP #$0a
1bc4 : f0 42 __ BEQ $1c08 ; (fpscanf.s142 + 0)
.s149:
1bc6 : c9 0d __ CMP #$0d
1bc8 : f0 3e __ BEQ $1c08 ; (fpscanf.s142 + 0)
.s147:
1bca : a5 15 __ LDA P8 ; (fparam + 0)
1bcc : a0 02 __ LDY #$02
1bce : 91 23 __ STA (SP + 0),y 
1bd0 : a5 16 __ LDA P9 ; (fparam + 1)
1bd2 : c8 __ __ INY
1bd3 : 91 23 __ STA (SP + 0),y 
1bd5 : a5 60 __ LDA T9 + 0 
1bd7 : d0 0c __ BNE $1be5 ; (fpscanf.s155 + 0)
.s153:
1bd9 : a5 55 __ LDA T1 + 0 
1bdb : a0 00 __ LDY #$00
1bdd : 91 59 __ STA (T4 + 0),y 
1bdf : e6 59 __ INC T4 + 0 
1be1 : d0 02 __ BNE $1be5 ; (fpscanf.s155 + 0)
.s1161:
1be3 : e6 5a __ INC T4 + 1 
.s155:
1be5 : a5 13 __ LDA P6 ; (ffunc + 0)
1be7 : 85 1b __ STA ACCU + 0 
1be9 : a5 14 __ LDA P7 ; (ffunc + 1)
1beb : 85 1c __ STA ACCU + 1 
1bed : 20 fd 21 JSR $21fd ; (bcexec + 0)
1bf0 : a5 1b __ LDA ACCU + 0 
1bf2 : 85 55 __ STA T1 + 0 
1bf4 : e6 57 __ INC T3 + 0 
1bf6 : d0 02 __ BNE $1bfa ; (fpscanf.s1160 + 0)
.s1159:
1bf8 : e6 58 __ INC T3 + 1 
.s1160:
1bfa : a5 5b __ LDA T5 + 0 
1bfc : d0 02 __ BNE $1c00 ; (fpscanf.s1119 + 0)
.s1118:
1bfe : c6 5c __ DEC T5 + 1 
.s1119:
1c00 : c6 5b __ DEC T5 + 0 
1c02 : d0 b2 __ BNE $1bb6 ; (fpscanf.l144 + 0)
.s1120:
1c04 : a5 5c __ LDA T5 + 1 
1c06 : d0 ae __ BNE $1bb6 ; (fpscanf.l144 + 0)
.s142:
1c08 : a5 60 __ LDA T9 + 0 
1c0a : f0 03 __ BEQ $1c0f ; (fpscanf.s156 + 0)
1c0c : 4c 56 18 JMP $1856 ; (fpscanf.s372 + 0)
.s156:
1c0f : a8 __ __ TAY
1c10 : 4c e2 1a JMP $1ae2 ; (fpscanf.s1110 + 0)
.s179:
1c13 : c9 64 __ CMP #$64
1c15 : d0 03 __ BNE $1c1a ; (fpscanf.s180 + 0)
1c17 : 4c 4d 19 JMP $194d ; (fpscanf.s41 + 0)
.s180:
1c1a : b0 03 __ BCS $1c1f ; (fpscanf.s82 + 0)
1c1c : 4c 7c 1f JMP $1f7c ; (fpscanf.s182 + 0)
.s82:
1c1f : a5 55 __ LDA T1 + 0 
1c21 : c9 2d __ CMP #$2d
1c23 : d0 11 __ BNE $1c36 ; (fpscanf.s84 + 0)
.s83:
1c25 : a5 15 __ LDA P8 ; (fparam + 0)
1c27 : a0 02 __ LDY #$02
1c29 : 91 23 __ STA (SP + 0),y 
1c2b : a5 16 __ LDA P9 ; (fparam + 1)
1c2d : c8 __ __ INY
1c2e : 91 23 __ STA (SP + 0),y 
1c30 : a9 01 __ LDA #$01
1c32 : 85 56 __ STA T2 + 0 
1c34 : d0 15 __ BNE $1c4b ; (fpscanf.s482 + 0)
.s84:
1c36 : a9 00 __ LDA #$00
1c38 : 85 56 __ STA T2 + 0 
1c3a : a5 55 __ LDA T1 + 0 
1c3c : c9 2b __ CMP #$2b
1c3e : d0 20 __ BNE $1c60 ; (fpscanf.s85 + 0)
.s86:
1c40 : a5 15 __ LDA P8 ; (fparam + 0)
1c42 : a0 02 __ LDY #$02
1c44 : 91 23 __ STA (SP + 0),y 
1c46 : a5 16 __ LDA P9 ; (fparam + 1)
1c48 : c8 __ __ INY
1c49 : 91 23 __ STA (SP + 0),y 
.s482:
1c4b : a5 13 __ LDA P6 ; (ffunc + 0)
1c4d : 85 1b __ STA ACCU + 0 
1c4f : a5 14 __ LDA P7 ; (ffunc + 1)
1c51 : 85 1c __ STA ACCU + 1 
1c53 : 20 fd 21 JSR $21fd ; (bcexec + 0)
1c56 : e6 57 __ INC T3 + 0 
1c58 : d0 02 __ BNE $1c5c ; (fpscanf.s1130 + 0)
.s1129:
1c5a : e6 58 __ INC T3 + 1 
.s1130:
1c5c : a5 1b __ LDA ACCU + 0 
1c5e : 85 55 __ STA T1 + 0 
.s85:
1c60 : c9 30 __ CMP #$30
1c62 : a5 55 __ LDA T1 + 0 
1c64 : 90 04 __ BCC $1c6a ; (fpscanf.s92 + 0)
.s93:
1c66 : c9 3a __ CMP #$3a
1c68 : 90 07 __ BCC $1c71 ; (fpscanf.s89 + 0)
.s92:
1c6a : c9 2e __ CMP #$2e
1c6c : f0 03 __ BEQ $1c71 ; (fpscanf.s89 + 0)
1c6e : 4c 5a 18 JMP $185a ; (fpscanf.s3 + 0)
.s89:
1c71 : a9 00 __ LDA #$00
1c73 : 85 61 __ STA T12 + 0 
1c75 : 85 62 __ STA T12 + 1 
1c77 : 85 63 __ STA T12 + 2 
1c79 : 85 64 __ STA T12 + 3 
.l448:
1c7b : a5 55 __ LDA T1 + 0 
1c7d : c9 30 __ CMP #$30
1c7f : 90 77 __ BCC $1cf8 ; (fpscanf.s96 + 0)
.s97:
1c81 : c9 3a __ CMP #$3a
1c83 : b0 73 __ BCS $1cf8 ; (fpscanf.s96 + 0)
.s95:
1c85 : a5 15 __ LDA P8 ; (fparam + 0)
1c87 : a0 02 __ LDY #$02
1c89 : 91 23 __ STA (SP + 0),y 
1c8b : a5 16 __ LDA P9 ; (fparam + 1)
1c8d : c8 __ __ INY
1c8e : 91 23 __ STA (SP + 0),y 
1c90 : a5 55 __ LDA T1 + 0 
1c92 : 85 59 __ STA T4 + 0 
1c94 : a5 13 __ LDA P6 ; (ffunc + 0)
1c96 : 85 1b __ STA ACCU + 0 
1c98 : a5 14 __ LDA P7 ; (ffunc + 1)
1c9a : 85 1c __ STA ACCU + 1 
1c9c : 20 fd 21 JSR $21fd ; (bcexec + 0)
1c9f : a5 1b __ LDA ACCU + 0 
1ca1 : 85 55 __ STA T1 + 0 
1ca3 : a9 00 __ LDA #$00
1ca5 : 85 1b __ STA ACCU + 0 
1ca7 : 85 1c __ STA ACCU + 1 
1ca9 : a9 20 __ LDA #$20
1cab : 85 1d __ STA ACCU + 2 
1cad : a9 41 __ LDA #$41
1caf : 85 1e __ STA ACCU + 3 
1cb1 : a2 61 __ LDX #$61
1cb3 : 20 4a 29 JSR $294a ; (freg + 4)
1cb6 : 20 72 2a JSR $2a72 ; (fmul + 0)
1cb9 : a5 1b __ LDA ACCU + 0 
1cbb : 85 61 __ STA T12 + 0 
1cbd : a5 1c __ LDA ACCU + 1 
1cbf : 85 62 __ STA T12 + 1 
1cc1 : a5 1d __ LDA ACCU + 2 
1cc3 : 85 63 __ STA T12 + 2 
1cc5 : a5 1e __ LDA ACCU + 3 
1cc7 : 85 64 __ STA T12 + 3 
1cc9 : 38 __ __ SEC
1cca : a5 59 __ LDA T4 + 0 
1ccc : e9 30 __ SBC #$30
1cce : 85 1b __ STA ACCU + 0 
1cd0 : a9 00 __ LDA #$00
1cd2 : 85 1c __ STA ACCU + 1 
1cd4 : 20 19 2d JSR $2d19 ; (sint16_to_float + 0)
1cd7 : a2 61 __ LDX #$61
1cd9 : 20 4a 29 JSR $294a ; (freg + 4)
1cdc : 20 8b 29 JSR $298b ; (faddsub + 0)
1cdf : a5 1b __ LDA ACCU + 0 
1ce1 : 85 61 __ STA T12 + 0 
1ce3 : a5 1c __ LDA ACCU + 1 
1ce5 : 85 62 __ STA T12 + 1 
1ce7 : a5 1d __ LDA ACCU + 2 
1ce9 : 85 63 __ STA T12 + 2 
1ceb : a5 1e __ LDA ACCU + 3 
1ced : 85 64 __ STA T12 + 3 
1cef : e6 57 __ INC T3 + 0 
1cf1 : d0 88 __ BNE $1c7b ; (fpscanf.l448 + 0)
.s1141:
1cf3 : e6 58 __ INC T3 + 1 
1cf5 : 4c 7b 1c JMP $1c7b ; (fpscanf.l448 + 0)
.s96:
1cf8 : c9 2e __ CMP #$2e
1cfa : f0 03 __ BEQ $1cff ; (fpscanf.s98 + 0)
1cfc : 4c e5 1d JMP $1de5 ; (fpscanf.s100 + 0)
.s98:
1cff : a5 15 __ LDA P8 ; (fparam + 0)
1d01 : a0 02 __ LDY #$02
1d03 : 91 23 __ STA (SP + 0),y 
1d05 : a5 16 __ LDA P9 ; (fparam + 1)
1d07 : c8 __ __ INY
1d08 : 91 23 __ STA (SP + 0),y 
1d0a : a9 00 __ LDA #$00
1d0c : 85 65 __ STA T13 + 0 
1d0e : 85 66 __ STA T13 + 1 
1d10 : a9 80 __ LDA #$80
1d12 : 85 67 __ STA T13 + 2 
1d14 : a9 3f __ LDA #$3f
1d16 : 85 68 __ STA T13 + 3 
.l450:
1d18 : a5 13 __ LDA P6 ; (ffunc + 0)
1d1a : 85 1b __ STA ACCU + 0 
1d1c : a5 14 __ LDA P7 ; (ffunc + 1)
1d1e : 85 1c __ STA ACCU + 1 
1d20 : 20 fd 21 JSR $21fd ; (bcexec + 0)
1d23 : a5 1b __ LDA ACCU + 0 
1d25 : 85 55 __ STA T1 + 0 
1d27 : c9 30 __ CMP #$30
1d29 : 90 06 __ BCC $1d31 ; (fpscanf.s103 + 0)
.s104:
1d2b : a9 39 __ LDA #$39
1d2d : c5 1b __ CMP ACCU + 0 
1d2f : b0 2b __ BCS $1d5c ; (fpscanf.s102 + 0)
.s103:
1d31 : a5 61 __ LDA T12 + 0 
1d33 : 85 1b __ STA ACCU + 0 
1d35 : a5 62 __ LDA T12 + 1 
1d37 : 85 1c __ STA ACCU + 1 
1d39 : a5 63 __ LDA T12 + 2 
1d3b : 85 1d __ STA ACCU + 2 
1d3d : a5 64 __ LDA T12 + 3 
1d3f : 85 1e __ STA ACCU + 3 
1d41 : a2 65 __ LDX #$65
1d43 : 20 4a 29 JSR $294a ; (freg + 4)
1d46 : 20 41 2b JSR $2b41 ; (fdiv + 0)
1d49 : a5 1b __ LDA ACCU + 0 
1d4b : 85 61 __ STA T12 + 0 
1d4d : a5 1c __ LDA ACCU + 1 
1d4f : 85 62 __ STA T12 + 1 
1d51 : a5 1d __ LDA ACCU + 2 
1d53 : 85 63 __ STA T12 + 2 
1d55 : a5 1e __ LDA ACCU + 3 
1d57 : 85 64 __ STA T12 + 3 
1d59 : 4c e5 1d JMP $1de5 ; (fpscanf.s100 + 0)
.s102:
1d5c : a5 15 __ LDA P8 ; (fparam + 0)
1d5e : a0 02 __ LDY #$02
1d60 : 91 23 __ STA (SP + 0),y 
1d62 : a5 16 __ LDA P9 ; (fparam + 1)
1d64 : c8 __ __ INY
1d65 : 91 23 __ STA (SP + 0),y 
1d67 : a9 00 __ LDA #$00
1d69 : 85 1b __ STA ACCU + 0 
1d6b : 85 1c __ STA ACCU + 1 
1d6d : a9 20 __ LDA #$20
1d6f : 85 1d __ STA ACCU + 2 
1d71 : a9 41 __ LDA #$41
1d73 : 85 1e __ STA ACCU + 3 
1d75 : a2 61 __ LDX #$61
1d77 : 20 4a 29 JSR $294a ; (freg + 4)
1d7a : 20 72 2a JSR $2a72 ; (fmul + 0)
1d7d : a5 1b __ LDA ACCU + 0 
1d7f : 85 61 __ STA T12 + 0 
1d81 : a5 1c __ LDA ACCU + 1 
1d83 : 85 62 __ STA T12 + 1 
1d85 : a5 1d __ LDA ACCU + 2 
1d87 : 85 63 __ STA T12 + 2 
1d89 : a5 1e __ LDA ACCU + 3 
1d8b : 85 64 __ STA T12 + 3 
1d8d : 38 __ __ SEC
1d8e : a5 55 __ LDA T1 + 0 
1d90 : e9 30 __ SBC #$30
1d92 : 85 1b __ STA ACCU + 0 
1d94 : a9 00 __ LDA #$00
1d96 : 85 1c __ STA ACCU + 1 
1d98 : 20 19 2d JSR $2d19 ; (sint16_to_float + 0)
1d9b : a2 61 __ LDX #$61
1d9d : 20 4a 29 JSR $294a ; (freg + 4)
1da0 : 20 8b 29 JSR $298b ; (faddsub + 0)
1da3 : a5 1b __ LDA ACCU + 0 
1da5 : 85 61 __ STA T12 + 0 
1da7 : a5 1c __ LDA ACCU + 1 
1da9 : 85 62 __ STA T12 + 1 
1dab : a5 1d __ LDA ACCU + 2 
1dad : 85 63 __ STA T12 + 2 
1daf : a5 1e __ LDA ACCU + 3 
1db1 : 85 64 __ STA T12 + 3 
1db3 : a9 00 __ LDA #$00
1db5 : 85 1b __ STA ACCU + 0 
1db7 : 85 1c __ STA ACCU + 1 
1db9 : a9 20 __ LDA #$20
1dbb : 85 1d __ STA ACCU + 2 
1dbd : a9 41 __ LDA #$41
1dbf : 85 1e __ STA ACCU + 3 
1dc1 : a2 65 __ LDX #$65
1dc3 : 20 4a 29 JSR $294a ; (freg + 4)
1dc6 : 20 72 2a JSR $2a72 ; (fmul + 0)
1dc9 : a5 1b __ LDA ACCU + 0 
1dcb : 85 65 __ STA T13 + 0 
1dcd : a5 1c __ LDA ACCU + 1 
1dcf : 85 66 __ STA T13 + 1 
1dd1 : a5 1d __ LDA ACCU + 2 
1dd3 : 85 67 __ STA T13 + 2 
1dd5 : a5 1e __ LDA ACCU + 3 
1dd7 : 85 68 __ STA T13 + 3 
1dd9 : e6 57 __ INC T3 + 0 
1ddb : f0 03 __ BEQ $1de0 ; (fpscanf.s1139 + 0)
1ddd : 4c 18 1d JMP $1d18 ; (fpscanf.l450 + 0)
.s1139:
1de0 : e6 58 __ INC T3 + 1 
1de2 : 4c 18 1d JMP $1d18 ; (fpscanf.l450 + 0)
.s100:
1de5 : a9 00 __ LDA #$00
1de7 : 85 59 __ STA T4 + 0 
1de9 : 85 5d __ STA T6 + 0 
1deb : a5 55 __ LDA T1 + 0 
1ded : c9 65 __ CMP #$65
1def : f0 04 __ BEQ $1df5 ; (fpscanf.s105 + 0)
.s108:
1df1 : c9 45 __ CMP #$45
1df3 : d0 51 __ BNE $1e46 ; (fpscanf.s107 + 0)
.s105:
1df5 : a5 15 __ LDA P8 ; (fparam + 0)
1df7 : a0 02 __ LDY #$02
1df9 : 91 23 __ STA (SP + 0),y 
1dfb : a5 16 __ LDA P9 ; (fparam + 1)
1dfd : c8 __ __ INY
1dfe : 91 23 __ STA (SP + 0),y 
1e00 : a5 13 __ LDA P6 ; (ffunc + 0)
1e02 : 85 1b __ STA ACCU + 0 
1e04 : a5 14 __ LDA P7 ; (ffunc + 1)
1e06 : 85 1c __ STA ACCU + 1 
1e08 : 20 fd 21 JSR $21fd ; (bcexec + 0)
1e0b : a5 1b __ LDA ACCU + 0 
1e0d : c9 2d __ CMP #$2d
1e0f : d0 10 __ BNE $1e21 ; (fpscanf.s110 + 0)
.s109:
1e11 : a5 15 __ LDA P8 ; (fparam + 0)
1e13 : a0 02 __ LDY #$02
1e15 : 91 23 __ STA (SP + 0),y 
1e17 : a5 16 __ LDA P9 ; (fparam + 1)
1e19 : c8 __ __ INY
1e1a : 91 23 __ STA (SP + 0),y 
1e1c : e6 5d __ INC T6 + 0 
1e1e : 4c 74 1f JMP $1f74 ; (fpscanf.s529 + 0)
.s110:
1e21 : c9 2b __ CMP #$2b
1e23 : d0 0e __ BNE $1e33 ; (fpscanf.s115 + 0)
.s112:
1e25 : a5 15 __ LDA P8 ; (fparam + 0)
1e27 : a0 02 __ LDY #$02
1e29 : 91 23 __ STA (SP + 0),y 
1e2b : a5 16 __ LDA P9 ; (fparam + 1)
1e2d : c8 __ __ INY
1e2e : 91 23 __ STA (SP + 0),y 
1e30 : 4c 74 1f JMP $1f74 ; (fpscanf.s529 + 0)
.s115:
1e33 : 85 55 __ STA T1 + 0 
1e35 : e6 57 __ INC T3 + 0 
1e37 : d0 02 __ BNE $1e3b ; (fpscanf.s1138 + 0)
.s1137:
1e39 : e6 58 __ INC T3 + 1 
.s1138:
1e3b : c9 30 __ CMP #$30
1e3d : 90 07 __ BCC $1e46 ; (fpscanf.s107 + 0)
.s118:
1e3f : c9 3a __ CMP #$3a
1e41 : b0 03 __ BCS $1e46 ; (fpscanf.s107 + 0)
1e43 : 4c 3c 1f JMP $1f3c ; (fpscanf.s116 + 0)
.s107:
1e46 : a5 60 __ LDA T9 + 0 
1e48 : f0 03 __ BEQ $1e4d ; (fpscanf.s119 + 0)
1e4a : 4c 56 18 JMP $1856 ; (fpscanf.s372 + 0)
.s119:
1e4d : a5 59 __ LDA T4 + 0 
1e4f : f0 68 __ BEQ $1eb9 ; (fpscanf.s124 + 0)
.s122:
1e51 : a5 5d __ LDA T6 + 0 
1e53 : d0 72 __ BNE $1ec7 ; (fpscanf.l128 + 0)
.l131:
1e55 : a5 59 __ LDA T4 + 0 
1e57 : c9 07 __ CMP #$07
1e59 : 90 2f __ BCC $1e8a ; (fpscanf.s133 + 0)
.s132:
1e5b : e9 06 __ SBC #$06
1e5d : 85 59 __ STA T4 + 0 
1e5f : a9 00 __ LDA #$00
1e61 : 85 1b __ STA ACCU + 0 
1e63 : a9 24 __ LDA #$24
1e65 : 85 1c __ STA ACCU + 1 
1e67 : a9 74 __ LDA #$74
1e69 : 85 1d __ STA ACCU + 2 
1e6b : a9 49 __ LDA #$49
1e6d : 85 1e __ STA ACCU + 3 
1e6f : a2 61 __ LDX #$61
1e71 : 20 4a 29 JSR $294a ; (freg + 4)
1e74 : 20 72 2a JSR $2a72 ; (fmul + 0)
1e77 : a5 1b __ LDA ACCU + 0 
1e79 : 85 61 __ STA T12 + 0 
1e7b : a5 1c __ LDA ACCU + 1 
1e7d : 85 62 __ STA T12 + 1 
1e7f : a5 1d __ LDA ACCU + 2 
1e81 : 85 63 __ STA T12 + 2 
1e83 : a5 1e __ LDA ACCU + 3 
1e85 : 85 64 __ STA T12 + 3 
1e87 : 4c 55 1e JMP $1e55 ; (fpscanf.l131 + 0)
.s133:
1e8a : 0a __ __ ASL
1e8b : 0a __ __ ASL
1e8c : aa __ __ TAX
1e8d : bd 76 2f LDA $2f76,x ; (tpow10 + 0)
1e90 : 85 1b __ STA ACCU + 0 
1e92 : bd 77 2f LDA $2f77,x ; (tpow10 + 1)
1e95 : 85 1c __ STA ACCU + 1 
1e97 : bd 78 2f LDA $2f78,x ; (tpow10 + 2)
1e9a : 85 1d __ STA ACCU + 2 
1e9c : bd 79 2f LDA $2f79,x ; (tpow10 + 3)
1e9f : 85 1e __ STA ACCU + 3 
1ea1 : a2 61 __ LDX #$61
1ea3 : 20 4a 29 JSR $294a ; (freg + 4)
1ea6 : 20 72 2a JSR $2a72 ; (fmul + 0)
.s1124:
1ea9 : a5 1b __ LDA ACCU + 0 
1eab : 85 61 __ STA T12 + 0 
1ead : a5 1c __ LDA ACCU + 1 
1eaf : 85 62 __ STA T12 + 1 
1eb1 : a5 1d __ LDA ACCU + 2 
1eb3 : 85 63 __ STA T12 + 2 
1eb5 : a5 1e __ LDA ACCU + 3 
1eb7 : 85 64 __ STA T12 + 3 
.s124:
1eb9 : a5 56 __ LDA T2 + 0 
1ebb : d0 03 __ BNE $1ec0 ; (fpscanf.s134 + 0)
1ebd : 4c c5 1a JMP $1ac5 ; (fpscanf.s1111 + 0)
.s134:
1ec0 : a5 64 __ LDA T12 + 3 
1ec2 : 49 80 __ EOR #$80
1ec4 : 4c c3 1a JMP $1ac3 ; (fpscanf.s1112 + 0)
.l128:
1ec7 : a5 59 __ LDA T4 + 0 
1ec9 : c9 07 __ CMP #$07
1ecb : 90 3d __ BCC $1f0a ; (fpscanf.s130 + 0)
.s129:
1ecd : e9 06 __ SBC #$06
1ecf : 85 59 __ STA T4 + 0 
1ed1 : a5 61 __ LDA T12 + 0 
1ed3 : 85 1b __ STA ACCU + 0 
1ed5 : a5 62 __ LDA T12 + 1 
1ed7 : 85 1c __ STA ACCU + 1 
1ed9 : a5 63 __ LDA T12 + 2 
1edb : 85 1d __ STA ACCU + 2 
1edd : a5 64 __ LDA T12 + 3 
1edf : 85 1e __ STA ACCU + 3 
1ee1 : a9 00 __ LDA #$00
1ee3 : 85 03 __ STA WORK + 0 
1ee5 : a9 24 __ LDA #$24
1ee7 : 85 04 __ STA WORK + 1 
1ee9 : a9 74 __ LDA #$74
1eeb : 85 05 __ STA WORK + 2 
1eed : a9 49 __ LDA #$49
1eef : 85 06 __ STA WORK + 3 
1ef1 : 20 5a 29 JSR $295a ; (freg + 20)
1ef4 : 20 41 2b JSR $2b41 ; (fdiv + 0)
1ef7 : a5 1b __ LDA ACCU + 0 
1ef9 : 85 61 __ STA T12 + 0 
1efb : a5 1c __ LDA ACCU + 1 
1efd : 85 62 __ STA T12 + 1 
1eff : a5 1d __ LDA ACCU + 2 
1f01 : 85 63 __ STA T12 + 2 
1f03 : a5 1e __ LDA ACCU + 3 
1f05 : 85 64 __ STA T12 + 3 
1f07 : 4c c7 1e JMP $1ec7 ; (fpscanf.l128 + 0)
.s130:
1f0a : 0a __ __ ASL
1f0b : 0a __ __ ASL
1f0c : aa __ __ TAX
1f0d : bd 76 2f LDA $2f76,x ; (tpow10 + 0)
1f10 : 85 65 __ STA T13 + 0 
1f12 : bd 77 2f LDA $2f77,x ; (tpow10 + 1)
1f15 : 85 66 __ STA T13 + 1 
1f17 : bd 78 2f LDA $2f78,x ; (tpow10 + 2)
1f1a : 85 67 __ STA T13 + 2 
1f1c : bd 79 2f LDA $2f79,x ; (tpow10 + 3)
1f1f : 85 68 __ STA T13 + 3 
1f21 : a5 61 __ LDA T12 + 0 
1f23 : 85 1b __ STA ACCU + 0 
1f25 : a5 62 __ LDA T12 + 1 
1f27 : 85 1c __ STA ACCU + 1 
1f29 : a5 63 __ LDA T12 + 2 
1f2b : 85 1d __ STA ACCU + 2 
1f2d : a5 64 __ LDA T12 + 3 
1f2f : 85 1e __ STA ACCU + 3 
1f31 : a2 65 __ LDX #$65
1f33 : 20 4a 29 JSR $294a ; (freg + 4)
1f36 : 20 41 2b JSR $2b41 ; (fdiv + 0)
1f39 : 4c a9 1e JMP $1ea9 ; (fpscanf.s1124 + 0)
.s116:
1f3c : a5 15 __ LDA P8 ; (fparam + 0)
1f3e : a0 02 __ LDY #$02
1f40 : 91 23 __ STA (SP + 0),y 
1f42 : a5 16 __ LDA P9 ; (fparam + 1)
1f44 : c8 __ __ INY
1f45 : 91 23 __ STA (SP + 0),y 
1f47 : a5 59 __ LDA T4 + 0 
1f49 : 0a __ __ ASL
1f4a : 0a __ __ ASL
1f4b : 18 __ __ CLC
1f4c : 65 59 __ ADC T4 + 0 
1f4e : 0a __ __ ASL
1f4f : 18 __ __ CLC
1f50 : 65 1b __ ADC ACCU + 0 
1f52 : 38 __ __ SEC
1f53 : e9 30 __ SBC #$30
1f55 : 85 59 __ STA T4 + 0 
1f57 : 18 __ __ CLC
1f58 : a5 57 __ LDA T3 + 0 
1f5a : 69 01 __ ADC #$01
.l454:
1f5c : 85 57 __ STA T3 + 0 
1f5e : 90 02 __ BCC $1f62 ; (fpscanf.s1132 + 0)
.s1131:
1f60 : e6 58 __ INC T3 + 1 
.s1132:
1f62 : a5 13 __ LDA P6 ; (ffunc + 0)
1f64 : 85 1b __ STA ACCU + 0 
1f66 : a5 14 __ LDA P7 ; (ffunc + 1)
1f68 : 85 1c __ STA ACCU + 1 
1f6a : 20 fd 21 JSR $21fd ; (bcexec + 0)
1f6d : a5 1b __ LDA ACCU + 0 
1f6f : 85 55 __ STA T1 + 0 
1f71 : 4c 3b 1e JMP $1e3b ; (fpscanf.s1138 + 0)
.s529:
1f74 : 18 __ __ CLC
1f75 : a5 57 __ LDA T3 + 0 
1f77 : 69 02 __ ADC #$02
1f79 : 4c 5c 1f JMP $1f5c ; (fpscanf.l454 + 0)
.s182:
1f7c : c9 5b __ CMP #$5b
1f7e : f0 03 __ BEQ $1f83 ; (fpscanf.s160 + 0)
1f80 : 4c 15 20 JMP $2015 ; (fpscanf.s183 + 0)
.s160:
1f83 : a5 11 __ LDA P4 ; (fmt + 0)
1f85 : 85 0d __ STA P0 
1f87 : a5 12 __ LDA P5 ; (fmt + 1)
1f89 : 85 0e __ STA P1 
1f8b : 18 __ __ CLC
1f8c : a5 23 __ LDA SP + 0 
1f8e : 69 1c __ ADC #$1c
1f90 : 85 0f __ STA P2 
1f92 : a5 24 __ LDA SP + 1 
1f94 : 69 00 __ ADC #$00
1f96 : 85 10 __ STA P3 
1f98 : 20 fa 20 JSR $20fa ; (scanpat.s0 + 0)
1f9b : a5 1b __ LDA ACCU + 0 
1f9d : 85 11 __ STA P4 ; (fmt + 0)
1f9f : a5 1c __ LDA ACCU + 1 
1fa1 : 85 12 __ STA P5 ; (fmt + 1)
1fa3 : a0 00 __ LDY #$00
1fa5 : b1 17 __ LDA (P10),y ; (params + 0)
1fa7 : 85 59 __ STA T4 + 0 
1fa9 : c8 __ __ INY
1faa : b1 17 __ LDA (P10),y ; (params + 0)
1fac : 85 5a __ STA T4 + 1 
1fae : a5 5c __ LDA T5 + 1 
1fb0 : 10 03 __ BPL $1fb5 ; (fpscanf.s1071 + 0)
1fb2 : 4c 08 1c JMP $1c08 ; (fpscanf.s142 + 0)
.s1071:
1fb5 : 05 5b __ ORA T5 + 0 
1fb7 : d0 03 __ BNE $1fbc ; (fpscanf.l164 + 0)
1fb9 : 4c 08 1c JMP $1c08 ; (fpscanf.s142 + 0)
.l164:
1fbc : a5 55 __ LDA T1 + 0 
1fbe : 29 07 __ AND #$07
1fc0 : aa __ __ TAX
1fc1 : a5 55 __ LDA T1 + 0 
1fc3 : 4a __ __ LSR
1fc4 : 4a __ __ LSR
1fc5 : 4a __ __ LSR
1fc6 : 18 __ __ CLC
1fc7 : 69 1c __ ADC #$1c
1fc9 : a8 __ __ TAY
1fca : b1 23 __ LDA (SP + 0),y 
1fcc : 3d 08 30 AND $3008,x ; (bitshift + 8)
1fcf : d0 03 __ BNE $1fd4 ; (fpscanf.s162 + 0)
1fd1 : 4c 08 1c JMP $1c08 ; (fpscanf.s142 + 0)
.s162:
1fd4 : a5 15 __ LDA P8 ; (fparam + 0)
1fd6 : a0 02 __ LDY #$02
1fd8 : 91 23 __ STA (SP + 0),y 
1fda : a5 16 __ LDA P9 ; (fparam + 1)
1fdc : c8 __ __ INY
1fdd : 91 23 __ STA (SP + 0),y 
1fdf : a5 60 __ LDA T9 + 0 
1fe1 : d0 0c __ BNE $1fef ; (fpscanf.s167 + 0)
.s165:
1fe3 : a5 55 __ LDA T1 + 0 
1fe5 : a0 00 __ LDY #$00
1fe7 : 91 59 __ STA (T4 + 0),y 
1fe9 : e6 59 __ INC T4 + 0 
1feb : d0 02 __ BNE $1fef ; (fpscanf.s167 + 0)
.s1151:
1fed : e6 5a __ INC T4 + 1 
.s167:
1fef : a5 13 __ LDA P6 ; (ffunc + 0)
1ff1 : 85 1b __ STA ACCU + 0 
1ff3 : a5 14 __ LDA P7 ; (ffunc + 1)
1ff5 : 85 1c __ STA ACCU + 1 
1ff7 : 20 fd 21 JSR $21fd ; (bcexec + 0)
1ffa : a5 1b __ LDA ACCU + 0 
1ffc : 85 55 __ STA T1 + 0 
1ffe : e6 57 __ INC T3 + 0 
2000 : d0 02 __ BNE $2004 ; (fpscanf.s1150 + 0)
.s1149:
2002 : e6 58 __ INC T3 + 1 
.s1150:
2004 : a5 5b __ LDA T5 + 0 
2006 : d0 02 __ BNE $200a ; (fpscanf.s1116 + 0)
.s1115:
2008 : c6 5c __ DEC T5 + 1 
.s1116:
200a : c6 5b __ DEC T5 + 0 
200c : d0 ae __ BNE $1fbc ; (fpscanf.l164 + 0)
.s1117:
200e : a5 5c __ LDA T5 + 1 
2010 : d0 aa __ BNE $1fbc ; (fpscanf.l164 + 0)
2012 : 4c 08 1c JMP $1c08 ; (fpscanf.s142 + 0)
.s183:
2015 : c9 63 __ CMP #$63
2017 : f0 03 __ BEQ $201c ; (fpscanf.s172 + 0)
2019 : 4c 56 18 JMP $1856 ; (fpscanf.s372 + 0)
.s172:
201c : a4 60 __ LDY T9 + 0 
201e : f0 03 __ BEQ $2023 ; (fpscanf.s173 + 0)
2020 : 4c 36 18 JMP $1836 ; (fpscanf.s175 + 0)
.s173:
2023 : b1 17 __ LDA (P10),y ; (params + 0)
2025 : 85 5b __ STA T5 + 0 
2027 : a0 01 __ LDY #$01
2029 : b1 17 __ LDA (P10),y ; (params + 0)
202b : 85 5c __ STA T5 + 1 
202d : a5 55 __ LDA T1 + 0 
202f : 88 __ __ DEY
2030 : 91 5b __ STA (T5 + 0),y 
2032 : 18 __ __ CLC
2033 : a5 17 __ LDA P10 ; (params + 0)
2035 : 69 02 __ ADC #$02
2037 : 85 17 __ STA P10 ; (params + 0)
2039 : 90 02 __ BCC $203d ; (fpscanf.s1156 + 0)
.s1155:
203b : e6 18 __ INC P11 ; (params + 1)
.s1156:
203d : e6 53 __ INC T0 + 0 
203f : f0 03 __ BEQ $2044 ; (fpscanf.s1157 + 0)
2041 : 4c 36 18 JMP $1836 ; (fpscanf.s175 + 0)
.s1157:
2044 : e6 54 __ INC T0 + 1 
2046 : 4c 36 18 JMP $1836 ; (fpscanf.s175 + 0)
.s32:
2049 : a0 00 __ LDY #$00
204b : b1 11 __ LDA (P4),y ; (fmt + 0)
204d : a8 __ __ TAY
204e : e6 11 __ INC P4 ; (fmt + 0)
2050 : d0 02 __ BNE $2054 ; (fpscanf.s1128 + 0)
.s1127:
2052 : e6 12 __ INC P5 ; (fmt + 1)
.s1128:
2054 : c0 67 __ CPY #$67
2056 : d0 03 __ BNE $205b ; (fpscanf.s350 + 0)
2058 : 4c 1f 1c JMP $1c1f ; (fpscanf.s82 + 0)
.s350:
205b : a9 01 __ LDA #$01
205d : 85 5d __ STA T6 + 0 
205f : 98 __ __ TYA
2060 : 4c 27 19 JMP $1927 ; (fpscanf.s177 + 0)
.s21:
2063 : 84 60 __ STY T9 + 0 
2065 : 18 __ __ CLC
2066 : a5 59 __ LDA T4 + 0 
2068 : 69 03 __ ADC #$03
206a : 85 11 __ STA P4 ; (fmt + 0)
206c : a5 5a __ LDA T4 + 1 
206e : 69 00 __ ADC #$00
2070 : 85 12 __ STA P5 ; (fmt + 1)
2072 : c8 __ __ INY
2073 : b1 59 __ LDA (T4 + 0),y 
2075 : 85 45 __ STA T11 + 0 
2077 : c9 30 __ CMP #$30
2079 : b0 03 __ BCS $207e ; (fpscanf.s21 + 27)
207b : 4c 17 19 JMP $1917 ; (fpscanf.s26 + 0)
207e : 4c ad 18 JMP $18ad ; (fpscanf.s27 + 0)
.s7:
2081 : a5 55 __ LDA T1 + 0 
2083 : d0 03 __ BNE $2088 ; (fpscanf.l10 + 0)
2085 : 4c 5a 18 JMP $185a ; (fpscanf.s3 + 0)
.l10:
2088 : c9 20 __ CMP #$20
208a : f0 0f __ BEQ $209b ; (fpscanf.s12 + 0)
.s17:
208c : c9 09 __ CMP #$09
208e : f0 0b __ BEQ $209b ; (fpscanf.s12 + 0)
.s16:
2090 : c9 0a __ CMP #$0a
2092 : f0 07 __ BEQ $209b ; (fpscanf.s12 + 0)
.s15:
2094 : c9 0d __ CMP #$0d
2096 : f0 03 __ BEQ $209b ; (fpscanf.s12 + 0)
2098 : 4c 56 18 JMP $1856 ; (fpscanf.s372 + 0)
.s12:
209b : a5 15 __ LDA P8 ; (fparam + 0)
209d : a0 02 __ LDY #$02
209f : 91 23 __ STA (SP + 0),y 
20a1 : a5 16 __ LDA P9 ; (fparam + 1)
20a3 : c8 __ __ INY
20a4 : 91 23 __ STA (SP + 0),y 
20a6 : a5 13 __ LDA P6 ; (ffunc + 0)
20a8 : 85 1b __ STA ACCU + 0 
20aa : a5 14 __ LDA P7 ; (ffunc + 1)
20ac : 85 1c __ STA ACCU + 1 
20ae : 20 fd 21 JSR $21fd ; (bcexec + 0)
20b1 : e6 57 __ INC T3 + 0 
20b3 : d0 02 __ BNE $20b7 ; (fpscanf.s1126 + 0)
.s1125:
20b5 : e6 58 __ INC T3 + 1 
.s1126:
20b7 : a5 1b __ LDA ACCU + 0 
20b9 : 85 55 __ STA T1 + 0 
20bb : d0 cb __ BNE $2088 ; (fpscanf.l10 + 0)
20bd : 4c 5a 18 JMP $185a ; (fpscanf.s3 + 0)
--------------------------------------------------------------------
hexch: ; hexch(u8)->i16
.s0:
20c0 : c9 30 __ CMP #$30
20c2 : 90 10 __ BCC $20d4 ; (hexch.s2 + 0)
.s4:
20c4 : c9 3a __ CMP #$3a
20c6 : b0 0c __ BCS $20d4 ; (hexch.s2 + 0)
.s1:
20c8 : 38 __ __ SEC
20c9 : e9 30 __ SBC #$30
20cb : 85 1b __ STA ACCU + 0 
20cd : a9 00 __ LDA #$00
20cf : e9 00 __ SBC #$00
20d1 : 4c f7 20 JMP $20f7 ; (hexch.s1001 + 0)
.s2:
20d4 : c9 61 __ CMP #$61
20d6 : 90 09 __ BCC $20e1 ; (hexch.s7 + 0)
.s9:
20d8 : c9 67 __ CMP #$67
20da : b0 05 __ BCS $20e1 ; (hexch.s7 + 0)
.s6:
20dc : 69 a9 __ ADC #$a9
20de : 4c f1 20 JMP $20f1 ; (hexch.s1014 + 0)
.s7:
20e1 : c9 41 __ CMP #$41
20e3 : 90 04 __ BCC $20e9 ; (hexch.s12 + 0)
.s14:
20e5 : c9 47 __ CMP #$47
20e7 : 90 06 __ BCC $20ef ; (hexch.s11 + 0)
.s12:
20e9 : a9 ff __ LDA #$ff
20eb : 85 1b __ STA ACCU + 0 
20ed : d0 08 __ BNE $20f7 ; (hexch.s1001 + 0)
.s11:
20ef : 69 c9 __ ADC #$c9
.s1014:
20f1 : 85 1b __ STA ACCU + 0 
20f3 : a9 00 __ LDA #$00
20f5 : 69 ff __ ADC #$ff
.s1001:
20f7 : 85 1c __ STA ACCU + 1 
20f9 : 60 __ __ RTS
--------------------------------------------------------------------
scanpat: ; scanpat(const u8*,u8*)->const u8*
.s0:
20fa : a9 00 __ LDA #$00
20fc : a8 __ __ TAY
.l1018:
20fd : 91 0f __ STA (P2),y ; (mask + 0)
20ff : c8 __ __ INY
2100 : c0 20 __ CPY #$20
2102 : 90 f9 __ BCC $20fd ; (scanpat.l1018 + 0)
.s1019:
2104 : a5 0d __ LDA P0 ; (fmt + 0)
2106 : 85 43 __ STA T1 + 0 
2108 : 18 __ __ CLC
2109 : 69 01 __ ADC #$01
210b : 85 0d __ STA P0 ; (fmt + 0)
210d : a5 0e __ LDA P1 ; (fmt + 1)
210f : 85 44 __ STA T1 + 1 
2111 : 69 00 __ ADC #$00
2113 : 85 0e __ STA P1 ; (fmt + 1)
2115 : a0 00 __ LDY #$00
2117 : b1 43 __ LDA (T1 + 0),y 
2119 : c9 5e __ CMP #$5e
211b : d0 10 __ BNE $212d ; (scanpat.s1022 + 0)
.s5:
211d : 18 __ __ CLC
211e : a5 43 __ LDA T1 + 0 
2120 : 69 02 __ ADC #$02
2122 : 85 0d __ STA P0 ; (fmt + 0)
2124 : a5 44 __ LDA T1 + 1 
2126 : 69 00 __ ADC #$00
2128 : 85 0e __ STA P1 ; (fmt + 1)
212a : c8 __ __ INY
212b : b1 43 __ LDA (T1 + 0),y 
.s1022:
212d : 84 1c __ STY ACCU + 1 
212f : 85 1b __ STA ACCU + 0 
.l8:
2131 : 85 1d __ STA ACCU + 2 
2133 : a5 0d __ LDA P0 ; (fmt + 0)
2135 : 85 43 __ STA T1 + 0 
2137 : 18 __ __ CLC
2138 : 69 01 __ ADC #$01
213a : 85 0d __ STA P0 ; (fmt + 0)
213c : a5 0e __ LDA P1 ; (fmt + 1)
213e : 85 44 __ STA T1 + 1 
2140 : 69 00 __ ADC #$00
2142 : 85 0e __ STA P1 ; (fmt + 1)
2144 : a0 00 __ LDY #$00
2146 : b1 43 __ LDA (T1 + 0),y 
2148 : 85 1e __ STA ACCU + 3 
214a : c9 2d __ CMP #$2d
214c : d0 23 __ BNE $2171 ; (scanpat.l17 + 0)
.s10:
214e : c8 __ __ INY
214f : b1 43 __ LDA (T1 + 0),y 
2151 : 85 1e __ STA ACCU + 3 
2153 : c9 5d __ CMP #$5d
2155 : f0 1a __ BEQ $2171 ; (scanpat.l17 + 0)
.s13:
2157 : 85 1d __ STA ACCU + 2 
2159 : 18 __ __ CLC
215a : a5 43 __ LDA T1 + 0 
215c : 69 03 __ ADC #$03
215e : 85 0d __ STA P0 ; (fmt + 0)
2160 : a5 44 __ LDA T1 + 1 
2162 : 69 00 __ ADC #$00
2164 : 85 0e __ STA P1 ; (fmt + 1)
2166 : c8 __ __ INY
2167 : b1 43 __ LDA (T1 + 0),y 
2169 : 85 1e __ STA ACCU + 3 
216b : a5 1d __ LDA ACCU + 2 
216d : c5 1b __ CMP ACCU + 0 
216f : 90 1a __ BCC $218b ; (scanpat.s18 + 0)
.l17:
2171 : a5 1b __ LDA ACCU + 0 
2173 : 29 07 __ AND #$07
2175 : aa __ __ TAX
2176 : a5 1b __ LDA ACCU + 0 
2178 : 4a __ __ LSR
2179 : 4a __ __ LSR
217a : 4a __ __ LSR
217b : a8 __ __ TAY
217c : b1 0f __ LDA (P2),y ; (mask + 0)
217e : 1d 08 30 ORA $3008,x ; (bitshift + 8)
2181 : 91 0f __ STA (P2),y ; (mask + 0)
2183 : e6 1b __ INC ACCU + 0 
2185 : a5 1d __ LDA ACCU + 2 
2187 : c5 1b __ CMP ACCU + 0 
2189 : b0 e6 __ BCS $2171 ; (scanpat.l17 + 0)
.s18:
218b : a5 1e __ LDA ACCU + 3 
218d : f0 06 __ BEQ $2195 ; (scanpat.s9 + 0)
.s19:
218f : 85 1b __ STA ACCU + 0 
2191 : c9 5d __ CMP #$5d
2193 : d0 9c __ BNE $2131 ; (scanpat.l8 + 0)
.s9:
2195 : a5 1c __ LDA ACCU + 1 
2197 : f0 0d __ BEQ $21a6 ; (scanpat.s22 + 0)
.s24:
2199 : a0 04 __ LDY #$04
.l1020:
219b : b1 0f __ LDA (P2),y ; (mask + 0)
219d : 49 ff __ EOR #$ff
219f : 91 0f __ STA (P2),y ; (mask + 0)
21a1 : c8 __ __ INY
21a2 : c0 20 __ CPY #$20
21a4 : 90 f5 __ BCC $219b ; (scanpat.l1020 + 0)
.s22:
21a6 : a5 0d __ LDA P0 ; (fmt + 0)
21a8 : 85 1b __ STA ACCU + 0 
21aa : a5 0e __ LDA P1 ; (fmt + 1)
21ac : 85 1c __ STA ACCU + 1 
.s1001:
21ae : 60 __ __ RTS
--------------------------------------------------------------------
scanf_func: ; scanf_func(void*)->i16
.s0:
21af : 20 b9 21 JSR $21b9 ; (getchar.s0 + 0)
21b2 : 85 1b __ STA ACCU + 0 
21b4 : a9 00 __ LDA #$00
21b6 : 85 1c __ STA ACCU + 1 
.s1001:
21b8 : 60 __ __ RTS
--------------------------------------------------------------------
getchar: ; getchar()->u8
.s0:
21b9 : 20 c5 21 JSR $21c5 ; (getpch + 0)
21bc : 85 1b __ STA ACCU + 0 
21be : a9 00 __ LDA #$00
21c0 : 85 1c __ STA ACCU + 1 
.s1001:
21c2 : a5 1b __ LDA ACCU + 0 
21c4 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
21c5 : 20 cf ff JSR $ffcf 
21c8 : ae ff 28 LDX $28ff ; (giocharmap + 0)
21cb : e0 01 __ CPX #$01
21cd : 90 26 __ BCC $21f5 ; (getpch + 48)
21cf : c9 0d __ CMP #$0d
21d1 : d0 02 __ BNE $21d5 ; (getpch + 16)
21d3 : a9 0a __ LDA #$0a
21d5 : e0 02 __ CPX #$02
21d7 : 90 1c __ BCC $21f5 ; (getpch + 48)
21d9 : c9 db __ CMP #$db
21db : b0 18 __ BCS $21f5 ; (getpch + 48)
21dd : c9 41 __ CMP #$41
21df : 90 14 __ BCC $21f5 ; (getpch + 48)
21e1 : c9 c1 __ CMP #$c1
21e3 : 90 02 __ BCC $21e7 ; (getpch + 34)
21e5 : 49 a0 __ EOR #$a0
21e7 : c9 7b __ CMP #$7b
21e9 : b0 0a __ BCS $21f5 ; (getpch + 48)
21eb : c9 61 __ CMP #$61
21ed : b0 04 __ BCS $21f3 ; (getpch + 46)
21ef : c9 5b __ CMP #$5b
21f1 : b0 02 __ BCS $21f5 ; (getpch + 48)
21f3 : 49 20 __ EOR #$20
21f5 : 60 __ __ RTS
--------------------------------------------------------------------
21f6 : __ __ __ BYT 25 64 00                                        : %d.
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
21f9 : 20 81 ff JSR $ff81 
.s1001:
21fc : 60 __ __ RTS
--------------------------------------------------------------------
bcexec: ; bcexec
21fd : 6c 1b 00 JMP ($001b)
--------------------------------------------------------------------
2200 : __ __ __ BYT 43 68 6f 69 63 65 3a 20 00                      : Choice: .
--------------------------------------------------------------------
initGame: ; initGame(struct*)->void
.s0:
2209 : a9 00 __ LDA #$00
220b : 85 10 __ STA P3 
220d : 85 12 __ STA P5 
220f : a9 01 __ LDA #$01
2211 : 85 0f __ STA P2 
2213 : a0 1e __ LDY #$1e
2215 : 91 13 __ STA (P6),y ; (game + 0)
2217 : a9 00 __ LDA #$00
2219 : c8 __ __ INY
221a : 91 13 __ STA (P6),y ; (game + 0)
221c : a9 64 __ LDA #$64
221e : 85 11 __ STA P4 
2220 : c8 __ __ INY
2221 : 91 13 __ STA (P6),y ; (game + 0)
2223 : a9 00 __ LDA #$00
2225 : c8 __ __ INY
2226 : 91 13 __ STA (P6),y ; (game + 0)
2228 : 20 3f 22 JSR $223f ; (generateSecretNumber.s0 + 0)
222b : a5 1b __ LDA ACCU + 0 
222d : a0 18 __ LDY #$18
222f : 91 13 __ STA (P6),y ; (game + 0)
2231 : a5 1c __ LDA ACCU + 1 
2233 : c8 __ __ INY
2234 : 91 13 __ STA (P6),y ; (game + 0)
2236 : a9 00 __ LDA #$00
2238 : c8 __ __ INY
2239 : 91 13 __ STA (P6),y ; (game + 0)
223b : c8 __ __ INY
223c : 91 13 __ STA (P6),y ; (game + 0)
.s1001:
223e : 60 __ __ RTS
--------------------------------------------------------------------
generateSecretNumber: ; generateSecretNumber(i16,i16)->i16
.s0:
223f : 20 76 22 JSR $2276 ; (clock.s0 + 0)
2242 : a5 1b __ LDA ACCU + 0 
2244 : 8d f4 2e STA $2ef4 ; (seed + 0)
2247 : a5 1c __ LDA ACCU + 1 
2249 : 8d f5 2e STA $2ef5 ; (seed + 1)
224c : 20 87 22 JSR $2287 ; (rand.s0 + 0)
224f : 38 __ __ SEC
2250 : a5 11 __ LDA P4 ; (max + 0)
2252 : e5 0f __ SBC P2 ; (min + 0)
2254 : a8 __ __ TAY
2255 : a5 12 __ LDA P5 ; (max + 1)
2257 : e5 10 __ SBC P3 ; (min + 1)
2259 : aa __ __ TAX
225a : 98 __ __ TYA
225b : 18 __ __ CLC
225c : 69 01 __ ADC #$01
225e : 85 03 __ STA WORK + 0 
2260 : 90 01 __ BCC $2263 ; (generateSecretNumber.s1003 + 0)
.s1002:
2262 : e8 __ __ INX
.s1003:
2263 : 86 04 __ STX WORK + 1 
2265 : 20 29 2c JSR $2c29 ; (divmod + 0)
2268 : 18 __ __ CLC
2269 : a5 05 __ LDA WORK + 2 
226b : 65 0f __ ADC P2 ; (min + 0)
226d : 85 1b __ STA ACCU + 0 
226f : a5 06 __ LDA WORK + 3 
2271 : 65 10 __ ADC P3 ; (min + 1)
2273 : 85 1c __ STA ACCU + 1 
.s1001:
2275 : 60 __ __ RTS
--------------------------------------------------------------------
clock: ; clock()->i32
.s0:
2276 : a5 a2 __ LDA $a2 
2278 : 85 1b __ STA ACCU + 0 
227a : a5 a1 __ LDA $a1 
227c : 85 1c __ STA ACCU + 1 
227e : a5 a0 __ LDA $a0 
2280 : 85 1d __ STA ACCU + 2 
2282 : a9 00 __ LDA #$00
2284 : 85 1e __ STA ACCU + 3 
.s1001:
2286 : 60 __ __ RTS
--------------------------------------------------------------------
rand: ; rand()->u16
.s0:
2287 : ad f5 2e LDA $2ef5 ; (seed + 1)
228a : 4a __ __ LSR
228b : ad f4 2e LDA $2ef4 ; (seed + 0)
228e : 6a __ __ ROR
228f : aa __ __ TAX
2290 : a9 00 __ LDA #$00
2292 : 6a __ __ ROR
2293 : 4d f4 2e EOR $2ef4 ; (seed + 0)
2296 : 85 1b __ STA ACCU + 0 
2298 : 8a __ __ TXA
2299 : 4d f5 2e EOR $2ef5 ; (seed + 1)
229c : 85 1c __ STA ACCU + 1 
229e : 4a __ __ LSR
229f : 45 1b __ EOR ACCU + 0 
22a1 : 8d f4 2e STA $2ef4 ; (seed + 0)
22a4 : 85 1b __ STA ACCU + 0 
22a6 : 45 1c __ EOR ACCU + 1 
22a8 : 8d f5 2e STA $2ef5 ; (seed + 1)
22ab : 85 1c __ STA ACCU + 1 
.s1001:
22ad : 60 __ __ RTS
--------------------------------------------------------------------
processDifficultyMenu: ; processDifficultyMenu(struct*)->void
.s0:
22ae : 20 ec 22 JSR $22ec ; (difficultyMenu.s1000 + 0)
22b1 : ad fa 9f LDA $9ffa ; (sstack + 11)
22b4 : 85 44 __ STA T1 + 0 
22b6 : ad fb 9f LDA $9ffb ; (sstack + 12)
22b9 : 85 45 __ STA T1 + 1 
22bb : a9 00 __ LDA #$00
22bd : a0 17 __ LDY #$17
22bf : 91 44 __ STA (T1 + 0),y 
22c1 : a5 1b __ LDA ACCU + 0 
22c3 : c9 01 __ CMP #$01
22c5 : d0 07 __ BNE $22ce ; (processDifficultyMenu.s10 + 0)
.s4:
22c7 : 88 __ __ DEY
22c8 : 91 44 __ STA (T1 + 0),y 
22ca : a9 0a __ LDA #$0a
22cc : d0 14 __ BNE $22e2 ; (processDifficultyMenu.s1008 + 0)
.s10:
22ce : 09 00 __ ORA #$00
22d0 : d0 07 __ BNE $22d9 ; (processDifficultyMenu.s11 + 0)
.s2:
22d2 : 88 __ __ DEY
22d3 : 91 44 __ STA (T1 + 0),y 
22d5 : a9 0f __ LDA #$0f
22d7 : d0 09 __ BNE $22e2 ; (processDifficultyMenu.s1008 + 0)
.s11:
22d9 : c9 02 __ CMP #$02
22db : d0 0e __ BNE $22eb ; (processDifficultyMenu.s1001 + 0)
.s6:
22dd : 88 __ __ DEY
22de : 91 44 __ STA (T1 + 0),y 
22e0 : a9 05 __ LDA #$05
.s1008:
22e2 : a0 1c __ LDY #$1c
22e4 : 91 44 __ STA (T1 + 0),y 
22e6 : a9 00 __ LDA #$00
22e8 : c8 __ __ INY
22e9 : 91 44 __ STA (T1 + 0),y 
.s1001:
22eb : 60 __ __ RTS
--------------------------------------------------------------------
difficultyMenu: ; difficultyMenu()->enum
.s1000:
22ec : a5 53 __ LDA T0 + 0 
22ee : 8d 3b 9f STA $9f3b ; (difficultyMenu@stack + 0)
22f1 : a5 54 __ LDA T0 + 1 
22f3 : 8d 3c 9f STA $9f3c ; (difficultyMenu@stack + 1)
22f6 : a5 55 __ LDA T1 + 0 
22f8 : 8d 3d 9f STA $9f3d ; (difficultyMenu@stack + 2)
22fb : 38 __ __ SEC
22fc : a5 23 __ LDA SP + 0 
22fe : e9 08 __ SBC #$08
2300 : 85 23 __ STA SP + 0 
2302 : b0 02 __ BCS $2306 ; (difficultyMenu.s0 + 0)
2304 : c6 24 __ DEC SP + 1 
.s0:
2306 : a2 5a __ LDX #$5a
.l1002:
2308 : bd 91 2f LDA $2f91,x ; (tpow10 + 27)
230b : 9d 3e 9f STA $9f3e,x ; (difficultyMenu@stack + 3)
230e : ca __ __ DEX
230f : d0 f7 __ BNE $2308 ; (difficultyMenu.l1002 + 0)
.s1003:
2311 : a9 bd __ LDA #$bd
2313 : a0 02 __ LDY #$02
2315 : 91 23 __ STA (SP + 0),y 
2317 : a9 23 __ LDA #$23
2319 : c8 __ __ INY
231a : 91 23 __ STA (SP + 0),y 
231c : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
231f : a9 2d __ LDA #$2d
2321 : 8d f7 9f STA $9ff7 ; (sstack + 8)
2324 : a9 0a __ LDA #$0a
2326 : 8d f8 9f STA $9ff8 ; (sstack + 9)
2329 : a9 00 __ LDA #$00
232b : 8d f9 9f STA $9ff9 ; (sstack + 10)
232e : 20 9a 16 JSR $169a ; (printLine.s1000 + 0)
.l23:
2331 : a2 00 __ LDX #$00
2333 : 18 __ __ CLC
.l1009:
2334 : a9 30 __ LDA #$30
2336 : a0 02 __ LDY #$02
2338 : 91 23 __ STA (SP + 0),y 
233a : a9 17 __ LDA #$17
233c : c8 __ __ INY
233d : 91 23 __ STA (SP + 0),y 
233f : 8a __ __ TXA
2340 : 69 01 __ ADC #$01
2342 : 85 55 __ STA T1 + 0 
2344 : c8 __ __ INY
2345 : 91 23 __ STA (SP + 0),y 
2347 : a9 00 __ LDA #$00
2349 : c8 __ __ INY
234a : 91 23 __ STA (SP + 0),y 
234c : bd fb 28 LDA $28fb,x ; (__multab30L + 0)
234f : 18 __ __ CLC
2350 : 69 3f __ ADC #$3f
2352 : c8 __ __ INY
2353 : 91 23 __ STA (SP + 0),y 
2355 : a9 9f __ LDA #$9f
2357 : 69 00 __ ADC #$00
2359 : c8 __ __ INY
235a : 91 23 __ STA (SP + 0),y 
235c : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
235f : a5 55 __ LDA T1 + 0 
2361 : aa __ __ TAX
2362 : c9 03 __ CMP #$03
2364 : 90 ce __ BCC $2334 ; (difficultyMenu.l1009 + 0)
.s6:
2366 : a9 00 __ LDA #$00
2368 : 8d f7 9f STA $9ff7 ; (sstack + 8)
236b : a9 22 __ LDA #$22
236d : 8d f8 9f STA $9ff8 ; (sstack + 9)
2370 : 20 38 17 JSR $1738 ; (askForNumber.s1000 + 0)
2373 : a5 1b __ LDA ACCU + 0 
2375 : 85 53 __ STA T0 + 0 
2377 : a5 1c __ LDA ACCU + 1 
2379 : 85 54 __ STA T0 + 1 
237b : a9 1b __ LDA #$1b
237d : a0 02 __ LDY #$02
237f : 91 23 __ STA (SP + 0),y 
2381 : a9 17 __ LDA #$17
2383 : c8 __ __ INY
2384 : 91 23 __ STA (SP + 0),y 
2386 : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
2389 : a5 54 __ LDA T0 + 1 
238b : 30 a4 __ BMI $2331 ; (difficultyMenu.l23 + 0)
.s1006:
238d : d0 04 __ BNE $2393 ; (difficultyMenu.s7 + 0)
.s1005:
238f : a5 53 __ LDA T0 + 0 
2391 : f0 9e __ BEQ $2331 ; (difficultyMenu.l23 + 0)
.s7:
2393 : a5 54 __ LDA T0 + 1 
2395 : d0 9a __ BNE $2331 ; (difficultyMenu.l23 + 0)
.s1004:
2397 : a5 53 __ LDA T0 + 0 
2399 : c9 04 __ CMP #$04
239b : b0 94 __ BCS $2331 ; (difficultyMenu.l23 + 0)
.s2:
239d : 38 __ __ SEC
239e : e9 01 __ SBC #$01
23a0 : 85 1b __ STA ACCU + 0 
.s1001:
23a2 : 18 __ __ CLC
23a3 : a5 23 __ LDA SP + 0 
23a5 : 69 08 __ ADC #$08
23a7 : 85 23 __ STA SP + 0 
23a9 : 90 02 __ BCC $23ad ; (difficultyMenu.s1001 + 11)
23ab : e6 24 __ INC SP + 1 
23ad : ad 3b 9f LDA $9f3b ; (difficultyMenu@stack + 0)
23b0 : 85 53 __ STA T0 + 0 
23b2 : ad 3c 9f LDA $9f3c ; (difficultyMenu@stack + 1)
23b5 : 85 54 __ STA T0 + 1 
23b7 : ad 3d 9f LDA $9f3d ; (difficultyMenu@stack + 2)
23ba : 85 55 __ STA T1 + 0 
23bc : 60 __ __ RTS
--------------------------------------------------------------------
23bd : __ __ __ BYT 44 69 66 66 69 63 75 6c 74 79 0a 00             : Difficulty..
--------------------------------------------------------------------
playGame: ; playGame(struct*)->i16
.s1000:
23c9 : a2 08 __ LDX #$08
23cb : b5 53 __ LDA T0 + 0,x 
23cd : 9d 8e 9f STA $9f8e,x ; (choices + 79)
23d0 : ca __ __ DEX
23d1 : 10 f8 __ BPL $23cb ; (playGame.s1000 + 2)
23d3 : 38 __ __ SEC
23d4 : a5 23 __ LDA SP + 0 
23d6 : e9 08 __ SBC #$08
23d8 : 85 23 __ STA SP + 0 
23da : b0 02 __ BCS $23de ; (playGame.s0 + 0)
23dc : c6 24 __ DEC SP + 1 
.s0:
23de : a9 69 __ LDA #$69
23e0 : a0 02 __ LDY #$02
23e2 : 91 23 __ STA (SP + 0),y 
23e4 : a9 25 __ LDA #$25
23e6 : c8 __ __ INY
23e7 : 91 23 __ STA (SP + 0),y 
23e9 : ad fe 9f LDA $9ffe ; (sstack + 15)
23ec : 85 53 __ STA T0 + 0 
23ee : ad ff 9f LDA $9fff ; (sstack + 16)
23f1 : 85 54 __ STA T0 + 1 
23f3 : a9 00 __ LDA #$00
23f5 : a0 16 __ LDY #$16
23f7 : d1 53 __ CMP (T0 + 0),y 
23f9 : 2a __ __ ROL
23fa : 85 55 __ STA T1 + 0 
23fc : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
23ff : a0 1e __ LDY #$1e
2401 : b1 53 __ LDA (T0 + 0),y 
2403 : a0 04 __ LDY #$04
2405 : 91 23 __ STA (SP + 0),y 
2407 : a0 1f __ LDY #$1f
2409 : b1 53 __ LDA (T0 + 0),y 
240b : a0 05 __ LDY #$05
240d : 91 23 __ STA (SP + 0),y 
240f : a0 20 __ LDY #$20
2411 : b1 53 __ LDA (T0 + 0),y 
2413 : a0 06 __ LDY #$06
2415 : 91 23 __ STA (SP + 0),y 
2417 : a0 21 __ LDY #$21
2419 : b1 53 __ LDA (T0 + 0),y 
241b : a0 07 __ LDY #$07
241d : 91 23 __ STA (SP + 0),y 
241f : a9 8c __ LDA #$8c
2421 : a0 02 __ LDY #$02
2423 : 91 23 __ STA (SP + 0),y 
2425 : a9 25 __ LDA #$25
2427 : c8 __ __ INY
2428 : 91 23 __ STA (SP + 0),y 
242a : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
242d : a9 14 __ LDA #$14
242f : 85 1b __ STA ACCU + 0 
2431 : a9 00 __ LDA #$00
2433 : 85 1c __ STA ACCU + 1 
2435 : 20 35 2e JSR $2e35 ; (malloc + 0)
2438 : a5 1b __ LDA ACCU + 0 
243a : 85 56 __ STA T2 + 0 
243c : a5 1c __ LDA ACCU + 1 
243e : 85 57 __ STA T2 + 1 
2440 : a9 14 __ LDA #$14
2442 : 85 1b __ STA ACCU + 0 
2444 : a9 00 __ LDA #$00
2446 : 85 1c __ STA ACCU + 1 
2448 : 20 35 2e JSR $2e35 ; (malloc + 0)
244b : a5 1b __ LDA ACCU + 0 
244d : 85 58 __ STA T3 + 0 
244f : a5 1c __ LDA ACCU + 1 
2451 : 85 59 __ STA T3 + 1 
2453 : a0 1b __ LDY #$1b
2455 : b1 53 __ LDA (T0 + 0),y 
2457 : 30 2f __ BMI $2488 ; (playGame.s11 + 0)
.s1007:
2459 : 88 __ __ DEY
245a : 11 53 __ ORA (T0 + 0),y 
245c : f0 2a __ BEQ $2488 ; (playGame.s11 + 0)
.l6:
245e : a9 1b __ LDA #$1b
2460 : a0 02 __ LDY #$02
2462 : 91 23 __ STA (SP + 0),y 
2464 : a9 17 __ LDA #$17
2466 : c8 __ __ INY
2467 : 91 23 __ STA (SP + 0),y 
2469 : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
246c : a9 98 __ LDA #$98
246e : a0 02 __ LDY #$02
2470 : 91 23 __ STA (SP + 0),y 
2472 : a9 25 __ LDA #$25
2474 : c8 __ __ INY
2475 : 91 23 __ STA (SP + 0),y 
2477 : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
247a : a9 1b __ LDA #$1b
247c : a0 02 __ LDY #$02
247e : 91 23 __ STA (SP + 0),y 
2480 : a9 17 __ LDA #$17
2482 : c8 __ __ INY
2483 : 91 23 __ STA (SP + 0),y 
2485 : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
.s11:
2488 : ad fe 9f LDA $9ffe ; (sstack + 15)
248b : 85 53 __ STA T0 + 0 
248d : ad ff 9f LDA $9fff ; (sstack + 16)
2490 : 85 54 __ STA T0 + 1 
.l8:
2492 : a5 56 __ LDA T2 + 0 
2494 : 8d fa 9f STA $9ffa ; (sstack + 11)
2497 : a5 57 __ LDA T2 + 1 
2499 : 8d fb 9f STA $9ffb ; (sstack + 12)
249c : a5 53 __ LDA T0 + 0 
249e : 8d fc 9f STA $9ffc ; (sstack + 13)
24a1 : a5 54 __ LDA T0 + 1 
24a3 : 8d fd 9f STA $9ffd ; (sstack + 14)
24a6 : 20 a6 25 JSR $25a6 ; (playGamePrintCurrentGuessNumber.s1000 + 0)
24a9 : a5 53 __ LDA T0 + 0 
24ab : 8d f7 9f STA $9ff7 ; (sstack + 8)
24ae : a5 54 __ LDA T0 + 1 
24b0 : 8d f8 9f STA $9ff8 ; (sstack + 9)
24b3 : a5 55 __ LDA T1 + 0 
24b5 : 8d f9 9f STA $9ff9 ; (sstack + 10)
24b8 : a5 58 __ LDA T3 + 0 
24ba : 8d fa 9f STA $9ffa ; (sstack + 11)
24bd : a5 59 __ LDA T3 + 1 
24bf : 8d fb 9f STA $9ffb ; (sstack + 12)
24c2 : 20 d9 26 JSR $26d9 ; (playGameAlterPrompt.s1000 + 0)
24c5 : a5 58 __ LDA T3 + 0 
24c7 : 8d f7 9f STA $9ff7 ; (sstack + 8)
24ca : a5 59 __ LDA T3 + 1 
24cc : 8d f8 9f STA $9ff8 ; (sstack + 9)
24cf : 20 38 17 JSR $1738 ; (askForNumber.s1000 + 0)
24d2 : a5 1b __ LDA ACCU + 0 
24d4 : 85 5a __ STA T5 + 0 
24d6 : 8d f7 9f STA $9ff7 ; (sstack + 8)
24d9 : a5 1c __ LDA ACCU + 1 
24db : 85 5b __ STA T5 + 1 
24dd : 8d f8 9f STA $9ff8 ; (sstack + 9)
24e0 : a5 53 __ LDA T0 + 0 
24e2 : 8d f9 9f STA $9ff9 ; (sstack + 10)
24e5 : a5 54 __ LDA T0 + 1 
24e7 : 8d fa 9f STA $9ffa ; (sstack + 11)
24ea : 18 __ __ CLC
24eb : a0 1a __ LDY #$1a
24ed : b1 53 __ LDA (T0 + 0),y 
24ef : 69 01 __ ADC #$01
24f1 : 91 53 __ STA (T0 + 0),y 
24f3 : c8 __ __ INY
24f4 : b1 53 __ LDA (T0 + 0),y 
24f6 : 69 00 __ ADC #$00
24f8 : 91 53 __ STA (T0 + 0),y 
24fa : 20 8e 27 JSR $278e ; (playGameLogic.s1000 + 0)
24fd : a5 5b __ LDA T5 + 1 
24ff : a0 19 __ LDY #$19
2501 : d1 53 __ CMP (T0 + 0),y 
2503 : d0 07 __ BNE $250c ; (playGame.s9 + 0)
.s1005:
2505 : a5 5a __ LDA T5 + 0 
2507 : 88 __ __ DEY
2508 : d1 53 __ CMP (T0 + 0),y 
250a : f0 30 __ BEQ $253c ; (playGame.s5 + 0)
.s9:
250c : a0 1a __ LDY #$1a
250e : b1 53 __ LDA (T0 + 0),y 
2510 : 85 44 __ STA T6 + 0 
2512 : a0 1d __ LDY #$1d
2514 : b1 53 __ LDA (T0 + 0),y 
2516 : 49 80 __ EOR #$80
2518 : 85 03 __ STA WORK + 0 
251a : a0 1b __ LDY #$1b
251c : b1 53 __ LDA (T0 + 0),y 
251e : aa __ __ TAX
251f : 49 80 __ EOR #$80
2521 : c5 03 __ CMP WORK + 0 
2523 : d0 05 __ BNE $252a ; (playGame.s1004 + 0)
.s1003:
2525 : a5 44 __ LDA T6 + 0 
2527 : c8 __ __ INY
2528 : d1 53 __ CMP (T0 + 0),y 
.s1004:
252a : b0 10 __ BCS $253c ; (playGame.s5 + 0)
.s4:
252c : 8a __ __ TXA
252d : 10 03 __ BPL $2532 ; (playGame.s1002 + 0)
252f : 4c 92 24 JMP $2492 ; (playGame.l8 + 0)
.s1002:
2532 : 05 44 __ ORA T6 + 0 
2534 : d0 03 __ BNE $2539 ; (playGame.s1002 + 7)
2536 : 4c 92 24 JMP $2492 ; (playGame.l8 + 0)
2539 : 4c 5e 24 JMP $245e ; (playGame.l6 + 0)
.s5:
253c : a5 5a __ LDA T5 + 0 
253e : 8d f7 9f STA $9ff7 ; (sstack + 8)
2541 : a5 5b __ LDA T5 + 1 
2543 : 8d f8 9f STA $9ff8 ; (sstack + 9)
2546 : a5 53 __ LDA T0 + 0 
2548 : 8d f9 9f STA $9ff9 ; (sstack + 10)
254b : a5 54 __ LDA T0 + 1 
254d : 8d fa 9f STA $9ffa ; (sstack + 11)
2550 : 20 4b 28 JSR $284b ; (playGameCheckWin.s1000 + 0)
.s1001:
2553 : 18 __ __ CLC
2554 : a5 23 __ LDA SP + 0 
2556 : 69 08 __ ADC #$08
2558 : 85 23 __ STA SP + 0 
255a : 90 02 __ BCC $255e ; (playGame.s1001 + 11)
255c : e6 24 __ INC SP + 1 
255e : a2 08 __ LDX #$08
2560 : bd 8e 9f LDA $9f8e,x ; (choices + 79)
2563 : 95 53 __ STA T0 + 0,x 
2565 : ca __ __ DEX
2566 : 10 f8 __ BPL $2560 ; (playGame.s1001 + 13)
2568 : 60 __ __ RTS
--------------------------------------------------------------------
2569 : __ __ __ BYT 49 27 6d 20 74 68 69 6e 6b 69 6e 67 20 6f 66 20 : I'm thinking of 
2579 : __ __ __ BYT 61 20 6e 75 6d 62 65 72 20 62 65 74 77 65 65 6e : a number between
2589 : __ __ __ BYT 20 0a 00                                        :  ..
--------------------------------------------------------------------
258c : __ __ __ BYT 25 64 20 61 6e 64 20 25 64 2e 0a 00             : %d and %d...
--------------------------------------------------------------------
2598 : __ __ __ BYT 47 75 65 73 73 20 61 67 61 69 6e 21 0a 00       : Guess again!..
--------------------------------------------------------------------
playGamePrintCurrentGuessNumber: ; playGamePrintCurrentGuessNumber(u8*,struct*)->void
.s1000:
25a6 : a5 53 __ LDA T0 + 0 
25a8 : 8d 97 9f STA $9f97 ; (choices + 88)
25ab : a5 54 __ LDA T0 + 1 
25ad : 8d 98 9f STA $9f98 ; (choices + 89)
25b0 : 38 __ __ SEC
25b1 : a5 23 __ LDA SP + 0 
25b3 : e9 0a __ SBC #$0a
25b5 : 85 23 __ STA SP + 0 
25b7 : b0 02 __ BCS $25bb ; (playGamePrintCurrentGuessNumber.s0 + 0)
25b9 : c6 24 __ DEC SP + 1 ; (attempt_status + 0)
.s0:
25bb : ad fa 9f LDA $9ffa ; (sstack + 11)
25be : 85 53 __ STA T0 + 0 
25c0 : a0 02 __ LDY #$02
25c2 : 91 23 __ STA (SP + 0),y 
25c4 : ad fb 9f LDA $9ffb ; (sstack + 12)
25c7 : 85 54 __ STA T0 + 1 
25c9 : c8 __ __ INY
25ca : 91 23 __ STA (SP + 0),y 
25cc : a9 a5 __ LDA #$a5
25ce : c8 __ __ INY
25cf : 91 23 __ STA (SP + 0),y 
25d1 : a9 26 __ LDA #$26
25d3 : c8 __ __ INY
25d4 : 91 23 __ STA (SP + 0),y 
25d6 : ad fc 9f LDA $9ffc ; (sstack + 13)
25d9 : 85 43 __ STA T1 + 0 
25db : ad fd 9f LDA $9ffd ; (sstack + 14)
25de : 85 44 __ STA T1 + 1 
25e0 : a0 1a __ LDY #$1a
25e2 : b1 43 __ LDA (T1 + 0),y 
25e4 : 18 __ __ CLC
25e5 : 69 01 __ ADC #$01
25e7 : aa __ __ TAX
25e8 : c8 __ __ INY
25e9 : b1 43 __ LDA (T1 + 0),y 
25eb : 69 00 __ ADC #$00
25ed : a0 07 __ LDY #$07
25ef : 91 23 __ STA (SP + 0),y 
25f1 : 8a __ __ TXA
25f2 : 88 __ __ DEY
25f3 : 91 23 __ STA (SP + 0),y 
25f5 : a0 1c __ LDY #$1c
25f7 : b1 43 __ LDA (T1 + 0),y 
25f9 : a0 08 __ LDY #$08
25fb : 91 23 __ STA (SP + 0),y 
25fd : a0 1d __ LDY #$1d
25ff : b1 43 __ LDA (T1 + 0),y 
2601 : a0 09 __ LDY #$09
2603 : 91 23 __ STA (SP + 0),y 
2605 : 20 4e 26 JSR $264e ; (sprintf.s1000 + 0)
2608 : a5 53 __ LDA T0 + 0 
260a : a0 02 __ LDY #$02
260c : 91 23 __ STA (SP + 0),y 
260e : a5 54 __ LDA T0 + 1 
2610 : c8 __ __ INY
2611 : 91 23 __ STA (SP + 0),y 
2613 : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
2616 : a5 53 __ LDA T0 + 0 
2618 : 85 0d __ STA P0 
261a : a5 54 __ LDA T0 + 1 
261c : 85 0e __ STA P1 
261e : 20 b5 26 JSR $26b5 ; (strlen.s0 + 0)
2621 : a9 2d __ LDA #$2d
2623 : 8d f7 9f STA $9ff7 ; (sstack + 8)
2626 : 38 __ __ SEC
2627 : a5 1b __ LDA ACCU + 0 
2629 : e9 01 __ SBC #$01
262b : 8d f8 9f STA $9ff8 ; (sstack + 9)
262e : a5 1c __ LDA ACCU + 1 
2630 : e9 00 __ SBC #$00
2632 : 8d f9 9f STA $9ff9 ; (sstack + 10)
2635 : 20 9a 16 JSR $169a ; (printLine.s1000 + 0)
.s1001:
2638 : 18 __ __ CLC
2639 : a5 23 __ LDA SP + 0 
263b : 69 0a __ ADC #$0a
263d : 85 23 __ STA SP + 0 
263f : 90 02 __ BCC $2643 ; (playGamePrintCurrentGuessNumber.s1001 + 11)
2641 : e6 24 __ INC SP + 1 ; (attempt_status + 0)
2643 : ad 97 9f LDA $9f97 ; (choices + 88)
2646 : 85 53 __ STA T0 + 0 
2648 : ad 98 9f LDA $9f98 ; (choices + 89)
264b : 85 54 __ STA T0 + 1 
264d : 60 __ __ RTS
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->i16
.s1000:
264e : a5 53 __ LDA T0 + 0 
2650 : 8d cf 9f STA $9fcf ; (buff + 48)
2653 : a5 54 __ LDA T0 + 1 
2655 : 8d d0 9f STA $9fd0 ; (buff + 49)
.s0:
2658 : a9 00 __ LDA #$00
265a : 8d f6 9f STA $9ff6 ; (sstack + 7)
265d : a0 03 __ LDY #$03
265f : b1 23 __ LDA (SP + 0),y 
2661 : 85 54 __ STA T0 + 1 
2663 : 8d f1 9f STA $9ff1 ; (sstack + 2)
2666 : 88 __ __ DEY
2667 : b1 23 __ LDA (SP + 0),y 
2669 : 85 53 __ STA T0 + 0 
266b : 8d f0 9f STA $9ff0 ; (sstack + 1)
266e : a0 04 __ LDY #$04
2670 : b1 23 __ LDA (SP + 0),y 
2672 : 8d f2 9f STA $9ff2 ; (sstack + 3)
2675 : c8 __ __ INY
2676 : b1 23 __ LDA (SP + 0),y 
2678 : 8d f3 9f STA $9ff3 ; (sstack + 4)
267b : 18 __ __ CLC
267c : a5 23 __ LDA SP + 0 
267e : 69 06 __ ADC #$06
2680 : 8d f4 9f STA $9ff4 ; (sstack + 5)
2683 : a5 24 __ LDA SP + 1 
2685 : 69 00 __ ADC #$00
2687 : 8d f5 9f STA $9ff5 ; (sstack + 6)
268a : 20 6f 0a JSR $0a6f ; (sformat.s1000 + 0)
268d : 38 __ __ SEC
268e : a5 1b __ LDA ACCU + 0 
2690 : e5 53 __ SBC T0 + 0 
2692 : 85 1b __ STA ACCU + 0 
2694 : a5 1c __ LDA ACCU + 1 
2696 : e5 54 __ SBC T0 + 1 
2698 : 85 1c __ STA ACCU + 1 
.s1001:
269a : ad cf 9f LDA $9fcf ; (buff + 48)
269d : 85 53 __ STA T0 + 0 
269f : ad d0 9f LDA $9fd0 ; (buff + 49)
26a2 : 85 54 __ STA T0 + 1 
26a4 : 60 __ __ RTS
--------------------------------------------------------------------
26a5 : __ __ __ BYT 47 75 65 73 73 20 25 64 20 6f 66 20 25 64 0a 00 : Guess %d of %d..
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s0:
26b5 : a9 00 __ LDA #$00
26b7 : 85 1b __ STA ACCU + 0 
26b9 : 85 1c __ STA ACCU + 1 
26bb : a8 __ __ TAY
26bc : b1 0d __ LDA (P0),y ; (str + 0)
26be : f0 18 __ BEQ $26d8 ; (strlen.s1001 + 0)
.s2:
26c0 : a5 0d __ LDA P0 ; (str + 0)
26c2 : 85 1b __ STA ACCU + 0 
26c4 : a2 00 __ LDX #$00
.l1002:
26c6 : c8 __ __ INY
26c7 : d0 01 __ BNE $26ca ; (strlen.s1005 + 0)
.s1004:
26c9 : e8 __ __ INX
.s1005:
26ca : 8a __ __ TXA
26cb : 18 __ __ CLC
26cc : 65 0e __ ADC P1 ; (str + 1)
26ce : 85 1c __ STA ACCU + 1 
26d0 : b1 1b __ LDA (ACCU + 0),y 
26d2 : d0 f2 __ BNE $26c6 ; (strlen.l1002 + 0)
.s1003:
26d4 : 86 1c __ STX ACCU + 1 
26d6 : 84 1b __ STY ACCU + 0 
.s1001:
26d8 : 60 __ __ RTS
--------------------------------------------------------------------
playGameAlterPrompt: ; playGameAlterPrompt(struct*,bool,u8*)->void
.s1000:
26d9 : 38 __ __ SEC
26da : a5 23 __ LDA SP + 0 ; (hints + 0)
26dc : e9 0a __ SBC #$0a
26de : 85 23 __ STA SP + 0 ; (hints + 0)
26e0 : b0 02 __ BCS $26e4 ; (playGameAlterPrompt.s0 + 0)
26e2 : c6 24 __ DEC SP + 1 ; (promptMessage + 0)
.s0:
26e4 : ad f7 9f LDA $9ff7 ; (sstack + 8)
26e7 : 85 43 __ STA T0 + 0 
26e9 : ad f8 9f LDA $9ff8 ; (sstack + 9)
26ec : 85 44 __ STA T0 + 1 
26ee : a0 1a __ LDY #$1a
26f0 : b1 43 __ LDA (T0 + 0),y 
26f2 : c8 __ __ INY
26f3 : 11 43 __ ORA (T0 + 0),y 
26f5 : d0 07 __ BNE $26fe ; (playGameAlterPrompt.s2 + 0)
.s4:
26f7 : ad f9 9f LDA $9ff9 ; (sstack + 10)
26fa : c9 01 __ CMP #$01
26fc : f0 14 __ BEQ $2712 ; (playGameAlterPrompt.s1 + 0)
.s2:
26fe : ad fa 9f LDA $9ffa ; (sstack + 11)
2701 : a0 02 __ LDY #$02
2703 : 91 23 __ STA (SP + 0),y ; (hints + 0)
2705 : ad fb 9f LDA $9ffb ; (sstack + 12)
2708 : c8 __ __ INY
2709 : 91 23 __ STA (SP + 0),y ; (hints + 0)
270b : a9 27 __ LDA #$27
270d : a2 81 __ LDX #$81
270f : 4c 43 27 JMP $2743 ; (playGameAlterPrompt.s3 + 0)
.s1:
2712 : a0 1e __ LDY #$1e
2714 : b1 43 __ LDA (T0 + 0),y 
2716 : a0 06 __ LDY #$06
2718 : 91 23 __ STA (SP + 0),y ; (hints + 0)
271a : a0 1f __ LDY #$1f
271c : b1 43 __ LDA (T0 + 0),y 
271e : a0 07 __ LDY #$07
2720 : 91 23 __ STA (SP + 0),y ; (hints + 0)
2722 : a0 20 __ LDY #$20
2724 : b1 43 __ LDA (T0 + 0),y 
2726 : a0 08 __ LDY #$08
2728 : 91 23 __ STA (SP + 0),y ; (hints + 0)
272a : a0 21 __ LDY #$21
272c : b1 43 __ LDA (T0 + 0),y 
272e : a0 09 __ LDY #$09
2730 : 91 23 __ STA (SP + 0),y ; (hints + 0)
2732 : ad fa 9f LDA $9ffa ; (sstack + 11)
2735 : a0 02 __ LDY #$02
2737 : 91 23 __ STA (SP + 0),y ; (hints + 0)
2739 : ad fb 9f LDA $9ffb ; (sstack + 12)
273c : c8 __ __ INY
273d : 91 23 __ STA (SP + 0),y ; (hints + 0)
273f : a9 27 __ LDA #$27
2741 : a2 5e __ LDX #$5e
.s3:
2743 : 85 44 __ STA T0 + 1 
2745 : 8a __ __ TXA
2746 : a0 04 __ LDY #$04
2748 : 91 23 __ STA (SP + 0),y ; (hints + 0)
274a : a5 44 __ LDA T0 + 1 
274c : c8 __ __ INY
274d : 91 23 __ STA (SP + 0),y ; (hints + 0)
274f : 20 4e 26 JSR $264e ; (sprintf.s1000 + 0)
.s1001:
2752 : 18 __ __ CLC
2753 : a5 23 __ LDA SP + 0 ; (hints + 0)
2755 : 69 0a __ ADC #$0a
2757 : 85 23 __ STA SP + 0 ; (hints + 0)
2759 : 90 02 __ BCC $275d ; (playGameAlterPrompt.s1001 + 11)
275b : e6 24 __ INC SP + 1 ; (promptMessage + 0)
275d : 60 __ __ RTS
--------------------------------------------------------------------
275e : __ __ __ BYT 47 75 65 73 73 20 61 20 6e 75 6d 62 65 72 20 62 : Guess a number b
276e : __ __ __ BYT 65 74 77 65 65 6e 20 25 64 20 61 6e 64 20 25 64 : etween %d and %d
277e : __ __ __ BYT 3a 20 00                                        : : .
--------------------------------------------------------------------
2781 : __ __ __ BYT 59 6f 75 72 20 67 75 65 73 73 3a 20 00          : Your guess: .
--------------------------------------------------------------------
playGameLogic: ; playGameLogic(i16,struct*)->void
.s1000:
278e : a2 03 __ LDX #$03
2790 : b5 53 __ LDA T0 + 0,x 
2792 : 9d 9b 9f STA $9f9b,x ; (printLine@stack + 2)
2795 : ca __ __ DEX
2796 : 10 f8 __ BPL $2790 ; (playGameLogic.s1000 + 2)
2798 : 38 __ __ SEC
2799 : a5 23 __ LDA SP + 0 ; (game + 0)
279b : e9 04 __ SBC #$04
279d : 85 23 __ STA SP + 0 ; (game + 0)
279f : b0 02 __ BCS $27a3 ; (playGameLogic.s0 + 0)
27a1 : c6 24 __ DEC SP + 1 ; (game + 1)
.s0:
27a3 : ad f7 9f LDA $9ff7 ; (sstack + 8)
27a6 : 85 53 __ STA T0 + 0 
27a8 : ad f9 9f LDA $9ff9 ; (sstack + 10)
27ab : 85 55 __ STA T1 + 0 
27ad : ad fa 9f LDA $9ffa ; (sstack + 11)
27b0 : 85 56 __ STA T1 + 1 
27b2 : a0 18 __ LDY #$18
27b4 : b1 55 __ LDA (T1 + 0),y 
27b6 : 85 43 __ STA T2 + 0 
27b8 : c8 __ __ INY
27b9 : b1 55 __ LDA (T1 + 0),y 
27bb : 49 80 __ EOR #$80
27bd : 85 03 __ STA WORK + 0 
27bf : ad f8 9f LDA $9ff8 ; (sstack + 9)
27c2 : 85 54 __ STA T0 + 1 
27c4 : 49 80 __ EOR #$80
27c6 : c5 03 __ CMP WORK + 0 
27c8 : d0 04 __ BNE $27ce ; (playGameLogic.s1005 + 0)
.s1004:
27ca : a5 53 __ LDA T0 + 0 
27cc : c5 43 __ CMP T2 + 0 
.s1005:
27ce : b0 1e __ BCS $27ee ; (playGameLogic.s2 + 0)
.s1:
27d0 : a9 36 __ LDA #$36
27d2 : a0 02 __ LDY #$02
27d4 : 91 23 __ STA (SP + 0),y ; (game + 0)
27d6 : a9 28 __ LDA #$28
27d8 : c8 __ __ INY
27d9 : 91 23 __ STA (SP + 0),y ; (game + 0)
27db : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
27de : 18 __ __ CLC
27df : a5 53 __ LDA T0 + 0 
27e1 : 69 01 __ ADC #$01
27e3 : a0 1e __ LDY #$1e
27e5 : 91 55 __ STA (T1 + 0),y 
27e7 : a5 54 __ LDA T0 + 1 
27e9 : 69 00 __ ADC #$00
27eb : c8 __ __ INY
27ec : d0 30 __ BNE $281e ; (playGameLogic.s1006 + 0)
.s2:
27ee : a5 54 __ LDA T0 + 1 
27f0 : 49 80 __ EOR #$80
27f2 : 85 03 __ STA WORK + 0 
27f4 : b1 55 __ LDA (T1 + 0),y 
27f6 : 49 80 __ EOR #$80
27f8 : c5 03 __ CMP WORK + 0 
27fa : d0 04 __ BNE $2800 ; (playGameLogic.s1003 + 0)
.s1002:
27fc : a5 43 __ LDA T2 + 0 
27fe : c5 53 __ CMP T0 + 0 
.s1003:
2800 : b0 1e __ BCS $2820 ; (playGameLogic.s1001 + 0)
.s4:
2802 : a9 40 __ LDA #$40
2804 : a0 02 __ LDY #$02
2806 : 91 23 __ STA (SP + 0),y ; (game + 0)
2808 : a9 28 __ LDA #$28
280a : c8 __ __ INY
280b : 91 23 __ STA (SP + 0),y ; (game + 0)
280d : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
2810 : 38 __ __ SEC
2811 : a5 53 __ LDA T0 + 0 
2813 : e9 01 __ SBC #$01
2815 : a0 20 __ LDY #$20
2817 : 91 55 __ STA (T1 + 0),y 
2819 : a5 54 __ LDA T0 + 1 
281b : e9 00 __ SBC #$00
281d : c8 __ __ INY
.s1006:
281e : 91 55 __ STA (T1 + 0),y 
.s1001:
2820 : 18 __ __ CLC
2821 : a5 23 __ LDA SP + 0 ; (game + 0)
2823 : 69 04 __ ADC #$04
2825 : 85 23 __ STA SP + 0 ; (game + 0)
2827 : 90 02 __ BCC $282b ; (playGameLogic.s1001 + 11)
2829 : e6 24 __ INC SP + 1 ; (game + 1)
282b : a2 03 __ LDX #$03
282d : bd 9b 9f LDA $9f9b,x ; (printLine@stack + 2)
2830 : 95 53 __ STA T0 + 0,x 
2832 : ca __ __ DEX
2833 : 10 f8 __ BPL $282d ; (playGameLogic.s1001 + 13)
2835 : 60 __ __ RTS
--------------------------------------------------------------------
2836 : __ __ __ BYT 54 6f 6f 20 6c 6f 77 21 0a 00                   : Too low!..
--------------------------------------------------------------------
2840 : __ __ __ BYT 54 6f 6f 20 68 69 67 68 21 0a 00                : Too high!..
--------------------------------------------------------------------
playGameCheckWin: ; playGameCheckWin(i16,struct*)->i16
.s1000:
284b : a5 53 __ LDA T1 + 0 
284d : 8d 9d 9f STA $9f9d ; (printLine@stack + 4)
2850 : a5 54 __ LDA T1 + 1 
2852 : 8d 9e 9f STA $9f9e ; (printLine@stack + 5)
2855 : 38 __ __ SEC
2856 : a5 23 __ LDA SP + 0 ; (game + 0)
2858 : e9 06 __ SBC #$06
285a : 85 23 __ STA SP + 0 ; (game + 0)
285c : b0 02 __ BCS $2860 ; (playGameCheckWin.s0 + 0)
285e : c6 24 __ DEC SP + 1 ; (game + 1)
.s0:
2860 : ad f9 9f LDA $9ff9 ; (sstack + 10)
2863 : 85 53 __ STA T1 + 0 
2865 : ad fa 9f LDA $9ffa ; (sstack + 11)
2868 : 85 54 __ STA T1 + 1 
286a : ad f8 9f LDA $9ff8 ; (sstack + 9)
286d : a0 19 __ LDY #$19
286f : d1 53 __ CMP (T1 + 0),y 
2871 : d0 08 __ BNE $287b ; (playGameCheckWin.s2 + 0)
.s1002:
2873 : ad f7 9f LDA $9ff7 ; (sstack + 8)
2876 : 88 __ __ DEY
2877 : d1 53 __ CMP (T1 + 0),y 
2879 : f0 14 __ BEQ $288f ; (playGameCheckWin.s1 + 0)
.s2:
287b : a9 00 __ LDA #$00
287d : a0 02 __ LDY #$02
287f : 91 23 __ STA (SP + 0),y ; (game + 0)
2881 : a9 29 __ LDA #$29
2883 : c8 __ __ INY
2884 : 91 23 __ STA (SP + 0),y ; (game + 0)
2886 : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
2889 : a9 ff __ LDA #$ff
288b : 85 1b __ STA ACCU + 0 
288d : d0 27 __ BNE $28b6 ; (playGameCheckWin.s1001 + 0)
.s1:
288f : a0 1a __ LDY #$1a
2891 : b1 53 __ LDA (T1 + 0),y 
2893 : a0 04 __ LDY #$04
2895 : 91 23 __ STA (SP + 0),y ; (game + 0)
2897 : a0 1b __ LDY #$1b
2899 : b1 53 __ LDA (T1 + 0),y 
289b : a0 05 __ LDY #$05
289d : 91 23 __ STA (SP + 0),y ; (game + 0)
289f : a9 ce __ LDA #$ce
28a1 : a0 02 __ LDY #$02
28a3 : 91 23 __ STA (SP + 0),y ; (game + 0)
28a5 : a9 28 __ LDA #$28
28a7 : c8 __ __ INY
28a8 : 91 23 __ STA (SP + 0),y ; (game + 0)
28aa : 20 41 0a JSR $0a41 ; (printf.s0 + 0)
28ad : a0 1a __ LDY #$1a
28af : b1 53 __ LDA (T1 + 0),y 
28b1 : 85 1b __ STA ACCU + 0 
28b3 : c8 __ __ INY
28b4 : b1 53 __ LDA (T1 + 0),y 
.s1001:
28b6 : 85 1c __ STA ACCU + 1 
28b8 : 18 __ __ CLC
28b9 : a5 23 __ LDA SP + 0 ; (game + 0)
28bb : 69 06 __ ADC #$06
28bd : 85 23 __ STA SP + 0 ; (game + 0)
28bf : 90 02 __ BCC $28c3 ; (playGameCheckWin.s1001 + 13)
28c1 : e6 24 __ INC SP + 1 ; (game + 1)
28c3 : ad 9d 9f LDA $9f9d ; (printLine@stack + 4)
28c6 : 85 53 __ STA T1 + 0 
28c8 : ad 9e 9f LDA $9f9e ; (printLine@stack + 5)
28cb : 85 54 __ STA T1 + 1 
28cd : 60 __ __ RTS
--------------------------------------------------------------------
28ce : __ __ __ BYT 59 6f 75 20 67 75 65 73 73 65 64 20 69 74 20 69 : You guessed it i
28de : __ __ __ BYT 6e 20 25 64 20 61 74 74 65 6d 70 74 73 21 0a 00 : n %d attempts!..
--------------------------------------------------------------------
28ee : __ __ __ BYT 48 69 67 68 20 53 63 6f 72 65 73 0a 00          : High Scores..
--------------------------------------------------------------------
__multab30L:
28fb : __ __ __ BYT 00 1e 3c                                        : ..<
--------------------------------------------------------------------
spentry:
28fe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
28ff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
2900 : __ __ __ BYT 59 6f 75 20 72 61 6e 20 6f 75 74 20 6f 66 20 61 : You ran out of a
2910 : __ __ __ BYT 74 74 65 6d 70 74 73 21 0a 00                   : ttempts!..
--------------------------------------------------------------------
291a : __ __ __ BYT 45 78 69 74 69 6e 67 2e 2e 2e 0a 00             : Exiting.....
--------------------------------------------------------------------
mul16by8: ; mul16by8
2926 : a0 00 __ LDY #$00
2928 : 84 06 __ STY WORK + 3 
292a : 4a __ __ LSR
292b : 90 0d __ BCC $293a ; (mul16by8 + 20)
292d : aa __ __ TAX
292e : 18 __ __ CLC
292f : 98 __ __ TYA
2930 : 65 1b __ ADC ACCU + 0 
2932 : a8 __ __ TAY
2933 : a5 06 __ LDA WORK + 3 
2935 : 65 1c __ ADC ACCU + 1 
2937 : 85 06 __ STA WORK + 3 
2939 : 8a __ __ TXA
293a : 06 1b __ ASL ACCU + 0 
293c : 26 1c __ ROL ACCU + 1 
293e : 4a __ __ LSR
293f : b0 ec __ BCS $292d ; (mul16by8 + 7)
2941 : d0 f7 __ BNE $293a ; (mul16by8 + 20)
2943 : 84 05 __ STY WORK + 2 
2945 : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
2946 : b1 19 __ LDA (IP + 0),y 
2948 : c8 __ __ INY
2949 : aa __ __ TAX
294a : b5 00 __ LDA $00,x 
294c : 85 03 __ STA WORK + 0 
294e : b5 01 __ LDA $01,x 
2950 : 85 04 __ STA WORK + 1 
2952 : b5 02 __ LDA $02,x 
2954 : 85 05 __ STA WORK + 2 
2956 : b5 03 __ LDA WORK + 0,x 
2958 : 85 06 __ STA WORK + 3 
295a : a5 05 __ LDA WORK + 2 
295c : 0a __ __ ASL
295d : a5 06 __ LDA WORK + 3 
295f : 2a __ __ ROL
2960 : 85 08 __ STA WORK + 5 
2962 : f0 06 __ BEQ $296a ; (freg + 36)
2964 : a5 05 __ LDA WORK + 2 
2966 : 09 80 __ ORA #$80
2968 : 85 05 __ STA WORK + 2 
296a : a5 1d __ LDA ACCU + 2 
296c : 0a __ __ ASL
296d : a5 1e __ LDA ACCU + 3 
296f : 2a __ __ ROL
2970 : 85 07 __ STA WORK + 4 
2972 : f0 06 __ BEQ $297a ; (freg + 52)
2974 : a5 1d __ LDA ACCU + 2 
2976 : 09 80 __ ORA #$80
2978 : 85 1d __ STA ACCU + 2 
297a : 60 __ __ RTS
297b : 06 1e __ ASL ACCU + 3 
297d : a5 07 __ LDA WORK + 4 
297f : 6a __ __ ROR
2980 : 85 1e __ STA ACCU + 3 
2982 : b0 06 __ BCS $298a ; (freg + 68)
2984 : a5 1d __ LDA ACCU + 2 
2986 : 29 7f __ AND #$7f
2988 : 85 1d __ STA ACCU + 2 
298a : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
298b : a9 ff __ LDA #$ff
298d : c5 07 __ CMP WORK + 4 
298f : f0 04 __ BEQ $2995 ; (faddsub + 10)
2991 : c5 08 __ CMP WORK + 5 
2993 : d0 11 __ BNE $29a6 ; (faddsub + 27)
2995 : a5 1e __ LDA ACCU + 3 
2997 : 09 7f __ ORA #$7f
2999 : 85 1e __ STA ACCU + 3 
299b : a9 80 __ LDA #$80
299d : 85 1d __ STA ACCU + 2 
299f : a9 00 __ LDA #$00
29a1 : 85 1b __ STA ACCU + 0 
29a3 : 85 1c __ STA ACCU + 1 
29a5 : 60 __ __ RTS
29a6 : 38 __ __ SEC
29a7 : a5 07 __ LDA WORK + 4 
29a9 : e5 08 __ SBC WORK + 5 
29ab : f0 38 __ BEQ $29e5 ; (faddsub + 90)
29ad : aa __ __ TAX
29ae : b0 25 __ BCS $29d5 ; (faddsub + 74)
29b0 : e0 e9 __ CPX #$e9
29b2 : b0 0e __ BCS $29c2 ; (faddsub + 55)
29b4 : a5 08 __ LDA WORK + 5 
29b6 : 85 07 __ STA WORK + 4 
29b8 : a9 00 __ LDA #$00
29ba : 85 1b __ STA ACCU + 0 
29bc : 85 1c __ STA ACCU + 1 
29be : 85 1d __ STA ACCU + 2 
29c0 : f0 23 __ BEQ $29e5 ; (faddsub + 90)
29c2 : a5 1d __ LDA ACCU + 2 
29c4 : 4a __ __ LSR
29c5 : 66 1c __ ROR ACCU + 1 
29c7 : 66 1b __ ROR ACCU + 0 
29c9 : e8 __ __ INX
29ca : d0 f8 __ BNE $29c4 ; (faddsub + 57)
29cc : 85 1d __ STA ACCU + 2 
29ce : a5 08 __ LDA WORK + 5 
29d0 : 85 07 __ STA WORK + 4 
29d2 : 4c e5 29 JMP $29e5 ; (faddsub + 90)
29d5 : e0 18 __ CPX #$18
29d7 : b0 33 __ BCS $2a0c ; (faddsub + 129)
29d9 : a5 05 __ LDA WORK + 2 
29db : 4a __ __ LSR
29dc : 66 04 __ ROR WORK + 1 
29de : 66 03 __ ROR WORK + 0 
29e0 : ca __ __ DEX
29e1 : d0 f8 __ BNE $29db ; (faddsub + 80)
29e3 : 85 05 __ STA WORK + 2 
29e5 : a5 1e __ LDA ACCU + 3 
29e7 : 29 80 __ AND #$80
29e9 : 85 1e __ STA ACCU + 3 
29eb : 45 06 __ EOR WORK + 3 
29ed : 30 31 __ BMI $2a20 ; (faddsub + 149)
29ef : 18 __ __ CLC
29f0 : a5 1b __ LDA ACCU + 0 
29f2 : 65 03 __ ADC WORK + 0 
29f4 : 85 1b __ STA ACCU + 0 
29f6 : a5 1c __ LDA ACCU + 1 
29f8 : 65 04 __ ADC WORK + 1 
29fa : 85 1c __ STA ACCU + 1 
29fc : a5 1d __ LDA ACCU + 2 
29fe : 65 05 __ ADC WORK + 2 
2a00 : 85 1d __ STA ACCU + 2 
2a02 : 90 08 __ BCC $2a0c ; (faddsub + 129)
2a04 : 66 1d __ ROR ACCU + 2 
2a06 : 66 1c __ ROR ACCU + 1 
2a08 : 66 1b __ ROR ACCU + 0 
2a0a : e6 07 __ INC WORK + 4 
2a0c : a5 07 __ LDA WORK + 4 
2a0e : c9 ff __ CMP #$ff
2a10 : f0 83 __ BEQ $2995 ; (faddsub + 10)
2a12 : 4a __ __ LSR
2a13 : 05 1e __ ORA ACCU + 3 
2a15 : 85 1e __ STA ACCU + 3 
2a17 : b0 06 __ BCS $2a1f ; (faddsub + 148)
2a19 : a5 1d __ LDA ACCU + 2 
2a1b : 29 7f __ AND #$7f
2a1d : 85 1d __ STA ACCU + 2 
2a1f : 60 __ __ RTS
2a20 : 38 __ __ SEC
2a21 : a5 1b __ LDA ACCU + 0 
2a23 : e5 03 __ SBC WORK + 0 
2a25 : 85 1b __ STA ACCU + 0 
2a27 : a5 1c __ LDA ACCU + 1 
2a29 : e5 04 __ SBC WORK + 1 
2a2b : 85 1c __ STA ACCU + 1 
2a2d : a5 1d __ LDA ACCU + 2 
2a2f : e5 05 __ SBC WORK + 2 
2a31 : 85 1d __ STA ACCU + 2 
2a33 : b0 19 __ BCS $2a4e ; (faddsub + 195)
2a35 : 38 __ __ SEC
2a36 : a9 00 __ LDA #$00
2a38 : e5 1b __ SBC ACCU + 0 
2a3a : 85 1b __ STA ACCU + 0 
2a3c : a9 00 __ LDA #$00
2a3e : e5 1c __ SBC ACCU + 1 
2a40 : 85 1c __ STA ACCU + 1 
2a42 : a9 00 __ LDA #$00
2a44 : e5 1d __ SBC ACCU + 2 
2a46 : 85 1d __ STA ACCU + 2 
2a48 : a5 1e __ LDA ACCU + 3 
2a4a : 49 80 __ EOR #$80
2a4c : 85 1e __ STA ACCU + 3 
2a4e : a5 1d __ LDA ACCU + 2 
2a50 : 30 ba __ BMI $2a0c ; (faddsub + 129)
2a52 : 05 1c __ ORA ACCU + 1 
2a54 : 05 1b __ ORA ACCU + 0 
2a56 : f0 0f __ BEQ $2a67 ; (faddsub + 220)
2a58 : c6 07 __ DEC WORK + 4 
2a5a : f0 0b __ BEQ $2a67 ; (faddsub + 220)
2a5c : 06 1b __ ASL ACCU + 0 
2a5e : 26 1c __ ROL ACCU + 1 
2a60 : 26 1d __ ROL ACCU + 2 
2a62 : 10 f4 __ BPL $2a58 ; (faddsub + 205)
2a64 : 4c 0c 2a JMP $2a0c ; (faddsub + 129)
2a67 : a9 00 __ LDA #$00
2a69 : 85 1b __ STA ACCU + 0 
2a6b : 85 1c __ STA ACCU + 1 
2a6d : 85 1d __ STA ACCU + 2 
2a6f : 85 1e __ STA ACCU + 3 
2a71 : 60 __ __ RTS
--------------------------------------------------------------------
fmul: ; fmul
2a72 : a5 1b __ LDA ACCU + 0 
2a74 : 05 1c __ ORA ACCU + 1 
2a76 : 05 1d __ ORA ACCU + 2 
2a78 : d0 03 __ BNE $2a7d ; (fmul + 11)
2a7a : 85 1e __ STA ACCU + 3 
2a7c : 60 __ __ RTS
2a7d : a5 03 __ LDA WORK + 0 
2a7f : 05 04 __ ORA WORK + 1 
2a81 : 05 05 __ ORA WORK + 2 
2a83 : d0 09 __ BNE $2a8e ; (fmul + 28)
2a85 : 85 1b __ STA ACCU + 0 
2a87 : 85 1c __ STA ACCU + 1 
2a89 : 85 1d __ STA ACCU + 2 
2a8b : 85 1e __ STA ACCU + 3 
2a8d : 60 __ __ RTS
2a8e : a5 1e __ LDA ACCU + 3 
2a90 : 45 06 __ EOR WORK + 3 
2a92 : 29 80 __ AND #$80
2a94 : 85 1e __ STA ACCU + 3 
2a96 : a9 ff __ LDA #$ff
2a98 : c5 07 __ CMP WORK + 4 
2a9a : f0 42 __ BEQ $2ade ; (fmul + 108)
2a9c : c5 08 __ CMP WORK + 5 
2a9e : f0 3e __ BEQ $2ade ; (fmul + 108)
2aa0 : a9 00 __ LDA #$00
2aa2 : 85 09 __ STA WORK + 6 
2aa4 : 85 0a __ STA WORK + 7 
2aa6 : 85 0b __ STA $0b 
2aa8 : a4 1b __ LDY ACCU + 0 
2aaa : a5 03 __ LDA WORK + 0 
2aac : d0 06 __ BNE $2ab4 ; (fmul + 66)
2aae : a5 04 __ LDA WORK + 1 
2ab0 : f0 0a __ BEQ $2abc ; (fmul + 74)
2ab2 : d0 05 __ BNE $2ab9 ; (fmul + 71)
2ab4 : 20 13 2b JSR $2b13 ; (fmul8 + 0)
2ab7 : a5 04 __ LDA WORK + 1 
2ab9 : 20 13 2b JSR $2b13 ; (fmul8 + 0)
2abc : a5 05 __ LDA WORK + 2 
2abe : 20 13 2b JSR $2b13 ; (fmul8 + 0)
2ac1 : 38 __ __ SEC
2ac2 : a5 0b __ LDA $0b 
2ac4 : 30 06 __ BMI $2acc ; (fmul + 90)
2ac6 : 06 09 __ ASL WORK + 6 
2ac8 : 26 0a __ ROL WORK + 7 
2aca : 2a __ __ ROL
2acb : 18 __ __ CLC
2acc : 29 7f __ AND #$7f
2ace : 85 0b __ STA $0b 
2ad0 : a5 07 __ LDA WORK + 4 
2ad2 : 65 08 __ ADC WORK + 5 
2ad4 : 90 19 __ BCC $2aef ; (fmul + 125)
2ad6 : e9 7f __ SBC #$7f
2ad8 : b0 04 __ BCS $2ade ; (fmul + 108)
2ada : c9 ff __ CMP #$ff
2adc : d0 15 __ BNE $2af3 ; (fmul + 129)
2ade : a5 1e __ LDA ACCU + 3 
2ae0 : 09 7f __ ORA #$7f
2ae2 : 85 1e __ STA ACCU + 3 
2ae4 : a9 80 __ LDA #$80
2ae6 : 85 1d __ STA ACCU + 2 
2ae8 : a9 00 __ LDA #$00
2aea : 85 1b __ STA ACCU + 0 
2aec : 85 1c __ STA ACCU + 1 
2aee : 60 __ __ RTS
2aef : e9 7e __ SBC #$7e
2af1 : 90 15 __ BCC $2b08 ; (fmul + 150)
2af3 : 4a __ __ LSR
2af4 : 05 1e __ ORA ACCU + 3 
2af6 : 85 1e __ STA ACCU + 3 
2af8 : a9 00 __ LDA #$00
2afa : 6a __ __ ROR
2afb : 05 0b __ ORA $0b 
2afd : 85 1d __ STA ACCU + 2 
2aff : a5 0a __ LDA WORK + 7 
2b01 : 85 1c __ STA ACCU + 1 
2b03 : a5 09 __ LDA WORK + 6 
2b05 : 85 1b __ STA ACCU + 0 
2b07 : 60 __ __ RTS
2b08 : a9 00 __ LDA #$00
2b0a : 85 1b __ STA ACCU + 0 
2b0c : 85 1c __ STA ACCU + 1 
2b0e : 85 1d __ STA ACCU + 2 
2b10 : 85 1e __ STA ACCU + 3 
2b12 : 60 __ __ RTS
--------------------------------------------------------------------
fmul8: ; fmul8
2b13 : 38 __ __ SEC
2b14 : 6a __ __ ROR
2b15 : 90 1e __ BCC $2b35 ; (fmul8 + 34)
2b17 : aa __ __ TAX
2b18 : 18 __ __ CLC
2b19 : 98 __ __ TYA
2b1a : 65 09 __ ADC WORK + 6 
2b1c : 85 09 __ STA WORK + 6 
2b1e : a5 0a __ LDA WORK + 7 
2b20 : 65 1c __ ADC ACCU + 1 
2b22 : 85 0a __ STA WORK + 7 
2b24 : a5 0b __ LDA $0b 
2b26 : 65 1d __ ADC ACCU + 2 
2b28 : 6a __ __ ROR
2b29 : 85 0b __ STA $0b 
2b2b : 8a __ __ TXA
2b2c : 66 0a __ ROR WORK + 7 
2b2e : 66 09 __ ROR WORK + 6 
2b30 : 4a __ __ LSR
2b31 : f0 0d __ BEQ $2b40 ; (fmul8 + 45)
2b33 : b0 e2 __ BCS $2b17 ; (fmul8 + 4)
2b35 : 66 0b __ ROR $0b 
2b37 : 66 0a __ ROR WORK + 7 
2b39 : 66 09 __ ROR WORK + 6 
2b3b : 4a __ __ LSR
2b3c : 90 f7 __ BCC $2b35 ; (fmul8 + 34)
2b3e : d0 d7 __ BNE $2b17 ; (fmul8 + 4)
2b40 : 60 __ __ RTS
--------------------------------------------------------------------
fdiv: ; fdiv
2b41 : a5 1b __ LDA ACCU + 0 
2b43 : 05 1c __ ORA ACCU + 1 
2b45 : 05 1d __ ORA ACCU + 2 
2b47 : d0 03 __ BNE $2b4c ; (fdiv + 11)
2b49 : 85 1e __ STA ACCU + 3 
2b4b : 60 __ __ RTS
2b4c : a5 1e __ LDA ACCU + 3 
2b4e : 45 06 __ EOR WORK + 3 
2b50 : 29 80 __ AND #$80
2b52 : 85 1e __ STA ACCU + 3 
2b54 : a5 08 __ LDA WORK + 5 
2b56 : f0 62 __ BEQ $2bba ; (fdiv + 121)
2b58 : a5 07 __ LDA WORK + 4 
2b5a : c9 ff __ CMP #$ff
2b5c : f0 5c __ BEQ $2bba ; (fdiv + 121)
2b5e : a9 00 __ LDA #$00
2b60 : 85 09 __ STA WORK + 6 
2b62 : 85 0a __ STA WORK + 7 
2b64 : 85 0b __ STA $0b 
2b66 : a2 18 __ LDX #$18
2b68 : a5 1b __ LDA ACCU + 0 
2b6a : c5 03 __ CMP WORK + 0 
2b6c : a5 1c __ LDA ACCU + 1 
2b6e : e5 04 __ SBC WORK + 1 
2b70 : a5 1d __ LDA ACCU + 2 
2b72 : e5 05 __ SBC WORK + 2 
2b74 : 90 13 __ BCC $2b89 ; (fdiv + 72)
2b76 : a5 1b __ LDA ACCU + 0 
2b78 : e5 03 __ SBC WORK + 0 
2b7a : 85 1b __ STA ACCU + 0 
2b7c : a5 1c __ LDA ACCU + 1 
2b7e : e5 04 __ SBC WORK + 1 
2b80 : 85 1c __ STA ACCU + 1 
2b82 : a5 1d __ LDA ACCU + 2 
2b84 : e5 05 __ SBC WORK + 2 
2b86 : 85 1d __ STA ACCU + 2 
2b88 : 38 __ __ SEC
2b89 : 26 09 __ ROL WORK + 6 
2b8b : 26 0a __ ROL WORK + 7 
2b8d : 26 0b __ ROL $0b 
2b8f : ca __ __ DEX
2b90 : f0 0a __ BEQ $2b9c ; (fdiv + 91)
2b92 : 06 1b __ ASL ACCU + 0 
2b94 : 26 1c __ ROL ACCU + 1 
2b96 : 26 1d __ ROL ACCU + 2 
2b98 : b0 dc __ BCS $2b76 ; (fdiv + 53)
2b9a : 90 cc __ BCC $2b68 ; (fdiv + 39)
2b9c : 38 __ __ SEC
2b9d : a5 0b __ LDA $0b 
2b9f : 30 06 __ BMI $2ba7 ; (fdiv + 102)
2ba1 : 06 09 __ ASL WORK + 6 
2ba3 : 26 0a __ ROL WORK + 7 
2ba5 : 2a __ __ ROL
2ba6 : 18 __ __ CLC
2ba7 : 29 7f __ AND #$7f
2ba9 : 85 0b __ STA $0b 
2bab : a5 07 __ LDA WORK + 4 
2bad : e5 08 __ SBC WORK + 5 
2baf : 90 1a __ BCC $2bcb ; (fdiv + 138)
2bb1 : 18 __ __ CLC
2bb2 : 69 7f __ ADC #$7f
2bb4 : b0 04 __ BCS $2bba ; (fdiv + 121)
2bb6 : c9 ff __ CMP #$ff
2bb8 : d0 15 __ BNE $2bcf ; (fdiv + 142)
2bba : a5 1e __ LDA ACCU + 3 
2bbc : 09 7f __ ORA #$7f
2bbe : 85 1e __ STA ACCU + 3 
2bc0 : a9 80 __ LDA #$80
2bc2 : 85 1d __ STA ACCU + 2 
2bc4 : a9 00 __ LDA #$00
2bc6 : 85 1c __ STA ACCU + 1 
2bc8 : 85 1b __ STA ACCU + 0 
2bca : 60 __ __ RTS
2bcb : 69 7f __ ADC #$7f
2bcd : 90 15 __ BCC $2be4 ; (fdiv + 163)
2bcf : 4a __ __ LSR
2bd0 : 05 1e __ ORA ACCU + 3 
2bd2 : 85 1e __ STA ACCU + 3 
2bd4 : a9 00 __ LDA #$00
2bd6 : 6a __ __ ROR
2bd7 : 05 0b __ ORA $0b 
2bd9 : 85 1d __ STA ACCU + 2 
2bdb : a5 0a __ LDA WORK + 7 
2bdd : 85 1c __ STA ACCU + 1 
2bdf : a5 09 __ LDA WORK + 6 
2be1 : 85 1b __ STA ACCU + 0 
2be3 : 60 __ __ RTS
2be4 : a9 00 __ LDA #$00
2be6 : 85 1e __ STA ACCU + 3 
2be8 : 85 1d __ STA ACCU + 2 
2bea : 85 1c __ STA ACCU + 1 
2bec : 85 1b __ STA ACCU + 0 
2bee : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
2bef : 24 1c __ BIT ACCU + 1 
2bf1 : 10 0d __ BPL $2c00 ; (divs16 + 17)
2bf3 : 20 0d 2c JSR $2c0d ; (negaccu + 0)
2bf6 : 24 04 __ BIT WORK + 1 
2bf8 : 10 0d __ BPL $2c07 ; (divs16 + 24)
2bfa : 20 1b 2c JSR $2c1b ; (negtmp + 0)
2bfd : 4c 29 2c JMP $2c29 ; (divmod + 0)
2c00 : 24 04 __ BIT WORK + 1 
2c02 : 10 f9 __ BPL $2bfd ; (divs16 + 14)
2c04 : 20 1b 2c JSR $2c1b ; (negtmp + 0)
2c07 : 20 29 2c JSR $2c29 ; (divmod + 0)
2c0a : 4c 0d 2c JMP $2c0d ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
2c0d : 38 __ __ SEC
2c0e : a9 00 __ LDA #$00
2c10 : e5 1b __ SBC ACCU + 0 
2c12 : 85 1b __ STA ACCU + 0 
2c14 : a9 00 __ LDA #$00
2c16 : e5 1c __ SBC ACCU + 1 
2c18 : 85 1c __ STA ACCU + 1 
2c1a : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
2c1b : 38 __ __ SEC
2c1c : a9 00 __ LDA #$00
2c1e : e5 03 __ SBC WORK + 0 
2c20 : 85 03 __ STA WORK + 0 
2c22 : a9 00 __ LDA #$00
2c24 : e5 04 __ SBC WORK + 1 
2c26 : 85 04 __ STA WORK + 1 
2c28 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
2c29 : a5 1c __ LDA ACCU + 1 
2c2b : d0 31 __ BNE $2c5e ; (divmod + 53)
2c2d : a5 04 __ LDA WORK + 1 
2c2f : d0 1e __ BNE $2c4f ; (divmod + 38)
2c31 : 85 06 __ STA WORK + 3 
2c33 : a2 04 __ LDX #$04
2c35 : 06 1b __ ASL ACCU + 0 
2c37 : 2a __ __ ROL
2c38 : c5 03 __ CMP WORK + 0 
2c3a : 90 02 __ BCC $2c3e ; (divmod + 21)
2c3c : e5 03 __ SBC WORK + 0 
2c3e : 26 1b __ ROL ACCU + 0 
2c40 : 2a __ __ ROL
2c41 : c5 03 __ CMP WORK + 0 
2c43 : 90 02 __ BCC $2c47 ; (divmod + 30)
2c45 : e5 03 __ SBC WORK + 0 
2c47 : 26 1b __ ROL ACCU + 0 
2c49 : ca __ __ DEX
2c4a : d0 eb __ BNE $2c37 ; (divmod + 14)
2c4c : 85 05 __ STA WORK + 2 
2c4e : 60 __ __ RTS
2c4f : a5 1b __ LDA ACCU + 0 
2c51 : 85 05 __ STA WORK + 2 
2c53 : a5 1c __ LDA ACCU + 1 
2c55 : 85 06 __ STA WORK + 3 
2c57 : a9 00 __ LDA #$00
2c59 : 85 1b __ STA ACCU + 0 
2c5b : 85 1c __ STA ACCU + 1 
2c5d : 60 __ __ RTS
2c5e : a5 04 __ LDA WORK + 1 
2c60 : d0 1f __ BNE $2c81 ; (divmod + 88)
2c62 : a5 03 __ LDA WORK + 0 
2c64 : 30 1b __ BMI $2c81 ; (divmod + 88)
2c66 : a9 00 __ LDA #$00
2c68 : 85 06 __ STA WORK + 3 
2c6a : a2 10 __ LDX #$10
2c6c : 06 1b __ ASL ACCU + 0 
2c6e : 26 1c __ ROL ACCU + 1 
2c70 : 2a __ __ ROL
2c71 : c5 03 __ CMP WORK + 0 
2c73 : 90 02 __ BCC $2c77 ; (divmod + 78)
2c75 : e5 03 __ SBC WORK + 0 
2c77 : 26 1b __ ROL ACCU + 0 
2c79 : 26 1c __ ROL ACCU + 1 
2c7b : ca __ __ DEX
2c7c : d0 f2 __ BNE $2c70 ; (divmod + 71)
2c7e : 85 05 __ STA WORK + 2 
2c80 : 60 __ __ RTS
2c81 : a9 00 __ LDA #$00
2c83 : 85 05 __ STA WORK + 2 
2c85 : 85 06 __ STA WORK + 3 
2c87 : 84 02 __ STY $02 
2c89 : a0 10 __ LDY #$10
2c8b : 18 __ __ CLC
2c8c : 26 1b __ ROL ACCU + 0 
2c8e : 26 1c __ ROL ACCU + 1 
2c90 : 26 05 __ ROL WORK + 2 
2c92 : 26 06 __ ROL WORK + 3 
2c94 : 38 __ __ SEC
2c95 : a5 05 __ LDA WORK + 2 
2c97 : e5 03 __ SBC WORK + 0 
2c99 : aa __ __ TAX
2c9a : a5 06 __ LDA WORK + 3 
2c9c : e5 04 __ SBC WORK + 1 
2c9e : 90 04 __ BCC $2ca4 ; (divmod + 123)
2ca0 : 86 05 __ STX WORK + 2 
2ca2 : 85 06 __ STA WORK + 3 
2ca4 : 88 __ __ DEY
2ca5 : d0 e5 __ BNE $2c8c ; (divmod + 99)
2ca7 : 26 1b __ ROL ACCU + 0 
2ca9 : 26 1c __ ROL ACCU + 1 
2cab : a4 02 __ LDY $02 
2cad : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
2cae : 24 1c __ BIT ACCU + 1 
2cb0 : 10 0d __ BPL $2cbf ; (mods16 + 17)
2cb2 : 20 0d 2c JSR $2c0d ; (negaccu + 0)
2cb5 : 24 04 __ BIT WORK + 1 
2cb7 : 10 0d __ BPL $2cc6 ; (mods16 + 24)
2cb9 : 20 1b 2c JSR $2c1b ; (negtmp + 0)
2cbc : 4c 29 2c JMP $2c29 ; (divmod + 0)
2cbf : 24 04 __ BIT WORK + 1 
2cc1 : 10 f9 __ BPL $2cbc ; (mods16 + 14)
2cc3 : 20 1b 2c JSR $2c1b ; (negtmp + 0)
2cc6 : 20 29 2c JSR $2c29 ; (divmod + 0)
2cc9 : 38 __ __ SEC
2cca : a9 00 __ LDA #$00
2ccc : e5 05 __ SBC WORK + 2 
2cce : 85 05 __ STA WORK + 2 
2cd0 : a9 00 __ LDA #$00
2cd2 : e5 06 __ SBC WORK + 3 
2cd4 : 85 06 __ STA WORK + 3 
2cd6 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
2cd7 : 20 6a 29 JSR $296a ; (freg + 36)
2cda : a5 07 __ LDA WORK + 4 
2cdc : c9 7f __ CMP #$7f
2cde : b0 07 __ BCS $2ce7 ; (f32_to_i16 + 16)
2ce0 : a9 00 __ LDA #$00
2ce2 : 85 1b __ STA ACCU + 0 
2ce4 : 85 1c __ STA ACCU + 1 
2ce6 : 60 __ __ RTS
2ce7 : 38 __ __ SEC
2ce8 : e9 8e __ SBC #$8e
2cea : 90 0a __ BCC $2cf6 ; (f32_to_i16 + 31)
2cec : a9 ff __ LDA #$ff
2cee : 85 1b __ STA ACCU + 0 
2cf0 : a9 7f __ LDA #$7f
2cf2 : 85 1c __ STA ACCU + 1 
2cf4 : d0 08 __ BNE $2cfe ; (f32_to_i16 + 39)
2cf6 : aa __ __ TAX
2cf7 : 46 1d __ LSR ACCU + 2 
2cf9 : 66 1c __ ROR ACCU + 1 
2cfb : e8 __ __ INX
2cfc : d0 f9 __ BNE $2cf7 ; (f32_to_i16 + 32)
2cfe : 24 1e __ BIT ACCU + 3 
2d00 : 10 0e __ BPL $2d10 ; (f32_to_i16 + 57)
2d02 : 38 __ __ SEC
2d03 : a9 00 __ LDA #$00
2d05 : e5 1c __ SBC ACCU + 1 
2d07 : 85 1b __ STA ACCU + 0 
2d09 : a9 00 __ LDA #$00
2d0b : e5 1d __ SBC ACCU + 2 
2d0d : 85 1c __ STA ACCU + 1 
2d0f : 60 __ __ RTS
2d10 : a5 1c __ LDA ACCU + 1 
2d12 : 85 1b __ STA ACCU + 0 
2d14 : a5 1d __ LDA ACCU + 2 
2d16 : 85 1c __ STA ACCU + 1 
2d18 : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
2d19 : 24 1c __ BIT ACCU + 1 
2d1b : 30 03 __ BMI $2d20 ; (sint16_to_float + 7)
2d1d : 4c 37 2d JMP $2d37 ; (uint16_to_float + 0)
2d20 : 38 __ __ SEC
2d21 : a9 00 __ LDA #$00
2d23 : e5 1b __ SBC ACCU + 0 
2d25 : 85 1b __ STA ACCU + 0 
2d27 : a9 00 __ LDA #$00
2d29 : e5 1c __ SBC ACCU + 1 
2d2b : 85 1c __ STA ACCU + 1 
2d2d : 20 37 2d JSR $2d37 ; (uint16_to_float + 0)
2d30 : a5 1e __ LDA ACCU + 3 
2d32 : 09 80 __ ORA #$80
2d34 : 85 1e __ STA ACCU + 3 
2d36 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
2d37 : a5 1b __ LDA ACCU + 0 
2d39 : 05 1c __ ORA ACCU + 1 
2d3b : d0 05 __ BNE $2d42 ; (uint16_to_float + 11)
2d3d : 85 1d __ STA ACCU + 2 
2d3f : 85 1e __ STA ACCU + 3 
2d41 : 60 __ __ RTS
2d42 : a2 8e __ LDX #$8e
2d44 : a5 1c __ LDA ACCU + 1 
2d46 : 30 06 __ BMI $2d4e ; (uint16_to_float + 23)
2d48 : ca __ __ DEX
2d49 : 06 1b __ ASL ACCU + 0 
2d4b : 2a __ __ ROL
2d4c : 10 fa __ BPL $2d48 ; (uint16_to_float + 17)
2d4e : 29 7f __ AND #$7f
2d50 : 85 1d __ STA ACCU + 2 
2d52 : a5 1b __ LDA ACCU + 0 
2d54 : 85 1c __ STA ACCU + 1 
2d56 : 8a __ __ TXA
2d57 : 4a __ __ LSR
2d58 : 85 1e __ STA ACCU + 3 
2d5a : a9 00 __ LDA #$00
2d5c : 85 1b __ STA ACCU + 0 
2d5e : 6a __ __ ROR
2d5f : 05 1d __ ORA ACCU + 2 
2d61 : 85 1d __ STA ACCU + 2 
2d63 : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
2d64 : a9 00 __ LDA #$00
2d66 : 85 07 __ STA WORK + 4 
2d68 : 85 08 __ STA WORK + 5 
2d6a : 85 09 __ STA WORK + 6 
2d6c : 85 0a __ STA WORK + 7 
2d6e : a2 20 __ LDX #$20
2d70 : 46 06 __ LSR WORK + 3 
2d72 : 66 05 __ ROR WORK + 2 
2d74 : 66 04 __ ROR WORK + 1 
2d76 : 66 03 __ ROR WORK + 0 
2d78 : 90 19 __ BCC $2d93 ; (mul32 + 47)
2d7a : 18 __ __ CLC
2d7b : a5 07 __ LDA WORK + 4 
2d7d : 65 1b __ ADC ACCU + 0 
2d7f : 85 07 __ STA WORK + 4 
2d81 : a5 08 __ LDA WORK + 5 
2d83 : 65 1c __ ADC ACCU + 1 
2d85 : 85 08 __ STA WORK + 5 
2d87 : a5 09 __ LDA WORK + 6 
2d89 : 65 1d __ ADC ACCU + 2 
2d8b : 85 09 __ STA WORK + 6 
2d8d : a5 0a __ LDA WORK + 7 
2d8f : 65 1e __ ADC ACCU + 3 
2d91 : 85 0a __ STA WORK + 7 
2d93 : 06 1b __ ASL ACCU + 0 
2d95 : 26 1c __ ROL ACCU + 1 
2d97 : 26 1d __ ROL ACCU + 2 
2d99 : 26 1e __ ROL ACCU + 3 
2d9b : ca __ __ DEX
2d9c : d0 d2 __ BNE $2d70 ; (mul32 + 12)
2d9e : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
2d9f : 84 02 __ STY $02 
2da1 : a0 20 __ LDY #$20
2da3 : a9 00 __ LDA #$00
2da5 : 85 07 __ STA WORK + 4 
2da7 : 85 08 __ STA WORK + 5 
2da9 : 85 09 __ STA WORK + 6 
2dab : 85 0a __ STA WORK + 7 
2dad : a5 05 __ LDA WORK + 2 
2daf : 05 06 __ ORA WORK + 3 
2db1 : d0 39 __ BNE $2dec ; (divmod32 + 77)
2db3 : 18 __ __ CLC
2db4 : 26 1b __ ROL ACCU + 0 
2db6 : 26 1c __ ROL ACCU + 1 
2db8 : 26 1d __ ROL ACCU + 2 
2dba : 26 1e __ ROL ACCU + 3 
2dbc : 26 07 __ ROL WORK + 4 
2dbe : 26 08 __ ROL WORK + 5 
2dc0 : 90 0c __ BCC $2dce ; (divmod32 + 47)
2dc2 : a5 07 __ LDA WORK + 4 
2dc4 : e5 03 __ SBC WORK + 0 
2dc6 : aa __ __ TAX
2dc7 : a5 08 __ LDA WORK + 5 
2dc9 : e5 04 __ SBC WORK + 1 
2dcb : 38 __ __ SEC
2dcc : b0 0c __ BCS $2dda ; (divmod32 + 59)
2dce : 38 __ __ SEC
2dcf : a5 07 __ LDA WORK + 4 
2dd1 : e5 03 __ SBC WORK + 0 
2dd3 : aa __ __ TAX
2dd4 : a5 08 __ LDA WORK + 5 
2dd6 : e5 04 __ SBC WORK + 1 
2dd8 : 90 04 __ BCC $2dde ; (divmod32 + 63)
2dda : 86 07 __ STX WORK + 4 
2ddc : 85 08 __ STA WORK + 5 
2dde : 88 __ __ DEY
2ddf : d0 d3 __ BNE $2db4 ; (divmod32 + 21)
2de1 : 26 1b __ ROL ACCU + 0 
2de3 : 26 1c __ ROL ACCU + 1 
2de5 : 26 1d __ ROL ACCU + 2 
2de7 : 26 1e __ ROL ACCU + 3 
2de9 : a4 02 __ LDY $02 
2deb : 60 __ __ RTS
2dec : 18 __ __ CLC
2ded : 26 1b __ ROL ACCU + 0 
2def : 26 1c __ ROL ACCU + 1 
2df1 : 26 1d __ ROL ACCU + 2 
2df3 : 26 1e __ ROL ACCU + 3 
2df5 : 26 07 __ ROL WORK + 4 
2df7 : 26 08 __ ROL WORK + 5 
2df9 : 26 09 __ ROL WORK + 6 
2dfb : 26 0a __ ROL WORK + 7 
2dfd : a5 07 __ LDA WORK + 4 
2dff : c5 03 __ CMP WORK + 0 
2e01 : a5 08 __ LDA WORK + 5 
2e03 : e5 04 __ SBC WORK + 1 
2e05 : a5 09 __ LDA WORK + 6 
2e07 : e5 05 __ SBC WORK + 2 
2e09 : a5 0a __ LDA WORK + 7 
2e0b : e5 06 __ SBC WORK + 3 
2e0d : 90 18 __ BCC $2e27 ; (divmod32 + 136)
2e0f : a5 07 __ LDA WORK + 4 
2e11 : e5 03 __ SBC WORK + 0 
2e13 : 85 07 __ STA WORK + 4 
2e15 : a5 08 __ LDA WORK + 5 
2e17 : e5 04 __ SBC WORK + 1 
2e19 : 85 08 __ STA WORK + 5 
2e1b : a5 09 __ LDA WORK + 6 
2e1d : e5 05 __ SBC WORK + 2 
2e1f : 85 09 __ STA WORK + 6 
2e21 : a5 0a __ LDA WORK + 7 
2e23 : e5 06 __ SBC WORK + 3 
2e25 : 85 0a __ STA WORK + 7 
2e27 : 88 __ __ DEY
2e28 : d0 c3 __ BNE $2ded ; (divmod32 + 78)
2e2a : 26 1b __ ROL ACCU + 0 
2e2c : 26 1c __ ROL ACCU + 1 
2e2e : 26 1d __ ROL ACCU + 2 
2e30 : 26 1e __ ROL ACCU + 3 
2e32 : a4 02 __ LDY $02 
2e34 : 60 __ __ RTS
--------------------------------------------------------------------
malloc: ; malloc
2e35 : 18 __ __ CLC
2e36 : a5 1b __ LDA ACCU + 0 
2e38 : 69 02 __ ADC #$02
2e3a : 85 03 __ STA WORK + 0 
2e3c : a5 1c __ LDA ACCU + 1 
2e3e : 69 00 __ ADC #$00
2e40 : 85 04 __ STA WORK + 1 
2e42 : ad f8 2e LDA $2ef8 ; (HeapNode + 2)
2e45 : d0 1f __ BNE $2e66 ; (malloc + 49)
2e47 : a9 00 __ LDA #$00
2e49 : 8d 38 30 STA $3038 
2e4c : 8d 39 30 STA $3039 
2e4f : ee f8 2e INC $2ef8 ; (HeapNode + 2)
2e52 : a9 38 __ LDA #$38
2e54 : 8d f6 2e STA $2ef6 ; (HeapNode + 0)
2e57 : a9 30 __ LDA #$30
2e59 : 8d f7 2e STA $2ef7 ; (HeapNode + 1)
2e5c : a9 00 __ LDA #$00
2e5e : 8d 3a 30 STA $303a 
2e61 : a9 90 __ LDA #$90
2e63 : 8d 3b 30 STA $303b 
2e66 : a9 f6 __ LDA #$f6
2e68 : a2 2e __ LDX #$2e
2e6a : 85 1d __ STA ACCU + 2 
2e6c : 86 1e __ STX ACCU + 3 
2e6e : 18 __ __ CLC
2e6f : a0 00 __ LDY #$00
2e71 : b1 1d __ LDA (ACCU + 2),y 
2e73 : 85 1b __ STA ACCU + 0 
2e75 : 65 03 __ ADC WORK + 0 
2e77 : 85 05 __ STA WORK + 2 
2e79 : c8 __ __ INY
2e7a : b1 1d __ LDA (ACCU + 2),y 
2e7c : 85 1c __ STA ACCU + 1 
2e7e : f0 18 __ BEQ $2e98 ; (malloc + 99)
2e80 : 65 04 __ ADC WORK + 1 
2e82 : 85 06 __ STA WORK + 3 
2e84 : a0 02 __ LDY #$02
2e86 : b1 1b __ LDA (ACCU + 0),y 
2e88 : c5 05 __ CMP WORK + 2 
2e8a : c8 __ __ INY
2e8b : b1 1b __ LDA (ACCU + 0),y 
2e8d : e5 06 __ SBC WORK + 3 
2e8f : b0 08 __ BCS $2e99 ; (malloc + 100)
2e91 : a5 1b __ LDA ACCU + 0 
2e93 : a6 1c __ LDX ACCU + 1 
2e95 : 4c 6a 2e JMP $2e6a ; (malloc + 53)
2e98 : 60 __ __ RTS
2e99 : 18 __ __ CLC
2e9a : a5 05 __ LDA WORK + 2 
2e9c : 69 03 __ ADC #$03
2e9e : 29 fc __ AND #$fc
2ea0 : 85 07 __ STA WORK + 4 
2ea2 : a5 06 __ LDA WORK + 3 
2ea4 : 69 00 __ ADC #$00
2ea6 : 85 08 __ STA WORK + 5 
2ea8 : a0 02 __ LDY #$02
2eaa : a5 07 __ LDA WORK + 4 
2eac : d1 1b __ CMP (ACCU + 0),y 
2eae : d0 15 __ BNE $2ec5 ; (malloc + 144)
2eb0 : c8 __ __ INY
2eb1 : a5 08 __ LDA WORK + 5 
2eb3 : d1 1b __ CMP (ACCU + 0),y 
2eb5 : d0 0e __ BNE $2ec5 ; (malloc + 144)
2eb7 : a0 00 __ LDY #$00
2eb9 : b1 1b __ LDA (ACCU + 0),y 
2ebb : 91 1d __ STA (ACCU + 2),y 
2ebd : c8 __ __ INY
2ebe : b1 1b __ LDA (ACCU + 0),y 
2ec0 : 91 1d __ STA (ACCU + 2),y 
2ec2 : 4c e2 2e JMP $2ee2 ; (malloc + 173)
2ec5 : a0 00 __ LDY #$00
2ec7 : b1 1b __ LDA (ACCU + 0),y 
2ec9 : 91 07 __ STA (WORK + 4),y 
2ecb : a5 07 __ LDA WORK + 4 
2ecd : 91 1d __ STA (ACCU + 2),y 
2ecf : c8 __ __ INY
2ed0 : b1 1b __ LDA (ACCU + 0),y 
2ed2 : 91 07 __ STA (WORK + 4),y 
2ed4 : a5 08 __ LDA WORK + 5 
2ed6 : 91 1d __ STA (ACCU + 2),y 
2ed8 : c8 __ __ INY
2ed9 : b1 1b __ LDA (ACCU + 0),y 
2edb : 91 07 __ STA (WORK + 4),y 
2edd : c8 __ __ INY
2ede : b1 1b __ LDA (ACCU + 0),y 
2ee0 : 91 07 __ STA (WORK + 4),y 
2ee2 : a0 00 __ LDY #$00
2ee4 : a5 05 __ LDA WORK + 2 
2ee6 : 91 1b __ STA (ACCU + 0),y 
2ee8 : c8 __ __ INY
2ee9 : a5 06 __ LDA WORK + 3 
2eeb : 91 1b __ STA (ACCU + 0),y 
2eed : a5 1b __ LDA ACCU + 0 
2eef : 09 02 __ ORA #$02
2ef1 : 85 1b __ STA ACCU + 0 
2ef3 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
2ef4 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
HeapNode:
2ef6 : __ __ __ BSS	4
--------------------------------------------------------------------
2f00 : __ __ __ BYT 4e 65 77 20 47 61 6d 65 00 00 00 00 00 00 00 00 : New Game........
2f10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 44 69 : ..............Di
2f20 : __ __ __ BYT 66 66 69 63 75 6c 74 79 00 00 00 00 00 00 00 00 : fficulty........
2f30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 45 78 69 74 : ............Exit
2f40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2f50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00                   : ..........
--------------------------------------------------------------------
fround5:
2f5a : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
2f6a : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
tpow10:
2f76 : __ __ __ BYT 00 00 80 3f 00 00 20 41 00 00 c8 42 00 00 7a 44 : ...?.. A...B..zD
2f86 : __ __ __ BYT 00 40 1c 46 00 50 c3 47 00 24 74 49             : .@.F.P.G.$tI
--------------------------------------------------------------------
2f92 : __ __ __ BYT 45 61 73 79 20 28 31 35 20 61 74 74 65 6d 70 74 : Easy (15 attempt
2fa2 : __ __ __ BYT 73 29 00 00 00 00 00 00 00 00 00 00 00 00 4d 65 : s)............Me
2fb2 : __ __ __ BYT 64 69 75 6d 20 28 31 30 20 61 74 74 65 6d 70 74 : dium (10 attempt
2fc2 : __ __ __ BYT 73 29 00 00 00 00 00 00 00 00 00 00 48 61 72 64 : s)..........Hard
2fd2 : __ __ __ BYT 20 28 35 20 61 74 74 65 6d 70 74 73 29 00 00 00 :  (5 attempts)...
2fe2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00                   : ..........
--------------------------------------------------------------------
bitshift:
3000 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
3010 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3020 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
3030 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
