function objvalue = cal_objvalue(pop)
global Phase_cos
global Phase_sin
global Mag_pow10
interference_AZ=10;%干扰点俯仰角下边
interference_EL=10;%干扰点水平角下标
goal_AZ=10;%目标点俯仰角下标
goal_EL=5;%目标点水平角
goal_index_AZ=(goal_AZ+180)/5+1;%目标点水平角的下标=39
goal_index_EL=(goal_EL+90)/5+1;%目标点俯仰角角的下标=20
interference_index_AZ=(interference_AZ+180) / 5 + 1;%干扰点水平角下标=39
interference_index_EL=(interference_EL+90 ) / 5 + 1;%干扰点俯仰角下标=21
for j = 1 : 100
goal_component_cos = 0; %初始化目标值，干扰值
goal_component_sin = 0;%
interference_component_cos = 0;
interference_component_sin= 0;
goal_value = 0;
interference_value = 0;

    for i = 1 : 32
 %   display(j);
 %   k = pop(1,1);
 %   display(pop(j,1));
        if(pop(j,i) == 0) %假如遇到有关闭的情况就直接跳过
            continue;
        end
    
    k = pop(j,i);   %取出当前的配置方式

    % a1 =  10.^(Mag(39,21,1,k)/20).*cos(Phase(39,21,1,k));
    % b1 =  10.^(Mag(39,21,1,k)/20).*sin(Phase(39,21,1,k));
    % a2 =  10.^(Mag(39,20,1,k)/20).*cos(Phase(39,20,1,k));
    % b2 =  10.^(Mag(39,20,1,k)/20).*sin(Phase(39,20,1,k));
      % display(k);
    goal_component_cos = goal_component_cos + Mag_pow10(goal_index_AZ,goal_index_EL,i,k).*Phase_cos(goal_index_AZ,goal_index_EL,i,k);
    goal_component_sin = goal_component_sin + Mag_pow10(goal_index_AZ,goal_index_EL,i,k).*Phase_sin(goal_index_AZ,goal_index_EL,i,k);
    interference_component_cos = interference_component_cos + Mag_pow10(interference_index_AZ,interference_index_EL,i,k).*Phase_cos(interference_index_AZ,interference_index_EL,i,k);
    interference_component_sin = interference_component_sin + Mag_pow10(interference_index_AZ,interference_index_EL,i,k).*Phase_sin(interference_index_AZ,interference_index_EL,i,k);
    end
    goal_value = (goal_component_cos.^2 + goal_component_sin.^2).^(1/2);
    interference_value = (interference_component_cos.^2 + interference_component_sin.^2).^(1/2);
    goal_value = 20 * (log10(goal_value));
    display(interference_value);
    interference_value = 20 * (log10(interference_value)); %按照dbm和信号幅度的运算公式以及矢量的正交相加减最后求其长度
    display(interference_value);
    display(goal_value);
    %分配权重（重点考虑！！适应度函数很重要，因为这道题有两个变量，如何配置两者的权重就很关键
% if (ans1 < 35)  %首先目标波束一定要为35以上，不然其贡献度瞬间下降，用标记统一化实现
%     bj = 0;
% else
%     bj = 1;
% end
    %权重：50/20；
   % display(ans1);
   % display(ans2);
    objvalue(1,j) = 1/(1+exp((-(goal_value-35.5)*15)))*20*exp((20-interference_value)/10);%对于特定的第一问的两个位置进行计算；

end