T=20/1000; N=1024; dt=1/1000;

t = -T:dt:T;
res = pulsocua(t, T, 1)

subplot(2,1,1), stairs(t,res)

transf = trfa(res, t, N);
xTransf = transf(2,1:end);
yTransf = transf(1,1:end);
subplot(2,1,2),plot( xTransf , yTransf )

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

temp=resultados(1:end,length(resultados)/2:end)
temp2=temp(1:end,1:104)
diffDecib = abs( real( max(temp2(2,1:end)) ) ) - abs( real( min(temp2(2,1:end)) ) )

% frequencias = resultados;
% for i = 1:length(frequencias)
%     if ( frequencias(3,i) == 0 )
%         linalg::delCol(frequencias,i)
%     end
% end