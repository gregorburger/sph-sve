function sph_smoothing_length = function_sph_smoothing_length(domain, i)
%FUNCTION_SPH_SMOOTHING_LENGTH Summary of this function goes here
%   Detailed explanation goes here

particle_i_volume = domain(2,i);
particle_i_area = domain(3,i);


sph_smoothing_length_sigma = 1.3;
%sph_smoothing_length_sigma = 10;
k = 5;

if particle_i_area > 0
    sph_smoothing_length = sph_smoothing_length_sigma*particle_i_volume/particle_i_area*k;
    
elseif particle_i_area == 0
    sph_smoothing_length = 2;
else
    error('Negative crossectional-area!')
end

end

