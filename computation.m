% Roller Coaster Computations, SU 2020 

clc
clear

%Fill in Header Information
fprintf ('\n**********************************************\n')
fprintf ('*  Group: 1                                    *\n')
fprintf ('*  Roller Coaster Computations, SU 2020        *\n')
fprintf ('*  ENGR1182 Columbus State Community College   *\n')
fprintf ('*  Instructor:  M. Rahimi                      *\n')  
fprintf ('************************************************\n')


%% Computations

heights = [2.65, 2.6, 2.1, 2, 2.4, 2, 1.75, 1.65, 1.5, 1.45, 1.4, 0];
track_length = [0, 0.5, 1.41, 1.55, 2.53, 3.51, 3.86, 4.04, 4.56, 5.19, 6.02, 7.86];
% make sure heights and track length are entered in correctly
assert(length(heights) == length(track_length));


% Constants
mass = 0.00097;  % unit: kg
gravity = 9.81;  % unit: m/s^2
