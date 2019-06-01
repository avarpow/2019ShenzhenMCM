function max_flow=calculate_max_flow(route_weight)%用EK算法计算最大流
    global pre;%前向边
    global rest
    rest=route_weight;
    pre=zeros(1,20,'int8');
    flow=0;
    while(bfs() == 1)
        d=9999999;
        i=20;%for(i=t;i!=s;i=pre[i])
        while(i~=1)
            if d>=rest(pre(i),i)
                d=rest(pre(i),i);
            end
            i=pre(i);
        end
        i=20;
        while(i~=1)
            rest(pre(i),i)=rest(pre(i),i)-d;
            rest(i,pre(i))=rest(i,pre(i))+d;
            i=pre(i);
        end
        flow=flow+d;
    end
    max_flow=flow;
    disp(max_flow);
end


