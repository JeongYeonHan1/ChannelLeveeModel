%% plotting figures 4, 5, 6, 7, 8, 9
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

%% Figure 4, 5, 6, 8
%% Ac, in-channel aggradation
close all
load('output_Va0.01cm_QQ5_Wf5.mat')
figure(1); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb1); ylim([0 3.5]);
t = linspace(1,250,it);
figure(2); hold on; plot(t,eta_floodplain(j,:)*100,'LineWidth', 1.5,'Color',color_rgb1); ylim([0 60]);
figure(3); hold on; plot(t,Q_bk./Q_bk0,'LineWidth', 1.5,'Color',color_rgb1); ylim([1 3.5]);
figure(4);
x_new = 1:floor(i/52/10);
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
scatter(x_new,Avg10,100,'MarkerFaceColor', color_rgb1,'MarkerEdgeColor', 'none'); hold on;
h = errorbar(1:(i/52/10), meanData, err, 'LineWidth', 0.75);
h.Color = color_rgb1; h.Color(4) = 0.7;

p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
hold on; plot(x_new, y_newregression, '-', 'LineWidth', 1,'Color',color_rgb1); ylim([0 45]);

load('output_Va0.1cm_QQ5_Wf5.mat')
figure(1); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb2); ylim([0 3.5]);
t = linspace(1,250,it);
figure(2); hold on; plot(t,eta_floodplain(j,:)*100,'LineWidth', 1.5,'Color',color_rgb2); ylim([0 60]);
figure(3); hold on; plot(t,Q_bk./Q_bk0,'LineWidth', 1.5,'Color',color_rgb2); ylim([1 3.5]);
figure(4);
x_new = 1:floor(i/52/10);
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
scatter(x_new,Avg10,100,'MarkerFaceColor', color_rgb2,'MarkerEdgeColor', 'none'); hold on;
h = errorbar(1:(i/52/10), meanData, err, 'LineWidth', 0.75);
h.Color = color_rgb2; h.Color(4) = 0.7;

p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
hold on; plot(x_new, y_newregression, '-', 'LineWidth', 1, 'Color', color_rgb2); ylim([0 45]);

load('output_Va0.5cm_QQ5_Wf5.mat')
figure(1); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb3); ylim([0 3.5]);
t = linspace(1,250,it);
figure(2); hold on; plot(t,eta_floodplain(j,:)*100,'LineWidth', 1.5,'Color',color_rgb3); ylim([0 60]);
figure(3); hold on; plot(t,Q_bk./Q_bk0,'LineWidth', 1.5,'Color',color_rgb3); ylim([1 3.5]);
figure(4);
x_new = 1:floor(i/52/10);
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
scatter(x_new,Avg10,100,'MarkerFaceColor', color_rgb3,'MarkerEdgeColor', 'none'); hold on;
h = errorbar(1:(i/52/10), meanData, err, 'LineWidth', 0.75);
h.Color = color_rgb3; h.Color(4) = 0.7;

p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
hold on; plot(x_new, y_newregression, '-', 'LineWidth', 1,'Color',color_rgb3); ylim([0 45]);

load('output_Va1cm_QQ5_Wf5.mat')
figure(1); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb4); ylim([0 3.5]);
 
box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
fileName = 'Ac_eta.pdf';
saveas(gcf, fullfile(folderPath, fileName));

t = linspace(1,250,it);
figure(2); hold on; plot(t,eta_floodplain(j,:)*100,'LineWidth', 1.5,'Color',color_rgb4); ylim([0 60]);
 
 box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
fileName = 'Ac_floodplain.pdf';
saveas(gcf, fullfile(folderPath, fileName));

figure(3); hold on; plot(t,Q_bk./Q_bk0,'LineWidth', 1.5,'Color',color_rgb4); ylim([1 3.5]);
 
 box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
fileName = 'Ac_Qbk.pdf';
saveas(gcf, fullfile(folderPath, fileName));

figure(4);
x_new = 1:floor(i/52/10);
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
scatter(x_new,Avg10,100,'MarkerFaceColor', color_rgb4,'MarkerEdgeColor', 'none'); hold on;
h = errorbar(1:(i/52/10), meanData, err, 'LineWidth', 0.75);
h.Color = color_rgb4; h.Color(4) = 0.7;

p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
hold on; plot(x_new, y_newregression, '-', 'LineWidth', 1,'Color',color_rgb4); ylim([0 45]);
 
box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
fileName = 'Ac_flood.pdf';
saveas(gcf, fullfile(folderPath, fileName));

