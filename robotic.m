function [a]=robotic(t,a,l,d)
% t is thta, a is alpa , l lenght , d is same as of book  
a= [cos(t)           -sin(t)         0          l   ;
    sin(t)*cos(a)  cos(t)*cos(a)  -sin(a)  -d*sin(a);
    sin(t)*sin(a)  cos(t)*sin(a)  cos(a)    d*cos(a);
    0                 0               0         1] ;