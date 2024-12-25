
_Alg_init:

;Alg.c,6 :: 		void Alg_init(void)
;Alg.c,9 :: 		SW_INP_REG = 0x00;
	CLRF       PORTB+0
;Alg.c,10 :: 		MOTOR_OUTPUT_REG = 0x00;
	CLRF       PORTD+0
;Alg.c,13 :: 		Sw_init(SW_DIR_REG,UP);
	MOVF       TRISB+0, 0
	MOVWF      FARG_Sw_init_Sw_Reg+0
	CLRF       FARG_Sw_init_Sw_num+0
	CALL       _Sw_init+0
;Alg.c,14 :: 		Sw_init(SW_DIR_REG,DOWN);
	MOVF       TRISB+0, 0
	MOVWF      FARG_Sw_init_Sw_Reg+0
	MOVLW      1
	MOVWF      FARG_Sw_init_Sw_num+0
	CALL       _Sw_init+0
;Alg.c,15 :: 		Sw_init(SW_DIR_REG,RIGHT);
	MOVF       TRISB+0, 0
	MOVWF      FARG_Sw_init_Sw_Reg+0
	MOVLW      2
	MOVWF      FARG_Sw_init_Sw_num+0
	CALL       _Sw_init+0
;Alg.c,16 :: 		Sw_init(SW_DIR_REG,LEFT);
	MOVF       TRISB+0, 0
	MOVWF      FARG_Sw_init_Sw_Reg+0
	MOVLW      3
	MOVWF      FARG_Sw_init_Sw_num+0
	CALL       _Sw_init+0
;Alg.c,17 :: 		Sw_init(SW_DIR_REG,OK);
	MOVF       TRISB+0, 0
	MOVWF      FARG_Sw_init_Sw_Reg+0
	MOVLW      7
	MOVWF      FARG_Sw_init_Sw_num+0
	CALL       _Sw_init+0
;Alg.c,18 :: 		Dio_ChannelDirectionSet(&MOTOR_DIR_REG,MOTOR_1_CLOCKWISE,DIO_OUTPUT);
	MOVLW      TRISD+0
	MOVWF      FARG_Dio_ChannelDirectionSet_Port_reg+0
	CLRF       FARG_Dio_ChannelDirectionSet_Channel+0
	CLRF       FARG_Dio_ChannelDirectionSet_Direction+0
	CALL       _Dio_ChannelDirectionSet+0
;Alg.c,19 :: 		Dio_ChannelDirectionSet(&MOTOR_DIR_REG,MOTOR_1_ANTICLOCKWISE,DIO_OUTPUT);
	MOVLW      TRISD+0
	MOVWF      FARG_Dio_ChannelDirectionSet_Port_reg+0
	MOVLW      1
	MOVWF      FARG_Dio_ChannelDirectionSet_Channel+0
	CLRF       FARG_Dio_ChannelDirectionSet_Direction+0
	CALL       _Dio_ChannelDirectionSet+0
;Alg.c,20 :: 		Dio_ChannelDirectionSet(&MOTOR_DIR_REG,MOTOR_2_CLOCKWISE,DIO_OUTPUT);
	MOVLW      TRISD+0
	MOVWF      FARG_Dio_ChannelDirectionSet_Port_reg+0
	MOVLW      2
	MOVWF      FARG_Dio_ChannelDirectionSet_Channel+0
	CLRF       FARG_Dio_ChannelDirectionSet_Direction+0
	CALL       _Dio_ChannelDirectionSet+0
;Alg.c,21 :: 		Dio_ChannelDirectionSet(&MOTOR_DIR_REG,MOTOR_2_ANTICLOCKWISE,DIO_OUTPUT);
	MOVLW      TRISD+0
	MOVWF      FARG_Dio_ChannelDirectionSet_Port_reg+0
	MOVLW      3
	MOVWF      FARG_Dio_ChannelDirectionSet_Channel+0
	CLRF       FARG_Dio_ChannelDirectionSet_Direction+0
	CALL       _Dio_ChannelDirectionSet+0
;Alg.c,22 :: 		}
L_end_Alg_init:
	RETURN
; end of _Alg_init

_Move_State:

;Alg.c,25 :: 		void Move_State(Motor_SelectEnum motor,Motor_DirectionEnum dir)
;Alg.c,27 :: 		switch(motor)
	GOTO       L_Move_State0
;Alg.c,29 :: 		case MOTOR_1:
L_Move_State2:
;Alg.c,31 :: 		switch(dir)
	GOTO       L_Move_State3
