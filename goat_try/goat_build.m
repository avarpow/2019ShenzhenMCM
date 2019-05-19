function main()
clear;
clc;
clc;
clear;  %清空所有操作
popsize = 100;  %种群大小
chromlenth = 32;    %染色体长度
pc = 0.7;   %交叉概率
pm = 0.01;  %变异概率
pop = initpop(popsize, chromlenth);  %染色体处理
for i = 1:700
    %计算适应度值（函数值）
    objvalue = cal_objvalue(pop);
    fitvalue = objvalue;
    %选择操作
    newpop = selection(pop,fitvalue);
    %交叉操作
    newpop = crossover(newpop,pc);
    %变异操作
    newpop = mutation(newpop,pm);
    %更新种群
    pop = newpop;
    %寻找最优解
    [bestindividual,bestfit] = best(pop,fitvalue);
    display(bestfit);
end
    serve = bestindividual;
    surfdisplay(serve); %生成最优排列的图像
    display(serve);
end


