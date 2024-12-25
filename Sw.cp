#line 1 "C:/Users/user/OneDrive/Desktop/mouse/mouse pic/Sw.c"
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
#line 5 "C:/Users/user/OneDrive/Desktop/mouse/mouse pic/Sw.c"
 DioPinStateEnum_t Sw_PrevState = SW_RELEASED;
void Sw_init(volatile uint16 Sw_Reg, SwEnumt_t Sw_num)
{
 Dio_ChannelDirectionSet (&Sw_Reg, Sw_num, DIO_INPUT);
}
Sw_StateEnum_t Sw_StateGet(volatile uint16 Sw_Reg, SwEnumt_t Sw_num)
{
 Sw_StateEnum_t LocalSwState = SW_RELEASED;

 if(Sw_PrevState != Dio_ChannelRead(&Sw_Reg, Sw_num))
 {
 Delay_ms( (50U) );

 Sw_PrevState = Dio_ChannelRead(&Sw_Reg, Sw_num);
 if (Sw_PrevState == DIO_HIGH)
 {
 LocalSwState = SW_PRESSED;
 }
 else
 {
 LocalSwState = SW_RELEASED;
 }
 Delay_ms( (50U) );
 }
 return LocalSwState;
}
