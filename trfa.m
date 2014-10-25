function [ output ] = trfa( x, t, N )
%trfa Transformada de Fourier Aproximada
%   Detailed explanation goes here
% if N >= length(x)
% if N == 2^n

f =  -N/2:(N/2)-1;
% X = fft(x,N);

X = f .* 0;
for k = 1:N
    for n = 1:length(x)-1
        X(k) = X(k) + x(n) * exp( -1i*2*pi*f(k)*t(n) ) * (t(n+1) - t(n)) ;
    end
end    

output = [X;f];

end

