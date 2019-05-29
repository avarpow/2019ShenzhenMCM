function init()
clear all
clc
load route
global route
[r,c]=size(route);
for i = 1:r
    for j=1:r
        if route(i,j)~=-1
            if route(i,j)<=80
                route(i,j)=2;
            else if route(i,j)<=100
                    route(i,j)=3;
                else if route(i,j)<=200
                        route(i,j)=4;
                    end
                end
            end
        end
    end
end


