function flag=bfs(route_weight)
    global pre;
    global rest
    maxn=20;
    rest=route_weight;%²ĞÓàÍøÂç
    visit=zeros(1,20);
    pre=zeros(1,20);
    pre=int8(pre);
    s=1;%Ô´µã
    t=20;%³¬¼¶»ã
    head=1;
    tail=1;
    queue(head)=1;
    visit(1)=1;
    head=head+1;
    while(tail~=head)
        i=queue(tail);
        tail=tail+1;
        for j= 1:maxn
            if(rest(i,j)>0 && visit(j)~=1)
                pre(j)=i;
                visit(j)=1;
                if j==t
                    flag=1;
                    return
                end
                queue(head)=j;
                head=head+1;
            end
        end
    end
    flag=0;
    return
end

                
    

