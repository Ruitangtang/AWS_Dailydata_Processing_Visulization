% Script Name: Amazon_Creek_Daily.m
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
%% Amazon_Creek_Daily
figure
set(gcf,'windowstyle','normal');
set(gcf,'Units','centimeters','position',[0 0 28 19]);


Width_sub=0.88;
Heigh_sub=0.126;
% subplot(8,1,1)
subplot('position',[0.1,0.864,Width_sub,Heigh_sub])
%subplot(7,1,1)
% Tempereratue 1m / 3m
% t1=Amazon_Creek_Daily.Date_Time(1);
% t2=Amazon_Creek_Daily.Date_Time(end);
t1 = string({'01 Jul 2018 00:00'});
t2 = string({'30 Sep 2023 00:00'});
% title(gca,'Amazon Creek')
TimeSeries(Amazon_Creek_Daily.Date_Time,Amazon_Creek_Daily.T_1m,...
    Amazon_Creek_Daily.T_3m,'k','b',t1,t2,10,['Temperature';'(^{\circ}C)'],0)
hold on
% subplot(7,1,2)
subplot('position',[0.1,0.727,Width_sub,Heigh_sub])
TimeSeries(Amazon_Creek_Daily.Date_Time,Amazon_Creek_Daily.RH_1m,...
    Amazon_Creek_Daily.RH_3m,'k','b',t1,t2,10,strjoin({'Humidity';'(%)'},'\n'),0)

hold on
subplot('position',[0.1,0.590,Width_sub,Heigh_sub])
TimeSeries(Amazon_Creek_Daily.Date_Time, Amazon_Creek_Daily.Wspd_3m,...
    [],'k','b',t1,t2,10,['Wind speed';'(m s^{-1})'],0)
% subplot(8,1,4)
% TimeSeries(Amazon_Creek_Daily.Date_Time,Amazon_Creek_Daily.Wdir_1m,...
%     Amazon_Creek_Daily.Wdir_3m,'k','b',t1,t2,10,strjoin({'Wind direction';'(^{\circ})'},'\n'),0)
subplot('position',[0.1,0.453,Width_sub,Heigh_sub])
TimeSeries(Amazon_Creek_Daily.Date_Time,Amazon_Creek_Daily.SWin,...
    Amazon_Creek_Daily.SWout,[0.5 0.5 0.5],[0.93 0.69 0.13],t1,t2,10,strjoin({'Shortwave';'(W m^{-2})'},'\n'),0)
subplot('position',[0.1,0.316,Width_sub,Heigh_sub])
TimeSeries(Amazon_Creek_Daily.Date_Time,Amazon_Creek_Daily.LWin,...
    Amazon_Creek_Daily.LWout,[0.5 0.5 0.5],[0.93 0.69 0.13],t1,t2,10,strjoin({'Longwave';'(W m^{-2})'},'\n'),0)
subplot('position',[0.1,0.179,Width_sub,Heigh_sub])
TimeSeries(Amazon_Creek_Daily.Date_Time,Amazon_Creek_Daily.RainSnow_Rate,...
    [],'b','g',t1,t2,10,strjoin({'Precipitation';'(cm hr^{-1})'},'\n'),0)
subplot('position',[0.1,0.042,Width_sub,Heigh_sub])
TimeSeries(Amazon_Creek_Daily.Date_Time,Amazon_Creek_Daily.Pressure,...
    [],'b','g',t1,t2,10,strjoin({'Pressure';'(hPa)'},'\n'),1)

%% save the figure
% save the figure
set(gcf,'windowstyle','normal');
set(gcf,'Units','centimeters','position',[0 0 28 19]);
PPath_v='H:\Eric_Kennicotte_AWS_DATA\';
Nameinfo='Timeseries_Amazon_Creek';
address_info_fig=strcat(PPath_v,'Fig\',Nameinfo,'.fig');
address_info_tif=strcat(PPath_v,'Tif\',Nameinfo,'.tif');
address_info_fig=char(address_info_fig);
address_info_tif=char(address_info_tif);
address_info_fig=char(address_info_fig);
address_info_tif=char(address_info_tif);
disp(address_info_tif)
% savefig(address_info_fig)
% saveas(gcf,address_info_tif)