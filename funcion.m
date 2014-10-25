tmin = -2;
tmax = 2;
muestreo = 300;
t = [tmin : (tmax-tmin)/muestreo : tmax];
x= escalon(t);

% ploteo de escalon
% stem(t,x,'.');
stairs(t,x);
axis([-3 3 -.5 1.5])
xlabel('t')
ylabel('Signal') 

% ploteo de delta de Dirac
stairs( t, delta(t, 1) );
axis([-3 3 -.5 1.5])
xlabel('t')
ylabel('Signal') 

% ploteo del pulso cuadrado
stairs( t, pulsocua(t,1,1) );
axis([-3 3 -3 3])
xlabel('t')
ylabel('Signal') 

% ploteo del pulso triangular
result = pulsotri(t,1,1);
plot( t, result );
axis([-3 3 -3 3])
xlabel('t')
ylabel('Signal') 

% ploteo del escalon invertido
result = escalon(t);
result = invertir(result , t);
plot( t, result );
axis([-3 3 -3 3])
xlabel('t')
ylabel('Signal') 

% ploteo del pulso triangular desplazado
result = pulsotri(t,1,1);
subplot(2,1,1) , plot( t, result );
axis([-3 3 -3 3])
xlabel('t')
ylabel('Signal')
title('original')
result2 = desplazar(result , t, -1);
subplot(2,1,2) , plot( t, result2 );
axis([-3 3 -3 3])
xlabel('t')
ylabel('Signal')
title('desplazada')


