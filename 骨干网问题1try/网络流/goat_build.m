function main()
init();
process=zeros(1,50000);%ͳ���Ŵ��㷨�Ľ�������
x=(1:50000);
generation=10000;
popsize = 100;  %��Ⱥ��С
chromlenth = 20;    %Ⱦɫ�峤��
pc = 0.7;   %�������
pm = 0.3;  %�������
pop = initpop(popsize, chromlenth);  %Ⱦɫ�崦��
for i = 1:generation
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
    process(i)=bestfit;
    display(bestfit);
    display(i);
    figure(3);
    plot(x(1:i),process(1:i))
end
    serve = bestindividual;
    figure(4);
    surfdisplay(serve); %�����������е�ͼ��
    save txt serve;
    display(serve);
end


