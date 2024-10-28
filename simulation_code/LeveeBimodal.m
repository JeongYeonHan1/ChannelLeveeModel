%==========================================================
% Channel-Overbank Decoupled aggrading model
% JeongYeon Han and Douglas Edmonds, 2024 Oct

% Advection settling of suspended sediment
% Constant aggradation rate in channel bed
%==========================================================
%%
function [T_eta, Ag] = LeveeBimodal(Qw, Hc, Hbk, Wc, r, eta_Hf, Hf0, Uf0, L, T_eta, Sc, a, b, psi, p)
%% Model Parameters
% Assign constant parameters
g = 9.81; %acceleration of gravity
nu = 1*10^(-6); %kinematic viscosity
ro = 1000; %water density
ros = 2650; %sediment density for sand
R = (ros/ro)-1; %submerged specific gravity

% Assign Matrix of Parameters
M = 8*r; %number of nodes
dx = L/M; %step length
dt = 1; %time variation [s]
Niterations = 60*60*24*3/dt; %number of total iterations 3days
qs = zeros(M,length(psi)); %sediment discharge
qst = zeros(M,1); %total sediment discharge of each node
cibar = zeros(M,length(psi)); % sediment concentration for sand and silt size
qsoi = zeros(1,length(psi)); %initial sediemnt discharge of each sediment grainsize range

%% Grain size distribution
D = 2.^(psi); %sediment grain size in mm
D = D/1000; %sediment grain size in m
% Settling velocity of each grain size using Ferguson and Church (2004)
% The constants, C1 = 18 and C2 = 1 for natural grains
ws=(R*g.*(D.^2))./(18*nu+(0.75*R*g.*D.^3).^0.5);
Pi = zeros(M,length(psi)); %fractional distribution of ith grain size at each node in the flood flow
Pdi = zeros(M,length(psi)); %fractional distribution of ith grain size at each node in the deposit
Pdi_0 = zeros(M,length(psi)); %fractional distribution of ith grain size at each node in the last deposited layer

%% Deposition parameters
lamda = 0.3; %porosity of sandy levee deposit
Ds = zeros(M,length(psi)); %deposit rate for each grain size on one iteration
Dst = zeros (M,1); %total rate at each node on one iteration
T_Ds = zeros(M,length(psi)); %total deposition rate for each grain size at each node
T_Dst= zeros(M,1); %total deposition rate at each node
Def = zeros(M,length(psi)); %deposit rate for each grain size after final steps
T_Def = zeros(M,1); %total deposit rate after final steps

%% Rouse-Vanoni Equilibrium Suspended sediment profile
Qs = a*((Qw*35.3)^b)*10^(3)/24/60/60; %0.5 kg/s
T_qso = 0.2*Qs/ros./Wc.*p; %m2/s sand and silt sediment flux

%%updated by hydrology model
Ht = Hbk + eta_Hf - T_eta(1); %total water level in channel
Uc = Uf0*10; % channel velocity

%% Calculate Sand Suspended load Concentration
cibar0H = zeros(1,length(psi)); %overflooded SSC
cibarH = zeros(1,length(psi)); %reference height 0.05H SSC
ca = zeros(1,length(psi)); %total SSC
ustar_c = sqrt(g.*Ht.*Sc); %channel shear velocity
P = ws./(0.4.*ustar_c); %Rouse number: the exponent of Rouse equation

for k=1:length(psi)
    fun = @(z) ((Ht./z - 1)./9).^P(k); % Rouse equation
    cibar0H(k) = integral(fun, Hbk, Ht); %input concentration
    cibarH(k) = integral(fun, 0.05*Ht, Ht);
    ca(k) = T_qso(k)/Uc*(cibarH(k)+1);
    qsoi(k) = Uc*cibar0H(k)*ca(k);
end

%% Initial Concentration of Suspended Sediment
for i=1:M
    cibar(i,:) = zeros(1,length(psi)); %(alpha.*qsoi)./qf; %initial sand & silt concentration
end

Hfi = eta_Hf.*ones(M,1) - T_eta(:); %update water depth at each node
qf = Hfi(1)*Uf0; %overflow flux
Uf = qf./Hfi; %overflow velocity
dHf = zeros(M,1); %depth variation
eta = zeros(M,1); %elevation at each node
Hf = Hfi; %varying overflow depth over time
    
for j=1:1:Niterations
    for i=1:1:M
        for k=1:1:length(psi) % each grain size
            %%
            if i==1
                cibar(i,k) = cibar(i,k) - cibar(i,k)/Hf(i,1)*dHf(i)*dt + (((qsoi(k)-qs(i,k))/dx) - ws(k)*cibar(i,k))*dt/Hf(i);
            else
                cibar(i,k) = cibar(i,k) - cibar(i,k)/Hf(i,1)*dHf(i)*dt + (((qs(i-1,k)-qs(i,k))/dx) - ws(k)*cibar(i,k))*dt/Hf(i,1);
            end %for if
            %%
            if cibar(i,k) < 0
                cibar(i,k) = 0;
                qs(i,k) = 0;
                Ds(i,k) = 0;
                break;
            end
               
            qs(i,k) = cibar(i,k)*qf; %sediment discharge at each node
            Ds(i,k) = ws(k)*cibar(i,k); %deposit rate for each grain size at each node on one iteration 

        end %for k

        qst(i) = sum(qs(i,:)); %total sediment discharge at each node 
        Dst(i) = sum(Ds(i,:)); %total deposit rate at each node on one iteration 
        eta(i) = eta(i) + (Dst(i))*dt/(1-lamda); %update sediment surface elevation (Exner equation)
        if eta(i) >= Hfi(i)
            eta(i) = Hfi(i);
            Hf(i) = 0;
            break;
        end
        Pi(i,:) = qs(i,:)./qst(i);  % fraction function of each suspended grain size at each node
            for k=1:length(psi)
                if Dst(i,1) > 0 && Ds(i,k) > 0
                   Pdi(i,k) = Ds(i,k)/Dst(i,1);
                   Pdi_0(i,k) = Ds(i,k)/Dst(i,1);
                else
                   Pdi(i,k) = Pdi_0(i,k);
                end
            end
    
            T_Ds(i,k) = T_Ds(i,k) + Ds(i,k); %total deposital rate at each node 
            T_Dst(i) = sum(T_Ds(i,:)); %total deposital rate at each node 
            Hf(i) = Hfi(i) - eta(i);
            dHf(i) = abs((Dst(i))*dt/(1-lamda)); %variation of flow depth per each interation
            Uf(i) = qf/Hf(i); %update flooded flow velocity
    end % for M     
    %%
    if Hf(i) == 0
         break;
    end
end %for j

Ag = zeros(M,1); %aggradation rate
for i=1:M
    if Hf(i) > 0
        Def(i,:) = cibar(i,:).*ws.*dt; %total deposit rate for each grain size after final steps
        T_Def(i) = sum(Def(i,:)); %total deposition at each node
    else
         T_Def(i) = 0;
    end
    
    T_eta(i) = T_eta(i) + eta(i) +  T_Def(i); %update total elevation
     
    if T_eta(i) < 0 
        T_eta(i) = 0;
    end
    
    Ag(i) = eta(i)/Niterations; %j, m/s

end

end
