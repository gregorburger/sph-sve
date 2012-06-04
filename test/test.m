clear all


domain = [];

for m = 1:5
    domain(:,end+1) = [0+m*0.1;0.1;0.01;0.01;1];
end

%test
particle_i=1;
sph_smoothing_length = 100;
boundary_channel_width = 1;
%-------------------------------------------------------------------------

particle_i_area = 0;
particle_i_velocity = 0;
particle_i_velocity_derivation = 0;
particle_i_height_derivation = 0;

particle_j_above = particle_i+1;

if (particle_j_above <= length(domain(1,:)))

    particle_distance =  abs(domain(1,particle_j_above) - domain(1,particle_i));
particle_distance
    while particle_distance < sph_smoothing_length

        %-------------------------------------------------------------------------                    
        sph_kernel_poly = function_sph_kernel_poly(abs(particle_distance), sph_smoothing_length);
        sph_kernel_poly_derivation = function_sph_kernel_poly_derivation(particle_distance, sph_smoothing_length);
        %-------------------------------------------------------------------------
        particle_j_volume = domain(2,particle_j_above);
        particle_j_area = domain(3,particle_j_above);
        particle_j_velocity = domain(4,particle_j_above);
        %-------------------------------------------------------------------------
        A = particle_j_volume*particle_j_velocity/particle_j_area;
        %-------------------------------------------------------------------------
        particle_i_area = particle_i_area + particle_j_volume*sph_kernel_poly;

        particle_i_height_derivation = particle_i_height_derivation - 1/boundary_channel_width*particle_j_volume*sph_kernel_poly_derivation;
        %-------------------------------------------------------------------------

        particle_j_above = particle_j_above+1;

         if (particle_j_above > length(domain(1,:)))
             break
         end

        particle_distance =  abs(domain(1,particle_j_above) - domain(1,particle_i));
        particle_distance
    end
end

glub = 0

particle_j_beneath = particle_i-1;

if (particle_j_beneath >= 1)
    particle_distance =  abs(domain(1,particle_i) - domain(1,particle_j_beneath));
particle_distance
    while particle_distance < sph_smoothing_length

        %-------------------------------------------------------------------------                    
        sph_kernel_poly = function_sph_kernel_poly(abs(particle_distance), sph_smoothing_length);
        sph_kernel_poly_derivation = function_sph_kernel_poly_derivation(particle_distance, sph_smoothing_length);
        %-------------------------------------------------------------------------
        particle_j_volume = domain(2,particle_j_beneath);
        particle_j_area = domain(3,particle_j_beneath);
        particle_j_velocity = domain(4,particle_j_beneath);
        %-------------------------------------------------------------------------
        A = particle_j_volume*particle_j_velocity/particle_j_area;
        %-------------------------------------------------------------------------
        particle_i_area = particle_i_area + particle_j_volume*sph_kernel_poly;

        particle_i_height_derivation = particle_i_height_derivation + 1/boundary_channel_width*particle_j_volume*sph_kernel_poly_derivation;
        %-------------------------------------------------------------------------

        particle_j_beneath = particle_j_beneath-1;

         if (particle_j_beneath < 1)
             break
         end

        particle_distance =  abs(domain(1,particle_i) - domain(1,particle_j_beneath));
        particle_distance
    end
end
