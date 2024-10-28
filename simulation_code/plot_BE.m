%% Figure 11
%Ac = 0.01 cm/yr
clear all; close all;
load('output_Va0.01cm_QQ5_Wf5.mat')
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
v11 = sum(y_new)/10;
load('output_Va0.01cm_QQ5_Wf5_BE1.mat')
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
v12 = sum(y_new)/10;
load('output_Va0.01cm_QQ5_Wf5_BE2.mat')
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
v13 = sum(y_new)/10;
%Ac = 0.1 cm/yr
load('output_Va0.1cm_QQ5_Wf5.mat')
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
v21 = sum(y_new)/10;
load('output_Va0.1cm_QQ5_Wf5_BE1.mat')
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
v22 = sum(y_new)/10;
load('output_Va0.1cm_QQ5_Wf5_BE2.mat')
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
v23 = sum(y_new)/10;
%Ac = 0.5 cm/yr
load('output_Va0.5cm_QQ5_Wf5.mat')
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
v31 = sum(y_new)/10;
load('output_Va0.5cm_QQ5_Wf5_BE1.mat')
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
v32 = sum(y_new)/10;
load('output_Va0.5cm_QQ5_Wf5_BE2.mat')
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
v33 = sum(y_new)/10;
%Ac = 1 cm/yr
load('output_Va1cm_QQ5_Wf5.mat')
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
v41 = sum(y_new)/10;
load('output_Va1cm_QQ5_Wf5_BE1.mat')
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
v42 = sum(y_new)/10;
load('output_Va1cm_QQ5_Wf5_BE2.mat')
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
v43 = sum(y_new)/10;

v = [v11;v12;v13;v21;v22;v23;v31;v32;v33;v41;v42;v43];
v = v';
x = 1:12;
group = repmat(x, 25, 1);
group = group(:);
vt = v(:);
figure(4);
b = boxchart(group,vt,'BoxFaceColor', 'b');
b.BoxEdgeColor = 'k'; 

%Figure 11c
figure(4); hold on; scatter(ones(1,25), v11, 30, 'k', 'filled');
hold on; scatter(2*ones(1,25), v12, 30, 'k', 'filled');
hold on; scatter(3*ones(1,25), v13, 30, 'k', 'filled');

figure(4); hold on; scatter(4*ones(1,25), v21, 30, 'k', 'filled');
hold on; scatter(5*ones(1,25), v22, 30, 'k', 'filled');
hold on; scatter(6*ones(1,25), v23, 30, 'k', 'filled');

figure(4); hold on; scatter(7*ones(1,25), v31, 30, 'k', 'filled');
hold on; scatter(8*ones(1,25), v32, 30, 'k', 'filled');
hold on; scatter(9*ones(1,25), v33, 30, 'k', 'filled');

figure(4); hold on; scatter(10*ones(1,25), v41, 30, 'k', 'filled');
hold on; scatter(11*ones(1,25), v42, 30, 'k', 'filled');
hold on; scatter(12*ones(1,25), v43, 30, 'k', 'filled');
ylim([0 45]);

set(gca,'xtick',[mean(1:3), mean(4:6), mean(7:9), mean(10:12)])
set(gca,'xticklabel',{'0.01','0.1','0.5','1'})
box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');

% Figures 11a and 11b
% Color palette
color_rgb1 = [0.21 0.55 0.8];
color_rgb2 = [0.11 0.13 0.53];
color_rgb3 = [0.45 0.44 0.44];
color_rgb4 = [0.76 0.05 0.14];

load('output_Va0.1cm_QQ5_Wf5.mat')
y = ann_front(j,:)+ann_back(j,:);
x_new = 1:floor(i/52/10);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 

p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
yresid = Avg10 - y_newregression;
SSresid = sum(yresid.^2);
df = length(Avg10) - 2; % degrees of freedom
sigma = sqrt(SSresid / df);
CI = tinv(0.95, df) * sigma; % 95% confidence interval

figure(7); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb2);ylim([0 3.5]);
% Plot the data points
figure(8); hold on; ylim([0 45]);
scatter(x_new, Avg10, 100, 'o','fill','MarkerFaceColor', color_rgb2,'MarkerEdgeColor', 'none'); hold on;
errorbar(1:25, meanData, err, 'k', 'LineWidth', 0.75);
% Plot the regression line
plot(x_new, y_newregression,'LineWidth', 1.5,'Color',color_rgb2); hold on;
% Plot confidence intervals
plot(x_new, y_newregression + CI, '--','LineWidth', 1,'Color',color_rgb2); hold on;
plot(x_new, y_newregression - CI, '--','LineWidth', 1,'Color',color_rgb2); hold on;
mean(y);

load('output_Va0.1cm_QQ5_Wf5_BE1.mat')
y = ann_front(j,:)+ann_back(j,:);
x_new = 1:floor(i/52/10);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);

meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
yresid = Avg10 - y_newregression;
SSresid = sum(yresid.^2);
df = length(Avg10) - 2; % degrees of freedom
sigma = sqrt(SSresid / df); 
CI = tinv(0.95, df) * sigma; % 95% confidence interval

%
figure(7);hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb1);ylim([0 3.5]);
% Plot the data points
figure(8); hold on; ylim([0 45]);
scatter(x_new, Avg10, 100, 'o','fill','MarkerFaceColor', color_rgb1,'MarkerEdgeColor', 'none'); hold on;
errorbar(1:25, meanData, err, 'k', 'LineWidth', 0.75);
% Plot the regression line
plot(x_new, y_newregression,'LineWidth', 1.5,'Color',color_rgb1); hold on;
% Plot confidence intervals
plot(x_new, y_newregression + CI, '--','LineWidth', 1,'Color',color_rgb1); hold on;
plot(x_new, y_newregression - CI, '--','LineWidth', 1,'Color',color_rgb1); hold on;
mean(y);

load('output_Va0.1cm_QQ5_Wf5_BE2.mat')
y = ann_front(j,:)+ann_back(j,:);
x_new = 1:floor(i/52/10);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
yresid = Avg10 - y_newregression;
SSresid = sum(yresid.^2);
df = length(Avg10) - 2; % degrees of freedom
sigma = sqrt(SSresid / df);
CI = tinv(0.95, df) * sigma; % 95% confidence interval

figure(7);hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb4);ylim([0 3.5]);
box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
% Plot the data points
figure(8);hold on; ylim([0 45]);
scatter(x_new, Avg10, 100, 'o','fill','MarkerFaceColor', color_rgb4,'MarkerEdgeColor', 'none'); hold on;
errorbar(1:25, meanData, err, 'k', 'LineWidth', 0.75);
% Plot the regression line
plot(x_new, y_newregression,'LineWidth', 1.5,'Color',color_rgb4); hold on;
% Plot confidence intervals
plot(x_new, y_newregression + CI, '--','LineWidth', 1,'Color',color_rgb4); hold on;
plot(x_new, y_newregression - CI, '--','LineWidth', 1,'Color',color_rgb4); hold on;
box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
ylim([0 45]);
%mean(y);


