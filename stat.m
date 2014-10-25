function [ output_args ] = stat( x )
% STAT promedioy desviacion estandard.
n = length(x);
promedio = sum(x)/n; 
stdev = sqrt(sum((x-promedio).^2)/n);
output_args = [promedio ; stdev];
end

% function [ output_args ] = stat( x )
% %UNTITLED Summary of this function goes here
% %   Detailed explanation goes here
% % STAT Interesting statistics.
% n = length(x);
% promedio = avg(x,n); 
% stdev = sqrt(sum((x-promedio).^2)/n);
% 
% output_args = [promedio ; stdev];
% 
%     %------------ subfuncion
%     function [f] = avg( datos , numero)
%         f = sum(datos)/numero;
%     end
% 
% end

