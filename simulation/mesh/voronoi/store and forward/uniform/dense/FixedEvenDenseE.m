%%
figure
hold on
len = min(maxv);

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
        
        if minv <= len
            
            plot(i,j,'o','MarkerEdgeColor',[mcolor(index,:)],'MarkerFaceColor',[mcolor(index,:)]);
            
        end
        
    end
end

for k = 1:numseed
    
    plot(pos(k,1),pos(k,2),'k*');
    
    txt = num2str(k);
    
    text(pos(k,1)+ 1,pos(k,2),txt);
    
end


figure
hold on

sumcore = 0;

for i = 1:numseed
    
    title = [];
    
    %title = [1 neighbor(i,1:maxv(i,1))];
    title = [1 neighbor(i,1:min(maxv))];
    sum(title)
    
    sumcore = sumcore + sum(title);
    
    %nunitm(title);
    nunitm_no(title);
    
end

(size*size - sumcore)/(size*size)

legend('1','2','3','4','5','6','7','8','9','10');

hold off