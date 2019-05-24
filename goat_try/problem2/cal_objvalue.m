function objvalue = cal_objvalue(pop)
load 'raw_data.mat';
objvalue = ones(1,100);
Mag = raw_data.LogMag;
Phase = raw_data.Phase;
Mag(find(isnan(Mag))) = 0;
Phase(find(isnan(Phase))) = 0;
Mag(find(isinf(Mag))) = 0;
Phase(find(isinf(Phase))) = 0;  %LogMag和Phase数据处理，将inf和nan全部变成0;
range_AZ_min_index=(-30+180)/5+1;%范围水平角最小边界
range_AZ_max_index= (30+180)/5+1;%范围水平角最大边界
range_EL_min_index=(-15+90)/5+1;%范围俯仰角最小边界
range_EL_max_index= (15+90)/5+1;%范围俯仰角最大边界
for j = 1 : 100
mix_field_average=0;
mix_field_cos=zeros(360/5+1,180/5+1);
mix_field_sin=zeros(360/5+1,180/5+1);
mix_field_value=zeros(360/5+1,180/5+1);
    for i = 1 : 32
 %   display(j);
 %   k = pop(1,1);
 %   display(pop(j,1));
        if(pop(j,i) == 0) %假如遇到有关闭的情况就直接跳过
            continue;
        end
    
       k = pop(j,i);   
    mix_field_cos = mix_field_cos + 10.^((Mag(:,:,i,k))/20).*cos(Phase(:,:,i,k));%矢量叠加横轴
    mix_field_sin = mix_field_sin + 10.^((Mag(:,:,i,k))/20).*sin(Phase(:,:,i,k));%矢量叠加纵轴
    end
    mix_field_value = (mix_field_cos.^2 + mix_field_sin.^2).^(1/2);%是强度值不是dbm单位
    %mix_field_value = 20 * (log10(mix_field_value));
    for az = range_AZ_min_index:range_AZ_max_index
        for el = range_EL_min_index:range_EL_max_index
            mix_field_average = mix_field_average + mix_field_value(az,el);
        end
    end
    mix_field_average=mix_field_average/((range_AZ_max_index-range_AZ_min_index)+1)/((range_EL_max_index-range_EL_min_index)+1);
    mix_field_average=20 * (log10(mix_field_average));%强度值转换为dbm单位
    %display(mix_field_average);
    %display(i)
    %display(mix_field_average)
     %按照dbm和信号幅度的运算公式以及矢量的正交相加减最后求其长度

        %分配权重（重点考虑！！适应度函数很重要，因为这道题有两个变量，如何配置两者的权重就很关键
    % if (ans1 < 35)  %首先目标波束一定要为35以上，不然其贡献度瞬间下降，用标记统一化实现
    %     bj = 0;
    % else
    %     bj = 1;
    % end
    %权重：50/20；
   % display(ans1);
   % display(ans2);
    objvalue(1,j) = 1/(1+exp(-(mix_field_average-35.3)));%exp(mix_field_average-20);%对于特定的第一问的两个位置进行计算；

end