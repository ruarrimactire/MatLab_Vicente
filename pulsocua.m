function [ y ] = pulsocua( t, tau, A )
%pulsocua Summary of this function goes here
%   Detailed explanation goes here
nfin= length(t);
y = [1:nfin] .* 0;
for n = 1:nfin
    if (t(n)<=+tau/2) && (t(n)>=-tau/2)    
        y(n) = A; 
    end
end

end

