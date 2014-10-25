function [ x ] = delta( t,A )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
nfin = length(t);
    for n = 1:nfin ;
        if t(n)~=0 
            x(n)=0;
        elseif t(n)==0
            x(n)=1*A;
        end
    end
end

