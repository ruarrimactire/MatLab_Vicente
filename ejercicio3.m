muestreo = 100;
f2 = 0.01;
tmin = 0;
tmax = 500;

t = [tmin : tmax/muestreo : tmax];
res = 5   .*   exp(-t/500)  .*   cos(2*pi*f2*t)
plot(t,res)
