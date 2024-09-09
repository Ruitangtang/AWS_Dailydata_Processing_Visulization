% Script Name: LaChappelle_Nunatak.m
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
%% LaChappelle_Glacier_Daily
% LaChappelle_Glacier_Daily=[];
figure
set(gcf,'windowstyle','normal');
set(gcf,'Units','centimeters','position',[0 0 22 16]);
Width_sub=0.88;
Heigh_sub=0.17;
% subplot(8,1,1)
subplot('position',[0.1,0.81,Width_sub,Heigh_sub])
% subplot(5,1,1)
% Tempereratue 1m / 3m
% t1=Amazon_Creek_Daily.Date_Time(1);
% t2=Amazon_Creek_Daily.Date_Time(end);
t1 = string({'01 Jun 2019 00:00'});
t2 = string({'31 Oct 2021 00:00'});
% title(gca,'Amazon Creek')
TimeSeries(LaChappelle_Glacier_Daily.Date_Time,LaChappelle_Glacier_Daily.T_1_5m,...
    LaChappelle_Glacier_Daily.T_3m,'k','b',t1,t2,10,['Temperature';'(^{\circ}C)'],0)
hold on
% subplot(5,1,2)
subplot('position',[0.1,0.62,Width_sub,Heigh_sub])
TimeSeries(LaChappelle_Glacier_Daily.Date_Time,LaChappelle_Glacier_Daily.RH_1_5m,...
    LaChappelle_Glacier_Daily.RH_3m,'k','b',t1,t2,10,strjoin({'Humidity';'(%)'},'\n'),0)
hold on
subplot(5,1,3)
subplot('position',[0.1,0.43,Width_sub,Heigh_sub])
TimeSeries(LaChappelle_Glacier_Daily.Date_Time,LaChappelle_Glacier_Daily.Wspd_1_5m,...
    LaChappelle_Glacier_Daily.Wspd_3m,'k','b',t1,t2,10,['Wind speed';'(m s^{-1})'],0)
subplot(5,1,4)
subplot('position',[0.1,0.24,Width_sub,Heigh_sub])
TimeSeries(LaChappelle_Glacier_Daily.Date_Time,LaChappelle_Glacier_Daily.Wdir_3m,...
    [],'k','b',t1,t2,10,strjoin({'Wind direction';'(^{\circ})'},'\n'),0)
% subplot(5,1,5)
subplot('position',[0.1,0.05,Width_sub,Heigh_sub])
TimeSeries(LaChappelle_Glacier_Daily.Date_Time,LaChappelle_Glacier_Daily.Pressure,...
    [],'k','b',t1,t2,10,strjoin({'Pressure';'(hPa)'},'\n'),1)

%% save the figure
% save the figure
set(gcf,'windowstyle','normal');
set(gcf,'Units','centimeters','position',[0 0 22 16]);
PPath_v='H:\Eric_Kennicotte_AWS_DATA\';
Nameinfo='LaChappelle_Glacier';
address_info_fig=strcat(PPath_v,'Fig\',Nameinfo,'.fig');
address_info_tif=strcat(PPath_v,'Tif\',Nameinfo,'.tif');
address_info_fig=char(address_info_fig);
address_info_tif=char(address_info_tif);
address_info_fig=char(address_info_fig);
address_info_tif=char(address_info_tif);
disp(address_info_tif)
% savefig(address_info_fig)
% saveas(gcf,address_info_tif)