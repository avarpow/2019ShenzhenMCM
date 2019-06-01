function map_display(tau)
    global city_x
    global city_y
    global city_num
    for i = 1:city_num
        for j=1:city_num
            t=tau(i,j);
            if(t<1)
                t=1;
            end
            plot([city_x(i) city_x(j)],[city_y(i) city_y(j)],'k','LineWidth',t);
            hold on;
        end
    end
    