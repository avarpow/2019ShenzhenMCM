function objvalue = cal_objvalue(pop)
load 'raw_data.mat';
objvalue = ones(1,100);
Mag = raw_data.LogMag;
Phase = raw_data.Phase;
Mag(find(isnan(Mag))) = 0;
Phase(find(isnan(Phase))) = 0;
Mag(find(isinf(Mag))) = 0;
Phase(find(isinf(Phase))) = 0;  %LogMag��Phase���ݴ�����inf��nanȫ�����0;


for j = 1 : 100
a1 = 0; %��ʼ��ans1��ans2��x���y�ᣬ����ans1��ans2����
b1 = 0;
a2 = 0;
b2 = 0;
ans1 = 0;
ans2 = 0;

    for i = 1 : 32
 %   display(j);
 %   k = pop(1,1);
 %   display(pop(j,1));
    if(pop(j,i) == 0) %���������йرյ������ֱ������
        continue;
    end
    
    k = pop(j,i);   %ȡ����ǰ�����÷�ʽ
% a1 =  10.^(Mag(39,21,1,k)/20).*cos(Phase(39,21,1,k));
% b1 =  10.^(Mag(39,21,1,k)/20).*sin(Phase(39,21,1,k));
% a2 =  10.^(Mag(39,20,1,k)/20).*cos(Phase(39,20,1,k));
% b2 =  10.^(Mag(39,20,1,k)/20).*sin(Phase(39,20,1,k));
 %   display(k);
a1 = a1 + 10^((Mag(39,21,i,k))/20.*cos(Phase(39,21,i,k)));
b1 = b1 + 10^((Mag(39,21,i,k))/20.*sin(Phase(39,21,i,k)));
a2 = a2 + 10^((Mag(39,20,i,k))/20.*cos(Phase(39,20,i,k)));
b2 = b2 + 10^((Mag(39,20,i,k))/20.*sin(Phase(39,20,i,k)));
end
ans1 = (a2.^2 + b2.^2)^(1/2);
ans2 = (a1.^2 + b1.^2)^(1/2);
ans1 = 20 * (log10(ans1));
ans2 = 20 * (log10(ans2)); %����dbm���źŷ��ȵ����㹫ʽ�Լ�ʸ����������Ӽ�������䳤��

    %����Ȩ�أ��ص㿼�ǣ�����Ӧ�Ⱥ�������Ҫ����Ϊ���������������������������ߵ�Ȩ�ؾͺܹؼ�
if (ans1 < 35)  %����Ŀ�겨��һ��ҪΪ35���ϣ���Ȼ�乱�׶�˲���½����ñ��ͳһ��ʵ��
    bj = 0;
else
    bj = 1;
end
    %Ȩ�أ�50/20��
    display(ans1);
    display(ans2);
    objvalue(1,j) = (1/(1+exp(-ans1+38)))*20*exp((37-ans2)/2);%�����ض��ĵ�һ�ʵ�����λ�ý��м��㣻

end