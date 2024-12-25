
_main:

;main.c,5 :: 		void main() {
;main.c,7 :: 		uint8 u8Count_Value = 0;
	CLRF       main_u8Count_Value_L0+0
;main.c,8 :: 		Alg_Init();
	CALL       _Alg_init+0
;main.c,11 :: 		while(1)
L_main0:
;main.c,12 :: 		{     while (Sw_StateGet(SW_INP_REG,OK) == SW_RELEASED)
L_main2:
	MOVF       PORTB+0, 0
	MOVWF      FARG_Sw_StateGet_Sw_Reg+0
	MOVLW      7
	MOVWF      FARG_Sw_StateGet_Sw_num+0
	CALL       _Sw_StateGet+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;main.c,14 :: 		if(Sw_StateGet(SW_INP_REG,UP) == SW_PRESSED)
	MOVF       PORTB+0, 0
	MOVWF      FARG_Sw_StateGet_Sw_Reg+0
	CLRF       FARG_Sw_StateGet_Sw_num+0
	CALL       _Sw_StateGet+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;main.c,16 :: 		u8local_array[u8Count_Value] = UP;
	MOVF       main_u8Count_Value_L0+0, 0
	ADDLW      main_u8local_array_L0+0
	MOVWF      FSR
	CLRF       INDF+0
;main.c,17 :: 		u8Count_Value++;
	INCF       main_u8Count_Value_L0+0, 1
;main.c,18 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;main.c,19 :: 		}
	GOTO       L_main6
L_main4:
;main.c,20 :: 		else if (Sw_StateGet(SW_INP_REG,DOWN) == SW_PRESSED)
	MOVF       PORTB+0, 0
	MOVWF      FARG_Sw_StateGet_Sw_Reg+0
	MOVLW      1
	MOVWF      FARG_Sw_StateGet_Sw_num+0
	CALL       _Sw_StateGet+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;main.c,22 :: 		u8local_array[u8Count_Value] = DOWN;
	MOVF       main_u8Count_Value_L0+0, 0
	ADDLW      main_u8local_array_L0+0
	MOVWF      FSR
	MOVLW      1
	MOVWF      INDF+0
;main.c,23 :: 		u8Count_Value++;
	INCF       main_u8Count_Value_L0+0, 1
;main.c,24 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
	NOP
;main.c,25 :: 		}
	GOTO       L_main9
L_main7:
;main.c,26 :: 		else if (Sw_StateGet(SW_INP_REG,LEFT) == SW_PRESSED)
	MOVF       PORTB+0, 0
	MOVWF      FARG_Sw_StateGet_Sw_Reg+0
	MOVLW      3
	MOVWF      FARG_Sw_StateGet_Sw_num+0
	CALL       _Sw_StateGet+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;main.c,28 :: 		u8local_array[u8Count_Value] = LEFT;
	MOVF       main_u8Count_Value_L0+0, 0
	ADDLW      main_u8local_array_L0+0
	MOVWF      FSR
	MOVLW      3
	MOVWF      INDF+0
;main.c,29 :: 		u8Count_Value++;
	INCF       main_u8Count_Value_L0+0, 1
;main.c,30 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	NOP
	NOP
;main.c,31 :: 		}
	GOTO       L_main12
L_main10:
;main.c,32 :: 		else if (Sw_StateGet(SW_INP_REG,RIGHT) == SW_PRESSED)
	MOVF       PORTB+0, 0
	MOVWF      FARG_Sw_StateGet_Sw_Reg+0
	MOVLW      2
	MOVWF      FARG_Sw_StateGet_Sw_num+0
	CALL       _Sw_StateGet+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main13
;main.c,34 :: 		u8local_array[u8Count_Value] = RIGHT;
	MOVF       main_u8Count_Value_L0+0, 0
	ADDLW      main_u8local_array_L0+0
	MOVWF      FSR
	MOVLW      2
	MOVWF      INDF+0
;main.c,35 :: 		u8Count_Value++;
	INCF       main_u8Count_Value_L0+0, 1
;main.c,36 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	NOP
	NOP
;main.c,37 :: 		}
L_main13:
L_main12:
L_main9:
L_main6:
;main.c,38 :: 		}
	GOTO       L_main2
L_main3:
;main.c,39 :: 		Motor_Loop(u8Count_Value,u8local_array);
	MOVF       main_u8Count_Value_L0+0, 0
	MOVWF      FARG_Motor_Loop_count+0
	MOVLW      main_u8local_array_L0+0
	MOVWF      FARG_Motor_Loop_array+0
	CALL       _Motor_Loop+0
;main.c,41 :: 		u8Count_Value = 0;
	CLRF       main_u8Count_Value_L0+0
;main.c,44 :: 		}
	GOTO       L_main0
;main.c,48 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
