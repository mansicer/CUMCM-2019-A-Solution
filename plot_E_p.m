load appendix3.mat
pt = 0:0.01:200;
subplot(1, 2, 1);
plot(pt, getproperE_2(pt));
hold on;
scatter(p(1:10:end), M(1:10:end));
hold off;
xlabel('p/MPa');
ylabel('E/Mpa');
title('全局拟合情况');
subplot(1, 2, 2);
plot(pt, getproperE_2(pt));
hold on;
scatter(p(1:end), M(1:end));
hold off;
xlim([95, 105]);
xlabel('p/MPa');
ylabel('E/Mpa');
title('局部拟合情况');
