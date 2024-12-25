#ifndef ALG_H_
#define ALG_H_
#include "Dio.h"



typedef enum
{
MOTOR_1   ,
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




#endif /* ALG_H_ */