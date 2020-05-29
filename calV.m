function V = calV(deg)
deg = mod(deg, 2*pi);
load appendix1_2.mat;
h_total = 1.018591635788130 + 7.239;
h_b = interp1(theta, r, deg);
h_a = h_total - h_b;
V = h_a * pi * (5/2)^2;
end
