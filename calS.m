function [S, Sr] = calS(h)

r = 2.5 / 2;
theta = deg2rad(9);
l = h * sin(theta);
R = h * cos(theta) * sin(theta) + r;
S = pi .* r .* l + pi .* R .* l;
Sr = S;
for i = 1:length(S)
    S(i) = min(S(i), pi*(1.4/2)^2);
end
