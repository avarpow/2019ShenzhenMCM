function surfdisplay(serve) %用来打印最优解的三维图
load 'raw_data.mat';
Mag = raw_data.LogMag;
Phase_raw = raw_data.Phase;
Phase=Phase_raw/180*pi;
Mag(find(isnan(Mag))) = 0;
Phase(find(isnan(Phase))) = 0;
Mag(find(isinf(Mag))) = 0;
Phase(find(isinf(Phase))) = 0;  
y1 = raw_data.AZ(:,1);
x1 = raw_data.EL(1,:);
x = zeros(73, 37);
y = zeros(73, 37);
for i = 1 : 32
    if(serve(i) == 0) 
        continue;
    end
x = x + 10.^(Mag(:,:,i,serve(i))/20).*cos(Phase(:,:,i,serve(i)));
y = y + 10.^(Mag(:,:,i,serve(i))/20).*sin(Phase(:,:,i,serve(i)));
end
ans = (x.^2 + y.^2).^(1/2);
ans = 20 * (log10(ans));    %对于每一个特定的染色体，生成整个图像的值；
surf(x1, y1, ans);
figure();
contourf(x1, y1, ans);