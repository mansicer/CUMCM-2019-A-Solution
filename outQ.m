function Q = outQ(xt, t0)
    if xt < 0
        error("t not in proper range!");
    end
    t = mod(xt, 100);
    if t <= t0
        Q = 0;
    elseif t > t0 && t < t0 + 0.2
        Q = 100 * (t - t0);
    elseif t >= t0 + 0.2 && t < t0 + 2.2
        Q = 20;
    elseif t >= t0 + 2.2 && t < t0 + 2.4
        Q = -100 * (t - t0) + 240;
    else
        Q = 0;
    end
end
