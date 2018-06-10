%%matrix dense 2
addpath(genpath('D:\Dropbox\Prelim_Defense\simulation\lib'));
basex = [3 3 4 4];
basey = [3 3 4 4];

tsum = zeros(10,1);

for i = 1:5
    for j = 1:5
        
        tmpsum = 100;
        
        for k = 1:4
            
            tmx = min(abs(i - basex(k)), 5 - abs(i - basex(k)));
            tmy = min(abs(j - basey(k)), 5 - abs(j - basey(k)));
            
            tmpxy = tmx + tmy;
            
            tmpsum = min(tmpxy, tmpsum);
            
        end
        
        tsum(tmpsum+1,1) = tsum(tmpsum+1,1) + 1;
        
    end
end
%%

