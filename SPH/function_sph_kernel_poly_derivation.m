function Wd = function_sph_kernel_poly_derivation(r, h)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%r = sph_distance
%h = sph_smoothing_length


Wd = -24/(pi()*h^7)*(h^2-r^2)^2;

end