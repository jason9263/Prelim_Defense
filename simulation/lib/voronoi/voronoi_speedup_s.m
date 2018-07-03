function voronoi_speedup_s(numseed,mcolor,neighbor, maxv,S,type,no)

%%
%calculate the subgraph computation power
figure
hold on

for i = 1:numseed
    
    title = [];
    if type == 1
        title = [1 neighbor(i,1:maxv(i,1))];
    else
        if type == 2
            title =  [1 neighbor(i,1:min(maxv))];
        else 
            if type == 3
                title = [1 neighbor(i,1: S(i))];
            end
        end
        
        
    end
    
    if no == 1
        nunitm_c(title,mcolor(i,:));
    else
        nunitm_no_c(title,mcolor(i,:));
    end
    
    %nunitm_no(title);
end

legend('1','2','3','4','5','6','7','8','9','10');
hold off

% 0.3028
end
