function [ y ] = desplazar( x, t, t0 )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

if (t(1) == -t(end))
   y = x.*0;
   
   if t0>0
      temp = t(1)+t0;
      n = 1;
      while (t(n) < temp)
          n = n+1;
      end
      
      for z = n:length(y)
          y(z) = x(z-n+1);
      end
          
   elseif t0<0
       temp = t(1)-t0;
      n = 1;
      while (t(n) < temp)
          n = n+1;
      end
      
      for z = n:length(x)
          y(z-n+1) = x(z);
      end
   else
       y = x;
   end
       
   
else
    error('Error! intervalo de tiempo no simetrico');
end

end