;Alg.c,33 :: 		case CLOCKWISE:
L_Move_State5:
;Alg.c,35 :: 		Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_1_CLOCKWISE,DIO_HIGH);
	MOVLW      PORTD+0
	MOVWF      FARG_Dio_ChannelWrite_Port_reg+0
	CLRF       FARG_Dio_ChannelWrite_Channel+0
	MOVLW      1
	MOVWF      FARG_Dio_ChannelWrite_State+0
	CALL       _Dio_ChannelWrite+0
;Alg.c,36 :: 		Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_1_ANTICLOCKWISE,DIO_LOW);
	MOVLW      PORTD+0
	MOVWF      FARG_Dio_ChannelWrite_Port_reg+0
	MOVLW      1
	MOVWF      FARG_Dio_ChannelWrite_Channel+0
	CLRF       FARG_Dio_ChannelWrite_State+0
	CALL       _Dio_ChannelWrite+0
;Alg.c,37 :: 		break;
	GOTO       L_Move_State4
;Alg.c,39 :: 		case ANTICLOCKWISE:
L_Move_State6:
;Alg.c,41 :: 		Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_1_CLOCKWISE,DIO_LOW);
	MOVLW      PORTD+0
	MOVWF      FARG_Dio_ChannelWrite_Port_reg+0
	CLRF       FARG_Dio_ChannelWrite_Channel+0
	CLRF       FARG_Dio_ChannelWrite_State+0
	CALL       _Dio_ChannelWrite+0
;Alg.c,42 :: 		Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_1_ANTICLOCKWISE,DIO_HIGH);
	MOVLW      PORTD+0
	MOVWF      FARG_Dio_ChannelWrite_Port_reg+0
	MOVLW      1
	MOVWF      FARG_Dio_ChannelWrite_Channel+0
	MOVLW      1
	MOVWF      FARG_Dio_ChannelWrite_State+0
	CALL       _Dio_ChannelWrite+0
;Alg.c,43 :: 		break;
	GOTO       L_Move_State4
;Alg.c,45 :: 		}
L_Move_State3:
	MOVF       FARG_Move_State_dir+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Move_State5
	MOVF       FARG_Move_State_dir+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Move_State6
L_Move_State4:
;Alg.c,47 :: 		case MOTOR_2:
L_Move_State7:
;Alg.c,49 :: 		switch(dir)
	GOTO       L_Move_State8
;Alg.c,51 :: 		case CLOCKWISE:
L_Move_State10:
;Alg.c,53 :: 		Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_2_CLOCKWISE,DIO_HIGH);
	MOVLW      PORTD+0
	MOVWF      FARG_Dio_ChannelWrite_Port_reg+0
	MOVLW      2
	MOVWF      FARG_Dio_ChannelWrite_Channel+0
	MOVLW      1
	MOVWF      FARG_Dio_ChannelWrite_State+0
	CALL       _Dio_ChannelWrite+0
;Alg.c,54 :: 		Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_2_ANTICLOCKWISE,DIO_LOW);
	MOVLW      PORTD+0
	MOVWF      FARG_Dio_ChannelWrite_Port_reg+0
	MOVLW      3
	MOVWF      FARG_Dio_ChannelWrite_Channel+0
	CLRF       FARG_Dio_ChannelWrite_State+0
	CALL       _Dio_ChannelWrite+0
;Alg.c,55 :: 		break;
	GOTO       L_Move_State9
;Alg.c,57 :: 		case ANTICLOCKWISE:
L_Move_State11:
;Alg.c,59 :: 		Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_2_CLOCKWISE,DIO_LOW);
	MOVLW      PORTD+0
	MOVWF      FARG_Dio_ChannelWrite_Port_reg+0
	MOVLW      2
	MOVWF      FARG_Dio_ChannelWrite_Channel+0
	CLRF       FARG_Dio_ChannelWrite_State+0
	CALL       _Dio_ChannelWrite+0
;Alg.c,60 :: 		Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_2_ANTICLOCKWISE,DIO_HIGH);
	MOVLW      PORTD+0
	MOVWF      FARG_Dio_ChannelWrite_Port_reg+0
	MOVLW      3
	MOVWF      FARG_Dio_ChannelWrite_Channel+0
	MOVLW      1
	MOVWF      FARG_Dio_ChannelWrite_State+0
	CALL       _Dio_ChannelWrite+0
;Alg.c,61 :: 		break;
	GOTO       L_Move_State9
