function max_flow=calculate_max_flow(route_weight)%用EK算法计算最大流
    global pre;%前向边
    global rest
    pre=zeros(1,20);
    pre=int8(pre);
    flow=0;
    while(bfs(route_weight))
        d=9999999;
        for i=1:length(pre)
            now=int8(pre(i));
            if d>=rest(int8(pre(now)),now)
                d=rest(int8(pre(now)),now);
            end
        end
        for i=1:length(pre)
            now=int8(pre(i));
            rest(int8(pre(now)),now)=rest(int8(pre(now)),now)-d;
            rest(now,int8(pre(now)))=rest(now,int8(pre(now)))+d;
        end
        flow=flow+d;
    end
end


