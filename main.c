#include "Dio.h"
#include "Sw.h"
#include "Alg.h"

void main() {
uint16 u8local_array[10];
uint8 u8Count_Value = 0;
Alg_Init();


while(1)
{     while (Sw_StateGet(SW_INP_REG,OK) == SW_RELEASED)
      {
              if(Sw_StateGet(SW_INP_REG,UP) == SW_PRESSED)
              {
              u8local_array[u8Count_Value] = UP;
              u8Count_Value++;
              Delay_ms(20);
              }
              else if (Sw_StateGet(SW_INP_REG,DOWN) == SW_PRESSED)
              {
              u8local_array[u8Count_Value] = DOWN;
              u8Count_Value++;
              Delay_ms(20);
              }
              else if (Sw_StateGet(SW_INP_REG,LEFT) == SW_PRESSED)
              {
              u8local_array[u8Count_Value] = LEFT;
              u8Count_Value++;
              Delay_ms(20);
              }
              else if (Sw_StateGet(SW_INP_REG,RIGHT) == SW_PRESSED)
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