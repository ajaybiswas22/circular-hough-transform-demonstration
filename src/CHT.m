function ret = CHT(r,R_Start,R_End,R_Step,tolerance)

% Program to demonstrate Circle Hough Transform
%
% r: circle with unknown radius (we need r to demonstrate :)
% 
% The program will be sweeping from R_Start to R_End, until the radius of
% the red circle is not found, R_Step is step size of the sweep 
%
% tolerance is the amount of circles to be used to find the radius
% low tolerance implies high precision. For Example, 1.
% 
% Author: Ajay Biswas
% M.Tech Information Security, NIT Rourkela

r1 = r;
ret = 0;

for r2 = R_Start:R_Step:R_End

    [xp,yp] = circle(r1);

    k = 1;
    for i=1:tolerance:size(xp,2)
         circles_tab_x(k) = xp(i);
         circles_tab_y(k) = yp(i);
         k = k + 1;
    end

    int_points_x = [];
    int_points_y = [];

    for i = 1:length(circles_tab_x)
        for j = 1:length(circles_tab_x)
            if(i == j)
               continue; 
            end

            %intersection of two circles, can be more than one.
            [xout,yout] = circcirc(circles_tab_x(i),circles_tab_y(i),r2,circles_tab_x(j),circles_tab_y(j),r2);

            %int_points x stores all matched x coord
            int_points_x = [int_points_x xout];
            %int_points y stores all matched y coord
            int_points_y = [int_points_y yout];
        end
    end

    %finding the most occuring point
    tfx = mode(int_points_x);
    tfy = mode(int_points_y);

    %F is frequency of occurance
    F = 0;
    for i = 1:length(int_points_x)
       if(int_points_x(i) == tfx && int_points_y(i) == tfy)
          F = F + 1; 
       end
    end

    % no. of intersections at center will be greater than 3 if radius is found
    if(F >= 3)    
        % plot figures 
        hold on
        figure(1);

        circle(r1,0,0,'Red');

        for i=1:tolerance:size(xp,2)
            circle(r2,xp(i),yp(i));
        end

        xlabel('x');
        ylabel('y');
        title(['Circular Hough Transform for R = ' num2str(r2)]);

        %save figure
        saveas(figure(1),'../output/cht_output.bmp');

        ret = r2;
        return
    end
end