function E = getproperE(p0)
    load appendix3.mat;
    E = interp1(p, M, p0);
end
