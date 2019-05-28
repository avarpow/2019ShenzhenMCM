function tau=ant_move(pop,weight,tau)
global tau_increase %信息素增加强度系数?
global ant_num
global ant_steps
global city_num
global tau_factor %表征信息素重要程度的参数??
global tau_decline;%信息素蒸发系数?
global power_factor %表征启发式因子重要程度的参数??
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
    tau=tau*(1-tau_decline);%一轮走完,信息素挥发
    pause(0.5);
end


        
                
        
        