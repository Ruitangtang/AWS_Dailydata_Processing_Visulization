% Script Name: Gates_Glacier_Daily.m
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

%% Gates_Glacier_Daily
figure
set(gcf,'windowstyle','normal');
set(gcf,'Units','centimeters','position',[0 0 28 21]);
%% set the properties of the subplot
Width_sub=0.88;
Heigh_sub=0.1;
% subplot(8,1,1)
subplot('position',[0.1,0.89,Width_sub,Heigh_sub])
% Tempereratue 1m / 3m
% t1=Amazon_Creek_Daily.Date_Time(1);
% t2=Amazon_Creek_Daily.Date_Time(end);
t1 = string({'01 Sep 2015 00:00'});
t2 = string({'30 Nov 2023 00:00'});
% title(gca,'Amazon Creek')
TimeSeries(Gates_Glacier_Daily.Date_Time,Gates_Glacier_Daily.T_2m,...
    [],'b','b',t1,t2,12,['Temperature';'(^{\circ}C)'],0)
hold on
% subplot(8,1,2)

subplot('position',[0.1,0.77,Width_sub,Heigh_sub])
TimeSeries(Gates_Glacier_Daily.Date_Time,Gates_Glacier_Daily.RH_2m,...
    [],'b','b',t1,t2,12,strjoin({'Humidity';'(%)'},'\n'),0)

hold on
%subplot(8,1,3)
subplot('position',[0.1,0.65,Width_sub,Heigh_sub])

TimeSeries(Gates_Glacier_Daily.Date_Time,Gates_Glacier_Daily.Wspd,...
    [],'b','b',t1,t2,12,['Wind speed';'(m s^{-1})'],0)
% subplot(8,1,4)
subplot('position',[0.1,0.53,Width_sub,Heigh_sub])

TimeSeries(Gates_Glacier_Daily.Date_Time,Gates_Glacier_Daily.Wdir,...
    [],'b','b',t1,t2,12,strjoin({'Wind direction';'(^{\circ})'},'\n'),0)
% subplot(8,1,5)
subplot('position',[0.1,0.41,Width_sub,Heigh_sub])

TimeSeries(Gates_Glacier_Daily.Date_Time,Gates_Glacier_Daily.Solar_Rad,...
    [],'b','b',t1,t2,12,strjoin({'Shortwave';'(W m^{-2})'},'\n'),0)
% subplot(8,1,6)
subplot('position',[0.1,0.29,Width_sub,Heigh_sub])

TimeSeries(Gates_Glacier_Daily.Date_Time,10*Gates_Glacier_Daily.Snow_depth,...
    [],'b','b',t1,t2,12,strjoin({'Snow depth';'(mm)'},'\n'),0)
% subplot(8,1,7)
subplot('position',[0.1,0.17,Width_sub,Heigh_sub])

TimeSeries(Gates_Glacier_Daily.Date_Time,10*24*Gates_Glacier_Daily.Precipitation,...
    [],'b','b',t1,t2,12,strjoin({'Precipitation';'(mm)'},'\n'),0)
% subplot(8,1,8)
subplot('position',[0.1,0.05,Width_sub,Heigh_sub])

TimeSeries_triple(Gates_Glacier_Daily.Date_Time,Gates_Glacier_Daily.T_soil_10cm,...
    Gates_Glacier_Daily.T_soil_20cm,Gates_Glacier_Daily.T_soil_50cm,...,
    'b','k',[0.93 0.69 0.13],t1,t2,12,strjoin({'Soil temperature';'(^{\circ}C)'},'\n'),1)


%% save the figure
% save the figure
set(gcf,'windowstyle','normal');
set(gcf,'Units','centimeters','position',[0 0 28 21]);
PPath_v='H:\Eric_Kennicotte_AWS_DATA\';
Nameinfo='Gates_Glacier';
address_info_fig=strcat(PPath_v,'Fig\',Nameinfo,'.fig');
address_info_tif=strcat(PPath_v,'Tif\',Nameinfo,'.tif');
address_info_fig=char(address_info_fig);
address_info_tif=char(address_info_tif);
address_info_fig=char(address_info_fig);
address_info_tif=char(address_info_tif);
disp(address_info_tif)
% savefig(address_info_fig)
% saveas(gcf,address_info_tif)
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%