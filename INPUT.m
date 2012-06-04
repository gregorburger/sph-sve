%COMPUTATION
time.start = 0;             %s
time.increment = 0.01;      %s
time.end = 10;              %s

computation.velocity_iteration_number = 10;
computation.velocity_iteration_truncation_error = 0.1; %m/s not implemented yet!
%-------------------------------------------------------------------------


%GENERAL
boundary.general.particle_volume = 0.1;         %m³
boundary.general.channel_end = 50;              %m
boundary.general.channel_width = 1;             %m
%-------------------------------------------------------------------------


%INITIALIZATION
boundary.initialization.fluid_height = 1;     %m - function_boundary_initial_fluid_height     only for rectangular channels!!!!!!
boundary.upper_particles.length = 1;            %m
boundary.upper_particles.fluid_height = 1;    %m
boundary.lower_particles.length = 1;            %m
boundary.lower_particles.fluid_height = 1;    %m
%-------------------------------------------------------------------------


%INFLOW
boundary.inflow.inflow = 0;                     %m³/s
boundary.inflow.range = 1;                      %m
boundary.inflow.particle_velocity = 1;          %m/s
boundary.inflow.intervall_input = 2;           %each 10nd timestep inflowparticles are released
boundary.inflow.intervall_input_count = 0;
%-------------------------------------------------------------------------


%FRICTION
boundary.friction.k_st = 40;                    %constant friction across the channel!!!!!!!

% 20 bis 40 für natürliche Gerinne
% 45 bis 50 Bruchsteine, alter Beton
% 50 bis 60 Beton
% 80 bis .. Glatter Beton
% 90 bis .. Glatte Holzgerinne
% 100 bis .. PVC
%-------------------------------------------------------------------------


%Z-ELEVATION
boundary.z_elevation.slope = 0.001;   %has to be positive!!      %function_boundary_z_elevation
boundary.I_S = 0.05;
%-------------------------------------------------------------------------

%SPH
sph.smoothing_length = 1;     %m
%-------------------------------------------------------------------------


%visualization
visualization.plot_axis = [     -boundary.upper_particles.length, boundary.general.channel_end+5, 0, 4
                                -boundary.upper_particles.length, boundary.general.channel_end+5, -5, +5];
visualization.q = 0;
%-------------------------------------------------------------------------
