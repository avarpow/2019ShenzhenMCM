function cover_rate=cal_flow(pop)
global pop_size
global chromlenth 
global route_index
global route_cable
global total_requirement
cost=0;
route_weight=route_index;
for i = 1 : length(pop)
    k = pop(i);   %取出当前的配置方式
    [r,c]=size(route_cable);
        for q = 1:r
            for w = 1:c
                if(route_index(q,w) == i)
                       route_weight(q,w) = k*route_cable(q,w) * 100;%用尽可能大容量的线
                       cost=cost+k*(route_cable(q,w)+4)/8;
                end
            end
        end
end
    max_flow=calculate_max_flow(route_weight);
    cover_rate=max_flow/total_requirement;
    fprintf('    %.1f\n',cost);
    disp(cover_rate);
end
