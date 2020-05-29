function Q = inQ(xt, p, p0, rho0, t1)
    if xt < 0
        error("t not in proper range!");
    end
    t = mod(xt, 100);
    C = 0.85;
    A = pi * (1.4/2)^2;
    if t < t1
        Q = C * A * sqrt(2 * abs(p0 - p) / rho0);
    else
        Q = 0;
    end
end