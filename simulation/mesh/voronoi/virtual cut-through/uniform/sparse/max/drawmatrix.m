clear xlabel ylabel title
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

xlabel('Longitude geographical coordinate');
ylabel('Latitude geographical coordinate');
title('Augmented Reduced Voronoi Division');
hold off



figure
hold on
grid on

sumcore = 0;

sumtitle = [];
for i = 1:numseed
    
    title = [];
    %title = [1 neighbor(i,1:maxv(i,1))];
    %title = [1 neighbor(i,1:min(maxv))];
    title = [1 neighbor(i,1: S_ext(i))];
    sumtitle = [sumtitle sum(title)];
    %nunitm_c(title,mcolor(i,:));
    nunitm_no_c(title,mcolor(i,:));
    
end

legend('1','2','3','4','5','6','7','8','9','10');
hold off


