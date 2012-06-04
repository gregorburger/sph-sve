%TODO
%smoothing length - sigma is now 5 but should be 1.3
%   introduction of smoothing length by number of particles!?
%dfgl!!!!
%


%performace
profile off
profile on
%-------------------------------------------------------------------------


clear all
close all
%-------------------------------------------------------------------------


addpath('constants')
addpath('SPH')
addpath('approximation')
addpath('boundary')
addpath('boundary\initialization_inflow_outflow')
addpath('computation')
addpath('visualisation')
%-------------------------------------------------------------------------

%create input
INPUT;
%-------------------------------------------------------------------------


%start computation
function_computation(time, computation, boundary, sph, visualization, handles);
%-------------------------------------------------------------------------


%performace
profile report
%-------------------------------------------------------------------------