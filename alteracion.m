N = 5000;
f_s = 11025; % frequencia de muestreo
% f_s = 11025+5*440;
% f_s = 13*1000;
% f_s = 15*1000;
% f_s = 18*1000;


f01 = 550;
f02 = f01 * (9/8);
f03 = f02 * (10/9);
f04 = f03 * (16/15);
f05 = f04 * (9/8);
f06 = f05 * (10/9);
f07 = f06 * (9/8);
f08 = f07 * (16/15);
freqs=[f01, f02, f03, f04, f05, f06, f07, f08];
clear f01 f02 f03 f04 f05 f06 f07 f08;

t = (0:1/f_s:1);
t = t(1,1:N);
% t = (0:f_s/(N-1):f_s);

x = [];
for i = 1:length(freqs)
    nn = cos(2*pi*freqs(i).*t);
    x = [x ; nn];
end
clear i nn;
res = x(:).'; % concatenación
res2=[x(1,:),x(2,:),x(3,:),x(4,:),x(5,:),x(6,:),x(7,:),x(8,:)];
% x = cos(2*pi*f01*t);

% plot(t, x)
% t2 = (0:1/f_s:length(freqs));
% t2 = t2(1:N*length(freqs));
% plot(t2, res)

% xc = cuantifica(res2, 1, 16);

sound(res2, f_s, 16)
sound(res2, 8000, 16)

% sound(x(1,:), f_s, 16)
% sound(x(2,:), f_s, 16)
% sound(x(3,:), f_s, 16)
% sound(x(4,:), f_s, 16)
% sound(x(5,:), f_s, 16)
% sound(x(6,:), f_s, 16)
% sound(x(7,:), f_s, 16)
% sound(x(8,:), f_s, 16)

