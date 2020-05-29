crho = 0.85;
cp = 100;
M0 = 92.328614028392451;
lT = 100;
rT = 150;
while rT - lT > 1e-1
    T = ((lT + rT)/2);
    omiga = 2*pi/T;
    crho = 0.85;
    cp = 100;
    l = lcm(T * 10, 1000)/10;
    for i = 1:(l/T)
        fprintf("%d/%d ", i, l/T);
        Tstart = (i-1)*T;
        Tend = i*T;
        [t, Y] = runge_kutta1(@(t, X)odefunc3(t, X, omiga), [crho; cp; M0], 0.1, Tstart, Tend);
        crho = Y(1, end);
        cp = Y(2, end);
    end
    fprintf("\nT = %d after %d iterations: final p = %f\n", T, l/T, cp);
    if cp > 100
        lT = T;
    else
        rT = T;
    end
end

crho = 0.85;
cp = 100;
T = 115;
omiga = 2*pi/T;
M0 = 92.328614028392451;
ta_lst = linspace(0, 47, 10);
tb_lst = linspace(50, 97, 10);
l = lcm(T, 100) / T;
para_var = zeros(length(ta_lst), length(ta_lst));
para_var(1, 2) = 1.909339751288507;
for i = 1:length(ta_lst)
    for j = 1:length(tb_lst)
        if i == 1 && j == 2
            continue;
        end
        if i >= j
            continue;
        end
        y = [];
        for k = 1:l
            fprintf("%d", k);
            Tstart = (k-1)*T;
            Tend = k*T;
            [t, Y] = runge_kutta1(@(t, X)odefunc3(t, X, omiga, ta_lst(i), tb_lst(j)), [crho; cp; M0], 0.1, Tstart, Tend);
            crho = Y(1, end);
            cp = Y(2, end);
            y = [y, Y(2, :)];
        end
        para_var(i, j) = var(y);
        fprintf("\nvariance when ta = %f and tb = %f is %f\n", ta_lst(i), tb_lst(j), para_var(i, j));
    end
end

ta = 3.6154;
tb = 53.6154;
omiga = 2*pi/T;
M0 = 92.328614028392451;

crho = 0.85;
cp = 100;
l = lcm(T , 1000)/10/T;
tdata = [];
ydata = [];
for i=1:l
    fprintf("%d/%d ", i, l);
    Tstart = (i-1)*T;
    Tend = i*T;
    [t, Y] = runge_kutta1(@(t, X)odefunc3(t, X, omiga, ta, tb), [crho; cp; M0], 0.1, Tstart, Tend);
    crho = Y(1, end);
    cp = Y(2, end);
    tdata = [tdata, t];
    ydata = [ydata, Y(2, :)];
end
plot(tdata, ydata);
xlabel('t/ms')
ylabel('p/MPa')

ta_lst = linspace(0, 47, 4);
tb_lst = linspace(50, 97, 4);
res = zeros(length(ta_lst), length(tb_lst));
T = 114.5;
omiga = 2*pi/T;
M0 = 92.328614028392451;
l = lcm(T * 10, 1000)/10/T;

for i = 1:length(ta_lst)
    for j = 1:length(tb_lst)        
        crho = 0.85;
        cp = 100;        
        for k=1:l
            fprintf("%d/%d ", k, l);
            Tstart = (k-1)*T;
            Tend = k*T;
            [t, Y] = runge_kutta1(@(t, X)odefunc3(t, X, omiga, ta, tb), [crho; cp; M0], 0.1, Tstart, Tend);
            crho = Y(1, end);
            cp = Y(2, end);
        end
        res(i, j) = cp;
        fprintf("\nres = %f, ta = %f, tb = %f\n", res(i, j), ta_lst(i), tb_lst(j));
    end
end
