muestreo = 100;
f2 = 0.01;
tmin = 0;
tmax = 500;

t = [tmin : tmax/muestreo : tmax];
res = exp(-t/500);
res = [res;cos(2*pi*f2*t)];
res = [res ; 5 .* res(1,1:end) .* res(2,1:end)];

temp = res(1,1:end)
rms = sqrt( sum(temp.^2)/length(temp) );
rms2 = [1:101].^0 .* rms
res = [res ; rms2]

temp = res(2,1:end)
rms = sqrt( sum(temp.^2)/length(temp) );
rms2 = [1:101].^0 .* rms
res = [res ; rms2]

temp = res(3,1:end)
rms = sqrt( sum(temp.^2)/length(temp) );
rms2 = [1:101].^0 .* rms
res = [res ; rms2]

% res = 5   .*   exp(-t/500)  .*   cos(2*pi*f2*t)
plot(t,res)
hold on
legend('Esponenziale', 'Periodica', 'Moltip*5','RMS expon', 'RMS period', 'RMS moltip*5')
hold off
