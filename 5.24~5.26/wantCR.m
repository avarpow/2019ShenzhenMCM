A=[1 1/4 4;4 1 8;1/4 1/8 1]
%%
[V,D]=eig(A);
[x,y]=max(max(D));
disp("��max=")
disp(x)
%%
CI=(x-3)/2
RI=0.58
disp("CR�Ƿ�С��0.1��")
CR=CI/RI

%%
k=V(:,y);
disp("��׼����������Ϊ��")
k=k./sum(k)
clear