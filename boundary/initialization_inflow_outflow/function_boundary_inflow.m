function domain_inflow = function_boundary_inflow(time, boundary)
%FUNCTION_BOUNDARY_INFLOW Summary of this function goes here
%   Detailed explanation goes here

number_particles_inflow = boundary.inflow.inflow/boundary.general.particle_volume*time.increment*boundary.inflow.intervall_input;

particle_interval = boundary.inflow.range/number_particles_inflow;

domain_inflow = [];

particle_inflow = [ particle_interval
                    boundary.general.particle_volume
                    0
                    0
                    0
                    0
                    boundary.inflow.particle_velocity
                    1];  %1 -> moving!

for m = 1:number_particles_inflow
    domain_inflow(:,end+1) = [particle_inflow(1)*m;particle_inflow(2:end)];
end

end

