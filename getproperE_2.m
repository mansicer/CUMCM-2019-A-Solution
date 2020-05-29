function E = getproperE_2(p)
p1 =   1.199e-09;
p2 =  -2.539e-07; 
p3 =   6.835e-05;
p4 =    0.008696;
p5 =       4.914;
p6 =        1538;
E = p1 * p .^ 5 + p2 * p .^ 4 + p3 * p .^ 3 + p4 * p .^ 2 + p5 * p + p6;
end