;Alg.c,63 :: 		}
L_Move_State8:
	MOVF       FARG_Move_State_dir+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Move_State10
	MOVF       FARG_Move_State_dir+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Move_State11
L_Move_State9:
;Alg.c,65 :: 		}
	GOTO       L_Move_State1
L_Move_State0:
	MOVF       FARG_Move_State_motor+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Move_State2
	MOVF       FARG_Move_State_motor+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Move_State7
L_Move_State1:
;Alg.c,66 :: 		}
L_end_Move_State:
	RETURN
; end of _Move_State

_Motor_Stop:

;Alg.c,68 :: 		void Motor_Stop(Motor_SelectEnum motor)
;Alg.c,70 :: 		switch (motor)
	GOTO       L_Motor_Stop12
;Alg.c,72 :: 		case MOTOR_1:
L_Motor_Stop14:
;Alg.c,74 :: 		Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_1_CLOCKWISE,DIO_LOW);
	MOVLW      PORTD+0
	MOVWF      FARG_Dio_ChannelWrite_Port_reg+0
	CLRF       FARG_Dio_ChannelWrite_Channel+0
	CLRF       FARG_Dio_ChannelWrite_State+0
	CALL       _Dio_ChannelWrite+0
;Alg.c,75 :: 		Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_1_ANTICLOCKWISE,DIO_LOW);
	MOVLW      PORTD+0
	MOVWF      FARG_Dio_ChannelWrite_Port_reg+0
	MOVLW      1
	MOVWF      FARG_Dio_ChannelWrite_Channel+0
	CLRF       FARG_Dio_ChannelWrite_State+0
	CALL       _Dio_ChannelWrite+0
;Alg.c,76 :: 		break;
	GOTO       L_Motor_Stop13
;Alg.c,78 :: 		case MOTOR_2:
L_Motor_Stop15:
;Alg.c,80 :: 		Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_2_CLOCKWISE,DIO_LOW);
	MOVLW      PORTD+0
	MOVWF      FARG_Dio_ChannelWrite_Port_reg+0
	MOVLW      2
	MOVWF      FARG_Dio_ChannelWrite_Channel+0
	CLRF       FARG_Dio_ChannelWrite_State+0
	CALL       _Dio_ChannelWrite+0
;Alg.c,81 :: 		Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_2_ANTICLOCKWISE,DIO_LOW);
	MOVLW      PORTD+0
	MOVWF      FARG_Dio_ChannelWrite_Port_reg+0
	MOVLW      3
	MOVWF      FARG_Dio_ChannelWrite_Channel+0
	CLRF       FARG_Dio_ChannelWrite_State+0
	CALL       _Dio_ChannelWrite+0
;Alg.c,82 :: 		break;
	GOTO       L_Motor_Stop13
;Alg.c,84 :: 		}
L_Motor_Stop12:
	MOVF       FARG_Motor_Stop_motor+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Motor_Stop14
	MOVF       FARG_Motor_Stop_motor+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Motor_Stop15
L_Motor_Stop13:
;Alg.c,86 :: 		}
L_end_Motor_Stop:
	RETURN
; end of _Motor_Stop

_Motor_Loop:

;Alg.c,89 :: 		void Motor_Loop(uint8 count,uint16 *array)
;Alg.c,92 :: 		for (i=0;i<count;i++)
	CLRF       Motor_Loop_i_L0+0
L_Motor_Loop16:
	MOVF       FARG_Motor_Loop_count+0, 0
	SUBWF      Motor_Loop_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Motor_Loop17
;Alg.c,94 :: 		switch (array[i])
	MOVF       Motor_Loop_i_L0+0, 0
	ADDWF      FARG_Motor_Loop_array+0, 0
	MOVWF      FLOC__Motor_Loop+0
	GOTO       L_Motor_Loop19
;Alg.c,96 :: 		case UP:
L_Motor_Loop21:
;Alg.c,98 :: 		Move_State(MOTOR_RIGHT,CLOCKWISE);
	CLRF       FARG_Move_State_motor+0
	CLRF       FARG_Move_State_dir+0
	CALL       _Move_State+0
;Alg.c,99 :: 		Move_State(MOTOR_LEFT,CLOCKWISE);
	MOVLW      1
	MOVWF      FARG_Move_State_motor+0
	CLRF       FARG_Move_State_dir+0
	CALL       _Move_State+0
;Alg.c,100 :: 		Delay_ms(MOTOR_TIME_DOUBLE);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Motor_Loop22:
	DECFSZ     R13+0, 1
	GOTO       L_Motor_Loop22
	DECFSZ     R12+0, 1
	GOTO       L_Motor_Loop22
	DECFSZ     R11+0, 1
	GOTO       L_Motor_Loop22
	NOP
	NOP
