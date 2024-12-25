#line 1 "C:/Users/user/OneDrive/Desktop/mouse/mouse pic/Dio.c"
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
#line 1 "c:/users/user/onedrive/desktop/mouse/mouse pic/macros.h"
#line 1 "c:/users/user/onedrive/desktop/mouse/mouse pic/std_types.h"
#line 5 "C:/Users/user/OneDrive/Desktop/mouse/mouse pic/Dio.c"
void Dio_ChannelDirectionSet(uint16 volatile *Port_reg, DioPinEnum_t Channel, DioPinDirectionEnum_t Direction)
{

 switch(Direction)
 {
 case DIO_OUTPUT:
  ((*Port_reg)&=~(1U<<(Channel))) ;
 break;
 case DIO_INPUT:
  ((*Port_reg)|=(1U<<(Channel))) ;
 break;
 default:
 break;
 }
}

DioPinStateEnum_t Dio_ChannelRead(uint16 volatile *Port_reg, DioPinEnum_t Channel)
{
 DioPinStateEnum_t u8LocalPinValue =  (((*Port_reg) & (1U<<Channel)) >>(Channel)) ;
 return (u8LocalPinValue);
}

void Dio_ChannelWrite(uint16 volatile *Port_reg, DioPinEnum_t Channel, DioPinStateEnum_t State)
{
 switch(State)
 {
 case DIO_LOW:
  ((*Port_reg)&=~(1U<<(Channel))) ;
 break;
 case DIO_HIGH:
  ((*Port_reg)|=(1U<<(Channel))) ;
 break;
 default:
 break;
 }
}
void Dio_ChannelToggle(uint16 volatile *Port_reg, DioPinEnum_t Channel)
{
  ((*Port_reg)^=(1U<<(Channel))) ;
}

void Dio_PortWrite(uint16 volatile * Port_reg, uint8 Value)
{
 *Port_reg = Value;
}

uint8 Dio_PortRead(uint16 volatile *Port_reg)
{
 uint8 u8LocalPortValue = *Port_reg;
 return u8LocalPortValue;
}
