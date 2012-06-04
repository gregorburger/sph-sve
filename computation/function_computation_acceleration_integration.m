function particle_i_velocity_next_computed = function_computation_acceleration_integration(domain, i, time, boundary, sph)
%FUNCTION_COMPUTATION_ACCELERATION Summary of this function goes here
%   Detailed explanation goes here

particle_i_position_current = domain(1,i);
particle_i_area_current_computed = domain(3,i);
particle_i_area_derivation_current_computed = domain(4,i);
particle_i_I_S_current_computed = domain(5,i);
particle_i_velocity_old_next = domain(7,i);
%-------------------------------------------------------------------------
particle_i_I_E_current_computed = function_computation_I_E(boundary, particle_i_position_current, particle_i_area_current_computed, particle_i_velocity_old_next);
%-------------------------------------------------------------------------
particle_i_fluid_height_derivation_current_computed = particle_i_area_derivation_current_computed/boundary.general.channel_width;     %rectangular channel - has also be changed in funktion fluid height!!!!!!!!!!!!!!!!!!
%-------------------------------------------------------------------------
particle_i_velocity_derivation_old_next_computed = function_approximation_velocity_derivation(domain, i, boundary, sph);
%-------------------------------------------------------------------------

%test!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%!!!!!! what about the last +??????
%particle_i_acceleration_next_computed = gravity()*(particle_i_I_S_current_computed - particle_i_I_E_current_computed + particle_i_fluid_height_derivation_current_computed) + particle_i_velocity_old_next*particle_i_velocity_derivation_old_next_computed;


%test!!!
particle_i_acceleration_next_computed = gravity()*(particle_i_I_S_current_computed - particle_i_I_E_current_computed - particle_i_fluid_height_derivation_current_computed) - particle_i_velocity_old_next*particle_i_velocity_derivation_old_next_computed;
%particle_i_acceleration_next_computed = gravity()*(particle_i_I_S_current_computed - particle_i_I_E_current_computed);

%particle_i_acceleration_next_computed = gravity()*(particle_i_I_S_current_computed - particle_i_I_E_current_computed) - particle_i_velocity_old_next*particle_i_velocity_derivation_old_next_computed;


%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

%-------------------------------------------------------------------------
particle_i_velocity_next_computed =  particle_i_velocity_old_next + particle_i_acceleration_next_computed*time.increment;

end

