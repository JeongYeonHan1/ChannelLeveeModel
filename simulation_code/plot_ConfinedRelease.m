%% Plotting Figure 10
close all
currentDir = pwd;
newDir = fullfile(currentDir, 'output','matfiles');
cd(newDir)
folderPath = fullfile(currentDir, 'output', 'figures');
mkdir(folderPath)

%Color 
color_rgb1 = [0.21 0.55 0.8];
color_rgb2 = [0.11 0.13 0.53];
color_rgb3 = [0.45 0.44 0.44];
color_rgb4 = [0.76 0.05 0.14];

%%
load('output_Va0.1cm_QQ5_Wf5.mat')
cn0 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf0 = std(detrend(y));

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh0 = std(detrend(h));

%% QQ5

load('output_Va0.01cm_QQ5_Wf5.mat')
cn1 = sum(ann_front(j,:));
y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf1 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh1 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va0.25cm_QQ5_Wf5.mat')
cn2 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf2 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh2 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va0.5cm_QQ5_Wf5.mat')
cn3 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf3 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh3 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va0.75cm_QQ5_Wf5.mat')
cn4 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf4 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh4 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va1cm_QQ5_Wf5.mat')
cn5 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf5 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh5 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va1.25cm_QQ5_Wf5.mat')
cn6 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf6 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh6 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va1.5cm_QQ5_Wf5.mat')
cn7 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf7 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh7 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va1.75cm_QQ5_Wf5.mat')
cn8 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf8 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh8 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va2cm_QQ5_Wf5.mat')
cn9 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf9 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh9 = (std(detrend(h))-stdh0)/stdh0;

%%
cn_q5 = [cn1,cn0,cn2,cn3,cn4,cn5,cn6,cn7,cn8,cn9];
stdf_q5 = [stdf1,0,stdf2,stdf3,stdf4,stdf5,stdf6,stdf7,stdf8,stdf9];
stdh_q5 = [stdh1,0,stdh2,stdh3,stdh4,stdh5,stdh6,stdh7,stdh8,stdh9];

%%
load('output_Va0.1cm_QQ5_Wf2.mat')
cn10= sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf10 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh10 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va0.1cm_QQ5_Wf4.mat')
cn11 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf11 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh11 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va0.1cm_QQ5_Wf6.mat')
cn12 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf12 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh12 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va0.1cm_QQ5_Wf8.mat')
cn13 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf13 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh13 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va0.1cm_QQ5_Wf10.mat')
cn14 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf14 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh14 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va0.1cm_QQ5_Wf12.mat')
cn15 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf15 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh15 = (std(detrend(h))-stdh0)/stdh0;


%%
cn_q5_2 = [cn10,cn11,cn12,cn13,cn14,cn15];
stdf_q5_2 = [stdf10,stdf11,stdf12,stdf13,stdf14,stdf15];
stdh_q5_2 = [stdh10,stdh11,stdh12,stdh13,stdh14,stdh15];

%% QQ3
load('output_Va0.01cm_QQ3_Wf5.mat')
cn1 = sum(ann_front(j,:));
y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf1 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh1 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va0.1cm_QQ3_Wf5.mat')
cn2 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf2 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh2 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va0.25cm_QQ3_Wf5.mat')
cn3 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf3 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh3 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va0.5cm_QQ3_Wf5.mat')
cn4 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf4 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh4 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va0.75cm_QQ3_Wf5.mat')
cn5 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf5 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh5 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va1cm_QQ3_Wf5.mat')
cn6 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf6 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh6 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va1.25cm_QQ3_Wf5.mat')
cn7 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf7 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh7 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va1.5cm_QQ3_Wf5.mat')
cn8 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf8 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh8 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va1.75cm_QQ3_Wf5.mat')
cn9 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf9 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh9 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va2cm_QQ3_Wf5.mat')
cn10 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf10 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh10 = (std(detrend(h))-stdh0)/stdh0;

cn_q3 = [cn1,cn2,cn3,cn4,cn5,cn6,cn7,cn8,cn9,cn10];
stdf_q3 = [stdf1,stdf2,stdf3,stdf4,stdf5,stdf6,stdf7,stdf8,stdf9,stdf10];
stdh_q3 = [stdh1,stdh2,stdh3,stdh4,stdh5,stdh6,stdh7,stdh8,stdh9,stdh10];