%% Q50/Q90, Discharge variability
close all;
load('output_Va0.1cm_QQ3_Wf5.mat')
figure(1); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb1);ylim([0 3.5]);
t = linspace(1,250,it);
figure(2); hold on; plot(t,eta_floodplain(j,:)*100,'LineWidth', 1.5,'Color',color_rgb1); ylim([0 60]);
figure(3); hold on; plot(t,Q_bk./Q_bk0,'LineWidth', 1.5,'Color',color_rgb1); ylim([1 3.5]);
figure(4);
x_new = 1:floor(i/52/10);
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
scatter(x_new,Avg10,100,'MarkerFaceColor', color_rgb1,'MarkerEdgeColor', 'none'); hold on;
h = errorbar(1:(i/52/10), meanData, err, 'LineWidth', 0.75);
h.Color = color_rgb1; h.Color(4) = 0.7;
p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
hold on; plot(x_new, y_newregression, '-', 'LineWidth', 1,'Color',color_rgb1);ylim([0 45]);

load('output_Va0.1cm_QQ5_Wf5.mat')
figure(1); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb2);
t = linspace(1,250,it);
figure(2); hold on; plot(t,eta_floodplain(j,:)*100,'LineWidth', 1.5,'Color',color_rgb2); ylim([0 60]);
figure(3); hold on; plot(t,Q_bk./Q_bk0,'LineWidth', 1.5,'Color',color_rgb2); ylim([1 3.5]);
figure(4);
x_new = 1:floor(i/52/10);
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
scatter(x_new,Avg10,100,'MarkerFaceColor', color_rgb2,'MarkerEdgeColor', 'none'); hold on;
h = errorbar(1:(i/52/10), meanData, err, 'LineWidth', 0.75);
h.Color = color_rgb2; h.Color(4) = 0.7;
p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
hold on; plot(x_new, y_newregression, '-', 'LineWidth', 1,'Color',color_rgb2);ylim([0 45]);

load('output_Va0.1cm_QQ7_Wf5.mat')
figure(1); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb3);
t = linspace(1,250,it);
figure(2); hold on; plot(t,eta_floodplain(j,:)*100,'LineWidth', 1.5,'Color',color_rgb3); ylim([0 60]);
figure(3); hold on; plot(t,Q_bk./Q_bk0,'LineWidth', 1.5,'Color',color_rgb3); ylim([1 3.5]);
figure(4);
x_new = 1:floor(i/52/10);
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
scatter(x_new,Avg10,100,'MarkerFaceColor', color_rgb3,'MarkerEdgeColor', 'none'); hold on;
h = errorbar(1:(i/52/10), meanData, err, 'LineWidth', 0.75);
h.Color = color_rgb3; h.Color(4) = 0.7;
p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
hold on; plot(x_new, y_newregression, '-', 'LineWidth', 1,'Color',color_rgb3);ylim([0 45]);

load('output_Va0.1cm_QQ9_Wf5.mat')
figure(1); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb4);
 
 box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
fileName = 'QQ_eta.pdf';
saveas(gcf, fullfile(folderPath, fileName));

t = linspace(1,250,it);
figure(2); hold on; plot(t,eta_floodplain(j,:)*100,'LineWidth', 1.5,'Color',color_rgb4);ylim([0 60]);
 
 box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
fileName = 'QQ_floodplain.pdf';
saveas(gcf, fullfile(folderPath, fileName));

figure(3); hold on; plot(t,Q_bk./Q_bk0,'LineWidth', 1.5,'Color',color_rgb4); ylim([1 3.5]);
 
 box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
fileName = 'QQ_Qbk.pdf';
saveas(gcf, fullfile(folderPath, fileName));

figure(4);
x_new = 1:floor(i/52/10);
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
scatter(x_new,Avg10,100,'MarkerFaceColor', color_rgb4,'MarkerEdgeColor', 'none'); hold on;
h = errorbar(1:(i/52/10), meanData, err, 'LineWidth', 0.75);
h.Color = color_rgb4; h.Color(4) = 0.7;
p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
hold on; plot(x_new, y_newregression, '-', 'LineWidth', 1,'Color',color_rgb4);ylim([0 45]);
 
 box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
fileName = 'QQ_flood.pdf';
saveas(gcf, fullfile(folderPath, fileName));

