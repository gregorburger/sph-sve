function particle_i_I_E = function_computation_I_E(boundary, particle_i_position, particle_i_area, particle_i_velocity)
%FUNCTION_COMPUTE_I_E Summary of this function goes here
%   Detailed explanation goes here

[particle_i_fluid_height, particle_i_hydraulic_radius] = function_boundary_fluid_height_hydraulic_radius(particle_i_position, particle_i_area, boundary.general.channel_width);

particle_i_I_E = particle_i_velocity^2/(function_boundary_friction(boundary.friction)^2*particle_i_hydraulic_radius^(4/3));
end

