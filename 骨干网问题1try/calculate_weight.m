function weight=calculate_weight()
dis=calculate_distance();
req=get_requirement();
weight=1./dis;
[r,c]=size(dis);
for i =1:r
    for j=1:c
        if weight(i,j)~=-1
            weight(i,j)=weight(i,j)*(req(i)+req(j));
        end
    end
end
