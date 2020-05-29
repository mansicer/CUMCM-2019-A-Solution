function [Q, rho0, p0] = inQ2_1(t, omiga, p, M)
theta = omiga * t;
V = calV(theta);
C = 0.85;
A = pi * (1.4/2)^2;

rho0 = M / V;

[x, y] = ode45(@rhopodefunc, [0.85 rho0], 100);
p0 = y(end);

if p0 < p
    Q = 0;
else
    Q = C * A * sqrt(2 * abs(p - p0) / rho0);
end
end
