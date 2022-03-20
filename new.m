clc,clear
syms t1 t2  t3 a1 a2  l1 l2 l3  d1   
%are the respective angle of robotic arm (t,alpha, a ,d)

T0_1 = robotic(t1,       0     ,-2.5   ,10)
T1_2 = robotic(  t2  , a2  ,0     ,0)
T2_3 = robotic(    t3-pi/2  ,0     ,10    ,0)
T3_4 = robotic(   0   ,0     ,11 ,0)

%Oriantation of end effector from base
T0_4= T0_1*T1_2*T2_3*T3_4

% same basic operation to visualize or sample the equations

T0_4= subs(T0_4,cos(a2),0);
T0_4= subs(T0_4,sin(a2),1);
T0_4= subs(T0_4,sin(t2 + pi/2),cos(t2));
T0_4= subs(T0_4,cos(t2 + pi/2),-sin(t2));
p = T0_4(1:3,4)
% position of end effector from base
% Px= T0_4(1,4)
% Py= T0_4(2,4)
% Pz= T0_4(3,4)
p = T0_4(1:3,4)'

subs(p,[t1 t2 t3],[0.1*pi pi/2 0.5*pi])
%intial thetas is zeros

% clc
% clear all
% 
% tem1=0
% tem2=0
% tem3=0
% 
% syms time t
% while(1)
% theta0_1= tem1
% theta0_2= tem2
% theta0_3= tem3
% 
% theta1_1= input("enter theta 1   ")
% theta1_2= input("enter theta 2   ")
% theta1_3= input("enter theta 3   ")
% t1  = input("time     ")
% 
% tem1=theta1_1
% tem2=theta1_3
% tem3=theta1_2
% 
% 
% a=Trajectory(theta0_1,theta1_1,t1)
% theta=theta0_1+vpa(a.a2)*t^2 +vpa(a.a3)*t^3
% a=Trajectory(theta0_2,theta1_2,t1)
% theta2=theta0_1+vpa(a.a2)*t^2 +vpa(a.a3)*t^3
% a=Trajectory(theta0_3,theta1_3,t1)
% theta3=theta0_1+vpa(a.a2)*t^2 +vpa(a.a3)*t^3
% 
%  a = arduino('COM4', 'Uno', 'Libraries', 'Servo');
%  s = servo(a, 'D4')
%  g = servo(a, 'D5')
%  e = servo(a, 'D6')
%  
%  for ti = 0:0.1:t1
%      angle = double((subs(theta,t,ti))/180)
%      writePosition(s, angle);
%      angle2 = double((subs(theta2,t,ti))/180)
%      writePosition(g, angle2);
%      
%      angle3 = double((subs(theta3,t,ti))/180)
%      writePosition(e, angle3);
%      
%      current_pos = readPosition(s);
%      current_pos = current_pos*180;
%      fprintf('Current motor position is %d degrees\n', current_pos);
%      pause(0.2)
%  end
%  
% end
