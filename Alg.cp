#line 1 "C:/Users/user/OneDrive/Desktop/mouse/mouse pic/Alg.c"
#line 1 "c:/users/user/onedrive/desktop/mouse/mouse pic/alg.h"
#line 1 "c:/users/user/onedrive/desktop/mouse/mouse pic/dio.h"
#line 1 "c:/users/user/onedrive/desktop/mouse/mouse pic/std_types.h"








typedef unsigned char uint8;
typedef signed char sint8;
typedef unsigned short uint16;
typedef signed short sint16;
typedef unsigned long uint32;
typedef signed long sint32;
typedef unsigned long long uint64;
typedef signed long long sint64;



typedef float float32;
typedef double float64;
typedef long double float80;
#line 9 "c:/users/user/onedrive/desktop/mouse/mouse pic/dio.h"
typedef enum
{
 DIO_PIN0,
 DIO_PIN1,
 DIO_PIN2,
 DIO_PIN3,
 DIO_PIN4,
 DIO_PIN5,
 DIO_PIN6,
 DIO_PIN7
}DioPinEnum_t;
#line 24 "c:/users/user/onedrive/desktop/mouse/mouse pic/dio.h"
 typedef enum
 {
 DIO_LOW,
 DIO_HIGH
 }DioPinStateEnum_t;
#line 33 "c:/users/user/onedrive/desktop/mouse/mouse pic/dio.h"
typedef enum
{
 DIO_OUTPUT,
 DIO_INPUT
}DioPinDirectionEnum_t;

void Dio_ChannelDirectionSet(uint16 volatile *Port_reg, DioPinEnum_t Channel, DioPinDirectionEnum_t Direction);
DioPinStateEnum_t Dio_ChannelRead(uint16 volatile *Port_reg, DioPinEnum_t Channel);
void Dio_ChannelWrite(uint16 volatile *Port_reg, DioPinEnum_t Channel, DioPinStateEnum_t State);
void Dio_ChannelToggle(uint16 volatile *Port_reg, DioPinEnum_t Channel);
void Dio_PortWrite(uint16 volatile *Port_reg, uint8 Value);
uint8 Dio_PortRead(uint16 volatile *Port_reg);
#line 7 "c:/users/user/onedrive/desktop/mouse/mouse pic/alg.h"
typedef enum
{
MOTOR_1 ,
MOTOR_2
}Motor_SelectEnum;

typedef enum
{
CLOCKWISE,
ANTICLOCKWISE
}Motor_DirectionEnum;

void Alg_init(void);
void Move_State(Motor_SelectEnum motor,Motor_DirectionEnum dir);
void Motor_Stop(Motor_SelectEnum motor);
void Motor_Loop(uint8 count,uint8 *array);
#line 1 "c:/users/user/onedrive/desktop/mouse/mouse pic/sw.h"
#line 1 "c:/users/user/onedrive/desktop/mouse/mouse pic/dio.h"
#line 1 "c:/users/user/onedrive/desktop/mouse/mouse pic/cfg.h"
#line 26 "c:/users/user/onedrive/desktop/mouse/mouse pic/cfg.h"
typedef enum
{
 UP = DIO_PIN0,
 DOWN = DIO_PIN1,
 RIGHT = DIO_PIN2,
 LEFT = DIO_PIN3,
 OK = DIO_PIN7
}SwEnumt_t;
#line 8 "c:/users/user/onedrive/desktop/mouse/mouse pic/sw.h"
typedef enum
{
 SW_RELEASED,
 SW_PRESSED
}Sw_StateEnum_t;

