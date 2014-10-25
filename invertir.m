function [ y ] = invertir( x,t )
%invertir Summary of this function goes here
%   Detailed explanation goes here

if (t(1) == -t(end))
    nfin = length(t);
    y = x;
    for n = 1:nfin;
        y(nfin-n+1) = x(n);
    end
else
    error('Error! intervalo de tiempo no simetrico');
end

end

