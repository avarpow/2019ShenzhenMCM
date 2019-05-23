function objvalue = cal_objvalue(pop)
load 'raw_data.mat';
objvalue = ones(1,100);
Mag = raw_data.LogMag;
Phase = raw_data.Phase;
Mag(find(isnan(Mag))) = 0;
Phase(find(isnan(Phase))) = 0;
Mag(find(isinf(Mag))) = 0;
Phase(find(isinf(Phase))) = 0;  %LogMag��Phase���ݴ�����inf��nanȫ�����0;
interference_AZ=10;%���ŵ㸩�����±�
interference_EL=10;%���ŵ�ˮƽ���±�
goal_AZ=10;%Ŀ��㸩�����±�
goal_EL=5;%Ŀ���ˮƽ��
goal_index_AZ=(goal_AZ+180)/5+1;%Ŀ���ˮƽ�ǵ��±�=39
goal_index_EL=(goal_EL+90)/5+1;%Ŀ��㸩���ǽǵ��±�=20
interference_index_AZ=(interference_AZ+180) / 5 + 1;%���ŵ�ˮƽ���±�=39
interference_index_EL=(interference_EL+90 ) / 5 + 1;%���ŵ㸩�����±�=21
for j = 1 : 100
goal_component_cos = 0; %��ʼ��Ŀ��ֵ������ֵ
goal_component_sin = 0;%
interference_component_cos = 0;
interference_component_sin= 0;
goal_value = 0;
interference_value = 0;

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
    goal_component_cos = goal_component_cos + 10^((Mag(goal_index_AZ,goal_index_EL,i,k))/20.*cos(Phase(goal_index_AZ,goal_index_EL,i,k)));
    goal_component_sin = goal_component_sin + 10^((Mag(goal_index_AZ,goal_index_EL,i,k))/20.*sin(Phase(goal_index_AZ,goal_index_EL,i,k)));
    interference_component_cos = interference_component_cos + 10^((Mag(interference_index_AZ,interference_index_EL,i,k))/20.*cos(Phase(interference_index_AZ,interference_index_EL,i,k)));
    interference_component_cos = interference_component_cos + 10^((Mag(interference_index_AZ,interference_index_EL,i,k))/20.*sin(Phase(interference_index_AZ,interference_index_EL,i,k)));
    end
goal_value = (goal_component_cos.^2 + goal_component_sin.^2)^(1/2);
interference_value = (interference_component_cos.^2 + interference_component_sin.^2)^(1/2);
goal_value = 20 * (log10(goal_value));
interference_value = 20 * (log10(interference_value)); %����dbm���źŷ��ȵ����㹫ʽ�Լ�ʸ����������Ӽ�������䳤��

    %����Ȩ�أ��ص㿼�ǣ�����Ӧ�Ⱥ�������Ҫ����Ϊ���������������������������ߵ�Ȩ�ؾͺܹؼ�
% if (ans1 < 35)  %����Ŀ�겨��һ��ҪΪ35���ϣ���Ȼ�乱�׶�˲���½����ñ��ͳһ��ʵ��
%     bj = 0;
% else
%     bj = 1;
% end
    %Ȩ�أ�50/20��
   % display(ans1);
   % display(ans2);
    objvalue(1,j) = 1/(1+exp((-(goal_value-35.5)*15)))*20*exp((37-interference_value)/2);%�����ض��ĵ�һ�ʵ�����λ�ý��м��㣻

end