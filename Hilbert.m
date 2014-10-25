function [ output_args ] = Hilbert( dim )
%Hilbert( dim ) creates an Hilbert matrix given the dimension
%   Uses 2 nested for loops
for i = 1:dim
    for j = 1:dim
        A(i,j) = 1/(i+j-1);
    end
end
output_args = A;
end

