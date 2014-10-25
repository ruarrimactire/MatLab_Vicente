T=20; N=1024; dt=1;

t = -T:dt:T;
res = pulsocua(t, T, 1)
% res = t .^ 0;
% for i = 1:length(t)
%     for n = 1:i
%         res(i) = res(i) * t(n)/T;
%     end
% end
% clear i;
% clear n;

subplot(2,1,1), stairs(t,res)

transf = trfa(res, t, N);
xTransf = transf(2,1:end);
yTransf = transf(1,1:end);
subplot(2,1,2),plot( xTransf , yTransf )

cut = length(xTransf)/2
xTransf = xTransf(cut:end);
yTransf = yTransf(cut:end);
yModTransf = yTransf.*conj(yTransf);
subplot(2,1,2),plot( xTransf , yTransf )