%% D50, Grain size distribution
close all;
load('output_Va0.1cm_QQ5_Wf5_D3.mat')
figure(1); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb1);
t = linspace(1,250,it);
figure(2); hold on; plot(t,eta_floodplain(j,:)*100,'LineWidth', 1.5,'Color',color_rgb1); ylim([0 60]);
figure(3); hold on; plot(t,Q_bk./Q_bk0,'LineWidth', 1.5,'Color',color_rgb1); 
figure(4);
x_new = 1:floor(i/52/10);
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
scatter(x_new,Avg10,100,'MarkerFaceColor', color_rgb1,'MarkerEdgeColor', 'none'); hold on;
h = errorbar(1:(i/52/10), meanData, err, 'LineWidth', 0.75);
h.Color = color_rgb1; h.Color(4) = 0.7;
p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
hold on; plot(x_new, y_newregression, '-', 'LineWidth', 1,'Color',color_rgb1); ylim([0 45]);

load('output_Va0.1cm_QQ5_Wf5.mat')
figure(1); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb2);
t = linspace(1,250,it);
figure(2); hold on; plot(t,eta_floodplain(j,:)*100,'LineWidth', 1.5,'Color',color_rgb2); ylim([0 60]);
figure(3); hold on; plot(t,Q_bk./Q_bk0,'LineWidth', 1.5,'Color',color_rgb2); 
figure(4);
x_new = 1:floor(i/52/10);
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
scatter(x_new,Avg10,100,'MarkerFaceColor', color_rgb2,'MarkerEdgeColor', 'none'); hold on;
h = errorbar(1:(i/52/10), meanData, err, 'LineWidth', 0.75);
h.Color = color_rgb2; h.Color(4) = 0.7;
p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
hold on; plot(x_new, y_newregression, '-', 'LineWidth', 1,'Color',color_rgb2);ylim([0 45]);

load('output_Va0.1cm_QQ5_Wf5_Df.mat')
figure(1); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb3);
t = linspace(1,250,it);
figure(2); hold on; plot(t,eta_floodplain(j,:)*100,'LineWidth', 1.5,'Color',color_rgb3); ylim([0 60]);
figure(3); hold on; plot(t,Q_bk./Q_bk0,'LineWidth', 1.5,'Color',color_rgb3); 
figure(4);
x_new = 1:floor(i/52/10);
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
scatter(x_new,Avg10,100,'MarkerFaceColor', color_rgb3,'MarkerEdgeColor', 'none'); hold on;
h = errorbar(1:(i/52/10), meanData, err, 'LineWidth', 0.75);
h.Color = color_rgb3; h.Color(4) = 0.7;

p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
hold on; plot(x_new, y_newregression, '-', 'LineWidth', 1,'Color',color_rgb3);ylim([0 45]);

load('output_Va0.1cm_QQ5_Wf5_Dc.mat')
figure(1); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb4); ylim([0 3.5]);
 
 box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
fileName = 'D_eta.pdf';
saveas(gcf, fullfile(folderPath, fileName));

t = linspace(1,250,it);
figure(2); hold on; plot(t,eta_floodplain(j,:)*100,'LineWidth', 1.5,'Color',color_rgb4); ylim([0 60]);
 
 box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
fileName = 'D_floodplain.pdf';
saveas(gcf, fullfile(folderPath, fileName));

figure(3); hold on; plot(t,Q_bk./Q_bk0,'LineWidth', 1.5,'Color',color_rgb4); ylim([1 3.5]);
 
 box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
fileName = 'D_Qbk.pdf';
saveas(gcf, fullfile(folderPath, fileName));

figure(4);
x_new = 1:floor(i/52/10);
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
scatter(x_new,Avg10,100,'MarkerFaceColor', color_rgb4,'MarkerEdgeColor', 'none'); hold on;
h = errorbar(1:(i/52/10), meanData, err, 'LineWidth', 0.75);
h.Color = color_rgb4; h.Color(4) = 0.7;

p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
hold on; plot(x_new, y_newregression, '-', 'LineWidth', 1,'Color',color_rgb4);ylim([0 45]);
 
 box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
fileName = 'D_flood.pdf';
saveas(gcf, fullfile(folderPath, fileName));

%% Wf/Wc, Floodplain width ratio
close all;
load('output_Va0.1cm_QQ5_Wf2.5.mat')
figure(1); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb1);ylim([0 3.5]);
t = linspace(1,250,it);
figure(2); hold on; plot(t,eta_floodplain(j,:)*100,'LineWidth', 1.5,'Color',color_rgb1); ylim([0 60]);
figure(3); hold on; plot(t,Q_bk./Q_bk0,'LineWidth', 1.5,'Color',color_rgb1); ylim([1 3.5]);
figure(4);
x_new = 1:floor(i/52/10);
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
scatter(x_new,Avg10,100,'MarkerFaceColor', color_rgb1,'MarkerEdgeColor', 'none'); hold on;
h = errorbar(1:(i/52/10), meanData, err, 'LineWidth', 0.75);
h.Color = color_rgb1; h.Color(4) = 0.7;

