
_Dio_ChannelDirectionSet:

;Dio.c,5 :: 		void Dio_ChannelDirectionSet(uint16 volatile  *Port_reg, DioPinEnum_t Channel, DioPinDirectionEnum_t Direction)
;Dio.c,8 :: 		switch(Direction)
	GOTO       L_Dio_ChannelDirectionSet0
;Dio.c,10 :: 		case DIO_OUTPUT:
L_Dio_ChannelDirectionSet2:
;Dio.c,11 :: 		CLEAR_BIT(*Port_reg,Channel);
	MOVF       FARG_Dio_ChannelDirectionSet_Channel+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__Dio_ChannelDirectionSet11:
	BTFSC      STATUS+0, 2
	GOTO       L__Dio_ChannelDirectionSet12
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__Dio_ChannelDirectionSet11
L__Dio_ChannelDirectionSet12:
	COMF       R0+0, 0
	MOVWF      R1+0
	MOVF       FARG_Dio_ChannelDirectionSet_Port_reg+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_Dio_ChannelDirectionSet_Port_reg+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Dio.c,12 :: 		break;
	GOTO       L_Dio_ChannelDirectionSet1
;Dio.c,13 :: 		case DIO_INPUT:
L_Dio_ChannelDirectionSet3:
;Dio.c,14 :: 		SET_BIT(*Port_reg,Channel);
	MOVF       FARG_Dio_ChannelDirectionSet_Channel+0, 0
	MOVWF      R0+0
	MOVLW      1
	MOVWF      R1+0
	MOVF       R0+0, 0
L__Dio_ChannelDirectionSet13:
	BTFSC      STATUS+0, 2
	GOTO       L__Dio_ChannelDirectionSet14
	RLF        R1+0, 1
	BCF        R1+0, 0
	ADDLW      255
	GOTO       L__Dio_ChannelDirectionSet13
L__Dio_ChannelDirectionSet14:
	MOVF       FARG_Dio_ChannelDirectionSet_Port_reg+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	MOVF       FARG_Dio_ChannelDirectionSet_Port_reg+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Dio.c,15 :: 		break;
	GOTO       L_Dio_ChannelDirectionSet1
;Dio.c,16 :: 		default:
L_Dio_ChannelDirectionSet4:
;Dio.c,17 :: 		break;
	GOTO       L_Dio_ChannelDirectionSet1
;Dio.c,18 :: 		}
L_Dio_ChannelDirectionSet0:
	MOVF       FARG_Dio_ChannelDirectionSet_Direction+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Dio_ChannelDirectionSet2
	MOVF       FARG_Dio_ChannelDirectionSet_Direction+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Dio_ChannelDirectionSet3
	GOTO       L_Dio_ChannelDirectionSet4
L_Dio_ChannelDirectionSet1:
;Dio.c,19 :: 		}
L_end_Dio_ChannelDirectionSet:
	RETURN
; end of _Dio_ChannelDirectionSet

_Dio_ChannelRead:

;Dio.c,21 :: 		DioPinStateEnum_t Dio_ChannelRead(uint16 volatile  *Port_reg, DioPinEnum_t Channel)
;Dio.c,23 :: 		DioPinStateEnum_t u8LocalPinValue = READ_BIT(*Port_reg,Channel);
	MOVF       FARG_Dio_ChannelRead_Port_reg+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R3+0
	MOVF       FARG_Dio_ChannelRead_Channel+0, 0
	MOVWF      R2+0
	MOVLW      1
	MOVWF      R0+0
	CLRF       R0+1
	MOVF       R2+0, 0
L__Dio_ChannelRead16:
	BTFSC      STATUS+0, 2
	GOTO       L__Dio_ChannelRead17
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__Dio_ChannelRead16
L__Dio_ChannelRead17:
	MOVLW      0
	MOVWF      R3+1
	MOVF       R0+0, 0
	ANDWF      R3+0, 1
	MOVF       R0+1, 0
	ANDWF      R3+1, 1
	MOVF       FARG_Dio_ChannelRead_Channel+0, 0
	MOVWF      R2+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__Dio_ChannelRead18:
	BTFSC      STATUS+0, 2
	GOTO       L__Dio_ChannelRead19
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	ADDLW      255
	GOTO       L__Dio_ChannelRead18
L__Dio_ChannelRead19:
;Dio.c,24 :: 		return (u8LocalPinValue);
;Dio.c,25 :: 		}
L_end_Dio_ChannelRead:
	RETURN
; end of _Dio_ChannelRead

_Dio_ChannelWrite:

