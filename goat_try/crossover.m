%����任
%���������pop������Ƶĸ�����Ⱥ����pc������ĸ���
%���������newpop����������Ⱥ��
function [newpop] = crossover(pop,pc)
[px,py] = size(pop);    %ͬselection
newpop = ones(size(pop));
for i = 1:2:px-1    %ÿ�������������ѡȡ
    if(rand<pc) %�����������
        cpoint = round(rand*py);    %��ǽ��滥�������λ��
        newpop(i,:) = [pop(i,1:cpoint),pop(i+1,cpoint+1:py)]; %������ȫ������
        newpop(i+1,:) = [pop(i+1,1:cpoint),pop(i,cpoint+1:py)];
    else
        newpop(i,:) = pop(i,:); %���������ֳ
        newpop(i+1,:) = pop(i+1,:);
    end
end