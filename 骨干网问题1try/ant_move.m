function tau=ant_move(pop,weight,tau)
global tau_increase %��Ϣ������ǿ��ϵ��?
global ant_num
global ant_steps
global city_num
global tau_factor %������Ϣ����Ҫ�̶ȵĲ���??
global tau_decline;%��Ϣ������ϵ��?
global power_factor %��������ʽ������Ҫ�̶ȵĲ���??
ant_steps=10;
for i = 1:ant_steps
    for j=1:ant_num
        point=pop(j);
        if point ~= 1
            p_value=zeros(1,city_num);
            for k= 1:city_num
                if weight(point,k)~=-1
                    p_value(k)=tau(point,k)^tau_factor*weight(point,k)^power_factor;
                end
            end
            total_value=sum(p_value);
            p_value=p_value/total_value;
            p_value=cumsum(p_value)
            t=rand();
            for k = 1:city_num
                if t <= p_value(k)
                    disp(t);
                    disp(k);
                    tau(point,k)=tau(point,k)+tau_increase;
                    tau(k,point)=tau(k,point)+tau_increase;
                    pop(j)=k;
                    break;
                end
            end
        end
    end
    tau=tau*(1-tau_decline);%һ������,��Ϣ�ػӷ�
    pause(0.5);
end


        
                
        
        