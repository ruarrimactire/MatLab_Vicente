N = 5000; % numero de muestras que se han de tomar
f_s = 11025; % frequencia de muestreo
% alternativas en el enunciado
% f_s = 13*1000;
% f_s = 15*1000;
% f_s = 18*1000;

% en lugar de esto
    t = (0:1/f_s:1); % se crea un vector muy largo (num celdas > N) con paso 1/f_s
    t = t(1,1:N); % se corta el vector a lacelda num N
% mejor esto:
    t = 0:N-1; % se crea un vector de valores enteros desde 0 hasta N-1 ; numero total de celdas = N
    t = t * (1/f_s); % se multipica cada celda del vector por el valor del periodo de muestreo 1/f_s

% en lugar de esto
    f01 = 550;
    f02 = f01 * (9/8);
    f03 = f02 * (10/9);
    f04 = f03 * (16/15);
    f05 = f04 * (9/8);
    f06 = f05 * (10/9);
    f07 = f06 * (9/8);
    f08 = f07 * (16/15);
    freqs = [f01, f02, f03, f04, f05, f06, f07, f08];
    clear f01 f02 f03 f04 f05 f06 f07 f08;
% mejor esto:
    freqs(1) = 550;
    freqs(2) = freqs(1) * (9/8);
    freqs(3) = freqs(2) * (10/9);
    freqs(4) = freqs(3) * (16/15);
    freqs(5) = freqs(4) * (9/8);
    freqs(6) = freqs(5) * (10/9);
    freqs(7) = freqs(6) * (9/8);
    freqs(8) = freqs(7) * (16/15);

x = [];
for i = 1:length(freqs)
    nn = cos(2*pi*freqs(i).*t);
    x = [x ; nn];
end
clear i nn;

% en lugar de esto
    res = [x(1,:),x(2,:),x(3,:),x(4,:),x(5,:),x(6,:),x(7,:),x(8,:)]; % concatenación manual fila a fila
% mejor esto:
% res = x(:)'; % errato: crea un vector columna con el contendo de la matrix pero scanea la matrix por columnas
% correcto: 
    res = x';   % se calcula la transpuesta de x (invierte filas con columnas) y lo guarda en res
    res = res(:)';  % calcula el transpuesto del vector columna unico y lo substituye en el mismo res

% no se si sirve de verdad: preguntar a la profesora
% xc = cuantifica(res, 1, 16);

sound(res, f_s, 16)
sound(res, 8000, 16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pruebas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% t2 = (0:1/f_s:length(freqs));
% t2 = t2(1:N*length(freqs));
% plot(t2, res)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% sound(x(1,:), f_s, 16)
% sound(x(2,:), f_s, 16)
% sound(x(3,:), f_s, 16)
% sound(x(4,:), f_s, 16)
% sound(x(5,:), f_s, 16)
% sound(x(6,:), f_s, 16)
% sound(x(7,:), f_s, 16)
% sound(x(8,:), f_s, 16)

% xnew = x(1,:);
% xnew = xnew .* x(2,:);
% xnew = xnew .* x(3,:);
% xnew = xnew .* x(4,:);
% xnew = xnew .* x(5,:);
% xnew = xnew .* x(6,:);
% xnew = xnew .* x(7,:);
% xnew = xnew .* x(8,:);
% plot(t(1,1:500), xnew(1,1:500))
% sound(xnew, f_s, 16)