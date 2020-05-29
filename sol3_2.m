crho = 0.85;
cp = 100;
T = 100;
omiga = 2*pi/T;
M0 = 92.328614028392451;
ta_lst = linspace(18.5, 19.5, 10);
tb_lst = linspace(33, 34, 10);

res = zeros(length(ta_lst), length(tb_lst));
for i=1:length(ta_lst)
    for j=1:length(tb_lst)
        ta = ta_lst(i);
        tb = tb_lst(j);
        lt = 100;
        rt = 102;
        while rt - lt > 1e-3
            mid = (lt + rt) / 2;
            [~, Y] = runge_kutta1(@(t, X)odefunc3_2(t, X, omiga, mid, ta, tb), [crho; cp; M0], 0.1, 0, 100);
            py = Y(2, end);
            if py > 100
                rt = mid;
            else
                lt = mid;
            end
        end

        threshold = mid;
        [t, Y] = runge_kutta1(@(t, X)odefunc3_2(t, X, omiga, threshold, ta, tb), [crho; cp; M0], 0.1, 0, 100);
        res(i, j) = max([threshold - 100, 100 - min(Y(2, :))]);
        fprintf("calculated result = %f for ta = %f, tb = %f\n", res(i, j), ta, tb);
    end
end

% choosing data
ta = 18.83;
tb = 33.78;
lt = 100;
rt = 102;
while rt - lt > 1e-4
    mid = (lt + rt) / 2;
    [~, Y] = runge_kutta1(@(t, X)odefunc3_2(t, X, omiga, mid, ta, tb), [crho; cp; M0], 0.1, 0, 100);
    py = Y(2, end);
    if py > 100
        rt = mid;
        fprintf("current p = %f, change interval to [%f, %f]\n", py, lt, rt);
    else
        lt = mid;
        fprintf("current p = %f, change interval to [%f, %f]\n", py, lt, rt);
    end
end
[t, Y] = runge_kutta1(@(t, X)odefunc3_2(t, X, omiga, mid, ta, tb), [crho; cp; M0], 0.1, 0, 100);
plot(t, Y(2,:));