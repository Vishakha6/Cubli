
int last_error = 0;
int integrated_error = 0;
int P = 0, I = 0, D = 0, thresh = 20, error =0,Integral = 0, correction=0;

void PID(int targetPosition, int currentPosition)  
{
  error = targetPosition - currentPosition;
  if (abs(error)< thresh)
  {
    Integral += error; 
  }
  else 
  {
    Integral = 0;
  }

  P = Kp * error;
  I = Ki * Integral;
  D = Kd * (error - last_error);                            
  last_error = error;
  correction = P + I + D;
 
//  Serial.println(correction);
//  Serial.println("error");
//  Serial.println(error);
  
  motor_pwm = constrain(correction, -255, 255);
}

