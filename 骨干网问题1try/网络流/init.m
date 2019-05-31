function init()
clear all
clc
load route
load route_index
global route
global route_cable
global route_index
global popsize  
global chromlenth 
global total_requirement
total_requirement=sum(route_index(:,20));
route_cable=route;
popsize = 100;%种群大小
chromlenth = 21;%染色体长度
route_index(:,20)=route_index(:,20)*1024;
[r,c]=size(route_cable);
for i = 1:r
    for j=1:c
        if route_cable(i,j)~=-1
            if route_cable(i,j)<=80
                route_cable(i,j)=8;
            else if route_cable(i,j)<=100
                    route_cable(i,j)=6;
                else if route_cable(i,j)<=200
                        route_cable(i,j)=4;
                    end
                end
            end
        end
    end
end



