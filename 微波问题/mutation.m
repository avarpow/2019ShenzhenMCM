%关于编译
%函数说明
%输入变量：pop：五进制种群，pm：变异概率
%输出变量：newpop变异以后的种群
function [newpop] = mutation(pop,pm)
[px,py] = size(pop);    %同selection
newpop = ones(size(pop));%初始化
for i = 1:px
    if(rand<pm) %触发变异概率
        mpoint = round(rand*py);    %随机选取变异的碱基位置
       if mpoint <= 0;  %鲁棒性
            mpoint = 1;
        end
        newpop(i,:) = pop(i,:);
        %新加入变异
        k = newpop(i,mpoint);   %保存原先的位置碱基种类
        while(k == newpop(i,mpoint))    %一直更新直到出现和原先位置碱基种类不一样的情况
            k = round(4*rand(1));
        end
        newpop(i,mpoint) = k;   %更新当前位置碱基种类
    else newpop(i,:) = pop(i,:); %反之不突变
    end
end