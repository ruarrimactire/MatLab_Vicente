function [ output ] = trfa( x, t, N )
%trfa Transformada de Fourier Aproximada
%   Detailed explanation goes here

temp1 = log(N)/log(2);
temp2 = floor(temp1);
if ( (N >= length(x)) && temp1==temp2 )
    Fmax = 1/( 2 * (t(2)-t(1)) );
    k = -N/2:(N/2)-1;
    df = 2*Fmax/N;
    f = k.*df;

    X = f .* 0;
    for w = 1:length(X)
        for n = 1:length(x)-1
            X(w) = X(w) + x(n) * exp( -1i*2*pi*f(w)*t(n) ) * (t(n+1) - t(n)) ;
        end
    end    
    output = [X;f];
    
elseif ( ~(N >= length(x)) )
    error('el parametro N es demasiado pequeño')
    
elseif ( ~temp1==temp2 )
    error('el parametro N no es potencia de 2')
end

end
