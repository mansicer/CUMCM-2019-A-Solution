load appendix1_2.mat;
deg = 0:0.01:4*pi;
plot(deg, calV(deg));
xlabel('theta');
ylabel('V/mm^3');
title('凸轮角度与高压油泵体积关系');
