T=20; N=4096; dt=1/6;
f0=280;

t = -T:dt:T;
res1 = pulsocua(t, T, 1);
res1 = desplazar(res1, t, +T/2);
% res1 = t .^ 0;
% for i = 1:length(t)
%     for n = 1:i
%         res1(i) = res1(i) * (t(n)-T/2)/T;
%     end
% end
% clear i;
% clear n;

% res2 = t .^ 0;
% for i = 1:length(t)
%     res2(i) = cos( 2*pi*f0*(t(i)-T/2) );
% end
% clear i;
res2 = cos( 2*pi*f0*(t-T/2) );
res = res1.*res2;

transf = trfa(res, t, N);
plot( transf(2,1:end) , transf(1,1:end) )

subplot(4,1,1), stairs(t,res1)
subplot(4,1,2), plot(t,res2)
subplot(4,1,3), plot(t,res)
subplot(4,1,4),plot( transf(2,1:end) , transf(1,1:end) )

transf2 = [ transf(2,1:end) ; transf(1,1:end).*conj( transf(1,1:end) ) ]
subplot(4,1,4),plot( transf(2,1:end) , transf(1,1:end).*conj( transf(1,1:end) ) )
