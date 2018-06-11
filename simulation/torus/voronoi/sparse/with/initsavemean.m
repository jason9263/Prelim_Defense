%%
function [pos] = initsavemean(size)
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));

propos = randi([1 size],10,2);

propos(:,1) = propos(:,1) + size;
propos(:,2) = propos(:,2) + size;

pos = [];

for i = -1:1
    for j = -1:1
        tmp = [];
        tmp = propos;
        
        tmp(:,1) = tmp(:,1) + i*size;
        tmp(:,2) = tmp(:,2) + j*size;
        
        pos = [pos;tmp];
    end
end

end
