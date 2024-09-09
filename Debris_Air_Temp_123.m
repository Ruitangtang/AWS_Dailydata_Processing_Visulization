% Script Name: Debris_Air_Temp_123.m
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
%% Debris Air Temp1-3
figure
set(gcf,'windowstyle','normal');
set(gcf,'Units','centimeters','position',[0 0 18 15]);
%%
Width_sub=0.88;
Heigh_sub=0.42;
% subplot(8,1,1)
subplot('position',[0.1,0.54,Width_sub,Heigh_sub])
t1 = string({'01 Jun 2020 00:00'});
t2 = string({'30 Sep 2023 00:00'});

TimeSeries_triple_New(Debris_Air_Temp_1_Daily.Date_Time,Debris_Air_Temp_2_Daily.Date_Time,Debris_Air_Temp_3_Daily.Date_Time,Debris_Air_Temp_1_Daily.T_1_75m,...
    Debris_Air_Temp_2_Daily.T_1_75m,Debris_Air_Temp_3_Daily.T_1_75m,...,
    'k','b',[0.93 0.69 0.13],t1,t2,12,strjoin({'Temperature';'(^{\circ}C)'},'\n'),0)
% plot(Debris_Air_Temp_1_Daily.Date_Time,Debris_Air_Temp_1_Daily.T_1_75m,'Color','k','Linewidth',1)
% hold on
% plot(Debris_Air_Temp_2_Daily.Date_Time,Debris_Air_Temp_2_Daily.T_1_75m,'Color','b','Linewidth',1)
% plot(Debris_Air_Temp_3_Daily.Date_Time,Debris_Air_Temp_3_Daily.T_1_75m,'Color',[0.93 0.69 0.13],'Linewidth',1)
% set the x axis
% t1 = string(t1);
% t2 = string(t2);
% t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
% t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
% xlim([t1,t2]);
% Y_Name=['Temperature';'(^{\circ}C)'];
% set(gca,'fontsize',10)
% ylabel(gca,Y_Name,'FontSize',11);
%%
subplot('position',[0.1,0.08,Width_sub,Heigh_sub])
TimeSeries_triple_New(Debris_Air_Temp_1_Daily.Date_Time,Debris_Air_Temp_2_Daily.Date_Time,Debris_Air_Temp_3_Daily.Date_Time,Debris_Air_Temp_1_Daily.RH_1_75m,...
    Debris_Air_Temp_2_Daily.RH_1_75m,Debris_Air_Temp_3_Daily.RH_1_75m,...,
    'k','b',[0.93 0.69 0.13],t1,t2,12,strjoin({'Humidity';'(%)'},'\n'),1)
% plot(Debris_Air_Temp_1_Daily.Date_Time,Debris_Air_Temp_1_Daily.RH_1_75m,'Color','k','Linewidth',1)
% hold on
% plot(Debris_Air_Temp_2_Daily.Date_Time,Debris_Air_Temp_2_Daily.RH_1_75m,'Color','b','Linewidth',1)
% plot(Debris_Air_Temp_3_Daily.Date_Time,Debris_Air_Temp_3_Daily.RH_1_75m,'Color','r','Linewidth',1)
% set(gca,'fontsize',10)
% Y_Name=strjoin({'Humidity';'(%)'},'\n');
% xlim([t1,t2]);
% ylabel(gca,Y_Name,'FontSize',11);

%% save the figure
% save the figure
set(gcf,'windowstyle','normal');
set(gcf,'Units','centimeters','position',[0 0 18 10]);
PPath_v='H:\Eric_Kennicotte_AWS_DATA\';
Nameinfo='Debris_Air_Temp_123';
address_info_fig=strcat(PPath_v,'Fig\',Nameinfo,'.fig');
address_info_tif=strcat(PPath_v,'Tif\',Nameinfo,'.tif');
address_info_fig=char(address_info_fig);
address_info_tif=char(address_info_tif);
address_info_fig=char(address_info_fig);
address_info_tif=char(address_info_tif);
disp(address_info_tif)
% savefig(address_info_fig)
% saveas(gcf,address_info_tif)