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
