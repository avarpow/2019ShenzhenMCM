function main()
init();
process=zeros(1,50000);%统计遗传算法的进步过程
x=(1:50000);
generation=10000;
popsize = 100;  %种群大小
chromlenth = 20;    %染色体长度
pc = 0.7;   %交叉概率
pm = 0.3;  %变异概率
pop = initpop(popsize, chromlenth);  %染色体处理
for i = 1:generation
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
    process(i)=bestfit;
    display(bestfit);
    display(i);
    figure(3);
    plot(x(1:i),process(1:i))
end
    serve = bestindividual;
    figure(4);
    surfdisplay(serve); %生成最优排列的图像
    save txt serve;
    display(serve);
end


