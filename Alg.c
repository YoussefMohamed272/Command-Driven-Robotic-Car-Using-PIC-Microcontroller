#include "Alg.h"
#include "Sw.h"
#include "Dio.h"
#include "Std_Types.h"
#include "Cfg.h"
void Alg_init(void)
{
/* clear output and input registers*/
SW_INP_REG = 0x00;
MOTOR_OUTPUT_REG = 0x00;

/*set the output and input direction pins*/
Sw_init(SW_DIR_REG,UP);
Sw_init(SW_DIR_REG,DOWN);
Sw_init(SW_DIR_REG,RIGHT);
Sw_init(SW_DIR_REG,LEFT);
Sw_init(SW_DIR_REG,OK);
Dio_ChannelDirectionSet(&MOTOR_DIR_REG,MOTOR_1_CLOCKWISE,DIO_OUTPUT);
Dio_ChannelDirectionSet(&MOTOR_DIR_REG,MOTOR_1_ANTICLOCKWISE,DIO_OUTPUT);
Dio_ChannelDirectionSet(&MOTOR_DIR_REG,MOTOR_2_CLOCKWISE,DIO_OUTPUT);
Dio_ChannelDirectionSet(&MOTOR_DIR_REG,MOTOR_2_ANTICLOCKWISE,DIO_OUTPUT);
}

/* Control the ON state of motor and its direction*/
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
                        Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_1_CLOCKWISE,DIO_HIGH);
                        Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_1_ANTICLOCKWISE,DIO_LOW);
                        break;
                        }
                   case ANTICLOCKWISE:
                        {
                        Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_1_CLOCKWISE,DIO_LOW);
                        Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_1_ANTICLOCKWISE,DIO_HIGH);
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
                        Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_2_CLOCKWISE,DIO_HIGH);
                        Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_2_ANTICLOCKWISE,DIO_LOW);
                        break;
                        }
                   case ANTICLOCKWISE:
                        {
                        Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_2_CLOCKWISE,DIO_LOW);
                        Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_2_ANTICLOCKWISE,DIO_HIGH);
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
                    Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_1_CLOCKWISE,DIO_LOW);
                    Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_1_ANTICLOCKWISE,DIO_LOW);
                    break;
                   }
             case MOTOR_2:
                   {
                    Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_2_CLOCKWISE,DIO_LOW);
                    Dio_ChannelWrite(&MOTOR_OUTPUT_REG,MOTOR_2_ANTICLOCKWISE,DIO_LOW);
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
                             Move_State(MOTOR_RIGHT,CLOCKWISE);
                             Move_State(MOTOR_LEFT,CLOCKWISE);
                             Delay_ms(MOTOR_TIME_DOUBLE);
                             break;
                            }
                       case DOWN:
                            {
                             Move_State(MOTOR_RIGHT,ANTICLOCKWISE);
                             Move_State(MOTOR_LEFT,ANTICLOCKWISE);
                             Delay_ms(MOTOR_TIME_DOUBLE);
                             break;
                            }
                       case RIGHT:
                            {
                             Motor_Stop(MOTOR_RIGHT);
                             Move_State(MOTOR_LEFT,CLOCKWISE);
                             Delay_ms(MOTOR_TIME_SINGLE);
                             break;
                            }
                       case LEFT:
                            {
                             Move_State(MOTOR_RIGHT,CLOCKWISE);
                             Motor_Stop(MOTOR_LEFT);
                             Delay_ms(MOTOR_TIME_SINGLE);
                             break;
                            }
                   }
                   Motor_Stop(MOTOR_RIGHT);
                   Motor_Stop(MOTOR_LEFT);

  }

}