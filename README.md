# Decoupled Channel-levee Evolution Model Simulation in MATLAB
This is the archive of a numerical model that decoupled channel bed and levee evolution with associated simulations, dataset, and figures by Han, JeongYeon and Edmonds, Douglas (2024)

## Overview
This numerical model is a one-dimensional hydrodynamic and morphodynamic model of a river-floodplain system to simulate the formation of natural levees in response to floods using MATLAB. The model employs randomly generated synthetic hydrograph and based on these weekly discharge values, it identifies two flood styles on the floodplain regime at each time step, front loading and back loading. The model is tested by varying four control parameters: in-channel aggradation rate, discharge variability, grain size distribution near channel bed and median grain size, and channel-floodplain width ratio and demonstrates the levee morphology, average floodplain accumulation, temporal variations in bankfull channel characteristics, and flood trends. Below is the flowchart of the model:

![alt text](https://github.com/JeongYeonHan1/ChannelLeveeModel/blob/68a68a2468d6b46b2a1ef74f4b3207c9f007790a/images/Figure2.jpg)

## Features
- Generate random weekly hydrograph and solve the divided channel method to compute the flooded water surface elevation (Lotter, 1933)
- Identify two flood styles: Front loading and Back loading
- Run advection-settling model (Han and Kim, 2022) for Front loading events and Ponded water model (Nicholas and Walling, 1996) for Back loading events
- Visualizes results with MATLAB plotting functions

## Prerequisites
- MATLAB R2022b or higher
  
## Function lists
- HydraulicGeometry.m
- Hydrograph.m
- OverflowLevel.m
- LeveeBimodal.m
- Backloading_wellmix.m
  
## Run the model
1. Configure the simulation parameters in `DecoupledCLM.m`.
2. Run the simulation
3. View the results in the `output/matfiles` directory.
4. Plot the results with plot_figures.m, plot_ConfinedRelease.m, and plot_BE.m
5. View the plots in the `output/figures` directory.

## Configuration
Edit the `DecoupledCLM.m` file to set the parameters for the simulation:
```matlab
% DecoupledCLM.m

%% Control parameters
% Ac, in-channel aggradation rate
va = 1.9231e-06*10; %0.1 cm/yr range: 1.9231e-06*[1 to 200] -> [0.01 cm/yr to 2 cm/yr]

% Q50/Q90, discharge variability
% load synthetic hydrograph ['Qw_QQ3.mat', 'Qw_QQ5.mat', 'Qw_QQ7.mat','Qw_QQ9.mat']
currentDir = pwd;
newDir = fullfile(currentDir, 'synthetic_hydrographs');
cd(newDir);
load('Qw_QQ3.mat',"QQ","Qw","flday")
Qwt = Qw;
cd(currentDir);

% Grain size distribution & D50
% Case 1 - unimodal & D50 = 0.125 mm
psibar = -2;   %mean psi
sigma = 0.8;    %standard deviation for normal distribution
p =(1/(sqrt(2*pi)*sigma))*exp(-(((psi-psibar)./sigma).^2)/2); %gaussian grain size distribution
% Case 2 - unimodal & D50 = 0.25 mm
psibar = -3;   %mean psi
sigma = 0.8;    %standard deviation for normal distribution
p =(1/(sqrt(2*pi)*sigma))*exp(-(((psi-psibar)./sigma).^2)/2); %gaussian grain size distribution
% Case 3 - bimodal & D50 = 0.56 mm
PDF_c = normpdf(psi, -4, 0.8) + 2*normpdf(psi, -1, 0.8);
p = PDF_c/sum(PDF_c); % normalise it, i.e. sum equals to one.
% Case 4 - bimodal & D50 = 0.063 mm
PDF_f = 2*normpdf(psi, -4, 0.8) + normpdf(psi, -1, 0.8);
p = PDF_f/sum(PDF_f); % normalise it, i.e. sum equals to one.

% Wf/Wc Floodplain width ratio
%%Select Channel-floodplain width ratio, r
r = 5; % Channel-floodplain width ratio, r = 2.5, 5, 7.5, 10
Wf = r*Wc; %confined floodplain width (Wf)

```





