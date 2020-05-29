function dYdt = odefunc1_2(t, X, p0, rho0, t0, t1)
    V0 = 500 * pi * (10/2)^2;
    rho = X(1);
    p = X(2);
    
    E = getproperE(p);

    drhodt = inQ1_2(t, p, p0, rho0, t1) * rho0 / V0  - outQ(t, t0) * rho / V0;
    dpdt = E / rho * inQ1_2(t, p, p0, rho0, t1) * rho0 / V0 - E * outQ(t, t0) / V0;

    dYdt = [drhodt; dpdt];
end
