tmin = -2;
tmax = 2;
muestreo = 300;
t = [tmin : (tmax-tmin)/muestreo : tmax];
x= escalon(t);

% ploteo de escalon
% stem(t,x,'.');
figure, stairs(t,x), axis([-3 3 -.5 1.5]), xlabel('t'), ylabel('Signal') 

% ploteo de delta de Dirac
figure, stairs( t, delta(t, 1) ), axis([-3 3 -.5 1.5]), xlabel('t'), ylabel('Signal') 

% ploteo del pulso cuadrado
figure, stairs( t, pulsocua(t,1,1) ), axis([-3 3 -3 3]), xlabel('t'), ylabel('Signal') 

% ploteo del pulso triangular
figure, plot( t, pulsotri(t,1,1) ), axis([-3 3 -3 3]), xlabel('t'), ylabel('Signal') 

% ploteo del escalon invertido
invertido = invertir(escalon(t) , t);
figure, plot( t, invertido ), axis([-3 3 -3 3]), xlabel('t'), ylabel('Signal') 

% ploteo del pulso triangular desplazado
triangular = pulsotri(t,1,1);
figure, subplot(2,1,1) , plot( t, triangular ), axis([-3 3 -3 3]), xlabel('t'), ylabel('Signal')
title('original')
subplot(2,1,2) , plot( t, desplazar(triangular , t, -1) ), axis([-3 3 -3 3]), xlabel('t'), ylabel('Signal')
title('desplazada')

% ploteo del pulso cuadrado desplazado
cuadrado = pulsocua(t,1,1);
figure, subplot(2,1,1) , stairs( t, cuadrado ), axis([-3 3 -3 3]), xlabel('t'), ylabel('Signal')
title('original')
subplot(2,1,2) , stairs( t, desplazar(cuadrado, t, 1/2) ), axis([-3 3 -3 3]), xlabel('t'), ylabel('Signal')
title('desplazada')


