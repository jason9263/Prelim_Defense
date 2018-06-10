%%
function [pos] = initsavemean
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));

propos = randi([1 50],10,2);

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

end
