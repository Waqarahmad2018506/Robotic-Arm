syms t1 t2  t3 t4 t5
% t are the respective angle of robotic arm 
T0_1 = robotic(t1,pi/2,0 , 7);
T1_2 = robotic(t2,0   ,10.5 , 0);
T2_3 = robotic(t3,0   ,8.5 , 0);
T3_4 = robotic(t4,0   ,3.5 , 2);
T4_5 = robotic(t5,pi/2,0 , 0);

T0_5= T0_1*T1_2*T2_3*T3_4*T4_5    

P = T0_5(:,4)   % position with respect to base 
