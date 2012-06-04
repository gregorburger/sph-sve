function function_computation(time, computation, boundary, sph, visualization, handles)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%INITZIALISATION
[domain, boundary_upper_particles_number_particles, boundary_lower_particles_number_particles] = function_boundary_initialization(boundary);

particles_number_outflow_lower = 0;
particles_number_outflow_upper = 0;

global stop
% figure(1)
% plot(domain(1,:),domain(4,:),'bo');
% figure(2)
%-------------------------------------------------------------------------



for t = time.start:time.increment:time.end
    
    %set time
    time.t = t;
    set(handles.textTimeCurrent, 'String', num2str(t));
    %-------------------------------------------------------------------------
    
    
    %number of particles
    %set(handles.textNumberParticles, 'String', num2str(length(domain(1,:)))); 
    %-------------------------------------------------------------------------
    
    
    %boundary inflow
    if boundary.inflow.intervall_input_count == boundary.inflow.intervall_input
        domain = [domain(:,1:boundary_upper_particles_number_particles), function_boundary_inflow(time, boundary), domain(:,boundary_upper_particles_number_particles+1:end)];
        boundary.inflow.intervall_input_count = 0;
    end

    boundary.inflow.intervall_input_count = boundary.inflow.intervall_input_count+1;
    %-------------------------------------------------------------------------
    
    
    %sort
    domain = sortrows(domain',1)';
    %-------------------------------------------------------------------------
    
    
    %STEP 1
    %cross-sectional area approximation
    %count through particle i
    for i = 1:length(domain(1,:))
        if (domain(end,i) == 1)
            %-------------------------------------------------------------------------
            [particle_i_area_current_computed, particle_i_area_derivation_current_computed] = function_approximation_area(domain, i, boundary, sph);
            domain(3,i) = particle_i_area_current_computed;
            domain(4,i) = particle_i_area_derivation_current_computed;
            %-------------------------------------------------------------------------
        end
    end
    %-------------------------------------------------------------------------
    
    
    %STEP 2
    %compute startvelocity
    %count through particle i
    for i = 1:length(domain(1,:))
        if (domain(end,i) == 1)
            %-------------------------------------------------------------------------
            %there is an error in function_approximation_I_S!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            %particle_i_I_S_current_computed = function_approximation_I_S(domain, i, boundary, sph)
            %domain(5,i) = particle_i_I_S_current_computed;
            domain(5,i) = boundary.I_S;
            %-------------------------------------------------------------------------
            %-------------------------------------------------------------------------
            particle_i_velocity_next_computed = function_computation_acceleration_integration(domain, i, time, boundary, sph);
            domain(7,i) = particle_i_velocity_next_computed;
            %-------------------------------------------------------------------------
            %-------------------------------------------------------------------------
        end
    end
    %-------------------------------------------------------------------------
    
    
    %STEP 3
    %iterate velocity
    %count through particle i
    
    particle_velocity_stop_iteration = zeros(1,length(domain(1,:)));
    
    for m = 1:computation.velocity_iteration_number
        
    for i = 1:length(domain(1,:))
        if (domain(end,i) == 1 && particle_velocity_stop_iteration(i) == 0)

            %-------------------------------------------------------------------------
            particle_i_velocity_next_computed = function_computation_acceleration_integration(domain, i, time, boundary, sph);
            %-------------------------------------------------------------------------
            
            if (abs(particle_i_velocity_next_computed - domain(7,i)) < computation.velocity_iteration_truncation_error)
                particle_velocity_stop_iteration(i) = 1;
                %msgbox('Truncation Error was not reached!','Velocity Iteration','warn')
            end
            
            %-------------------------------------------------------------------------
            domain(7,i) = particle_i_velocity_next_computed;
            %-------------------------------------------------------------------------
            
%             if (m == computation.velocity_iteration_number)
%                 %msgbox('Truncation Error was not reached!','Velocity Iteration','warn')
%                 set(handles.textError, 'String', 'velocity truncation error was not reached!');
%             end
            
        end
    end
    
    end
    %-------------------------------------------------------------------------
    
    
    %STEP 4 - velocity integration
    %count through particle i - compute new particle position
    for i = 1:length(domain(1,:))
        if (domain(end,i) == 1)  
            
            particle_i_velocity_new_computed = domain(7,i);
            particle_i_position_current = domain(1,i);
            
            particle_i_position_new_computed = particle_i_position_current + particle_i_velocity_new_computed*time.increment;
            domain(1,i) = particle_i_position_new_computed;
        end
    end

    
    %sort
    domain = sortrows(domain',1)';
    %-------------------------------------------------------------------------
    

    %boundary outflow lower
    [domain, particles_number_outflow_lower] = function_boundary_outflow_lower(domain, handles, boundary.general.channel_end, boundary_lower_particles_number_particles, particles_number_outflow_lower);
    %-------------------------------------------------------------------------
    
    
    %boundary outflow upper
    [domain, particles_number_outflow_upper] = function_boundary_outflow_upper(domain, handles, particles_number_outflow_upper);
    %-------------------------------------------------------------------------
    
    
    %visualization
    function_plot(domain, visualization.plot_axis, handles);
    %-------------------------------------------------------------------------
    
    %stop - not so nice
    if stop == 1
        return
    end
    
end

end