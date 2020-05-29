function dYdt = odefunc1(t, X, p0, rho0, t0, t1)
    V0 = 500 * pi * (10/2)^2;
    rho = X(1);
    p = X(2);
    
    E = getproperE_2(p);
    iQ = inQ(t, p, p0, rho0, t1);
    oQ = outQ(t, t0);

    drhodt = iQ * rho0 / V0  - oQ * rho / V0;
    dpdt = E / rho * iQ * rho0 / V0 - E * oQ / V0;

    dYdt = [drhodt; dpdt];
end