;Alg.c,101 :: 		break;
	GOTO       L_Motor_Loop20
;Alg.c,103 :: 		case DOWN:
L_Motor_Loop23:
;Alg.c,105 :: 		Move_State(MOTOR_RIGHT,ANTICLOCKWISE);
	CLRF       FARG_Move_State_motor+0
	MOVLW      1
	MOVWF      FARG_Move_State_dir+0
	CALL       _Move_State+0
;Alg.c,106 :: 		Move_State(MOTOR_LEFT,ANTICLOCKWISE);
	MOVLW      1
	MOVWF      FARG_Move_State_motor+0
	MOVLW      1
	MOVWF      FARG_Move_State_dir+0
	CALL       _Move_State+0
;Alg.c,107 :: 		Delay_ms(MOTOR_TIME_DOUBLE);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Motor_Loop24:
	DECFSZ     R13+0, 1
	GOTO       L_Motor_Loop24
	DECFSZ     R12+0, 1
	GOTO       L_Motor_Loop24
	DECFSZ     R11+0, 1
	GOTO       L_Motor_Loop24
	NOP
	NOP
;Alg.c,108 :: 		break;
	GOTO       L_Motor_Loop20
;Alg.c,110 :: 		case RIGHT:
L_Motor_Loop25:
;Alg.c,112 :: 		Motor_Stop(MOTOR_RIGHT);
	CLRF       FARG_Motor_Stop_motor+0
	CALL       _Motor_Stop+0
;Alg.c,113 :: 		Move_State(MOTOR_LEFT,CLOCKWISE);
	MOVLW      1
	MOVWF      FARG_Move_State_motor+0
	CLRF       FARG_Move_State_dir+0
	CALL       _Move_State+0
;Alg.c,114 :: 		Delay_ms(MOTOR_TIME_SINGLE);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Motor_Loop26:
	DECFSZ     R13+0, 1
	GOTO       L_Motor_Loop26
	DECFSZ     R12+0, 1
	GOTO       L_Motor_Loop26
	DECFSZ     R11+0, 1
	GOTO       L_Motor_Loop26
	NOP
	NOP
;Alg.c,115 :: 		break;
	GOTO       L_Motor_Loop20
;Alg.c,117 :: 		case LEFT:
L_Motor_Loop27:
;Alg.c,119 :: 		Move_State(MOTOR_RIGHT,CLOCKWISE);
	CLRF       FARG_Move_State_motor+0
	CLRF       FARG_Move_State_dir+0
	CALL       _Move_State+0
;Alg.c,120 :: 		Motor_Stop(MOTOR_LEFT);
	MOVLW      1
	MOVWF      FARG_Motor_Stop_motor+0
	CALL       _Motor_Stop+0
;Alg.c,121 :: 		Delay_ms(MOTOR_TIME_SINGLE);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Motor_Loop28:
	DECFSZ     R13+0, 1
	GOTO       L_Motor_Loop28
	DECFSZ     R12+0, 1
	GOTO       L_Motor_Loop28
	DECFSZ     R11+0, 1
	GOTO       L_Motor_Loop28
	NOP
	NOP
;Alg.c,122 :: 		break;
	GOTO       L_Motor_Loop20
;Alg.c,124 :: 		}
L_Motor_Loop19:
	MOVF       FLOC__Motor_Loop+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Motor_Loop21
	MOVF       FLOC__Motor_Loop+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Motor_Loop23
	MOVF       FLOC__Motor_Loop+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Motor_Loop25
	MOVF       FLOC__Motor_Loop+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Motor_Loop27
L_Motor_Loop20:
;Alg.c,125 :: 		Motor_Stop(MOTOR_RIGHT);
	CLRF       FARG_Motor_Stop_motor+0
	CALL       _Motor_Stop+0
;Alg.c,126 :: 		Motor_Stop(MOTOR_LEFT);
	MOVLW      1
	MOVWF      FARG_Motor_Stop_motor+0
	CALL       _Motor_Stop+0
;Alg.c,92 :: 		for (i=0;i<count;i++)
	INCF       Motor_Loop_i_L0+0, 1
;Alg.c,128 :: 		}
	GOTO       L_Motor_Loop16
L_Motor_Loop17:
;Alg.c,130 :: 		}
L_end_Motor_Loop:
	RETURN
; end of _Motor_Loop
