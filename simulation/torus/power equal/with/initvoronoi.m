%%
function [pos, mcolor] = initvoronoi
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
propos = [16    30
    46    13
    22    30
    9    36
    45    11
    49     6
    22    15
    6    16
    13    21
    20    25];

propos(:,1) = propos(:,1) + 50;
propos(:,2) = propos(:,2) + 50;

pos = [];

for i = -1:1
    for j = -1:1
        tmp = [];
        tmp = propos;
        
        tmp(:,1) = tmp(:,1) + i*50;  
        tmp(:,2) = tmp(:,2) + j*50;
        
        pos = [pos;tmp];
    end
end


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

end
