%交叉变换
%输入变量：pop：五进制的父代种群数，pc：交叉的概率
%输出变量：newpop：交叉后的种群数
function [newpop] = crossover(pop,pc)
[px,py] = size(pop);    %同selection
newpop = ones(size(pop));
for i = 1:2:px-1    %每相邻两个个体就选取
    if(rand<pc) %触发交叉概率
        cpoint = round(rand*py);    %标记交叉互换碱基的位置
        newpop(i,:) = [pop(i,1:cpoint),pop(i+1,cpoint+1:py)]; %将后面全部换掉
        newpop(i+1,:) = [pop(i+1,1:cpoint),pop(i,cpoint+1:py)];
    else
        newpop(i,:) = pop(i,:); %否则继续繁殖
        newpop(i+1,:) = pop(i+1,:);
    end
end