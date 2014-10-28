T=20/1000; N=4096; dt=1/6/1000;
f0=280;

t = -T:dt:T;
res1 = desplazar(pulsocua(t, T, 1), t, +T/2);
res2 = cos( 2*pi*f0*(t-T/2) );

res = res1 .* res2;

transf = trfa(res, t, N);

figure, subplot(3,1,1), stairs(t,res1), axis([-0.025 0.025 -0.1 1.1]), xlabel('t'), ylabel('Signal') 
subplot(3,1,2), plot(t,res2), xlabel('t'), ylabel('Signal') 
subplot(3,1,3), plot(t,res), axis([-0.025 0.025 -1.1 1.1]), xlabel('t'), ylabel('Signal') 

figure, plot( transf(2,1:end), real( transf(1,1:end) ) ), xlabel('f'), ylabel('trfa') 

transf([1,2],:) = transf([2,1],:); % intercanvio las filas 1 y 2 de la matriz 
% transf(2,:) = real( transf(2,:) ); % verificare

% derivada
transf(3,1) =  0;
for i = 1:length(transf)-1
    transf(3,i) = ( transf(2,i+1)-transf(2,i) ) / ( transf(1,i+1)-transf(1,i) );
end

% intersecciones eje f
j=1;
for i = 1:length(transf)-1
    if ( transf(2,i)<=0 && transf(2,i+1)>=0 )
        intersecciones(j) = transf(1,i); 
        j = j+1;
    elseif ( transf(2,i)>=0 && transf(2,i+1)<=0 )
        intersecciones(j) = transf(1,i); 
        j = j+1;
    end
end

% max & min relativos
j=1;
for i = 1:length(transf)-1
    if ( transf(3,i)<=0 && transf(3,i+1)>=0 )
        max_min(2,j) = transf(2,i); 
        max_min(1,j) = transf(1,i); 
        j = j+1;
    elseif ( transf(3,i)>=0 && transf(3,i+1)<=0 )
        max_min(2,j) = transf(2,i); 
        max_min(1,j) = transf(1,i); 
        j = j+1;
    end
end

clear i;
clear j;
