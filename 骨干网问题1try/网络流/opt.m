dfs=[18 17 13 7 1 14 5 21 20 19 15 11 2 10 16 9 6 3];
pop1=[80 80 80 0 80 16 80 2 8 80 80 0 26 13 80 12 44 13 77 64 15];
for i = 1:length(dfs)
    while(1)
    k=dfs(i);
    good_pop=pop1;
    good_pop(k)=good_pop(k)-1;
    if(cal_flow(good_pop)>=0.99999)
        pop1=good_pop;
    else break;
    end
    if(good_pop(k)==0)break;
    end
    end
end

    