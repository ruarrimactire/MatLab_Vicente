T=2;                                     % periodo de muestreo
fs=128;                                  % frecuencia de muestreo
t=[0:1/fs:T];                            % puntos de muestreo
N=length(t);
f=sin(10*2*pi*t)+sin(20*2*pi*t);         % se�al original
g=f+randn(size(f));                      % se�al con ru�do
F=fft(f)/sqrt(N);                        % trasformada de Fourier de f
G=fft(g)/sqrt(N);                        % trasformada de Fourier de g
% Para dibujarlo, despreciamos la mitad del dominio debido a la simetr�a
omega=0.5*fs*linspace(0,1,floor(N/2)+1); % vector de frecuencias discretas
range=(1:floor(N/2)+1);                  % rango del espectro de potencia
P=F(range).*conj(F(range));              % espectro de potencia de la se�al f
Q=G(range).*conj(G(range));              % espectro de potencia de la se�al g
figure, plot(t,f), xlabel('time'), ylabel('f'),title('se�al original')
figure, plot(t,g), xlabel('time'), ylabel('g'),title('se�al con ru�do')

% figure, plot(omega,F(range)), xlabel('frequency'), ylabel('P'),title('Espectro de potencia de la se�al f')
% figure, plot(omega,G(range)), xlabel('frequency'), ylabel('Q'),title('Espectro de potencia de la se�al g')

figure, plot(omega,P), xlabel('frequency'), ylabel('P'),title('Espectro de potencia de la se�al f')
figure, plot(omega,Q), xlabel('frequency'), ylabel('Q'),title('Espectro de potencia de la se�al g')