void Sw_init(volatile uint16 Sw_Reg, SwEnumt_t Sw_num);
Sw_StateEnum_t Sw_StateGet(volatile uint16 Sw_Reg, SwEnumt_t Sw_num);
#line 1 "c:/users/user/onedrive/desktop/mouse/mouse pic/dio.h"
#line 1 "c:/users/user/onedrive/desktop/mouse/mouse pic/std_types.h"
#line 1 "c:/users/user/onedrive/desktop/mouse/mouse pic/cfg.h"
#line 6 "C:/Users/user/OneDrive/Desktop/mouse/mouse pic/Alg.c"
void Alg_init(void)
{

 (PORTB)  = 0x00;
 (PORTD)  = 0x00;


Sw_init( (TRISB) ,UP);
Sw_init( (TRISB) ,DOWN);
Sw_init( (TRISB) ,RIGHT);
Sw_init( (TRISB) ,LEFT);
Sw_init( (TRISB) ,OK);
Dio_ChannelDirectionSet(& (TRISD) , (DIO_PIN0) ,DIO_OUTPUT);
Dio_ChannelDirectionSet(& (TRISD) , (DIO_PIN1) ,DIO_OUTPUT);
Dio_ChannelDirectionSet(& (TRISD) , (DIO_PIN2) ,DIO_OUTPUT);
Dio_ChannelDirectionSet(& (TRISD) , (DIO_PIN3) ,DIO_OUTPUT);
}


void Move_State(Motor_SelectEnum motor,Motor_DirectionEnum dir)
{
switch(motor)
{
 case MOTOR_1:
 {
 switch(dir)
 {
 case CLOCKWISE:
 {
 Dio_ChannelWrite(& (PORTD) , (DIO_PIN0) ,DIO_HIGH);
 Dio_ChannelWrite(& (PORTD) , (DIO_PIN1) ,DIO_LOW);
 break;
 }
 case ANTICLOCKWISE:
 {
 Dio_ChannelWrite(& (PORTD) , (DIO_PIN0) ,DIO_LOW);
 Dio_ChannelWrite(& (PORTD) , (DIO_PIN1) ,DIO_HIGH);
 break;
 }
 }
 }
 case MOTOR_2:
 {
 switch(dir)
 {
 case CLOCKWISE:
 {
 Dio_ChannelWrite(& (PORTD) , (DIO_PIN2) ,DIO_HIGH);
 Dio_ChannelWrite(& (PORTD) , (DIO_PIN3) ,DIO_LOW);
 break;
 }
 case ANTICLOCKWISE:
 {
 Dio_ChannelWrite(& (PORTD) , (DIO_PIN2) ,DIO_LOW);
 Dio_ChannelWrite(& (PORTD) , (DIO_PIN3) ,DIO_HIGH);
 break;
 }
 }
 }
}
}

void Motor_Stop(Motor_SelectEnum motor)
{
 switch (motor)
 {
 case MOTOR_1:
 {
 Dio_ChannelWrite(& (PORTD) , (DIO_PIN0) ,DIO_LOW);
 Dio_ChannelWrite(& (PORTD) , (DIO_PIN1) ,DIO_LOW);
 break;
 }
 case MOTOR_2:
 {
 Dio_ChannelWrite(& (PORTD) , (DIO_PIN2) ,DIO_LOW);
 Dio_ChannelWrite(& (PORTD) , (DIO_PIN3) ,DIO_LOW);
 break;
 }
 }

}


void Motor_Loop(uint8 count,uint16 *array)
{
uint8 i;
for (i=0;i<count;i++)
 {
 switch (array[i])
 {
 case UP:
 {
 Move_State( (MOTOR_1) ,CLOCKWISE);
 Move_State( (MOTOR_2) ,CLOCKWISE);
 Delay_ms( (1000) );
 break;
 }
 case DOWN:
 {
 Move_State( (MOTOR_1) ,ANTICLOCKWISE);
 Move_State( (MOTOR_2) ,ANTICLOCKWISE);
 Delay_ms( (1000) );
 break;
 }
 case RIGHT:
 {
 Motor_Stop( (MOTOR_1) );
 Move_State( (MOTOR_2) ,CLOCKWISE);
 Delay_ms( (1000) );
 break;
 }
 case LEFT:
 {
 Move_State( (MOTOR_1) ,CLOCKWISE);
 Motor_Stop( (MOTOR_2) );
 Delay_ms( (1000) );
 break;
 }
 }
 Motor_Stop( (MOTOR_1) );
 Motor_Stop( (MOTOR_2) );

 }

}
