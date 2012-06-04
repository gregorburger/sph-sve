function particle_z_elevation = function_boundary_z_elevation(particle_position, z_elevation)
%FUNCTION_BOUNDARY_Z_ELEVATION Summary of this function goes here
%   Detailed explanation goes here

particle_z_elevation = particle_position*z_elevation.slope;

end

