%���ڱ���
%����˵��
%���������pop���������Ⱥ��pm���������
%���������newpop�����Ժ����Ⱥ
function [newpop] = mutation(pop,pm)
[px,py] = size(pop);    %ͬselection
newpop = ones(size(pop));%��ʼ��
for i = 1:px
    if(rand<pm) %�����������
        mpoint = round(rand*py);    %���ѡȡ����ļ��λ��
       if mpoint <= 0;  %³����
            mpoint = 1;
        end
        newpop(i,:) = pop(i,:);
        %�¼������
        k = newpop(i,mpoint);   %����ԭ�ȵ�λ�ü������
        while(k == newpop(i,mpoint))    %һֱ����ֱ�����ֺ�ԭ��λ�ü�����಻һ�������
            k = round(4*rand(1));
        end
        newpop(i,mpoint) = k;   %���µ�ǰλ�ü������
    else newpop(i,:) = pop(i,:); %��֮��ͻ��
    end
end