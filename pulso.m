T=20/1000; N=1024; dt=1/1000;

t = -T:dt:T;
res = pulsocua(t, T, 1);

subplot(2,1,1), stairs(t,res), axis([-0.025 0.025 -0.1 1.1])

transf = trfa(res, t, N);
subplot(2,1,2), plot( transf(2,1:end) , real( transf(1,1:end) ) )

transf([1,2],:) = transf([2,1],:); % intercanvio las filas 1 y 2 de la matriz 

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
        max_min(2,j) = abs( real( transf(2,i) ) ); 
        max_min(1,j) = transf(1,i); 
        j = j+1;
    elseif ( transf(3,i)>=0 && transf(3,i+1)<=0 )
        max_min(2,j) = abs( real( transf(2,i) ) ); 
        max_min(1,j) = transf(1,i); 
        j = j+1;
    end
end

clear i;
clear j;

% differencia en decibelios entre el primer y el segundo lobulo
diffDecib1 = abs( max( real(transf(2,1:end)) ) ) - abs( min( real(transf(2,1:end)) ) )
diffDecib2 = abs( real( max(transf(2,1:end)) ) ) - abs( real( min(transf(2,1:end)) ) )

% frequencias = resultados;
% for i = 1:length(frequencias)
%     if ( frequencias(3,i) == 0 )
%         linalg::delCol(frequencias,i)
%     end
% end