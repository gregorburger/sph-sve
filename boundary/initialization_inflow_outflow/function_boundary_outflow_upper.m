function [domain, particles_number_outflow_upper] = function_boundary_outflow_lower(domain, handles, particles_number_outflow_upper)
%FUNCTION_BOUNDARY_OUTFLOW Summary of this function goes here
%   Detailed explanation goes here

particle_number = length(domain(1,:));
particle_first = 1;

while (domain(1,particle_first) < 0 && domain(end,particle_first) == 1)
    particle_first = particle_first + 1;
end

domain = domain(:,particle_first:end);

particles_number_outflow_upper = particles_number_outflow_upper + (particle_number - length(domain(1,:)));
set(handles.textOutUpper, 'String', num2str(particles_number_outflow_upper));

end