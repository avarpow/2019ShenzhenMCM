function pop=creat_pop()
global city_num
global ant_num
ant_num=100;
pop=zeros(1,ant_num);
for i = 1:ant_num
    pop(i)=unidrnd(city_num);
end
