function dYdt = odefunc2_1(t, X, omiga)
rho = X(1);
p = X(2);
M = X(3);
V0 = 500 * pi * (10/2)^2;

[inQ, rho0, p0] = inQ2_1(t, omiga, p, M);
outQ = outQ2_1(t, p, rho);
E = getproperE_2(p);

%% in only
% drhodt = rho0 * inQ / V0;
% dpdt = E / rho * rho0 * inQ / V0;
% dMdt = -rho0 * inQ;

%% out only
% drhodt =  - rho * outQ / V0;
% dpdt =  - E / rho * rho * outQ / V0;
% dMdt = 0;

%% in & out
drhodt = rho0 * inQ / V0 - rho * outQ / V0;
dpdt = E / rho * rho0 * inQ / V0 - E / rho * rho * outQ / V0;
dMdt = -rho0 * inQ;

dYdt = [drhodt; dpdt; dMdt];
end