%%
load('output_Va0.1cm_QQ3_Wf2.mat')
cn11 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf11 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh11 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.1cm_QQ3_Wf4.mat')
cn12 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf12 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh12 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.1cm_QQ3_Wf6.mat')
cn13 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf13 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh13 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.1cm_QQ3_Wf8.mat')
cn14 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf14 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh14 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.1cm_QQ3_Wf10.mat')
cn15 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf15 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh15 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.1cm_QQ3_Wf12.mat')
cn16 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf16 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh16 = (std(detrend(h))-stdh0)/stdh0;


%%
cn_q3_2 = [cn11,cn12,cn13,cn14,cn15,cn16];
stdf_q3_2 = [stdf11,stdf12,stdf13,stdf14,stdf15,stdf16];
stdh_q3_2 = [stdh11,stdh12,stdh13,stdh14,stdh15,stdh16];

%% QQ7
load('output_Va0.01cm_QQ7_Wf5.mat')
cn1 = sum(ann_front(j,:));
y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf1 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh1 = (std(detrend(h))-stdh0)/stdh0;


load('output_Va0.1cm_QQ7_Wf5.mat')
cn2 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf2 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh2 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.25cm_QQ7_Wf5.mat')
cn3 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf3 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh3 = (std(detrend(h))-stdh0)/stdh0;


load('output_Va0.5cm_QQ7_Wf5.mat')
cn4 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf4 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh4 = (std(detrend(h))-stdh0)/stdh0;


load('output_Va0.75cm_QQ7_Wf5.mat')
cn5 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf5 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh5 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va1cm_QQ7_Wf5.mat')
cn6 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf6 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh6 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va1.25cm_QQ7_Wf5.mat')
cn7 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf7 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh7 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va1.5cm_QQ7_Wf5.mat')
cn8 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf8 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh8 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va1.75cm_QQ7_Wf5.mat')
cn9 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf9 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh9 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va2cm_QQ7_Wf5.mat')
cn10 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf10 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh10 = (std(detrend(h))-stdh0)/stdh0;

cn_q7 = [cn1,cn2,cn3,cn4,cn5,cn6,cn7,cn8,cn9,cn10];
stdf_q7 = [stdf1,stdf2,stdf3,stdf4,stdf5,stdf6,stdf7,stdf8,stdf9,stdf10];
stdh_q7 = [stdh1,stdh2,stdh3,stdh4,stdh5,stdh6,stdh7,stdh8,stdh9,stdh10];

%%
load('output_Va0.1cm_QQ7_Wf2.mat')
cn11 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf11 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh11 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.1cm_QQ7_Wf4.mat')
cn12 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf12 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh12 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.1cm_QQ7_Wf6.mat')
cn13 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf13 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh13 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.1cm_QQ7_Wf8.mat')
cn14 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf14 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh14 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.1cm_QQ7_Wf10.mat')
cn15 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf15 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh15 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.1cm_QQ7_Wf12.mat')
cn16 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf16 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh16 = (std(detrend(h))-stdh0)/stdh0;

%%
cn_q7_2 = [cn11,cn12,cn13,cn14,cn15,cn16];
stdf_q7_2 = [stdf11,stdf12,stdf13,stdf14,stdf15,stdf16];
stdh_q7_2 = [stdh11,stdh12,stdh13,stdh14,stdh15,stdh16];

%% QQ9
load('output_Va0.01cm_QQ9_Wf5.mat')
cn1 = sum(ann_front(j,:));
y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf1 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh1 = (std(detrend(h))-stdh0)/stdh0;

%%
load('output_Va0.1cm_QQ9_Wf5.mat')
cn2 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf2 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh2 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.25cm_QQ9_Wf5.mat')
cn3 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf3 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh3 = (std(detrend(h))-stdh0)/stdh0;


load('output_Va0.5cm_QQ9_Wf5.mat')
cn4 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf4 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh4 = (std(detrend(h))-stdh0)/stdh0;


load('output_Va0.75cm_QQ9_Wf5.mat')
cn5 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf5 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh5 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va1cm_QQ9_Wf5.mat')
cn6 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf6 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh6 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va1.25cm_QQ9_Wf5.mat')
cn7 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf7 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh7 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va1.5cm_QQ9_Wf5.mat')
cn8 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf8 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh8 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va1.75cm_QQ9_Wf5.mat')
cn9 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf9 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh9 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va2cm_QQ9_Wf5.mat')
cn10 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf10 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh10 = (std(detrend(h))-stdh0)/stdh0;

cn_q9 = [cn1,cn2,cn3,cn4,cn5,cn6,cn7,cn8,cn9,cn10];
stdf_q9 = [stdf1,stdf2,stdf3,stdf4,stdf5,stdf6,stdf7,stdf8,stdf9,stdf10];
stdh_q9 = [stdh1,stdh2,stdh3,stdh4,stdh5,stdh6,stdh7,stdh8,stdh9,stdh10];

