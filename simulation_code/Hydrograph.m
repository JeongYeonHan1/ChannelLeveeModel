%% Function - generate a synthetic Hydrograph
function [Qw, k_day] = Hydrograph(Q_bk0,QQ,p50,it)

%Input
%Q_bk0: bankfull discharge
%QQ: discharge variability
%p50: 50th percentile value
%it: total run time [weeks]
%Output
%Qw: weekly flow discharge
%k_day: annual flooding days

%% Example
% Generate synthetic Hydrograph
% Daily Discharge (Qw), total flooding number (k0)
% Discharge variability Q90/Q50 -> QQ
% QQ = 5; %3/5/7/9
% p50 = 0.19; % 0.45/0.28/0.24/0.21
% [Qw, flday] = Hydrograph(Q_bk0,QQ,p50,it);
% save Qw_test.mat

% Define the desired percentiles
p90 = QQ*p50;  % 90th percentile value
p100 = 2.5*p90;  % 99th percentile value

% Using the log-normal quantile (inverse CDF) function to determine mu and sigma:
syms m sig real;
eqn1 = erfc(-(log(p50)-m)/(sig*sqrt(2)))/2 == 50/100;
eqn2 = erfc(-(log(p90)-m)/(sig*sqrt(2)))/2 == 90/100;

[muest, sigest] = vpasolve(eqn1,eqn2,m,sig);
muest = double(muest);
sigest = double(sigest);

% Create the log-normal distribution object with the calculated parameters
lognormal_dist = makedist('Lognormal', 'mu', muest, 'sigma', sigest);

% Generate n=it random samples from the log-normal distribution
num_samples = it;
samples = random(lognormal_dist, num_samples, 1);

% Cap values above the maximum value by resampling
for i = 1:num_samples
    while samples(i) > p100
        samples(i) = random(lognormal_dist, 1, 1);
    end
end

Qw = Q_bk0*samples;
k0 = sum(Qw(:,1) > Q_bk0,'all'); %total number of flooding events
k_day = k0.*52*7./it; %annual flood days

end

