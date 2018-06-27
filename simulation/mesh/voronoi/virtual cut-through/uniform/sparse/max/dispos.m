function [dpos]= dispos(x,y,dis,m,n)
dpos = [];

for i = x - dis : x + dis
    
    if i >= 1 && i <= m
        tmp = (dis - abs(i - x));
        j1 = y + tmp;
        j2 = y - tmp;
        
        if j1 >= 1 && j1 <= m
            dpos = [dpos;i,j1];
        end
        
        if j2 >= 1 && j2 <= n
            dpos = [dpos;i,j2];
        end
    end
    
end

end
