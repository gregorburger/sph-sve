function [domain_upper,  number_upper_particles] = function_boundary_upper_particles(boundary)
%FUNCTION_BOUNDARY_UPPER Summary of this function goes here
%   Detailed explanation goes here

boundary_upper_particles_area = boundary.upper_particles.fluid_height*boundary.general.channel_width;
%-------------------------------------------------------------------------
particle_interval = boundary.general.particle_volume/boundary_upper_particles_area;
number_upper_particles = boundary.upper_particles.length/particle_interval + 1;
%-------------------------------------------------------------------------

domain_upper = [];

particle_upper = [  -boundary.upper_particles.length
                    boundary.general.particle_volume
                    boundary_upper_particles_area
                    boundary.upper_particles.fluid_height
                    0
                    0
                    0
                    0];  %0 -> not moving!

domain_upper = particle_upper;
                
particle_upper_delta =  zeros([length(particle_upper),1]);
particle_upper_delta(1) = particle_interval;
                                    
for boundary_upper_particle_count = 2:number_upper_particles
    domain_upper(:,end+1) = domain_upper(:,end) + particle_upper_delta;
end

end

