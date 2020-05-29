[p, rho] = ode45(@prhoodefunc, [100 160], 0.85);
rho0 = rho(end);
p0 = 160;
t0 = 0;
time = 2; % modify time here to 2, 5, 10

%% method I
pert = zeros(size(1:time*10));
drho0 = 0.85;
dp0 = 100;
for i = 1:time*10
    perp = (150 - 100) / (time * 10);
    start = 100 + (i - 1) * perp;
    target = 100 + i * perp;
    
    lt = 0;
    rt = 10;
    
    ddrho0 = drho0;
    ddp0 = dp0;
    while rt - lt > 1e-5
        mid = (lt + rt)/2;
        [tT, YT] = runge_kutta1(@(t, X)odefunc1(t, X, p0, rho0, t0, mid), [drho0; dp0], 0.01, (i-1) * 100, (i-1) * 100 + mid);
        ddrho0 = YT(1, end);
        ddp0 = YT(2, end);
        if ddp0 > target
            rt = mid;
        else
            lt = mid;
        end
    end
    pert(i) = mid;
    fprintf("have caculated step %d time is %f\n", i, pert(i));
    dp0 = ddp0;
    drho0 = ddrho0;
end

drho0 = 0.85;
dp0 = 100;
t = [];
y = [];
for i = 1:time*10
    [tT, YT] = runge_kutta1(@(t, X)odefunc1(t, X, p0, rho0, t0, pert(i)), [drho0; dp0], 0.01, (i-1) * 100, (i-1) * 100 + pert(i));
    drho0 = YT(1, end);
    dp0 = YT(2, end);
    t = [t, tT];
    y = [y, YT(2, :)];
end
subplot(1, 3, 3);
plot(t, y);
xlabel('t/ms')
ylabel('p/MPa')

for i = 1:length(pert)
    fprintf("%f ", pert(i));
end
fprintf("\n");

%% method II
pert = zeros(size(1:time*10));
drho0 = 0.85;
dp0 = 100;
for i = 1:time*10
    perp = (150 - 100) / (time * 10);
    start = 100 + (i - 1) * perp;
    target = 100 + i * perp;
    
    lt = 0;
    rt = 2.5;
    
    ddrho0 = drho0;
    ddp0 = dp0;
    while rt - lt > 1e-4
        mid = (lt + rt)/2;
        [~, YT] = call_one_T(p0, rho0, t0, mid, dp0, drho0);
        ddrho0 = YT(1, end);
        ddp0 = YT(2, end);
        if ddp0 > target
            rt = mid;
        else
            lt = mid;
        end
    end
    pert(i) = mid;
    fprintf("have caculated step %d time is %f\n", i, pert(i));
    dp0 = ddp0;
    drho0 = ddrho0;
end

drho0 = 0.85;
dp0 = 100;
t = [];
y = [];
for i = 1:time*10
    [tT, YT] = call_one_T(p0, rho0, t0, pert(i), dp0, drho0);
    drho0 = YT(1, end);
    dp0 = YT(2, end);
    t = [t, 100 * (i - 1) + tT];
    y = [y, YT(2, :)];
end
subplot(1, 3, 3);
plot(t, y);
xlabel('t/ms')
ylabel('p/MPa')

for i = 1:length(pert)
    fprintf("%f ", pert(i));
end
fprintf("\n");
