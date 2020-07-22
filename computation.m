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
mass = 0.0097;  % unit: kg
gravity = 9.81;  % unit: m/s^2

% lists
total_energies = zeros(1, 12);
potential_energies = zeros(1, 12);
kinetic_energies = zeros(1, 12);
velocities = zeros(1, 12);

% At point 0
total_energies(1) = mass * gravity * heights(1);
potential_energies(1) = total_energies(1);
kinetic_energies(1) = 0;
velocities(1) = 0;

% all other points
fprintf("Total energy, kinetic energy, and velocity and potential energy\n");
fprintf("0: %f\t%.6f\t%.6f\t%.6f\n", total_energies(1), 0, 0, 0.25216605);
for i = 2:length(total_energies)
    total_energies(i) = total_energies(1) - 0.0007 * track_length(i);
    kinetic_energies(i) = total_energies(i) - (mass * gravity * heights(i));
    potential_energies(i) = mass * gravity * heights(i);
    velocities(i) = sqrt((10 * kinetic_energies(i)) / (7 * mass));
    fprintf("%d: %f\t%f\t%f\t%f\n", i - 1, total_energies(i), kinetic_energies(i), velocities(i), potential_energies(i));
end

% plot track_length vs. total_energy, kinetic_energy, potential_energy
figure(1)
hold on
plot(track_length, total_energies, track_length, kinetic_energies, track_length, potential_energies);
xlabel("Track Length (m)");
ylabel("Energies (J)");
title("Track Length vs. Total, Kinetic, and Potential Energies");
legend("Total Energy", "Kinetic Energy", "Potential Energy");
hold off

% plot track_length vs. velocities
figure(2)
hold on
plot(track_length, velocities);
xlabel("Track Length (m)");
ylabel("Velocities (m/s)");
title("Track Length vs. Velocities");
hold off
