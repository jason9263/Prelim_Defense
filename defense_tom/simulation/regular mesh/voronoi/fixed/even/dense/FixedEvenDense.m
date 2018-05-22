%%
%
clear 
clc

tline = [4 8 12 10 6 2];

nunitm(tline);

nunitm_no(tline);

legend('Square With Front End',' Square Wihtout Front End');
hold off

figure
tline = [7 14 15 10 6 3 1];

nunitm(tline);
nunitm_no(tline);

legend('Band With Front End','Band Wihtout Front End');


