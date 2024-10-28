# Decoupled Channel-levee Evolution Model Simulation in MATLAB

## Overview
This project contains a numerical model simulation for decoupled channel-levee evolution using MATLAB. The model employs  and visualize results.

!Alt flowchart

## Features
- Solves differential equations using finite difference methods
- Visualizes results with MATLAB plotting functions
- Configurable parameters for different simulation scenarios

## Prerequisites
- MATLAB R2022b or higher

## Usage
1. Configure the simulation parameters in `config.m`.
2. Run the simulation:
    ```matlab
    main
    ```
3. View the results in the `output` directory.

## Configuration
Edit the `config.m` file to set the parameters for the simulation:
```matlab
% config.m

% Simulation parameters
time_step = 0.01;
total_time = 10.0;
grid_size = 100;

% Initial conditions
initial_velocity = 1.0;
initial_pressure = 1.0;
```





