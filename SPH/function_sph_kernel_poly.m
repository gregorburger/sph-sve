function W = function_sph_kernel_poly(r, h)
%FUNCTION_SPH_SMOOTHING_KERNEL Summary of this function goes here
%   Detailed explanation goes here
%r = sph_distance
%h = sph_smoothing_length

W = 4/(pi()*h^7)*(h^2-r^2)^3;

end

