#include "pid.h"

void PID_Init(PID_Controller *pid, float kp, float ki, float kd)
{
    pid->Kp = kp;
    pid->Ki = ki;
    pid->Kd = kd;
    pid->prev_error = 0.0f;
    pid->integral = 0.0f;
}

float PID_Compute(PID_Controller *pid, float setpoint, float measured)
{
    float error = setpoint - measured;
    pid->integral += error;
    float derivative = error - pid->prev_error;

    pid->prev_error = error;

    return pid->Kp * error +
           pid->Ki * pid->integral +
           pid->Kd * derivative;
}
