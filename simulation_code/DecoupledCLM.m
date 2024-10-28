%==========================================================
% Decoupled Channel-levee evolution Model 
% with synthetic Hydrograph model
% By JeongYeon Han, Douglas Edmonds (2024)
% Front loading vs. Back loading
%==========================================================
clear all; 
warning('off');

%% Grain size distribution
psi = [-6 -5 -4 -3 -2 -1 0 1]; %grain size range
% Choose the grain size distribution and D50
% Case 1 - unimodal & D50 = 0.125 mm
psibar = -2;   %mean psi
sigma = 0.8;    %standard deviation for normal distribution
p =(1/(sqrt(2*pi)*sigma))*exp(-(((psi-psibar)./sigma).^2)/2); %gaussian grain size distribution
% Case 2 - unimodal & D50 = 0.25 mm
% psibar = -3;   %mean psi
% sigma = 0.8;    %standard deviation for normal distribution
% p =(1/(sqrt(2*pi)*sigma))*exp(-(((psi-psibar)./sigma).^2)/2); %gaussian grain size distribution
% Case 3 - bimodal & D50 = 0.56 mm
% PDF_c = normpdf(psi, -4, 0.8) + 2*normpdf(psi, -1, 0.8);
% p = PDF_c/sum(PDF_c); % normalise it, i.e. sum equals to one.
% Case 4 - bimodal & D50 = 0.063 mm
% PDF_f = 2*normpdf(psi, -4, 0.8) + normpdf(psi, -1, 0.8);
% p = PDF_f/sum(PDF_f); % normalise it, i.e. sum equals to one.

%% Hydrology parameter
n = 52; % 52 weeks per year
yr = 250; % Total years
it = n*yr; % Iternation number
Q_bk0 = 1000; % Initial bankfull discharge
tt = 1; % number of aggradation rate

% Generate Hydraulic Geometry 
% Initial channel depth (Hc0), channel width (Wc)
% Bankfull flow velocity (U_bk), channel slope (S)
[Hc0, Wc, U_bk, S] = HydraulicGeometry(Q_bk0);

%%Select Channel-floodplain width ratio, r
r = 5; % Channel-floodplain width ratio, r = 2.5, 5, 7.5, 10
Wf = r*Wc; %confined floodplain width (Wf)

% load synthetic hydrograph ['Qw_QQ3.mat', 'Qw_QQ5.mat', 'Qw_QQ7.mat','Qw_QQ9.mat']
currentDir = pwd;
newDir = fullfile(currentDir, 'synthetic_hydrographs');
cd(newDir);
load('Qw_QQ3.mat',"QQ","Qw","flday")
Qwt = Qw;
cd(currentDir);

%% Flood characteristics
% set arrays
Q_bk = zeros(it,1); % Update bankfull discharge
Hc = zeros(it,1); % Update channel depth
Hch = zeros(it,1); % compound channel depth
Ht = zeros(it,1); % Update channel depth
Ut = zeros(it,1); % Update channel velocity
eta_Hf = 0; % Overflow water level
Hf_matrix = zeros(it,1); % Overflow depth
Uf_matrix = zeros(it,1); % Overflow velocity
k = zeros(tt,yr); % Flooded number 

%% Assign Initial Slope for floodplain
M = r*8; % Number of node 
L = Wf*(M/(M+1)); % levee reach
eta_overflow = zeros(tt,it); % overflow level
eta_floodplain = zeros(tt,it); % average floodplain accumulation height
crest = zeros(tt,it); % levee crest height

Q_front = zeros(tt,it); % fully inundated discharge
Q_back = zeros(tt,it); % partially inundated discharge 
Hf_back = zeros(it,M); % updated overflow level after including overbank deposit volume
Hf_back0 = zeros(it,1); % initial overflow level before including overbank deposit volume
annTotal = zeros(tt,yr,M); % Annual levee crest elevation
ann_front = zeros(tt,yr); % Annaul number of front loading events
ann_back = zeros(tt,yr); % Annual number of back loading events

total_eta = zeros(tt,it,M); %update total elevation of overbank accumulation
front_agg = zeros(it,M); % Aggradation rate of front loading events
front_eta = zeros(it,M); % elevation updates when front loading
back_eta = zeros(it,M); % elevation updates when back loading

%% User defined parameters for SSC
% Example is Trinity River, TX at Rosser from Strom, K., & Hosseiny, H. (2015). 
a = 0.2; % Rating curve for SSC from Trinity River (Rosser)
b = 1.2; % Rating curve for SSC from Trinity River (Rosser)

%%
Kk = 0; % Annual flooding number
Pdi= zeros(M,length(psi)); %probablity density for grain sizes
fd = zeros(M,length(psi)); %cumulative density for grain sizes

