
_Sw_init:

;Sw.c,6 :: 		void Sw_init(volatile uint16 Sw_Reg, SwEnumt_t Sw_num)
;Sw.c,8 :: 		Dio_ChannelDirectionSet   (&Sw_Reg, Sw_num, DIO_INPUT);
	MOVLW      FARG_Sw_init_Sw_Reg+0
	MOVWF      FARG_Dio_ChannelDirectionSet_Port_reg+0
	MOVF       FARG_Sw_init_Sw_num+0, 0
	MOVWF      FARG_Dio_ChannelDirectionSet_Channel+0
	MOVLW      1
	MOVWF      FARG_Dio_ChannelDirectionSet_Direction+0
	CALL       _Dio_ChannelDirectionSet+0
;Sw.c,9 :: 		}
L_end_Sw_init:
	RETURN
; end of _Sw_init

_Sw_StateGet:

;Sw.c,10 :: 		Sw_StateEnum_t Sw_StateGet(volatile uint16 Sw_Reg, SwEnumt_t Sw_num)
;Sw.c,12 :: 		Sw_StateEnum_t LocalSwState = SW_RELEASED;
	CLRF       Sw_StateGet_LocalSwState_L0+0
;Sw.c,14 :: 		if(Sw_PrevState != Dio_ChannelRead(&Sw_Reg, Sw_num))
	MOVLW      FARG_Sw_StateGet_Sw_Reg+0
	MOVWF      FARG_Dio_ChannelRead_Port_reg+0
	MOVF       FARG_Sw_StateGet_Sw_num+0, 0
	MOVWF      FARG_Dio_ChannelRead_Channel+0
	CALL       _Dio_ChannelRead+0
	MOVF       _Sw_PrevState+0, 0
	XORWF      R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Sw_StateGet0
;Sw.c,16 :: 		Delay_ms(DEBOUNCE_PERIOD);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_Sw_StateGet1:
	DECFSZ     R13+0, 1
	GOTO       L_Sw_StateGet1
	DECFSZ     R12+0, 1
	GOTO       L_Sw_StateGet1
	NOP
	NOP
;Sw.c,18 :: 		Sw_PrevState = Dio_ChannelRead(&Sw_Reg, Sw_num);
	MOVLW      FARG_Sw_StateGet_Sw_Reg+0
	MOVWF      FARG_Dio_ChannelRead_Port_reg+0
	MOVF       FARG_Sw_StateGet_Sw_num+0, 0
	MOVWF      FARG_Dio_ChannelRead_Channel+0
	CALL       _Dio_ChannelRead+0
	MOVF       R0+0, 0
	MOVWF      _Sw_PrevState+0
;Sw.c,19 :: 		if (Sw_PrevState == DIO_HIGH)
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Sw_StateGet2
;Sw.c,21 :: 		LocalSwState = SW_PRESSED;
	MOVLW      1
	MOVWF      Sw_StateGet_LocalSwState_L0+0
;Sw.c,22 :: 		}
	GOTO       L_Sw_StateGet3
L_Sw_StateGet2:
;Sw.c,25 :: 		LocalSwState = SW_RELEASED;
	CLRF       Sw_StateGet_LocalSwState_L0+0
;Sw.c,26 :: 		}
L_Sw_StateGet3:
;Sw.c,27 :: 		Delay_ms(DEBOUNCE_PERIOD);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_Sw_StateGet4:
	DECFSZ     R13+0, 1
	GOTO       L_Sw_StateGet4
	DECFSZ     R12+0, 1
	GOTO       L_Sw_StateGet4
	NOP
	NOP
;Sw.c,28 :: 		}
L_Sw_StateGet0:
;Sw.c,29 :: 		return LocalSwState;
	MOVF       Sw_StateGet_LocalSwState_L0+0, 0
	MOVWF      R0+0
;Sw.c,30 :: 		}
L_end_Sw_StateGet:
	RETURN
; end of _Sw_StateGet
