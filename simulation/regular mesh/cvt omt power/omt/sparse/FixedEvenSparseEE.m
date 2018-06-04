sumxy = round(sumxy);

neighbor = zeros(numseed,2*size);
maxv = zeros(numseed,1);

pos = sumxy(:,1:2);

pdep = pd.dual_point_extended;
pdcell = pd.cell;

for i = 1:size
    for j = 1:size
        posi = i/25 -1;
        posj = j/25 - 1;
        
        for k = 1:time
            tmpcell = pdep(pdcell{k},:);
            in = inpolygon( posi, posj , tmpcell(:,1),tmpcell(:,2));
            if in == 1
                
                index = k;
                
                tmp = abs(i - pos(k,1)) + abs(j - pos(k,2));
                
                if tmp > 0
                    neighbor(index,tmp) = neighbor(index,tmp) + 1;
                    maxv(index) = max(maxv(index),tmp);
                    %plot(i,j,'o','MarkerEdgeColor',[mcolor(index,:)],'MarkerFaceColor',[mcolor(index,:)]);
                    
                end
                
                
            else
                
            end
            
        end
        
    end
end

hold off

%%
figure
hold on

sumcore = 0;

for i = 1:numseed
    
    title = [];
    
    title = [1 neighbor(i,1:maxv(i,1))];
    %title = [1 neighbor(i,1:min(maxv))];
    
    
    sumcore = sumcore + sum(title);
    
    nunitm(title);
    %nunitm_no(title);
    
end

(size*size - sumcore)/(size*size)

legend('1','2','3','4','5','6','7','8','9','10');

hold off