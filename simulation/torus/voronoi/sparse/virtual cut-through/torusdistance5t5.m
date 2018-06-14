%%
%5t5 (3,3)

dis = zeros(10,2);

for i = 1:5
    for j = 1:5
        tmpx = min( abs(i - 3), 5 - abs(i-3) );
        tmpy = min(abs(j-3), 5 - abs(j-3) );
        
        tmp = tmpx + tmpy;
        
        if  tmp == 0
            
        else
            dis(tmp,1) = tmp;
            dis(tmp,2) = dis(tmp,2) + 1;
        end
        
    end
end

dis