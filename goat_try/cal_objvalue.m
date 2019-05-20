function objvalue = cal_objvalue(pop)
load 'raw_data.mat';
objvalue = ones(1,100);
Mag = raw_data.LogMag;
Phase = raw_data.Phase;
Mag(find(isnan(Mag))) = 0;
Phase(find(isnan(Phase))) = 0;
Mag(find(isinf(Mag))) = 0;
Phase(find(isinf(Phase))) = 0;  %LogMag和Phase数据处理，将inf和nan全部变成0;


for j = 1 : 100
a1 = 0; %初始化ans1和ans2的x轴和y轴，还有ans1和ans2本身
b1 = 0;
a2 = 0;
b2 = 0;
ans1 = 0;
ans2 = 0;

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
 %   display(k);
a1 = a1 + 10^((Mag(39,21,i,k))/20.*cos(Phase(39,21,i,k)));
b1 = b1 + 10^((Mag(39,21,i,k))/20.*sin(Phase(39,21,i,k)));
a2 = a2 + 10^((Mag(39,20,i,k))/20.*cos(Phase(39,20,i,k)));
b2 = b2 + 10^((Mag(39,20,i,k))/20.*sin(Phase(39,20,i,k)));
end
ans1 = (a2.^2 + b2.^2)^(1/2);
ans2 = (a1.^2 + b1.^2)^(1/2);
ans1 = 20 * (log10(ans1));
ans2 = 20 * (log10(ans2)); %按照dbm和信号幅度的运算公式以及矢量的正交相加减最后求其长度

    %分配权重（重点考虑！！适应度函数很重要，因为这道题有两个变量，如何配置两者的权重就很关键
if (ans1 < 35)  %首先目标波束一定要为35以上，不然其贡献度瞬间下降，用标记统一化实现
    bj = 0;
else
    bj = 1;
end
    %权重：50/20；
    display(ans1);
    display(ans2);
    objvalue(1,j) = (1/(1+exp(-ans1+38)))*20*exp((37-ans2)/2);%对于特定的第一问的两个位置进行计算；

end