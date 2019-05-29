function main()
init();
dis=calculate_distance();%各个城市距离邻接矩阵，不能到达标记为-1
weight=calculate_weight();%取得每条边的权重(综合距离和信息需求量)
global tau
generations=10;
for i = 1:generations
    pop=creat_pop();%随机返回蚂蚁种群
    tau=ant_move(pop,weight,tau);%蚂蚁移动，并且更新信息素矩阵
    clf;
    map_display(tau);
    pause(1);
end
map_display(tau);
    

