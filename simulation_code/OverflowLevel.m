%% Function - Overflow water level calculation
function [Hf,Uf] = OverflowLevel(Qw,Hc,Wc,Wf,S)
% Input parameters
h_bankfull = Hc;     % Main channel bankfull depth (m)
nc = 0.025; %manning's roughness coefficient for channel from Tull et al. (2022)
nf = 0.075; %manning's roughness coefficient for floodplain from Tull et al. (2022)

% Initial guess for water depth
h = h_bankfull;
dh = 0.001;           % Initial depth increment
tolerance = 0.1;   % Tolerance for discharge difference

% Iterative calculation
while true
    % Calculate areas and wetted perimeters
    if h <= h_bankfull
        A_main = Wc * h;
        P_main = Wc + 2*h;
        A_flood = 0;
        P_flood = 0;
    else
        A_main = Wc * h;
        P_main = Wc + 2*h_bankfull;
        A_flood = Wf * (h-h_bankfull);
        P_flood = Wf + (h-h_bankfull);
    end
  
    % Calculate hydraulic radii
   R_main = A_main / P_main;
    if P_flood > 0
        R_flood = A_flood / P_flood;
    else
        R_flood = 0;
    end
 
    % Calculate discharges using Manning's equation
    Q_main = (1/nc) * A_main * R_main^(2/3) * sqrt(S);
    if R_flood > 0
        Q_flood = (1/nf) * 2 * A_flood * R_flood^(2/3) * sqrt(S);
    else
        Q_flood = 0;
    end
    Q_total = Q_main + Q_flood;

    % Check if within tolerance
    if abs(Q_total - Qw) < tolerance
        break;
    elseif Q_total < Qw
        h = h + dh;
    else
        h = h - dh/2;  % Reduce step size when overshooting
        dh = dh/2;
    end

    % Prevent infinite loop
    if dh < 1e-6
        disp('Warning: Reached minimum step size. Consider adjusting parameters.')
        break;
    end
end

%update overflow height
Hf = h-h_bankfull;
%update areas, wetted perimeters, and hydraulic radii
A_main = Wc * h;
P_main = Wc + 2*h_bankfull;
R_main = A_main / P_main;
A_flood = Wf * (h-h_bankfull);
P_flood = Wf + (h-h_bankfull);
R_flood = A_flood / P_flood;

Pt = P_flood*2 + P_main;
At = 2*A_flood + A_main;
Rt = At/Pt;
nt = Pt*Rt^(5/3)/((2*P_flood*R_flood^(5/3)/nf + P_main*R_main^(5/3)/nc)); %total roughness coefficient from Lotter (1933)

%Update channel velocity and overbank velocity
V = 1/nt*Rt^(2/3)*S^(1/2);
Uf = 0.1*V;

end