p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
hold on; plot(x_new, y_newregression, '-', 'LineWidth', 1,'Color',color_rgb1);ylim([0 45]);

load('output_Va0.1cm_QQ5_Wf5.mat')
figure(1); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb2);
t = linspace(1,250,it);
figure(2); hold on; plot(t,eta_floodplain(j,:)*100,'LineWidth', 1.5,'Color',color_rgb2); ylim([0 60]);
figure(3); hold on; plot(t,Q_bk./Q_bk0,'LineWidth', 1.5,'Color',color_rgb2); ylim([1 3.5]);
figure(4);
x_new = 1:floor(i/52/10);
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
scatter(x_new,Avg10,100,'MarkerFaceColor', color_rgb2,'MarkerEdgeColor', 'none'); hold on;
h = errorbar(1:(i/52/10), meanData, err, 'LineWidth', 0.75);
h.Color = color_rgb2; h.Color(4) = 0.7;

p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
hold on; plot(x_new, y_newregression, '-', 'LineWidth', 1,'Color',color_rgb2);ylim([0 45]);

load('output_Va0.1cm_QQ5_Wf7.5.mat')
figure(1); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb3);
t = linspace(1,250,it);
figure(2); hold on; plot(t,eta_floodplain(j,:)*100,'LineWidth', 1.5,'Color',color_rgb3); ylim([0 60]);
figure(3); hold on; plot(t,Q_bk./Q_bk0,'LineWidth', 1.5,'Color',color_rgb3); ylim([1 3.5]);
figure(4);
x_new = 1:floor(i/52/10);
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
scatter(x_new,Avg10,100,'MarkerFaceColor', color_rgb3,'MarkerEdgeColor', 'none'); hold on;
h = errorbar(1:(i/52/10), meanData, err, 'LineWidth', 0.75);
h.Color = color_rgb3; h.Color(4) = 0.7;

p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
hold on; plot(x_new, y_newregression, '-', 'LineWidth', 1,'Color',color_rgb3);ylim([0 45]);

load('output_Va0.1cm_QQ5_Wf10.mat')
figure(1); hold on; plot(dx:dx:dx*M,eta,'LineWidth', 1.5,'Color',color_rgb4);
t = linspace(1,250,it);
 
 box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
fileName = 'Wf_eta.pdf';
saveas(gcf, fullfile(folderPath, fileName));

figure(2); hold on; plot(t,eta_floodplain(j,:)*100,'LineWidth', 1.5,'Color',color_rgb4); ylim([0 60]);
 
 box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
fileName = 'Wf_floodplain.pdf';
saveas(gcf, fullfile(folderPath, fileName));

figure(3); hold on; plot(t,Q_bk./Q_bk0,'LineWidth', 1.5,'Color',color_rgb4); ylim([1 3.5]);
 
 box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
fileName = 'Wf_Qbk.pdf';
saveas(gcf, fullfile(folderPath, fileName));

figure(4);
x_new = 1:floor(i/52/10);
y = ann_front(j,:)+ann_back(j,:);
y_new = reshape(y(1:floor(i/52/10)*10),10,floor(i/52/10)).*7;
Avg10 = sum(y_new)/10;
meanData = mean(y_new);
stdData = std(y_new);
err = stdData/sqrt(10); 
% Plot error bars (1 standard deviation)
scatter(x_new,Avg10,100,'MarkerFaceColor', color_rgb4,'MarkerEdgeColor', 'none'); hold on;
h = errorbar(1:(i/52/10), meanData, err, 'LineWidth', 0.75);
h.Color = color_rgb4; h.Color(4) = 0.7;

p10 = polyfit(x_new, Avg10, 1);
y_newregression = polyval(p10, x_new);
hold on; plot(x_new, y_newregression, '-', 'LineWidth', 1,'Color',color_rgb4);ylim([0 45]);
box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
fileName = 'Wf_flood.pdf';
saveas(gcf, fullfile(folderPath, fileName));

%% Figure 7
%Color 
color_rgb1 = [0.21 0.55 0.8];
color_rgb2 = [0.11 0.13 0.53];
color_rgb3 = [0.45 0.44 0.44];
color_rgb4 = [0.76 0.05 0.14];
load('output_Va0.01cm_QQ5_Wf5.mat')
t = linspace(1,250,it);
figure(5); hold on; plot(t,Ht./Hc0,'LineWidth',1.5,'Color',color_rgb1); xlim([0 20]); 
cre1 = nonzeros(diff(crest(j,:)));

