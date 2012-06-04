function [domain, particles_number_outflow_lower] = function_boundary_outflow_lower(domain, handles, channel_end, boundary_lower_particles_number_particles, particles_number_outflow_lower)
%FUNCTION_BOUNDARY_OUTFLOW Summary of this function goes here
%   Detailed explanation goes here

%it can happen that a particle jumps 
particle_number = length(domain(1,:));
particle_last = particle_number;

particle_lower_count = 0;

for m = length(domain(1,:)):-1:1
    if domain(end,m) == 0
        particle_lower_count = particle_lower_count+1;
    else
        domain = [domain(:,1:(m-1)), domain(:,(m+1):end)];
    end
    
    if particle_lower_count == boundary_lower_particles_number_particles
        break
    end
    
end

% while domain(end,particle_last) == 1
%     particle_last = particle_last - 1;
% end
% 
% domain = domain(:,1:particle_last);

particle_last = length(domain(1,:)) - boundary_lower_particles_number_particles;

while domain(1,particle_last) >= channel_end
    particle_last = particle_last - 1;
end

domain = [domain(:,1:particle_last-1), domain(:,(length(domain(1,:)) - boundary_lower_particles_number_particles):end)];

particles_number_outflow_lower = particles_number_outflow_lower + (particle_number - length(domain(1,:)));
set(handles.textOutLower, 'String', num2str(particles_number_outflow_lower));

end