function Q = outQ3b(t, p, rho, tb)
if t < 0
    error("t can't be zero!\n");
end

t = mod(t, 100);
if t >= 0 && t < tb
    Q = 0;
elseif t < tb + 2.45
    load appendix2.mat;
    h = interp1(xt, d, t - tb);
    C = 0.85;
    A = calS(h);
    lowpressure = 0.1;
    Q = C * A * sqrt(2 * abs(p - lowpressure) / rho);
else
    Q = 0;
end
end
