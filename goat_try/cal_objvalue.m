function objvalue = cal_objvalue(pop)
load('C:\Users\16692\Desktop\数学建模\raw_data.mat');
objvalue = ones(1,100);
Mag = raw_data.LogMag;
Phase = raw_data.Phase;
Mag(find(isnan(Mag))) = 0;
Phase(find(isnan(Phase))) = 0;
Mag(find(isinf(Mag))) = 0;
Phase(find(isinf(Phase))) = 0;  %LogMag和Phase数据处理，将inf和nan全部变成0;

a1 = 0;
b1 = 0;
a2 = 0;
b2 = 0;

for j = 1 : 100
    for i = 1 : 32
 %   display(j);
 %   k = pop(1,1);
 %   display(pop(j,1));
    if(pop(j,i) == 0) 
        continue;
    end
    
    k = pop(j,i);
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
ans1 = (a1.^2 + b1.^2)^(1/2);
ans2 = (a2.^2 + b2.^2)^(1/2);
ans1 = 20 * (log10(ans1));
ans2 = 20 * (log10(ans2));

    %分配权重
if (ans1 < 35)
    bj = 0;
else
    bj = 1;
end
    %权重：50/20；
    display(ans1);
    display(ans2);
    objvalue(1,j) = bj*5 + (35-ans2)*4;%对于特定的第一问的两个位置进行计算；

end