function [res] = process(size,numseed)

pos = initsavemean(size/3);
neighbor = zeros(numseed,2*size);
maxv = zeros(numseed,1);
for i = 1:size
    for j = 1:size
        dis = [];
        
        for k = 1:numseed
            tmp = abs(i - pos(k,1)) + abs(j - pos(k,2));
            dis = [dis, tmp];
        end
        
        [minv,index] = min(dis);
        
        if minv > 0
            neighbor(index,minv) = neighbor(index,minv) + 1;
            maxv(index) = max(maxv(index),minv);
        end
        
    end
end
%%
savetmp = 0;
maxv;
min(maxv);
for i = 1:size
    for j = 1:size
        dis = [];
        
        for k = 1:numseed
            tmp = abs(i - pos(k,1)) + abs(j - pos(k,2));
            dis = [dis, tmp];
        end
        
        [minv,index] = min(dis);
                
        if minv <= min(maxv)
            
        else
            savetmp = savetmp  + 1;
        end
        
    end
end
%%
res = savetmp/(size*size);



end