#line 1 "C:/Users/user/OneDrive/Desktop/mouse/mouse pic/main.c"
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
#line 1 "c:/users/user/onedrive/desktop/mouse/mouse pic/alg.h"
#line 1 "c:/users/user/onedrive/desktop/mouse/mouse pic/dio.h"
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
#line 5 "C:/Users/user/OneDrive/Desktop/mouse/mouse pic/main.c"
void main() {
uint16 u8local_array[10];
uint8 u8Count_Value = 0;
Alg_Init();


while(1)
{ while (Sw_StateGet( (PORTB) ,OK) == SW_RELEASED)
 {
 if(Sw_StateGet( (PORTB) ,UP) == SW_PRESSED)
 {
 u8local_array[u8Count_Value] = UP;
 u8Count_Value++;
 Delay_ms(20);
 }
 else if (Sw_StateGet( (PORTB) ,DOWN) == SW_PRESSED)
 {
 u8local_array[u8Count_Value] = DOWN;
 u8Count_Value++;
 Delay_ms(20);
 }
 else if (Sw_StateGet( (PORTB) ,LEFT) == SW_PRESSED)
 {
 u8local_array[u8Count_Value] = LEFT;
 u8Count_Value++;
 Delay_ms(20);
 }
 else if (Sw_StateGet( (PORTB) ,RIGHT) == SW_PRESSED)
 {
 u8local_array[u8Count_Value] = RIGHT;
 u8Count_Value++;
 Delay_ms(20);
 }
 }
 Motor_Loop(u8Count_Value,u8local_array);

 u8Count_Value = 0;


}



}
