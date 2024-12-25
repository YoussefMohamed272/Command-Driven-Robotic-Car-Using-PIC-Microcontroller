#include "Dio.h"
#include "Sw.h"

#define DEBOUNCE_PERIOD (50U)
 DioPinStateEnum_t Sw_PrevState = SW_RELEASED;
void Sw_init(volatile uint16 Sw_Reg, SwEnumt_t Sw_num)
{
        Dio_ChannelDirectionSet   (&Sw_Reg, Sw_num, DIO_INPUT);
}
Sw_StateEnum_t Sw_StateGet(volatile uint16 Sw_Reg, SwEnumt_t Sw_num)
{
       Sw_StateEnum_t LocalSwState = SW_RELEASED;

        if(Sw_PrevState != Dio_ChannelRead(&Sw_Reg, Sw_num))
        {
                Delay_ms(DEBOUNCE_PERIOD);

                Sw_PrevState = Dio_ChannelRead(&Sw_Reg, Sw_num);
                if (Sw_PrevState == DIO_HIGH)
                {
                        LocalSwState = SW_PRESSED;
                }
                else
                {
                        LocalSwState = SW_RELEASED;
                }
                Delay_ms(DEBOUNCE_PERIOD);
        }
        return LocalSwState;
}