% Update levee aggradation
for j=1:tt %tt 
    va = 1.9231e-06*10; %0.1 cm/yr range: 1.9231e-06*[1 to 200] -> [0.01 cm/yr to 2 cm/yr]
    eta = zeros(M,1); %flat initial topography
    Ht = zeros(it,1); %total channel depth

    for i=1:it
        Hc(i) = Hc0 - va*i; %update channel depth
        %Hc(i) = Hc0 - va*i - 0.1*Hc0/(max(Qw)-min(Qw))*(Qw(i)-(min(Qw)+max(Qw))./2); %update channel depth with delBE = 0.1
        %Hc(i) = Hc0 - va*i - 0.2*Hc0/(max(Qw)-min(Qw))*(Qw(i)-(min(Qw)+max(Qw))./2); %update channel depth with delBE = 0.2
        Ht(i) = Hc(i) + eta(1); %update new total bankfull channel

        if Ht(i) < 0.005 %channel depth tolerance
            break;
        end

        Ut(i) = (Wc*Ht(i)/(2*Ht(i)+Wc))^(2/3)*S^(1/2)/0.025; % calculate bankfull velocity by Manning's equation
        Q_bk(i) = Ht(i)*Wc*Ut(i); %update Bankfull discharge
        Total_ele = 0;
        for nm = 1:M-1
                    Total_ele = Total_ele + (eta(nm)+eta(nm+1)-2*eta(M))/2;
        end
        H_area = Total_ele/(M+1); %overbank deposit volume convert to [L] unit

        if Qwt(i) > Q_bk(i) %flood condition
            Kk = Kk + 1; %update annual flooding days
            Hch(i) = Hc(i) + eta(M); %updated bankfull depth for compound channel calculation
            [Hf,Uf] = OverflowLevel(Qwt(i),Hch(i),Wc,Wf,S); %calculate overflow depth and velocity
            Hf_matrix(i,1) = Hf; %overflow depth
            Uf_matrix(i,1) = Uf; %overflow velocity
            
            if Hf+eta(M) > eta(1)+ 10^(-5) %Front loading
                eta_Hf = Hf + eta(M) + 2*(H_area)*Wf/(2*Wf+Wc); %initial overflow depth applying levee volume
                [eta, Ag] = LeveeBimodal(Qwt(i), Hch(i), Ht(i), Wc, r, eta_Hf, Hf, Uf, L, eta, S, a, b, psi, p); %run frontloading model
                Q_front(j,i) = Qwt(i); %save discharge for front loading
                front_agg(i,:) = Ag(:); %save aggradation rate for front loading
                front_eta(i,:) = eta(:); % save elevation for front loading
            else %Back loading
                [eta, Ag, Hfi] = Backloading_wellmix(Qwt(i), Hch(i), Ht(i), Wc, r, Hf, Uf, L, eta, S, a, b, psi, p); %run backloading model
                if Hfi(1) > 0 %Front loading if the inundated overbank deposit increased the water level higher than levee crest height
                    Q_front(j,i) = Qwt(i); % save discharge for front loading
                    front_agg(i,:) = Ag(:); % save aggradation rate for front loading
                    front_eta(i,:) = eta(:); % save elevation for front loading
                else %Back loading
                    Q_back(j,i) = Qwt(i); % save discharge for back loading
                    Hf_back(i,:) = Hfi; % save adjusted water depth for back loading
                    Hf_back0(i) = Hf; % save initial water depth for back loading
                end
                eta_Hf = Hfi(M) + eta(M); %updated overbank flow level
                back_eta(i,:) = eta(:); % save elevation for back loading
            end

        else %no flood
            eta_Hf = 0; %overbank flow level is zero
        end

         %update total levee elevation change
         total_eta(j,i,:) = eta; %total elevations
         crest(j,i) = eta(1); %levee crest elevation
         eta_overflow(j,i) = eta_Hf; %flood stage at each time step

         T_ele = 0;
         for nm = 1:M-1
                    T_ele = T_ele + (eta(nm)+eta(nm+1))/2;
         end
         eta_floodplain(j,i) = T_ele/(M+1); %average floodplain elevation change

         %Flooding days and levee crest elevation for each year
         for t=1:yr
             if i == n*t
                k(j,t) = Kk;
                Kk = 0;
                annTotal(j,t,:) = eta';
            end
            ann_front(j,t) = nnz(Q_front(j,(n*(t-1)+1):n*t)); %annual front loading events
            ann_back(j,t) = nnz(Q_back(j,(n*(t-1)+1):n*t)); %annual back loading events
         end

% check the superelevation for avulsion
        if va*i >= Hc0+eta(M) 
            fprintf("\n Avulsion at %g \n", i/52);
            break;
        end
    end

%save output file
folder = fullfile(currentDir, 'output','matfiles');
mkdir(folder)
baseFileName = sprintf('output_Va%.2fcm_QQ%g_Wf%g.mat',va*52*100,QQ,r);
fullMatFileName = fullfile(folder, baseFileName);
save(fullMatFileName);  
end 
%==========================================================


