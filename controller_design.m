clc;
%x1 = theta_b
%x2 = theta_b_dot
%x3 = theta_w
%x4 = theta_w_dot
l = 0.085; 
lb = 0.075; 
mb = 0.419;
mw = 0.204;
Ib = 3.34*(10^-3);
Iw = 0.57*(10^-3);
Cb = 1.02*(10^-3);
Cw = 0.05*(10^-3);
g = 9.81;
Km = 0.0251;
A = [0 1 0; ((mb*lb + mw*l)*g)/(Ib +(mw*(l^2))) -Cb/(Ib + mw*(l^2)) Cw/(Ib + mw*(l^2)); -((mb*lb + mw*l)*g)/(Ib +(mw*(l^2))) -Cb/(Ib+(mw*(l^2))) -Cw*(Ib+Iw+(mw*(l^2)))/(Iw*(Ib + (mw*(l^2))))];
B = [0; -Km/(Ib+(mw*(l^2)));  Km*(Ib+Iw+(mw*(l^2)))/(Iw*(Ib + (mw*(l^2))))];
C = [1 0 0; 0 1 0; 0 0 1];
D = [0; 0; 0];
Y = [B A*B (A^2)*B];
X = [C C*A C*(A^2)];

%Design of LQR
Q = diag([10^-2 10^-2 10^-8]);
R = 0.001;
[K,S,e] = lqr(A,B,Q,R);

%Design of Luenberger Observer
%p1 = [-1; -2; -3];
%L = transpose(place(A',C',p1)); 
%Z = eye(3) ;
%E = eye(3);
%a = A';
%b = C';
%F = Z*E*Z';
%r = 0.01*eye(3);
%[x,l,g] = care(a,b,F,r);
%L = x*C'*(inv(r));
K1 = K



