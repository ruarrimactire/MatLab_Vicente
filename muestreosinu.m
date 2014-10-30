function [xa,xs]=muestreosinu(f0,Ts)
% f0 es la frecuencia de la sinusoide continua en Hz
% Ts es el periodo de muestreo en segundos
% xa contiene los valores de la se�al continua
% xs contiene los valores de la se�al discreta (muestras)
T0 = 1/f0;
t = [0:2*T0/10000:2*T0];
xa = cos(2*pi*f0*t);
subplot(2,1,1)
plot(t, xa)
grid
xlabel('Tiempo continuo (s)','Fontsize',8)
ylabel('Amplitud','Fontsize',8)
title('Se�al continua x_a(t)')
axis([0 2*T0 -1.5 1.5]);
nTs = [0:Ts:2*T0];
xs = cos(2*pi*f0*nTs);
n = 0:length(nTs)-1;
subplot(2,1,2)
stem(n, xs)
grid
textox=['Tiempo discreto (n). T_s=',num2str(Ts*1000),' ms'];
xlabel(textox,'Fontsize',8)
ylabel('Amplitud','Fontsize',8)
title('Se�al discreta x[n]=x_a(nT_s)')
axis([0 2*T0/Ts -1.5 1.5])
end