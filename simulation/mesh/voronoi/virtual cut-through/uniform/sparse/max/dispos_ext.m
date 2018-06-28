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
                cx = -1;
                cy = -1;
                
                if x >= i
                    cx = connected_x(i,x,label,matrix);
                else
                    
                    
                    cx = connected_x(x,i,label,matrix);
                end
                
                
                if y >= u
                    cy = connected_y(u,y,label,matrix);
                else
                    if label == 2 && i == 50 && u == 42
                        i;
                    end
                    
                    cy = connected_y(y,u,label,matrix);
                end
                
                if cx == 1 && cy == 1
                    dpos = [dpos;i,u];
                end
                
            end
        end
        
    end
    
end


end
