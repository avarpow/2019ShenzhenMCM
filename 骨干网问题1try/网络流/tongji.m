clear all
load record62;
for i =1:length(record62)
record62(i).rate=int8(record62(i).rate*100);
end
record63.cost(500000)=0;
record63.rate(500000)=0;
record63.pop(500000,:)=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

for i =1:length(record62)
    if(mod(i,10000)==0)
        disp(i);
    end
record63.cost(i)=record62(i).cost;
record63.rate(i)=record62(i).rate;
record63.pop(i,:)=record62(i).pop(1,:);
end
scatter(record63.rate,record63.cost,0.2);

for i= 1:100
    disp(i);
    index=find(record63.rate == i);
    min=9999;
    min_index=0;
    for j=1:length(index)
        if(record63.cost(index(j))<min)
            min=record63.cost(index(j));
            min_index=index(j);
        end
    end
    min_mat(i)=min;
    min_mat_index(i)=min_index;
end
for i=1:39
    min_mat(1)=[];
end
for i = 40:100
    x(i-39)=i;
end
index=find(min_mat==9999);
while(length(index))
    x(index(1))=[];
    min_mat(index(1))=[];
    index=find(min_mat==9999);
end
polytool(x,min_mat);

%min_mat_index(min_mat_index==0)=[];

