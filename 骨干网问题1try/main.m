function main()
init();
dis=calculate_distance();%�������о����ڽӾ��󣬲��ܵ�����Ϊ-1
weight=calculate_weight();%ȡ��ÿ���ߵ�Ȩ��(�ۺϾ������Ϣ������)
global tau
generations=10;
for i = 1:generations
    pop=creat_pop();%�������������Ⱥ
    tau=ant_move(pop,weight,tau);%�����ƶ������Ҹ�����Ϣ�ؾ���
    clf;
    map_display(tau);
    pause(1);
end
map_display(tau);
    

