
function [dpos]= dispos(x,y,dis,m,n,pos)
dpos = [];
sizepos = size(pos);

for i = x - dis : x + dis
    
    if i >= 1 && i <= m
        tmp = (dis - abs(i - x));
        j1 = y + tmp;
        j2 = y - tmp;
        
        tmpdis = [];
                
        if j1 >= 1 && j1 <= n
            
            for k = 1:sizepos(1)
                gtmp = abs(i - pos(k,1)) + abs(j1 - pos(k,2));
                tmpdis = [tmpdis, gtmp];
            end
            
            [minv,index] = min(tmpdis);
            
            if pos(index,1) == x && pos(index,2) == y
                
                dpos = [dpos;i,j1];
                
            end
            
        end
        
        tmpdis = [];
        if j2 >= 1 && j2 <= n
            
            for k = 1:sizepos(1)
                gtmp = abs(i - pos(k,1)) + abs(j2 - pos(k,2));
                tmpdis = [tmpdis, gtmp];
            end
            
            [minv,index] = min(tmpdis);
            
            if pos(index,1) == x && pos(index,2) == y
                
                dpos = [dpos;i,j2];
                
            end

        end
    end
    
end

end



