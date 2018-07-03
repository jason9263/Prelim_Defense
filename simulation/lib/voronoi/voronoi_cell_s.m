function [savrpro] = voronoi_cell_s(scale,pos,size,numseed,mcolor,neighbor,maxv,plot_no)

        figure
        hold on
        
        savepro = 0;
        
        for i = 1:scale
            for j = 1:scale
                dis = [];
                
                for k = 1:numseed
                    tmp = abs(i - pos(k,1)) + abs(j - pos(k,2));
                    dis = [dis, tmp];
                end
                
                [minv,index] = min(dis);
                
                stmp = S(index);
                
                if minv <= stmp
                    savepro = savepro +1;
                    plot(i,j,'o','MarkerEdgeColor',[mcolor(index,:)],'MarkerFaceColor',[mcolor(index,:)]);
                end
                
            end
        end
        %show the seed position
        drawtext(numseed,pos);
        grid on
        xlabel('longitude geographical coordinate');
        ylabel('latitude geographical coordinate');
        hold off
end


