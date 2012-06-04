function [domain_initialization, number_upper_particles, number_lower_particles] = function_boundary_initialization(boundary)
%FUNCTION_BOUNDARY_INITIALIZATION Summary of this function goes here
%   Detailed explanation goes here

[domain_upper,  number_upper_particles] = function_boundary_upper_particles(boundary);
[domain_lower, number_lower_particles] = function_boundary_lower_particles(boundary);

domain_initial = function_boundary_initial_fluid_height(boundary);

domain_initialization = [domain_upper, domain_initial, domain_lower];

end