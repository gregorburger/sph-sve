function particle_i_I_S = function_approximation_I_S(domain, i, boundary, sph)
%FUNCTION_PARTICLE_FIND_NEIGHBOURS Summary of this function goes here
%   Detailed explanation goes here



%sph
sph_smoothing_length = function_sph_smoothing_length(domain, i);
%test!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%sph_smoothing_length = sph.smoothing_length;
%-------------------------------------------------------------------------

%initialization
particle_i_I_S = 0;

particle_i_z_elevation = function_boundary_z_elevation(domain(1,i), boundary.z_elevation);
%-------------------------------------------------------------------------

%search above

%-------------------------------------------------------------------------
signum = 1;
%-------------------------------------------------------------------------

j = i+1;

if (j <= length(domain(1,:)))

    particle_distance =  abs(domain(1,i) - domain(1,j));

    while particle_distance < sph_smoothing_length

        %-------------------------------------------------------------------------
        %-------------------------------------------------------------------------
        particle_j_volume = domain(2,j);
        particle_j_area = domain(3,j);
        particle_j_z_elevation = function_boundary_z_elevation(domain(1,j), boundary.z_elevation);
        %-------------------------------------------------------------------------        
        sph_kernel_poly_derivation = function_sph_kernel_poly_derivation(particle_distance, sph_smoothing_length);
        %-------------------------------------------------------------------------
        particle_i_I_S = particle_i_I_S + particle_j_volume*(particle_j_z_elevation - particle_i_z_elevation)/particle_j_area*signum*sph_kernel_poly_derivation;
        %-------------------------------------------------------------------------
        %-------------------------------------------------------------------------
        
        j = j+1;

        if (j > length(domain(1,:)))
            break
        end
        particle_distance =  abs(domain(1,i) - domain(1,j));
    end
end

%search beneath

%-------------------------------------------------------------------------
signum = -1;
%-------------------------------------------------------------------------

j = i-1;

if (j >= 1)
    particle_distance =  abs(domain(1,i) - domain(1,j));

    while particle_distance < sph_smoothing_length

        %-------------------------------------------------------------------------
        %-------------------------------------------------------------------------
        particle_j_volume = domain(2,j);
        particle_j_area = domain(3,j);
        particle_j_z_elevation = function_boundary_z_elevation(domain(1,j), boundary.z_elevation);
        %-------------------------------------------------------------------------        
        sph_kernel_poly_derivation = function_sph_kernel_poly_derivation(particle_distance, sph_smoothing_length);
        %-------------------------------------------------------------------------
        particle_i_I_S = particle_i_I_S + particle_j_volume*(particle_j_z_elevation - particle_i_z_elevation)/particle_j_area*signum*sph_kernel_poly_derivation;
        %-------------------------------------------------------------------------
        %-------------------------------------------------------------------------

        j = j-1;

        if (j < 1)
            break
        end
        particle_distance =  abs(domain(1,i) - domain(1,j));
    end
end

end

