function domain_initial = function_boundary_initial_fluid_height(boundary)
%FUNCTION_BOUNDARY_INITIAL_WATER_HEIGHT Summary of this function goes here
%   Detailed explanation goes here

particle_interval = boundary.general.particle_volume/(boundary.initialization.fluid_height*boundary.general.channel_width);
number_particles_initial = boundary.general.channel_end/particle_interval + 1 - 1;

domain_initial = [];

particle_initial = [0
                    boundary.general.particle_volume
                    0
                    0
                    0
                    0
                    0
                    1];  %1 -> moving!

domain_initial = particle_initial;

particle_initial_delta =  zeros([length(particle_initial),1]);
particle_initial_delta(1) = particle_interval;
                
for m = 2:number_particles_initial
    domain_initial(:,end+1) = domain_initial(:,end) + particle_initial_delta;
end

end

