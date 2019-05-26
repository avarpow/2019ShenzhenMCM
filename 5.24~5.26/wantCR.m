B1=[1 1/8 1/6;8 1 1;6 1 1]
[V,D]=eig(B1);
[x,y]=max(max(D));
disp("¶Àmax «∑Ò–°”⁄3.116£ø")
disp("¶Àmax=")
disp(x)

k=V(:,y);
k=k./sum(k)