N = 5000;
f_s = 11025;

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
res = x(:);
% x = cos(2*pi*f01*t);

% plot(t, x)
t2 = (0:1/f_s:8);
t2 = t2(1:N*8);
plot(t2, res)

xc = cuantifica(res, 1, 8);
sound(xc, f_s, 8)
