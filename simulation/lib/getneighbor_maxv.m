function [neighbor,maxv]=getneighbor_maxv(pos,size,numseed,mcolor,neighbor,maxv,plot_no)
%calculate the neighbor and maxv
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
        
        if plot_no == 1
            plot(i,j,'o','MarkerEdgeColor',[mcolor(index,:)],'MarkerFaceColor',[mcolor(index,:)]);
        else
            
        end

    end
end


%%
%show the seed position
for k = 1:numseed
    
    plot(pos(k,1),pos(k,2),'k*');
    
    txt = num2str(k);
    
    text(pos(k,1)+ 1,pos(k,2),txt);
    
end
%
xlabel('Longitude geographical coordinate');
ylabel('Latitude geographical coordinate');
title('Voronoi Division');

end


