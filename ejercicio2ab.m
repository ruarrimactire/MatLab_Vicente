muestreo = 30;
f0 = 100;
f1 = 300;

% t = linspace(0 , 2/f0 , muestreo);
t = [0 : 1/f0/muestreo : 2/f0];
res = 3* cos(2*pi*f0*t+pi/4)
plot(t,res)
% margh = (1/f0/muestreo)
% margv = (max(res)/muestreo)
% axis([0-margh 1/f0+margh min(res)-margv max(res)+margv])
hold on

t2 = [0 : 1/f1/muestreo : 2/f0];
res2 = 2*exp((-200+j*2*pi*f1)*t2);
res2 = real(res2);
plot(t2,res2)
hold off