clc,clear all 
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
%T0_4= subs(T0_4,sin(t2 - pi/2),cos(t2));
%T0_4= subs(T0_4,cos(t2 - pi/2),sin(t2));

tem1=0.1;
tem2=0.1;
tem3=0;
% loof will start
 a = arduino('COM4', 'Uno', 'Libraries', 'Servo');
 s = servo(a, 'D3')
 g = servo(a, 'D5')
 e = servo(a, 'D6')

while(1)
theta0_1= tem1
theta0_2= tem2
theta0_3= tem3

x= input("enter  x   ");
y= input("enter y   ");
z= input("enter  z   ");
t1  = input("time     ");

px= T0_4(1,4)==x
py= T0_4(2,4)==y
pz= T0_4(3,4)==z
ang=solve(px,py,pz)

theta11=double(ang.t1)
theta12=double(ang.t2)
theta13=double(ang.t3)

% % tem=10;
% % for i= 1:1:1:1:length(theta11) 
% %    if( theta11(i,1) >= 0 & abs(theta11(i,1)-theta0_1)<tem)
% %       theta1=  theta11(i,1);
% %       tem= abs(theta11(i,1)-theta0_1)
% %    end
% % end
% % 
% % tem=10;
% % for i= 1:1:1:1:length(theta12) 
% %    if( theta12(i,1) >= 0 & abs(theta12(i,1)-theta0_2)<tem)
% %       theta2=  theta12(i,1);
% %       tem= abs(theta12(i,1)-theta0_2)
% %    end
% % end
% % tem=10;
% % for i= 1:1:length(theta13) 
% %    if( theta13(i,1) >= 0 & abs(theta13(i,1)-theta0_3)<tem)
% %       theta3=  theta13(i,1);
% %       tem= abs(theta13(i,1)-theta0_3)
% %    end
% % end
% 
% tem1=abs(theta11(1,1));
% tem2=abs(theta12(1,1));
% tem3=abs(theta13(1,1));
% 
% theta1_1= abs(theta11(1,1));
% theta1_2= abs(theta12(1,1));
% theta1_3= abs(theta13(1,1));
% 
% syms time t
% 
% a=Trajectory(theta0_1,theta1_1,t1)
% theta=theta0_1+vpa(a.a2)*t^2 +vpa(a.a3)*t^3
% a=Trajectory(theta0_2,theta1_2,t1)
% theta2=theta0_2+vpa(a.a2)*t^2 +vpa(a.a3)*t^3
% a=Trajectory(theta0_3,theta1_3,t1)
% theta3=theta0_3+vpa(a.a2)*t^2 +vpa(a.a3)*t^3
% 
%  for ti = 0:0.1:t1
%      angle = double((subs(theta,t,ti))/pi);
%      writePosition(s, angle);
%      angle2 = double((subs(theta2,t,ti))/pi);
%      writePosition(g, angle2);
%      
%      angle3 = double((subs(theta3,t,ti))/pi);
%      writePosition(e, angle3);
%    
% %   fprintf('Current motor position is %d degrees\n', current_pos);
%      pause(0.1)
%  end
% end