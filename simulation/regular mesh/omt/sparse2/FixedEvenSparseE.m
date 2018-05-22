%%
pdep = pd.dual_point_extended;
pdcell = pd.cell;
figure
hold on

time = 10;
size = 50;

for i = 1:size
    for j = 1:size
        posi = i/25 -1;
        posj = j/25 - 1;
        
        for k = 1:time
            tmpcell = pdep(pdcell{k},:);
            in = inpolygon( posi, posj , tmpcell(:,1),tmpcell(:,2));
            if in == 1
                index = k;
                plot(i,j,'o','MarkerEdgeColor',[mcolor(index,:)],'MarkerFaceColor',[mcolor(index,:)]);
            else
                
            end
            
        end
        
    end
end

for k = 1:numseed
    
    plot(pos(k,1),pos(k,2),'k*');
    
    txt = num2str(k);
    
    text(pos(k,1)+ 1,pos(k,2),txt);
    
end


%%
figure
hold on

sumcore = 0;

for i = 1:numseed
    
    title = [];
    
    %title = [1 neighbor(i,1:maxv(i,1))];
    title = [1 neighbor(i,1:min(maxv))];
    
    sumcore = sumcore + sum(neighbor(i, 1:min(maxv)));
    
    nunitm(title);
    %nunitm_no(title);
    
end

(size*size - sumcore)/(size*size)

legend('1','2','3','4','5','6','7','8','9','10');

hold off

%%
pdep = pd.dual_point_extended;
pdcell = pd.cell;
figure
hold on

time = 10;
size = 50;

sumxy = zeros(time,3);

for i = 1:size
    for j = 1:size
        posi = i/25 -1;
        posj = j/25 - 1;
        
        for k = 1:time
            tmpcell = pdep(pdcell{k},:);
            in = inpolygon( posi, posj , tmpcell(:,1),tmpcell(:,2));
            if in == 1
                index = k;
                plot(i,j,'o','MarkerEdgeColor',[mcolor(index,:)],'MarkerFaceColor',[mcolor(index,:)]);
                sumxy(index,1) = sumxy(index,1) + i;
                sumxy(index,2) = sumxy(index,2) + j;
                sumxy(index,3) = sumxy(index,3) + 1;
            else
                
            end
            
        end
        
    end
end

for k = 1 :time
    sumxy(k,1) = sumxy(k,1)/sumxy(k,3);
    sumxy(k,2) = sumxy(k,2)/sumxy(k,3);
    plot(sumxy(k,1), sumxy(k,2), 'k*');
    
    txt = num2str(k);
    
    text(sumxy(k,1) + 1, sumxy(k,2)+ 1,txt);
end

