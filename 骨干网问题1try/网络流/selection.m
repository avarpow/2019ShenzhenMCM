%���ѡ���µĸ���
%���������pop�������Ⱥ��fitvalue����Ӧ��ֵ
%���������newpopѡ���Ժ���������Ⱥ
function [newpop] = selection(pop,fitvalue)
%��������
[px,py] = size(pop);    %px����Ⱥ��С��py��Ⱦɫ�峤��
totalfit = sum(fitvalue);   %�������Ŀ�꺯��
p_fitvalue = fitvalue/totalfit; %���ÿһ�������������������Ⱥ�еı���
p_fitvalue = cumsum(p_fitvalue);%����ǰ׺������
ms = sort(rand(px,1));%���ѡȡ100������������С��������
fitin = 1;  %��ʼ��ɸѡ
newin = 1;
while newin<=px
    if(ms(newin)) < p_fitvalue(fitin) %�����ѡȡ�ĸ�����С�ڵ�ǰ�ĸ�����أ�������ռ���ƣ���ֳ
        newpop(newin,:)=pop(fitin,:); 
        newin = newin+1;
    else
        fitin=fitin+1; %��֮�˸�
    end
end