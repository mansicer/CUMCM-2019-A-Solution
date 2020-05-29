function dpdrho = rhopodefunc(rho, p)
    E = getproperE_2(p);
    dpdrho = E/rho;
end