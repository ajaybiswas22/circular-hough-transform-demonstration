function [xp,yp] = circle(r,x,y,color)

% r is the radius of the circle
% x and y are the coordinates of the center of the circle
% 0.01 is the step function
%
% Author: Ajay Biswas
% M.Tech Information Security, NIT Rourkela

ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);

if nargin == 4
    plot(x+xp,y+yp,color);
elseif nargin == 3
    plot(x+xp,y+yp);
end