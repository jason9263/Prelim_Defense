x = 8;
y = 8;
S = zeros(25,1);
for i = 1:16
    for j = 1:16
        tmpx = abs(i - x);
        tmpy = abs(j - y);
        tmpxy = tmpx + tmpy;
        index = tmpxy + 1;
        S(index) = S(index) + 1;
        
    end
end

S'