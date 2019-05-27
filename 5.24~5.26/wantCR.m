A=[1 1/4 4;4 1 8;1/4 1/8 1]
%%
[V,D]=eig(A);
[x,y]=max(max(D));
disp("λmax=")
disp(x)
%%
CI=(x-3)/2
RI=0.58
disp("CR是否小于0.1？")
CR=CI/RI

%%
k=V(:,y);
disp("标准化特征向量为：")
k=k./sum(k)
clear