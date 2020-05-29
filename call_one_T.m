function [t, Y] = call_one_T(p0, rho0, t0, t1, dp0, drho0)
    firstTtime = 2.4;
    pert = [firstTtime, t1, t1, t1, t1, t1, t1, t1];
    t = [];
    Y = [];
    for i = 1:length(pert)
        if i == 1
            [tt, YT] = runge_kutta1(@(t, X)odefunc1_2(t, X, p0, rho0, t0, t1), [drho0; dp0], 0.01, 0, 2.4);
        else
            [tt, YT] = runge_kutta1(@(t, X)odefunc1_2(t, X, p0, rho0, t0, t1), [drho0; dp0], 0.01, (i-1)*12.5, (i-1)*12.5+t1);
        end
        t = [t, tt];
        Y = [Y, YT];
        drho0 = Y(1, end);
        dp0 = Y(2, end);
    end
end
