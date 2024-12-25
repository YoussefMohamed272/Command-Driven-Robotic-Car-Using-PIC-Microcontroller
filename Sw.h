#ifndef SW_H_
#define SW_H_

#include "Dio.h"
#include "Cfg.h"


typedef enum
{
        SW_RELEASED,
        SW_PRESSED
}Sw_StateEnum_t;

void Sw_init(volatile uint16 Sw_Reg, SwEnumt_t Sw_num);
Sw_StateEnum_t Sw_StateGet(volatile uint16 Sw_Reg, SwEnumt_t Sw_num);


#endif /* SW_H_ */