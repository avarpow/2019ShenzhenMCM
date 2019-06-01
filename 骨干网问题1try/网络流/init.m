function init()
clear all
clc
load route
load route_index
global route
global route_cable
global route_index
global pop_size  
global chromlenth 
global total_requirement
global pop_record
global rate_record
global cost_record
rate_record=[];
cost_record=[];
pop_record=[];
route_cable=route;
pop_size = 100;%种群大小
chromlenth = 21;%染色体长度
route_index(:,20)=route_index(:,20)*1024;
total_requirement=sum(route_index(:,20));
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



