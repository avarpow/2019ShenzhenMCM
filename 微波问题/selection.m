%如何选择新的个体
%输入变量：pop五进制种群，fitvalue：适应度值
%输出变量：newpop选择以后的五进制种群
function [newpop] = selection(pop,fitvalue)
%构造轮盘
[px,py] = size(pop);    %px是种群大小，py是染色体长度
totalfit = sum(fitvalue);   %求和所有目标函数
p_fitvalue = fitvalue/totalfit; %求出每一个个体求出其在整个种群中的比重
p_fitvalue = cumsum(p_fitvalue);%概率前缀和排序
ms = sort(rand(px,1));%随机选取100个概率数并从小到大排列
fitin = 1;  %初始化筛选
newin = 1;
while newin<=px
    if(ms(newin)) < p_fitvalue(fitin) %当随机选取的概率数小于当前的个体比重，即个体占优势，繁殖
        newpop(newin,:)=pop(fitin,:); 
        newin = newin+1;
    else
        fitin=fitin+1; %反之阉割
    end
end