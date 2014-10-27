T=20/1000; N=4096; dt=1/6/1000;
f0=280;

t = -T:dt:T;
res1 = pulsocua(t, T, 1);
res1 = desplazar(res1, t, +T/2);

res2 = cos( 2*pi*f0*(t-T/2) );
res = res1 .* res2;

transf = trfa(res, t, N);

% subplot(4,1,1), stairs(t,res1)
% subplot(4,1,2), plot(t,res2)
% subplot(4,1,3), plot(t,res)
% subplot(4,1,4),plot( transf(2,1:end) , transf(1,1:end) )

subplot(2,2,1), stairs(t,res1)
subplot(2,2,2), plot(t,res2)
subplot(2,2,3), plot(t,res)
subplot(2,2,4),plot( transf(2,1:end) , transf(1,1:end) )

i=0;
for i = 1:length(yTransf)-1
    if ( yTransf(i)<=0 && yTransf(i+1)>=0 )
        puntos(i) = 1;
    elseif ( yTransf(i)>=0 && yTransf(i+1)<=0 )
        puntos(i) = -1;
    else
        puntos(i) = 0;
    end
end
puntos(i+1) = 0;

resultados = [xTransf ; yTransf ; puntos]