%初期实验的时候整理的数据和大概操作，没什么用的脚本

data = rand(1,32); 
data = 4 * data;    
data = round(data);         %染色体处理

pop_size = 100;
chrom_lenth = 32;
pop = round(4*rand(pop_size, chrom_lenth));    %染色体处理
 


y1 = raw_data.AZ(:,1);
x1 = raw_data.EL(1,:);
Mag = raw_data.LogMag;
Phase = raw_data.Phase;
Mag(find(isnan(Mag))) = 0;
Phase(find(isnan(Phase))) = 0;
Mag(find(isinf(Mag))) = 0;
Phase(find(isinf(Phase))) = 0;  %LogMag和Phase数据处理，将inf和nan全部变成0;

a1 =  10.^(Mag(39,21,1,data(1))/20).*cos(Phase(39,21,1,data(1)));
b1 =  10.^(Mag(39,21,1,data(1))/20).*sin(Phase(39,21,1,data(1)));
a2 =  10.^(Mag(39,20,1,data(1))/20).*cos(Phase(39,20,1,data(1)));
b2 =  10.^(Mag(39,20,1,data(1))/20).*sin(Phase(39,20,1,data(1)));
for i = 2 : 32
    if(data(i) == 0) 
        continue;
    end
a1 = a1 + 10.^(Mag(39,21,i,data(i))/20).*cos(Phase(39,21,i,data(i)));
b1 = b1 + 10.^(Mag(39,21,i,data(i))/20).*sin(Phase(39,21,i,data(i)));
a2 = a2 + 10.^(Mag(39,20,i,data(i))/20).*cos(Phase(39,20,i,data(i)));
b2 = b2 + 10.^(Mag(39,20,i,data(i))/20).*sin(Phase(39,20,i,data(i)));
end
fitvalue1 = (a1.^2 + b1.^2).^(1/2);
fitvalue2 = (a2.^2 + b2.^2).^(1/2);
fitvalue1 = 20 * (log10(fitvalue1)); 
fitvalue2 = 20 * (log10(fitvalue2));  %对于特定的第一问的两个位置进行计算；

% x = 10.^(Mag(:,:,1,data(1))/20).*cos(Phase(:,:,1,data(1)));
% y = 10.^(Mag(:,:,1,data(1))/20).*sin(Phase(:,:,1,data(1)));
% for i = 2 : 32
%     if(data(i) == 0) 
%         continue;
%     end
% x = x + 10.^(Mag(:,:,i,data(i))/20).*cos(Phase(:,:,i,data(i)));
% y = y + 10.^(Mag(:,:,i,data(i))/20).*sin(Phase(:,:,i,data(i)));
% end
% ans = (x.^2 + y.^2).^(1/2);
% ans = 20 * (log10(ans));    %对于每一个特定的染色体，生成整个图像的值；
%surf(x1, y1, ans);

fitvalue1;
fitvalue2;


display(ans(39, 21));
display(ans(39, 20));       %生成图像和特定坐标的值