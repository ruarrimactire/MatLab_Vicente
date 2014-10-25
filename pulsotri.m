function [ x ] = pulsotri( t,tau,A )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
nfin = length(t);
x(nfin) = 0;
for n= 1:nfin;
    if ( t(n)>-tau/2 ) && (t(n)<0 )
        x(n) = A/(tau/2)*t(n)+A;
    elseif (t(n)<tau/2) &&(t(n)>0 )
        x(n) = -A/(tau/2)*t(n)+A;
    elseif t(n)==0
        x(n)=A;
    else
        x(n)=0;
    end
end

end

