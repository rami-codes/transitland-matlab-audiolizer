function [ output ] = remap(x, in_min, in_max, out_min, out_max)
%Ported from Arduino map function
 output = (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;

end

