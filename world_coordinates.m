function [x,y] = world_coordinates(X,Y,Z)
x0 = 45; y0 = 50; z0 = 55;
r1 = 0.02; r2 = 0.02; r3 = 0.02;

% 參數設定
alpha = 135/180.0*pi;
theta = 135/180.0*pi;
lamda = 1;

% 帶入公式
x = lamda *((X - x0)*cos(theta) + (Y - y0)*sin(theta) - r1)/(-(X -x0)*sin(theta)*sin(alpha) + (Y - y0)*cos(theta)*sin(alpha) - (Z - z0)*cos(alpha) + r3 + lamda);
y = lamda *(-(X - x0)*sin(theta)*cos(alpha) + (Y - y0)*cos(theta)*cos(alpha)+ (Z - z0)*sin(alpha) -r2)/(-(X - x0)*sin(theta)*sin(alpha) + (Y - y0)*cos(theta)*sin(alpha) - (Z - z0)*cos(alpha) + r3 + lamda);