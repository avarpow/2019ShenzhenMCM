function objvalue = cal_objvalue(pop)
global pop_size
global chromlenth 
global route_index
global route_cable
route_weight=route_index;
for j = 1 : pop_size
    for i = 1 : chromlenth
    k = pop(j,i)   %ȡ����ǰ�����÷�ʽ
    [r,c]=size(route_cable);
        for q = 1:r
            for w = 1:c
                if(route_index(q,w) == i)
                       route_weight(q,w) = k*route_cable(q,w) * 100;%�þ����ܴ���������
                end
            end
        end
    end
    
    objvalue(1,j) = max_flow(route_weight);%�����ض��ĵ�һ�ʵ�����λ�ý��м��㣻

end