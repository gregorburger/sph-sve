function function_plot(domain, visualisation_axis, handles)
%FUNCTION_VISUALIZATION Summary of this function goes here
%   Detailed explanation goes here

figure(1)

subplot(2,1,1);

plot(domain(1,:),domain(3,:),'b.')
hold on
plot(domain(1,:),domain(3,:),'r')
hold off
grid
axis(visualisation_axis(1,:))
%title('Cross-Sectional Area')
xlabel('x-Axis [m]')
ylabel('Cross-Sectional Area [m^2]')

subplot(2,1,2);

plot(domain(1,:),domain(7,:),'g.')
grid
axis(visualisation_axis(2,:))
%title('Velocity')
xlabel('x-Axis [m]')
ylabel('Particle Velocity [m/s]')

end

