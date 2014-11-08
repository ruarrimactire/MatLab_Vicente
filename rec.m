function [xrec]=rec(fs, f)
% fs = frequencia de muestreo
% f = frequeccia de la se�al que se qiere mostrar

Ts=1/fs;
tc=0.001*Ts;
TC = (0:tc:1);
TS = (0:Ts:1);

xc=cos(2*pi*f*TC); % se�al continua
xd=cos(2*pi*f*TS); % se�al muestreada
stem(TS,xd)
hold on
xrec=[0 xd];
plot(TC,xc,'g',Ts:Ts:1,xrec(2:end-1),'k'), grid 
hold off

end