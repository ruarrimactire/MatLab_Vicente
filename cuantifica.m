function [ xq ] = cuantifica( x, xmax, b )
%cuantifica Summary of this function goes here
%   Detailed explanation goes here

xq = x .* 0;
for i = 1:length(x)
    if abs(x(i)) < xmax
        xq(i) = fix( abs(x(i))/(xmax/b) ) * (xmax/b) * sign(x(i));
    else
        xq(i) = (b-1)/2 * (xmax/b) * sign(x(i));
    end
end

t = 0:length(x)-1;
subplot(2,1,1)
plot(t, x)
grid
xlabel('Tiempo continuo (s)','Fontsize',8)
ylabel('Amplitud','Fontsize',8)
textoTitle = ['Señal muestreada x(t)'];
title(textoTitle)
axis([0 max(t) -1.5 1.5]);

subplot(2,1,2)
plot(t, xq)
grid
xlabel('Tiempo continuo (s)','Fontsize',8)
ylabel('Amplitud','Fontsize',8)
textoTitle = ['Señal cuantificada a ', num2str(b), ' bits'];
title(textoTitle)
axis([0 max(t) -1.5 1.5])

end

