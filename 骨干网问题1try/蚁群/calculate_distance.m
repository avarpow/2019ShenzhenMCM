function [dis]=calculate_distance()
global city_x
global city_y
global normalization_factor%将像素差距转换为km的要乘以的系数
dis=zeros(length(city_x),length(city_y));
for i = 1:length(city_x)
    for j = 1:length(city_y)
        dis(i,j)=((city_x(i)-city_x(j))^2+(city_y(i)-city_y(j))^2)^(1/2)*normalization_factor;
        if(dis(i,j)>=200 || dis(i,j)==0)
            dis(i,j)=-1;
        end
    end
end