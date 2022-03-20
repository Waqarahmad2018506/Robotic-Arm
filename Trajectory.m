function [a]= Trajectory(theta0,theta1,t)
syms a2 a3 x
% x represent theta
theta= theta0+a2*x^2 + a3*x^3;
theta_dot= diff(theta);

%a1=0
%a0=theta0
E = theta1==subs(theta,x,t);
E1 = 0==subs(theta_dot,x,t);
a=solve(E,E1);