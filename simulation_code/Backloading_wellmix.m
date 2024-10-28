%==========================================================
% Well-mixed Back loading Processes
% for Channel-Overbank Decoupled aggrading model
% JeongYeon Han, 2024 Oct
%==========================================================
%%
function [T_eta, Ag, Hfi] = Backloading_wellmix(Qw, Hc, Ht, Wc, r, Hf0, Uf0, L, T_eta, S, a, b, psi,p)

%% Assign parameters
% Constant parameters
g = 9.81; %acceleration of gravity
nu = 1*10^(-6); %kinematic viscosity
ro = 1000; %water density
ros = 2650; %sediment density
R = (ros/ro)-1; %submerged specific gravity
% Dimension Parameters
M = 8*r; %number of nodes
Wf = r*Wc; %one-side floodplain width
dx = L/M; %step length
% Parameters related to Suspended load
cibar = zeros(M,length(psi)); % sediment concentration
qsoi = zeros(1,length(psi)); %initial sediemnt discharge of each sediment grainsize range
lamda = 0.3; %porosity of sandy levee deposit
Dst = zeros (M,1); %total rate at each node on one iteration
eta = zeros(M,1);

%% Grain size distribution of SSC
D = 2.^(psi); %sediment grain size in mm
D = D/1000; %sediment grain size in m
% Settling velocity of each grain size using Ferguson and Church (2004)
% The constants, C1 = 18 and C2 = 1 for natural grains
ws=(R*g.*(D.^2))./(18*nu+(0.75*R*g.*D.^3).^0.5);
%Repi = ((R*g*D).^(0.5)).*D/nu; % particle Reynolds Number
Qs = a*((Qw*35.3)^b)*10^(3)/24/60/60; %0.5 kg/s
T_qso = 0.2*Qs/ros./Wc.*p; %m2/s sand and silt sediment flux
Uc = Uf0*10; % channel velocity
ustar_c = sqrt(g.*Ht.*S); %channel shear velocity
P = ws./(0.4.*ustar_c); %Rouse number: the exponent of Rouse equation
Total_ele = 0;

%% adjust the overflow level to fill the bankfull channel
% consider channel bankfull discharge
h_flood = Hf0;     % Main channel bank full depth (m)
nc = 0.025; %manning's roughness coefficient for channel
nf = 0.075; %manning's roughness coefficient for floodplain

% Initial guess for water depth
h = h_flood;
dh = 0.001;           % Initial depth increment
tolerance = 0.1;   % Tolerance for discharge difference

% Iterative calculation
while true
    % Calculate areas and wetted perimeters
    A_main = Wc * Ht;
    P_main = Wc + 2*Ht;
    A_flood = Wf * h;
    P_flood = Wf + h;

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
    if abs(Qw - Q_total) < tolerance
        break;
    elseif Qw < Q_total
        h = h - dh;
    else
        h = h + dh/2;  % Reduce step size when overshooting
        dh = dh/2;
    end
 
    % Prevent infinite loop
    if dh < 1e-6 && Qw > Q_total
        h = h_flood;
        %disp('Warning: Reached minimum step size. Consider adjusting parameters.')
        break;
    end
end

% Calculate areas and wetted perimeters
Hf = h;
Pc = Wc + 2*Ht;
Ac = Wc*Ht;
Rc = Ac/Pc;
Pf = Wf + Hf;
Af = Hf*Wf;
Rf = Af/Pf;
Pt = Pf*2 + Pc;
At = 2*Af + Ac;
Rt = At/Pt;
nt = Pt*Rt^(5/3)/((2*Pf*Rf^(5/3)/nf + Pc*Rc^(5/3)/nc)); %total roughness coefficient from Lotter (1933).

%% Assign New Overflow Properties
Uc = 1/nt*Rt^(2/3)*S^(1/2);
Uf = 0.1*Uc; 

%% adjust the overflow level considering inundated volume of overbank accumulation
ebm = T_eta(:) < Hf + T_eta(M); %find the maximum node touching the overbank flow
x_ind = max(find(ebm==0));
eb = min(x_ind)+1;

if eb < M %if the overflow inundates multiple nodes
    for i = eb:M-1
        Total_ele = Total_ele + (T_eta(i)+T_eta(i+1)-2*T_eta(M))/2;
    end
    Ha = (Total_ele + Hf*(eb-1))*dx/Wf;
    ebm2 = T_eta(:) < (Hf + T_eta(M)+ Ha);
    x_ind = max(find(ebm2==0));
    if isempty(x_ind)
        eb2 = 1;
    else
        eb2 = min(x_ind)+1;
    end 
else %if the overflow inundates only last node
    Ha = Hf*(eb-1)*dx/Wf;
    ebm2 = T_eta(:) < (Hf + T_eta(M)+ Ha);
    x_ind = max(find(ebm2==0));
    eb2 = min(x_ind)+1;
end

Hfi = Hf.*ones(M,1) + T_eta(M) + Ha - T_eta(:); %update water depth

%% Ponding water case
%by A. P. Nicholas and D. E. Walling (1998)
%Initial Concentration of Suspended Sediment
alpha = 1; % constant for initial suspended sediment concentration, 0 for fresh water

%% Calculate Sand Suspended load Concentration
cibar0H = zeros(1,length(psi));
cibarH = zeros(1,length(psi));
ca = zeros(1,length(psi));
Ag = 0;

%Rouse profile (1937)
for k=1:length(psi)
    fun = @(z) ((Ht./z - 1)./19).^P(k); % Rouse equation
    cibar0H(k) = integral(fun, 0.95*Ht, Ht); %input concentration
    cibarH(k) = integral(fun, 0.05*Ht, Ht);
    ca(k) = T_qso(k)/(Uc.*(cibarH(k)+1));
    qsoi(k) = Uc*cibar0H(k)*ca(k);
end

if eb2 < M+1 %if new overflow level inundates multiple nodes
    if eb2 == 1 %full inundation as front loading process
        eta_Hf = Hf + Ha + T_eta(M); %initial overflow depth applying levee volume
        [T_eta, Ag] = LeveeBimodal(Qw, Hc, Ht, Wc, r, eta_Hf, Hf, Uf, L, T_eta, S, a, b, psi, p);

    else
        for i=eb2:1:M %back loading deposition process
            cibar(i,:) = (alpha.*qsoi)./(0.05*Ht*Uf);
            Dst(i) = sum(cibar(i,:))*Hfi(i);
            eta(i) = (Dst(i))/(1-lamda); %update sediment surface elevation (Exner equation)
            if eta(i) > Hfi(i)
                eta(i) = Hfi(i);
            end
            T_eta(i) = T_eta(i) + eta(i);
        end
        Ag = eta./(60*60*24); %update aggradation rate, m/s 1day
    end
end

%% Update adjusted overflow level at each node
if eb2 == M
    Hfi = [zeros(eb2-1,1);Hfi(M)];
elseif eb2 == 1

else
    Hfi = [zeros(eb2-1,1); Hfi(eb2:M)];
end

end
