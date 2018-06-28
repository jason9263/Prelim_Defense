figure
grid on
for i = 1:50
    for j = 1:50
        index = posmatrix(i,j);
        if index == 0
        
        else
            hold on
            plot(i,j,'o','MarkerEdgeColor',[mcolor(index,:)],'MarkerFaceColor',[mcolor(index,:)]);
        end
        
    end
end

for k = 1:numseed
    
    plot(pos(k,1),pos(k,2),'k*');
    
    txt = num2str(k);
    
    text(pos(k,1)+ 1,pos(k,2),txt);
    
end

xlabel('longitude geographical coordinate');
ylabel('latitude geographical coordinate');
hold off

