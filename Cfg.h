#ifndef CFG_H_
#define CFG_H_


#define SW_DIR_REG                 (TRISB)
#define SW_INP_REG                 (PORTB)

#define MOTOR_RIGHT                (MOTOR_1)
#define MOTOR_LEFT                 (MOTOR_2)

/*Defines Motor pins*/
#define MOTOR_DIR_REG               (TRISD)
#define MOTOR_OUTPUT_REG            (PORTD)
#define MOTOR_1_CLOCKWISE           (DIO_PIN0)
#define MOTOR_1_ANTICLOCKWISE       (DIO_PIN1)
#define MOTOR_2_CLOCKWISE           (DIO_PIN2)
#define MOTOR_2_ANTICLOCKWISE       (DIO_PIN3)

/* Motor time off delay*/

#define MOTOR_TIME_SINGLE           (1000)
#define MOTOR_TIME_DOUBLE           (1000)

/* Define enum switches pins*/

typedef enum
{
        UP            = DIO_PIN0,
        DOWN          = DIO_PIN1,
        RIGHT         = DIO_PIN2,
        LEFT          = DIO_PIN3,
        OK            = DIO_PIN7
}SwEnumt_t;



#endif /* CFG_H_ */