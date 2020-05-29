function Q = outDQ(xt, p, rho, threshold)
    if xt < 0
        error("t not in proper range!");
    end
    t = mod(xt, 100);
    C = 0.85;
    A = pi * (1.4/2)^2;
    if p > threshold
        Q = C * A * sqrt(2 * abs(p - 0.5) / rho);
    else
        Q = 0;
    end
end