function main()
clear;
clc;
clc;
clear;  %������в���
popsize = 100;  %��Ⱥ��С
chromlenth = 32;    %Ⱦɫ�峤��
pc = 0.7;   %�������
pm = 0.01;  %�������
pop = initpop(popsize, chromlenth);  %Ⱦɫ�崦��
for i = 1:700
    %������Ӧ��ֵ������ֵ��
    objvalue = cal_objvalue(pop);
    fitvalue = objvalue;
    %ѡ�����
    newpop = selection(pop,fitvalue);
    %�������
    newpop = crossover(newpop,pc);
    %�������
    newpop = mutation(newpop,pm);
    %������Ⱥ
    pop = newpop;
    %Ѱ�����Ž�
    [bestindividual,bestfit] = best(pop,fitvalue);
    display(bestfit);
end
    serve = bestindividual;
    surfdisplay(serve); %�����������е�ͼ��
    display(serve);
end


