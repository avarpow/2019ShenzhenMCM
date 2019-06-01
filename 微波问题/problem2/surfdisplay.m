function surfdisplay(serve) %用来打印最优解的三维图
load raw_data
global Phase_cos
global Phase_sin
global Mag_pow10
y1 = raw_data.AZ(:,1);
x1 = raw_data.EL(1,:);
x = zeros(73, 37);
y = zeros(73, 37);
for i = 1 : 32
    if(serve(i) == 0) 
        continue;
    end
x = x + Mag_pow10(:,:,i,serve(i)).*Phase_cos(:,:,i,serve(i));
y = y + Mag_pow10(:,:,i,serve(i)).*Phase_sin(:,:,i,serve(i));
end
field_ans = (x.^2 + y.^2).^(1/2);
field_ans =  20 * (log10(field_ans));    %对于每一个特定的染色体，生成整个图像的值；
surf(x1, y1, field_ans);
figure;
contourf(x1, y1, field_ans);