%%
load('output_Va0.1cm_QQ9_Wf2.mat')
cn11 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf11 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh11 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.1cm_QQ9_Wf4.mat')
cn12 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf12 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh12 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.1cm_QQ9_Wf6.mat')
cn13 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf13 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh13 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.1cm_QQ9_Wf8.mat')
cn14 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf14 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh14 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.1cm_QQ9_Wf10.mat')
cn15 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf15 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh15 = (std(detrend(h))-stdh0)/stdh0;

load('output_Va0.1cm_QQ9_Wf12.mat')
cn16 = sum(ann_front(j,:));

y = (ann_front(j,:)+ann_back(j,:)).*7;
stdf16 = (std(detrend(y))-stdf0)/stdf0;

overh = eta_overflow(j,:);
h = overh(overh~=0);
stdh16 = (std(detrend(h))-stdh0)/stdh0;

%%
cn_q9_2 = [cn11,cn12,cn13,cn14,cn15,cn16];
stdf_q9_2 = [stdf11,stdf12,stdf13,stdf14,stdf15,stdf16];
stdh_q9_2 = [stdh11,stdh12,stdh13,stdh14,stdh15,stdh16];

%% Ac, in-channel aggradation
%CN
va = [0.01, 0.1, 0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0];
sz = 100;

figure(1); plot(va,cn_q3,'Color',color_rgb1,'LineWidth',1.5); 
hold on; plot(va,cn_q5,'Color',color_rgb2,'LineWidth',1.5);
plot(va,cn_q7,'Color',color_rgb3,'LineWidth',1.5);
plot(va,cn_q9,'Color',color_rgb4,'LineWidth',1.5);
hold on; scatter(va,cn_q3,sz,'MarkerFaceColor',color_rgb1,'Marker',"^",'MarkerEdgeColor','none');
hold on; scatter(va,cn_q5,sz,'MarkerFaceColor',color_rgb2,'MarkerEdgeColor','none');
hold on; scatter(va,cn_q7,sz,'MarkerFaceColor',color_rgb3,'Marker',"square",'MarkerEdgeColor','none');
hold on; scatter(va,cn_q9,sz,'MarkerFaceColor', color_rgb4,'Marker','diamond','MarkerEdgeColor','none'); box on
box on; set(gca,'LineWidth',1, 'XColor', 'k', 'YColor', 'k');ylim([0 45]);
fileName = 'CR_Ac.pdf';
saveas(gcf, fullfile(folderPath, fileName));

%flood 
figure(2); plot(va,stdf_q3.*100,'Color',color_rgb1,'LineWidth',1.5); 
hold on; plot(va,stdf_q5.*100,'Color',color_rgb2,'LineWidth',1.5);
plot(va,stdf_q7.*100,'Color',color_rgb3,'LineWidth',1.5);
plot(va,stdf_q9.*100,'Color',color_rgb4,'LineWidth',1.5);
hold on; scatter(va,stdf_q3.*100,sz,'MarkerFaceColor',color_rgb1,'Marker',"^",'MarkerEdgeColor','none');
hold on; scatter(va,stdf_q5.*100,sz,'MarkerFaceColor',color_rgb2,'MarkerEdgeColor','none');
hold on; scatter(va,stdf_q7.*100,sz,'MarkerFaceColor',color_rgb3,'Marker',"square",'MarkerEdgeColor','none');
hold on; scatter(va,stdf_q9.*100,sz,'MarkerFaceColor', color_rgb4,'Marker','diamond','MarkerEdgeColor','none'); box on
box on; set(gca,'LineWidth',1, 'XColor', 'k', 'YColor', 'k');ylim([-100 250]);
fileName = 'stdf_Ac.pdf';
saveas(gcf, fullfile(folderPath, fileName));

%stage height
figure(3); plot(va,stdh_q3.*100,'Color',color_rgb1,'LineWidth',1.5); 
hold on; plot(va,stdh_q5.*100,'Color',color_rgb2,'LineWidth',1.5);
plot(va,stdh_q7.*100,'Color',color_rgb3,'LineWidth',1.5);
plot(va,stdh_q9.*100,'Color',color_rgb4,'LineWidth',1.5);
hold on; scatter(va,stdh_q3.*100,sz,'MarkerFaceColor',color_rgb1,'Marker',"^",'MarkerEdgeColor','none');
hold on; scatter(va,stdh_q5.*100,sz,'MarkerFaceColor',color_rgb2,'MarkerEdgeColor','none');
hold on; scatter(va,stdh_q7.*100,sz,'MarkerFaceColor',color_rgb3,'Marker',"square",'MarkerEdgeColor','none');
hold on; scatter(va,stdh_q9.*100,sz,'MarkerFaceColor', color_rgb4,'Marker','diamond','MarkerEdgeColor','none'); box on
box on; set(gca,'LineWidth',1, 'XColor', 'k', 'YColor', 'k');ylim([-100 250]);
fileName = 'stdh_Ac.pdf';
saveas(gcf, fullfile(folderPath, fileName));

