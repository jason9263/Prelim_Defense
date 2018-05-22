%Pos11-12
clc
clear

rA = [1 2 3 4];
rB = [1 2 3 4 5 ];

rC = [1 2 3 4 5 4 3 2 1];

nA = [1 2 3];
nC = [1 2 3 4 5 4];

nB = [1 2 3 4 5 4 3];
nD = [1 2];

nX = [1 2 3 4 5];
nY = [1 2 3 4];

% nunitm(nA);
% nunitm(nC);
% nunitm(nB);
% nunitm(nD);

nX = [1 4];
nY = [1 4 8];
nZ = [1 4 8 12];

nunitm(nX);
nunitm(nY);
nunitm(nZ);

% for alpha1 = 0.1:0.1:0.2
%     twocoresimu(rA,rB,nA,nB,rC,alpha1,1 - alpha1)
% end
