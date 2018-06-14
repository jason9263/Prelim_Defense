%%
clear 
clc
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
figure
hold on
tline = [4 8 12 10 6 2];
nunitm(tline);
%nunitm_no(tline);
grid on
legend('Store and Forward');
title('Speedup vs \sigma');
hold off

figure
hold on
fraction(tline);
grid on
title('Data Fraction vs \sigma');
legend('Store and Forward');
hold off

%%
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
figure
hold on
tline = [7 14 15 10 6 3 1];
nunitm(tline);
grid on
legend('Store and Forward');
title('Speedup vs \sigma');
hold off

figure
hold on
fraction(tline);
grid on
title('Data Fraction vs \sigma');
legend('Store and Forward');
hold off
