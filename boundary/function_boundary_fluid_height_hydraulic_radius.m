function [fluid_height, hydraulic_radius] = function_boundary_fluid_height_hydraulic_radius(particle_position, particle_area, boundary_channel_width)
%FUNCTION_BOUNDARY_FLUID_HEIGHT Summary of this function goes here
%   Detailed explanation goes here

fluid_height = particle_area/boundary_channel_width;

%wetted perimeter
boundary_wetted_perimeter = boundary_channel_width+2*fluid_height;

hydraulic_radius = particle_area/boundary_wetted_perimeter;

end