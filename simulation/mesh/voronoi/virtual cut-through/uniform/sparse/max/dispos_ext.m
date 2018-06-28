function [dpos]= dispos_ext(x,y,dis,m,n,matrix)

dpos = [];
for i = x - dis : x + dis
    
    if i >= 1 && i <= m
        tmp = (dis - abs(i - x));
        j1 = y + tmp;
        j2 = y - tmp;
        
        if j1 >= 1 && j1 <= n && matrix(i,j1) == 0
            dpos = [dpos;i,j1];
        end
        
        if j2 >= 1 && j2 <= n && matrix(i,j2) == 0 && j2 ~= j1
            dpos = [dpos;i,j2];
        end
    end
    
end


end
