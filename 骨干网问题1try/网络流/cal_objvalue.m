function objvalue = cal_objvalue(pop)
global pop_size
global chromlenth 
global route_index
global route_cable
global total_requirement
global pop_record
global rate_record
global cost_record
route_weight=route_index;
for j = 1 : pop_size
    cost(j)=0;
    for i = 1 : chromlenth
    k = pop(j,i);   %ȡ����ǰ�����÷�ʽ
    [r,c]=size(route_cable);
        for q = 1:r
            for w = 1:c
                if(route_index(q,w) == i)
                       route_weight(q,w) = k*route_cable(q,w) * 100;%�þ����ܴ���������
                       cost(j)=cost(j)+k*(route_cable(q,w)+4)/8;
                end
            end
        end
    end
    cover_rate=calculate_max_flow(route_weight)/total_requirement;
    pop_record=[pop_record ; pop(j,:)];
    rate_record=[rate_record cover_rate];
    cost_record=[cost_record cost(j)];
    objvalue(1,j) = exp(cover_rate*10)/exp(cost(j)/1000);%/cost(j);%�����ض��ĵ�һ�ʵ�����λ�ý��м��㣻
    %disp(f);
    disp(cost(j))
end