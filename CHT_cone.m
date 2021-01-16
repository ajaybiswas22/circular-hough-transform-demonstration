function CHT_cone(r_cone,h_cylinder,plane_offset)

% Implementation of Circular Hough Transformation Cone
% The program demonstrates the selection of circle of radius R
% based on cross-sectional cut of a cone
%
% Author: Ajay Biswas
% M.Tech Information Security, NIT Rourkela


H = plane_offset; %plane offset

r = 0:r_cone; % Define Radius of Cone
h = h_cylinder; % Define Height of Cylinder
[X,Y,Z] = cylinder(r);
Z = Z*h;

[x,y] = meshgrid(-r_cone-1:r_cone+1); % Generate x and y data
z = zeros(size(x, 1)); % Generate z data

%moving plane up and down
z = z+H;

hold on
view(3);
cone = surf(X,Y,Z);
set(cone,'FaceColor',[1 0 0], ...
      'FaceAlpha',0.5,'FaceLighting','gouraud','EdgeColor','none');
  
plane = surf(x, y, z);
set(plane,'FaceColor',[0 0 1], ...
      'FaceAlpha',0.5,'FaceLighting','gouraud','EdgeColor','none');
  
%placing text on plot
text(10,H,['R: ' num2str(H)]);

xlabel('x');
ylabel('y');
zlabel('H');
title('Circular Hough Transformation Cone');

%save figure
%saveas(figure(1),'output.bmp');
  
