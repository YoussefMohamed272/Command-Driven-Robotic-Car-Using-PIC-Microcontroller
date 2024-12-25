#include "Dio.h"
#include "Macros.h"
#include "Std_Types.h"

void Dio_ChannelDirectionSet(uint16 volatile  *Port_reg, DioPinEnum_t Channel, DioPinDirectionEnum_t Direction)
{

        switch(Direction)
        {
                case DIO_OUTPUT:
                CLEAR_BIT(*Port_reg,Channel);
                break;
                case DIO_INPUT:
                SET_BIT(*Port_reg,Channel);
                break;
                default:
                break;
        }
}

DioPinStateEnum_t Dio_ChannelRead(uint16 volatile  *Port_reg, DioPinEnum_t Channel)
{
        DioPinStateEnum_t u8LocalPinValue = READ_BIT(*Port_reg,Channel);
        return (u8LocalPinValue);
}

void Dio_ChannelWrite(uint16 volatile  *Port_reg, DioPinEnum_t Channel, DioPinStateEnum_t State)
{
        switch(State)
        {
                case DIO_LOW:
                CLEAR_BIT(*Port_reg,Channel);
                break;
                case DIO_HIGH:
                SET_BIT(*Port_reg,Channel);
                break;
                default:
                break;
        }
}
void Dio_ChannelToggle(uint16 volatile  *Port_reg, DioPinEnum_t Channel)
{
        TOGGLE_BIT(*Port_reg,Channel);
}

void Dio_PortWrite(uint16 volatile * Port_reg, uint8 Value)
{
        *Port_reg = Value;
}

uint8 Dio_PortRead(uint16 volatile  *Port_reg)
{
        uint8 u8LocalPortValue = *Port_reg;
        return u8LocalPortValue;
}