%% Wf/Wc, channel-floodplain width ratio
%CN
wf = 2:2:12;
figure(4); plot(wf,cn_q3_2,'Color',color_rgb1,'LineWidth',1.5); 
hold on; plot(wf,cn_q5_2,'Color',color_rgb2,'LineWidth',1.5);
plot(wf,cn_q7_2,'Color',color_rgb3,'LineWidth',1.5);
plot(wf,cn_q9_2,'Color',color_rgb4,'LineWidth',1.5);
hold on; scatter(wf,cn_q3_2,sz,'MarkerFaceColor',color_rgb1,'Marker',"^",'MarkerEdgeColor','none');
hold on; scatter(wf,cn_q5_2,sz,'MarkerFaceColor',color_rgb2,'MarkerEdgeColor','none');
hold on; scatter(wf,cn_q7_2,sz,'MarkerFaceColor',color_rgb3,'Marker',"square",'MarkerEdgeColor','none');
hold on; scatter(wf,cn_q9_2,sz,'MarkerFaceColor', color_rgb4,'Marker','diamond','MarkerEdgeColor','none'); box on
box on; set(gca,'LineWidth',1, 'XColor', 'k', 'YColor', 'k');ylim([0 45]);
fileName = 'CR_Wf.pdf';
saveas(gcf, fullfile(folderPath, fileName));

%flood 
figure(5); plot(wf,stdf_q3_2.*100,'Color',color_rgb1,'LineWidth',1.5); 
hold on; plot(wf,stdf_q5_2.*100,'Color',color_rgb2,'LineWidth',1.5);
plot(wf,stdf_q7_2.*100,'Color',color_rgb3,'LineWidth',1.5);
plot(wf,stdf_q9_2.*100,'Color',color_rgb4,'LineWidth',1.5);
hold on; scatter(wf,stdf_q3_2.*100,sz,'MarkerFaceColor',color_rgb1,'Marker',"^",'MarkerEdgeColor','none');
hold on; scatter(wf,stdf_q5_2.*100,sz,'MarkerFaceColor',color_rgb2,'MarkerEdgeColor','none');
hold on; scatter(wf,stdf_q7_2.*100,sz,'MarkerFaceColor',color_rgb3,'Marker',"square",'MarkerEdgeColor','none');
hold on; scatter(wf,stdf_q9_2.*100,sz,'MarkerFaceColor', color_rgb4,'Marker','diamond','MarkerEdgeColor','none'); box on
box on; set(gca,'LineWidth',1, 'XColor', 'k', 'YColor', 'k');ylim([-100 250]);
fileName = 'stdf_Wf.pdf';
saveas(gcf, fullfile(folderPath, fileName));

%stage height
figure(6); plot(wf,stdh_q3_2.*100,'Color',color_rgb1,'LineWidth',1.5); 
hold on; plot(wf,stdh_q5_2.*100,'Color',color_rgb2,'LineWidth',1.5);
plot(wf,stdh_q7_2.*100,'Color',color_rgb3,'LineWidth',1.5);
plot(wf,stdh_q9_2.*100,'Color',color_rgb4,'LineWidth',1.5);
hold on; scatter(wf,stdh_q3_2.*100,sz,'MarkerFaceColor',color_rgb1,'Marker',"^",'MarkerEdgeColor','none');
hold on; scatter(wf,stdh_q5_2.*100,sz,'MarkerFaceColor',color_rgb2,'MarkerEdgeColor','none');
hold on; scatter(wf,stdh_q7_2.*100,sz,'MarkerFaceColor',color_rgb3,'Marker',"square",'MarkerEdgeColor','none');
hold on; scatter(wf,stdh_q9_2.*100,sz,'MarkerFaceColor', color_rgb4,'Marker','diamond','MarkerEdgeColor','none'); box on
box on; set(gca,'LineWidth',1, 'XColor', 'k', 'YColor', 'k');ylim([-100 250]);
fileName = 'stdh_Wf.pdf';
saveas(gcf, fullfile(folderPath, fileName));
