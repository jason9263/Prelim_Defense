function [dpos]= dispos_ext(x,y,dis,m,n,matrix,pos,label)
% label = 2
% 50  42
dpos = [];
for i = x - dis : x + dis
    if i >= 1 && i <= m
        tmp = (dis - abs(i - x));
        j1 = y + tmp;
        j2 = y - tmp;
        
        for u = j2:j1

            if u >= 1 && u <= n && matrix(i,u) == 0
                c = connected(i,u,x,y,label,matrix);
                if c == 1
                    dpos = [dpos;i,u];
                end
                
            end
        end
        
    end
    
end


end
