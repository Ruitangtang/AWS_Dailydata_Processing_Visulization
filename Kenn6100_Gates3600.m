% Script Name: Kenn6100_Gates3600.m
% Author: [Ruitang Yang; tangruiyang123@gmail.com]
% Date: [ September 7, 2024]
% Version: 1.0
% Description: This script performs data read/analysis on the provided
%              timeseries of AWS dataset and visualizes the results."]
% Copyright (c) [2024], [University of Oslo]. All rights reserved.
% License: [ MIT License]
% Contact: [tangruiyang123@gmail.com]
% Revision History:
%   v1.0 - Initial version (August 30, 2024)
%% AWS DATA HOURLY ON DEBRIS
clear all
clc
% load the dataset
load('H:\Eric_Kennicotte_AWS_DATA\Kennicotte_AWS_Ruitang\Kennicotte_AWS_Data_RTY.mat')
%% Kenn6100_Gates3600

figure;
set(gcf, 'windowstyle', 'normal');
set(gcf, 'Units', 'centimeters', 'position', [0 0 15 8]);

% Define date range
t1 = '01 Jun 2021 00:00';
t2 = '15 Sep 2021 00:00';

% Convert strings to datetime format
t1 = datetime(t1, 'InputFormat', 'dd MMM yyyy HH:mm');
t2 = datetime(t2, 'InputFormat', 'dd MMM yyyy HH:mm');

% Plot data
plot(Gates3600_Daily.Date_Time, Gates3600_Daily.T_2_00m, 'Color', 'k', 'LineWidth', 1);
hold on;
plot(Kenn6100_Daily.Date_Time, Kenn6100_Daily.T_2_00m, 'Color', 'b', 'LineWidth', 1);

% Set x-axis limits
xlim([t1, t2]);
Y_Name = ['Temperature'; '(^{\circ}C)'];

hAx = gca; % Get current axis handle

% Set major tick locations
ixmajor = find(day(Gates3600_Daily.Date_Time) == 1);
hAx.XAxis.TickValues = Gates3600_Daily.Date_Time(ixmajor);

% Set minor ticks to daily intervals
hAx.XAxis.MinorTick = 'on'; % Enable minor ticks
hAx.XAxis.MinorTickValues = t1:caldays(1):t2; % Set minor ticks to daily intervals

% Customize ticks and labels if needed
datetick('x', 'mmm', 'keepticks', 'keeplimits'); % Set date format for ticks

set(gca,'fontsize',11)
ylabel(gca,Y_Name,'FontSize',12);
%% save the figure
% save the figure
set(gcf,'windowstyle','normal');
set(gcf,'Units','centimeters','position',[0 0 15 8]);
PPath_v='H:\Eric_Kennicotte_AWS_DATA\Kennicotte_AWS_Ruitang\';
Nameinfo='Gates3600_Kenn6100';
address_info_fig=strcat(PPath_v,'Fig\',Nameinfo,'.fig');
address_info_tif=strcat(PPath_v,'Tif\',Nameinfo,'.tif');
address_info_fig=char(address_info_fig);
address_info_tif=char(address_info_tif);
address_info_fig=char(address_info_fig);
address_info_tif=char(address_info_tif);
disp(address_info_tif)
savefig(address_info_fig)
saveas(gcf,address_info_tif)