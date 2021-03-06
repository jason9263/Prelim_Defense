function [mcolor,pos] = init
%%
mcolor = [
    0.5181    0.2548    0.9160
    0.9436    0.2240    0.0012
    0.6377    0.6678    0.4624
    0.9577    0.8444    0.4243
    0.2407    0.3445    0.4609
    0.6761    0.7805    0.7702
    0.2891    0.6753    0.3225
    0.6718    0.0067    0.7847
    0.6951    0.6022    0.4714
    0.0680    0.3868    0.0358
    ];
%%
pos = cell(1,10);

pos1 = zeros(9,2);

for i = 1:9
    pos1(i,1) = 12;
    pos1(i,2) = 25 + i -1;
end

pos2 = zeros(9,2);
for i = 1:9
    pos2(i,1) = 37 + i -1;
    pos2(i,2) = 17;
end

pos3 = [25 25
    24 25
    23 25
    22 25
    21 25
    25 26
    25 27
    25 28
    25 29];


pos4 = [40 40
    41 41
    42 42
    43 43];


pos5 = [10 10];
pos6 = [45 10];
pos7 = [10 45];

pos8 = [5 30
    5 31
    5 32
    5 33
    6 29
    4 29
    7 28
    3 28];

pos9 = [45 25
    45 24
    45 23
    ];

pos10 = [15 15];

pos{1} = pos1;
pos{2} = pos2;
pos{3} = pos3;
pos{4} = pos4;
pos{5} = pos5;
pos{6} = pos6;
pos{7} = pos7;
pos{8} = pos8;
pos{9} = pos9;
pos{10} = pos10;


end

%%