load('output_Va0.1cm_QQ5_Wf5.mat')
t = linspace(1,250,it);
figure(5); hold on; plot(t,Ht./Hc0,'LineWidth',1.5,'Color',color_rgb2); xlim([0 20]);
cre2 = nonzeros(diff(crest(j,:)));

load('output_Va0.5cm_QQ5_Wf5.mat')
t = linspace(1,250,it);
figure(5); hold on; plot(t,Ht./Hc0,'LineWidth',1.5,'Color',color_rgb3); xlim([0 20]);
cre3 = nonzeros(diff(crest(j,:)));

load('output_Va1cm_QQ5_Wf5.mat')
t = linspace(1,250,it);
figure(5); hold on; plot(t,Ht./Hc0,'LineWidth',1.5,'Color',color_rgb4); xlim([0 20]); ylim([1 1.8]);
cre4 = nonzeros(diff(crest(j,:)));

 
 box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');

C = [cre1;cre2;cre3;cre4].*100;
grp = [ones(size(cre1)); 2.*ones(size(cre2));3.*ones(size(cre3));4.*ones(size(cre4))];

% cre = nonzeros(diff(crest(j,:)));
%C = [cre1(4:length(cre1));cre2(4:length(cre2));cre3(4:length(cre3));cre4(4:length(cre4))].*100;
%grp = [ones(size(cre1)-[3 0]); 2.*ones(size(cre2)-[3 0]);3.*ones(size(cre3)-[3 0]);4.*ones(size(cre4)-[3 0])];

outliers1 = cre1(1:3).*100;
outliers2 = cre2(1:3).*100;
outliers3 = cre3(1:3).*100;
outliers4 = cre4(1:3).*100;


figure(6); boxplot(C, grp); hold on;
plot(ones(size(outliers1)), outliers1, 'rx', 'MarkerSize', 10, 'LineWidth', 2);  % Group 1 outliers
plot(2*ones(size(outliers2)), outliers2, 'bx', 'MarkerSize', 10, 'LineWidth', 2);  % Group 2 outliers
plot(3*ones(size(outliers3)), outliers3, 'gx', 'MarkerSize', 10, 'LineWidth', 2);  % Group 3 outliers
plot(4*ones(size(outliers4)), outliers4, 'kx', 'MarkerSize', 10, 'LineWidth', 2);  % Group 4 outliers


figure(7); boxplot(C, grp); hold on;
plot(ones(size(outliers1)), outliers1, 'rx', 'MarkerSize', 10, 'LineWidth', 2);  % Group 1 outliers
plot(2*ones(size(outliers2)), outliers2, 'bx', 'MarkerSize', 10, 'LineWidth', 2);  % Group 2 outliers
plot(3*ones(size(outliers3)), outliers3, 'gx', 'MarkerSize', 10, 'LineWidth', 2);  % Group 3 outliers
plot(4*ones(size(outliers4)), outliers4, 'kx', 'MarkerSize', 10, 'LineWidth', 2);  % Group 4 outliers


%% Figure 9
load('output_Va0.1cm_QQ5_Wf5.mat')
f = ann_front(j,:);
b = ann_back(j,:);
y = ann_front(j,:)+ann_back(j,:);
f_new = reshape(f(1:floor(i/52/10)*10),10,floor(i/52/10));
f_sum10 = sum(f_new)*7/10;
b_new = reshape(b(1:floor(i/52/10)*10),10,floor(i/52/10));
b_sum10 = sum(b_new)*7/10;
td = [b', f'].*7;
tt = [b_sum10', f_sum10'];
figure(19); box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
bar(td,'stacked','BarWidth', 0.9);xlim([0 250]); ylim([0 45]);

load('output_Va1cm_QQ5_Wf5.mat')
f = ann_front(j,:);
b = ann_back(j,:);
y = ann_front(j,:)+ann_back(j,:);
sum(f)/sum(y)
f_new = reshape(f(1:floor(i/52/10)*10),10,floor(i/52/10));
f_sum10 = sum(f_new)*7/10;
b_new = reshape(b(1:floor(i/52/10)*10),10,floor(i/52/10));
b_sum10 = sum(b_new)*7/10;
td = [b', f'].*7;
tt = [b_sum10', f_sum10'];
figure(20); box on; set(gca,'linewidth',1, 'XColor', 'k', 'YColor', 'k');
bar(td,'stacked','BarWidth', 0.9);xlim([0 250]); ylim([0 45]);

