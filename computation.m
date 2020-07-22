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

total_energy = zeros(1, 12);
potential_energy = zeros(1, 12);
% At point 0
total_energy(1) = mass * gravity * heights(1);
potential_energy(1) = total_energy(1);
% all other points
fprintf("Total energies\n");
fprintf("0: %f\n", total_energy(1));
for i = 2:length(total_energy)
    energy = total_energy(i - 1) - (0.0007 * track_length(i));
    % energy cannot be less than 0
    if energy < 0
        energy = 0;
    end
    total_energy(i) = energy;
    fprintf("%d: %f\n", i - 1, total_energy(i));
end
