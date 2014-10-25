function [x] = escalon(t)
nfin = length(t);
    for n = 1:nfin ;
        if t(n)<0 
            x(n)=0;
        elseif t(n)>=0
            x(n)=1;
        end
    end
end