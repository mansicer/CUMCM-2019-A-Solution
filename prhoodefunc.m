function drhodp = prhoodefunc(p, rho)
    E = getproperE(p);
    drhodp = rho/E;
end