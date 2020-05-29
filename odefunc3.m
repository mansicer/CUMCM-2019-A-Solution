function dYdt = odefunc3(t, X, omiga, ta, tb)
rho = X(1);
p = X(2);
M = X(3);
V0 = 500 * pi * (10/2)^2;

[inQ, rho0, p0] = inQ2_1(t, omiga, p, M);
outQa = outQ3a(t, p, rho, ta);
outQb = outQ3b(t, p, rho, tb);
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
drhodt = rho0 * inQ / V0 - rho * (outQa + outQb) / V0;
dpdt = E / rho * rho0 * inQ / V0 - E * (outQa + outQb) / V0;
dMdt = -rho0 * inQ;

dYdt = [drhodt; dpdt; dMdt];
end
