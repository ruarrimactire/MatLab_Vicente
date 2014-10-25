 function [ output_args ] = deltaOLD( t, A )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

for i = 1 : length(t)
    f(i) = dd1(t(i))*A;
end
stem(t, f,'.')
axis([-3 3 -.5 1.5])
xlabel('t')
ylabel('Impulse Function') 
output_args = f;

    function y = dd1(n)
        % Our default value is 0
        y = 0; 
        % The function is 1 only if the input is 0
        if n == 0
            y = 1;
        end
    end

end