;Dio.c,27 :: 		void Dio_ChannelWrite(uint16 volatile  *Port_reg, DioPinEnum_t Channel, DioPinStateEnum_t State)
;Dio.c,29 :: 		switch(State)
	GOTO       L_Dio_ChannelWrite5
;Dio.c,31 :: 		case DIO_LOW:
L_Dio_ChannelWrite7:
;Dio.c,32 :: 		CLEAR_BIT(*Port_reg,Channel);
	MOVF       FARG_Dio_ChannelWrite_Channel+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__Dio_ChannelWrite21:
	BTFSC      STATUS+0, 2
	GOTO       L__Dio_ChannelWrite22
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__Dio_ChannelWrite21
L__Dio_ChannelWrite22:
	COMF       R0+0, 0
	MOVWF      R1+0
	MOVF       FARG_Dio_ChannelWrite_Port_reg+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_Dio_ChannelWrite_Port_reg+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Dio.c,33 :: 		break;
	GOTO       L_Dio_ChannelWrite6
;Dio.c,34 :: 		case DIO_HIGH:
L_Dio_ChannelWrite8:
;Dio.c,35 :: 		SET_BIT(*Port_reg,Channel);
	MOVF       FARG_Dio_ChannelWrite_Channel+0, 0
	MOVWF      R0+0
	MOVLW      1
	MOVWF      R1+0
	MOVF       R0+0, 0
L__Dio_ChannelWrite23:
	BTFSC      STATUS+0, 2
	GOTO       L__Dio_ChannelWrite24
	RLF        R1+0, 1
	BCF        R1+0, 0
	ADDLW      255
	GOTO       L__Dio_ChannelWrite23
L__Dio_ChannelWrite24:
	MOVF       FARG_Dio_ChannelWrite_Port_reg+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	MOVF       FARG_Dio_ChannelWrite_Port_reg+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Dio.c,36 :: 		break;
	GOTO       L_Dio_ChannelWrite6
;Dio.c,37 :: 		default:
L_Dio_ChannelWrite9:
;Dio.c,38 :: 		break;
	GOTO       L_Dio_ChannelWrite6
;Dio.c,39 :: 		}
L_Dio_ChannelWrite5:
	MOVF       FARG_Dio_ChannelWrite_State+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Dio_ChannelWrite7
	MOVF       FARG_Dio_ChannelWrite_State+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Dio_ChannelWrite8
	GOTO       L_Dio_ChannelWrite9
L_Dio_ChannelWrite6:
;Dio.c,40 :: 		}
L_end_Dio_ChannelWrite:
	RETURN
; end of _Dio_ChannelWrite

_Dio_ChannelToggle:

;Dio.c,41 :: 		void Dio_ChannelToggle(uint16 volatile  *Port_reg, DioPinEnum_t Channel)
;Dio.c,43 :: 		TOGGLE_BIT(*Port_reg,Channel);
	MOVF       FARG_Dio_ChannelToggle_Channel+0, 0
	MOVWF      R0+0
	MOVLW      1
	MOVWF      R1+0
	MOVF       R0+0, 0
L__Dio_ChannelToggle26:
	BTFSC      STATUS+0, 2
	GOTO       L__Dio_ChannelToggle27
	RLF        R1+0, 1
	BCF        R1+0, 0
	ADDLW      255
	GOTO       L__Dio_ChannelToggle26
L__Dio_ChannelToggle27:
	MOVF       FARG_Dio_ChannelToggle_Port_reg+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	XORWF      R0+0, 1
	MOVF       FARG_Dio_ChannelToggle_Port_reg+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Dio.c,44 :: 		}
L_end_Dio_ChannelToggle:
	RETURN
; end of _Dio_ChannelToggle

_Dio_PortWrite:

;Dio.c,46 :: 		void Dio_PortWrite(uint16 volatile * Port_reg, uint8 Value)
;Dio.c,48 :: 		*Port_reg = Value;
	MOVF       FARG_Dio_PortWrite_Port_reg+0, 0
	MOVWF      FSR
	MOVF       FARG_Dio_PortWrite_Value+0, 0
	MOVWF      INDF+0
;Dio.c,49 :: 		}
L_end_Dio_PortWrite:
	RETURN
; end of _Dio_PortWrite

_Dio_PortRead:

;Dio.c,51 :: 		uint8 Dio_PortRead(uint16 volatile  *Port_reg)
;Dio.c,53 :: 		uint8 u8LocalPortValue = *Port_reg;
	MOVF       FARG_Dio_PortRead_Port_reg+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
;Dio.c,54 :: 		return u8LocalPortValue;
	MOVF       R1+0, 0
	MOVWF      R0+0
;Dio.c,55 :: 		}
L_end_Dio_PortRead:
	RETURN
; end of _Dio_PortRead
