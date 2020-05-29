[p, rho] = ode45(@prhoodefunc, [100 0.5], 0.85);
rho0 = rho(end);
M0 = rho0 * (1.018591635788130 + 7.239 - 2.413)* pi * (5/2)^2;

lT = 200;
rT = 300;
while rT - lT > 1
    T = round((lT + rT)/2);
    omiga = 2*pi/T;
    crho = 0.85;
    cp = 100;
    l = lcm(T, 100);
    for i = 1:(l/T)
        Tstart = (i-1)*T;
        Tend = i*T;
        [t, Y] = runge_kutta1(@(t, X)odefunc2_1(t, X, omiga), [crho; cp; M0], 0.1, Tstart, Tend);
        crho = Y(1, end);
        cp = Y(2, end);
    end
    fprintf("T = %d after %d iterations: final p = %f\n", T, l/T, cp);
    if cp > 100
        lT = T;
    else
        rT = T;
    end
end

crho = 0.85;
cp = 100;
T = 229;
omiga = 2*pi/T;
tdata = [];
ydata = [];
l = lcm(T, 100)/T;
for i = 1:l
    Tstart = (i-1)*T;
    Tend = i*T;
    [t, Y] = runge_kutta1(@(t, X)odefunc2_1(t, X, omiga), [crho; cp; M0], 0.1, Tstart, Tend);
    tdata = [tdata, t];
    ydata = [ydata, Y(2, :)];
    crho = Y(1, end);
    cp = Y(2, end);
end
plot(tdata, ydata);