function [ result ]=muestreosinu(f0,Ts)
% f0 es la frecuencia de la sinusoide continua en Hz
% Ts es el periodo de muestreo en segundos
% xa contiene los valores de la señal continua
% xs contiene los valores de la señal discreta (muestras)
T0 = 1/f0;
t = [0:2*T0/10000:2*T0];
xa = cos(2*pi*f0*t);
subplot(2,1,1)
plot(t, xa)
grid
xlabel('Tiempo continuo (s)','Fontsize',8)
ylabel('Amplitud','Fontsize',8)
textox0=['Señal continua x_a(t) con freq = ', num2str(f0/1000), ' kHz'];
title(textox0)
axis([0 2*T0 -1.5 1.5]);
nTs = [0:Ts:2*T0];
xs = cos(2*pi*f0*nTs);
n = 0:length(nTs)-1;
subplot(2,1,2)
stem(n, xs,'.')
grid
textox=['Tiempo discreto (n). T_s=',num2str(Ts*1000),' ms'];
xlabel(textox,'Fontsize',8)
ylabel('Amplitud','Fontsize',8)
title('Señal discreta x[n]=x_a(nT_s)')
axis([0 2*T0/Ts -1.5 1.5])
xs = [xs;n];
xs(1,length(xa)) = 0;
xa = [xa;t];
result = [xa;xs];
end