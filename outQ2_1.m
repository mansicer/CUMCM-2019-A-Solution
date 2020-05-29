function Q = outQ2_1(t, p, rho)
if t < 0
    error("t can't be zero!\n");
end

t = mod(t, 100);
if t > 2.45
    Q = 0;
else
    load appendix2.mat;
    h = interp1(xt, d, t);
    C = 0.85;
    A = calS(h);
    lowpressure = 0.1;
    Q = C * A * sqrt(2 * abs(p - lowpressure) / rho);
end
end
