[~, rho] = ode45(@prhoodefunc, [100 160], 0.85);
rho0 = rho(end);
p0 = 160;

lt = 0;
rt = 0.5;
while rt - lt > 1e-6
    mid = (lt + rt) / 2;
    [x, y] = runge_kutta1(@(t, X)odefunc1(t, X, p0, rho0, mid, 90), [0.85; 100], 0.001, 0, 3);
    p = y(2, :)';
    upper = max(p(x < 2.2 + mid)) - 100;
    lower = 100 - min(p);
    if upper < lower
        lt = mid;
    else
        rt = mid;
    end
end
t0 = mid;
fprintf("the proper t0 is %f\n", t0);

[x, y] = runge_kutta1(@(t, X)odefunc1(t, X, p0, rho0, mid, 90), [0.85; 100], 0.001, 0, 3);
p = y(2, :)';
stable = abs(p - 100);
[m, i] = min(stable(x > t0 + 2.2));
t1 = x(x > t0 + 2.2);
t1 = t1(i);
fprintf("time when p return 100 MPa is %f\n", t1);

[x, y] = runge_kutta1(@(t, X)odefunc1(t, X, p0, rho0, t0, t1), [0.85; 100], 0.001, 0, 3);
plot(x, y(2, :), 'r');
