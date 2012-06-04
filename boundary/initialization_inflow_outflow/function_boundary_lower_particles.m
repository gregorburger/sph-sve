function [domain_lower, number_lower_particles] = function_boundary_lower_particles(boundary)
%FUNCTION_BOUNDARY_UPPER Summary of this function goes here
%   Detailed explanation goes here

boundary_lower_particles_area = boundary.lower_particles.fluid_height*boundary.general.channel_width;
%-------------------------------------------------------------------------
particle_interval = boundary.general.particle_volume/boundary_lower_particles_area;
number_lower_particles = boundary.lower_particles.length/particle_interval + 1;
%-------------------------------------------------------------------------

particle_lower = [  boundary.general.channel_end
                    boundary.general.particle_volume
                    boundary_lower_particles_area
                    boundary.lower_particles.fluid_height
                    0
                    0
                    0
                    0];  %0 -> not moving!
                
domain_lower = particle_lower;
                
particle_lower_delta =  zeros([length(particle_lower),1]);
particle_lower_delta(1) = particle_interval;

for boundary_upper_particle_count = 2:number_lower_particles
    domain_lower(:,end+1) = domain_lower(:,end) + particle_lower_delta;
end

end

