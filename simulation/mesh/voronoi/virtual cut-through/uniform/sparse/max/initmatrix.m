function [posmatrix,sumtmp] = initmatrix(m,n,pos,S)

posmatrix = zeros(m,n);
sizepos = size(pos);
sumtmp = [];

for i = 1: sizepos(1)
    x = pos(i,1);
    y = pos(i,2);
    tmp = 0;
    
    for dis = 0:S(i)
        
        [dpos]= dispos(x,y,dis,m,n,pos);
        
        sizedpos = size(dpos);
        
        for u = 1: sizedpos(1)
            posx = dpos(u,1);
            posy = dpos(u,2);
            
            if posmatrix(posx,posy) == 0
                posmatrix(posx,posy) = i;
                tmp = tmp + 1;
            end
        end
    end
    sumtmp = [sumtmp tmp];
end

end