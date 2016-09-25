void forward(int pwm)
{
  analogWrite(right_pwm,pwm);
  digitalWrite(right_dir1,1);
  digitalWrite(right_dir2,0);
  analogWrite(left_pwm,pwm);
  digitalWrite(left_dir1,1);
  digitalWrite(left_dir2,0);
}

void reverse(int pwm)
{
  analogWrite(right_pwm,pwm);
  digitalWrite(right_dir1,0);
  digitalWrite(right_dir2,1);
  analogWrite(left_pwm,pwm);
  digitalWrite(left_dir1,0);
  digitalWrite(left_dir2,1);
}

void stopper(int pwm)
{
  analogWrite(right_pwm,0);
  digitalWrite(right_dir1,1);
  digitalWrite(right_dir2,1);
  analogWrite(left_pwm,0);
  digitalWrite(left_dir1,1);
  digitalWrite(left_dir2,1);
}

