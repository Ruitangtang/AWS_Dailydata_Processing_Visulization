% Script Name: Kennicott_AWS_Debris.m
% Author: [Ruitang Yang; tangruiyang123@gmail.com]
% Date: [ August 30, 2024]
% Version: 1.0
% Description: This script performs data plotting on the provided 
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
%% JOIN Timetables
AWS_T1=AWS_T{1,2};AWS_T2=AWS_T{1,3};AWS_T3=AWS_T{1,4};
AWS_T12 = outerjoin(AWS_T1,AWS_T2, 'Keys', [{'Date_Time'},...
    intersect(AWS_T1.Properties.VariableNames, AWS_T2.Properties.VariableNames)], 'MergeKeys', true);
AWS_T123 = outerjoin(AWS_T12,AWS_T3, 'Keys', [{'Date_Time'},...
    intersect(AWS_T12.Properties.VariableNames, AWS_T3.Properties.VariableNames)], 'MergeKeys', true);
%% iNTERPLOTE THE TIMETABLE AS A CONTINUOUS ONE
AWS_T123_Daily=retime(AWS_T123,'daily');

%% Plot the timeseries

figure
set(gcf,'windowstyle','normal');
set(gcf,'Units','centimeters','position',[0 0 26 20]);
Color_In='k';
Color_Ou='b';
%% Temperature
%subplot(6,3,1)
subplot('position',[0.11 0.85 0.28 0.14])

plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_2m,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)
% set the
t1 = string({'01 Jun 2020 00:00'});
t2 = string({'30 Sep 2020 00:00'});
t3 = string({'05 May 2020 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
text(t2,4,'//','fontsize',10);
text(t2,16,'//','fontsize',10);
xlim([t3,t2]);
ylim([4,16]);
hAx=gca;
% ixminor=find(day(AWS_T123_Daily.Date_Time)==1);                    % ides of each month...
hAx.XAxis.TickLabel={'','','',''};
hAx.TickLength = [0.025 0.025] ;
ylabel(hAx,['Temperature';'(^{\circ}C)'],'FontSize',13);
yyaxis(hAx,'right')
ylim([4,16]);
hAx.YAxis(2).Visible='off';
% hAx.Position = [0.11 0.85 0.28 0.14];
hAx.FontSize = 12;
%  set(axes1,'ContextMenu','XTickLabel',...
%     {'Jun 2020','Jul 2020','Aug 2020','Sep 2020'});
%
% subplot(6,3,2)
subplot('position',[0.40 0.85 0.28 0.14])

plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_2m,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)
% set the
t1 = string({'01 Jun 2021 00:00'});
t2 = string({'30 Sep 2021 00:00'});
t3 = string({'05 May 2021 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
text(t2,4,'//','fontsize',10);
text(t2,16,'//','fontsize',10);
xlim([t3,t2]);
ylim([4,16]);
hAx=gca;
hAx.XAxis.TickLabel={'','','',''};        % set minor tick locations
hAx.YAxis.Visible='off';
hAx.TickLength = [0.025 0.025] ;
% hAx.Position = [0.40 0.85 0.28 0.14];
hAx.FontSize = 12;
%
% subplot(6,3,3)
subplot('position',[0.69 0.85 0.28 0.14])
plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_2m,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)

% set the
t1 = string({'01 Jun 2022 00:00'});
t2 = string({'30 Sep 2022 00:00'});
t3 = string({'05 May 2022 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
xlim([t3,t2]);
ylim([4,16]);
hAx=gca;
hAx.XAxis.TickLabel={'','','',''};
hAx.TickLength = [0.025 0.025] ;

% set minor tick locations
yyaxis(hAx,'right')
ylim([4,16]);
hAx.YAxis(1).Visible='off';
hAx.YTickLabel={'','','','','','',''};
hAx.YColor='k';
% hAx.Position = [0.69 0.85 0.28 0.14];
hAx.FontSize = 12;


%% Humidity
% subplot(6,3,4)
subplot('position',[0.11 0.69 0.28 0.14])

plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.RH_2m,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)
% set the
t1 = string({'01 Jun 2020 00:00'});
t2 = string({'30 Sep 2020 00:00'});
t3 = string({'05 May 2020 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
text(t2,30,'//','fontsize',10);
text(t2,100,'//','fontsize',10);
xlim([t3,t2]);
ylim([30,100]);
hAx=gca;
% ixminor=find(day(AWS_T123_Daily.Date_Time)==1);                    % ides of each month...
hAx.XAxis.TickLabel={'','','',''};
hAx.TickLength = [0.025 0.025] ;% set minor tick locations
hAx.YAxis.TickLabel={'40','60','80','100'};
ylabel(hAx,strjoin({'Humidity';'(%)'},'\n'),'FontSize',13);
hAx.YAxis.TickValues =[40 60 80 100];  
yyaxis(hAx,'right')
ylim([30,100]);
hAx.YAxis(2).Visible='off';
% hAx.Position = [0.11 0.69 0.28 0.14];
hAx.FontSize = 12;
%  set(axes1,'ContextMenu','XTickLabel',...
%     {'Jun 2020','Jul 2020','Aug 2020','Sep 2020'});
%
% subplot(6,3,5)
subplot('position',[0.40  0.69 0.28 0.14])

plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.RH_2m,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)
% set the
t1 = string({'01 Jun 2021 00:00'});
t2 = string({'30 Sep 2021 00:00'});
t3 = string({'05 May 2021 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
text(t2,30,'//','fontsize',10);
text(t2,100,'//','fontsize',10);
xlim([t3,t2]);
ylim([30,100]);
hAx=gca;
hAx.XAxis.TickLabel={'','','',''};
hAx.TickLength = [0.025 0.025] ;% set minor tick locations
hAx.YAxis.Visible='off';
% hAx.Position = [0.40  0.69 0.28 0.14];
hAx.FontSize = 12;
%
% subplot(6,3,6)
subplot('position',[0.69  0.69 0.28 0.14])

plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.RH_2m,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)

% set the
t1 = string({'01 Jun 2022 00:00'});
t2 = string({'30 Sep 2022 00:00'});
t3 = string({'05 May 2022 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
xlim([t3,t2]);
ylim([30,100]);
hAx=gca;
hAx.XAxis.TickLabel={'','','',''};
hAx.TickLength = [0.025 0.025] ;

% set minor tick locations
yyaxis(hAx,'right')
ylim([30,100]);
hAx.YAxis(1).Visible='off';
hAx.YTick =[40 60 80 100];  
hAx.YTickLabel={'','','','','','',''};
hAx.YColor='k';
% hAx.Position = [0.69  0.69 0.28 0.14];
hAx.FontSize = 12;

%% Windspead
% subplot(6,3,7)
subplot('position',[0.11 0.53 0.28 0.14])

plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.Wspd,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)
% set the
t1 = string({'01 Jun 2020 00:00'});
t2 = string({'30 Sep 2020 00:00'});
t3 = string({'05 May 2020 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
text(t2,0,'//','fontsize',10);
text(t2,5,'//','fontsize',10);
xlim([t3,t2]);
ylim([0,5]);
hAx=gca;
% ixminor=find(day(AWS_T123_Daily.Date_Time)==1);                    % ides of each month...
hAx.XAxis.TickLabel={'','','',''};
hAx.TickLength = [0.025 0.025] ;% set minor tick locations
hAx.YAxis.TickValues =[0 2 4];
hAx.YAxis.TickLabels ={'0','2','4'};
ylabel(hAx,['Wind speed';'(m s^{-1})'],'FontSize',13);

yyaxis(hAx,'right')
ylim([0,5]);
hAx.YAxis(2).Visible='off';
% hAx.Position = [0.11 0.53 0.28 0.14];
hAx.FontSize = 12;
%  set(axes1,'ContextMenu','XTickLabel',...
%     {'Jun 2020','Jul 2020','Aug 2020','Sep 2020'});
%
% subplot(6,3,8)
subplot('position',[0.40 0.53 0.28 0.14])

plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.Wspd,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)
% set the
t1 = string({'01 Jun 2021 00:00'});
t2 = string({'30 Sep 2021 00:00'});
t3 = string({'05 May 2021 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
text(t2,0,'//','fontsize',10);
text(t2,5,'//','fontsize',10);
xlim([t3,t2]);
ylim([0,5]);
hAx=gca;
hAx.XAxis.TickLabel={'','','',''};
hAx.TickLength = [0.025 0.025] ;% set minor tick locations
hAx.YAxis.Visible='off';
% hAx.Position = [0.40 0.53 0.28 0.14];
hAx.FontSize = 12;
%
% subplot(6,3,9)
subplot('position',[0.69 0.53 0.28 0.14])

plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.Wspd,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)

% set the
t1 = string({'01 Jun 2022 00:00'});
t2 = string({'30 Sep 2022 00:00'});
t3 = string({'05 May 2022 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
xlim([t3,t2]);
ylim([0,5]);
hAx=gca;
hAx.XAxis.TickLabel={'','','',''};
hAx.TickLength = [0.025 0.025] ;

% set minor tick locations
yyaxis(hAx,'right')
ylim([0,5]);
hAx.YAxis(1).Visible='off';
hAx.YTick =[0 2 4];
hAx.YTickLabel={'','','',''};
hAx.YColor='k';
% hAx.Position = [0.69 0.53 0.28 0.14];
hAx.FontSize = 12;
%% Winddirection
max_v=360;
min_v=90;
% subplot(6,3,10)
subplot('position',[0.11 0.37 0.28 0.14])

plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.Wdir,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)
% set the
t1 = string({'01 Jun 2020 00:00'});
t2 = string({'30 Sep 2020 00:00'});
t3 = string({'05 May 2020 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
text(t2,min_v,'//','fontsize',10);
text(t2,max_v,'//','fontsize',10);
xlim([t3,t2]);
ylim([min_v,max_v]);
hAx=gca;
% ixminor=find(day(AWS_T123_Daily.Date_Time)==1);                    % ides of each month...
hAx.XAxis.TickLabel={'','','',''};
hAx.TickLength = [0.025 0.025] ;% set minor tick locations
hAx.YTick = [90 180 270 360];

ylabel(hAx,strjoin({'Wind direction';'(^{\circ})'},'\n'),'FontSize',13);

yyaxis(hAx,'right')
ylim([min_v,max_v]);
hAx.YAxis(2).Visible='off';
% hAx.Position = [0.11 0.37 0.28 0.14];
hAx.FontSize = 12;
%  set(axes1,'ContextMenu','XTickLabel',...
%     {'Jun 2020','Jul 2020','Aug 2020','Sep 2020'});
%
% subplot(6,3,11)
subplot('position',[0.40 0.37 0.28 0.14])

plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.Wdir,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)
% set the
t1 = string({'01 Jun 2021 00:00'});
t2 = string({'30 Sep 2021 00:00'});
t3 = string({'05 May 2021 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
text(t2,min_v,'//','fontsize',10);
text(t2,max_v,'//','fontsize',10);
xlim([t3,t2]);
ylim([min_v,max_v]);
hAx=gca;
hAx.XAxis.TickLabel={'','','',''};
hAx.TickLength = [0.025 0.025] ;% set minor tick locations
hAx.YAxis.Visible='off';
% hAx.Position = [0.40 0.37 0.28 0.14];
hAx.FontSize = 12;
%
% subplot(6,3,12)
subplot('position',[0.69 0.37 0.28 0.14])

plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.Wdir,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)

% set the
t1 = string({'01 Jun 2022 00:00'});
t2 = string({'30 Sep 2022 00:00'});
t3 = string({'05 May 2022 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
xlim([t3,t2]);
ylim([min_v,max_v]);
hAx=gca;
hAx.XAxis.TickLabel={'','','',''};
hAx.TickLength = [0.025 0.025] ;

% set minor tick locations

hAx.YAxis(1).Visible='off';

yyaxis(hAx,'right')
ylim([min_v,max_v]);
hAx.YAxis(2).Visible='on';
hAx.YTick = [90 180 270 360];
% hAx.YAxis(2).Visible='on';
hAx.YTickLabel={'','','','','','',''};
hAx.YColor='k';
% hAx.Position = [0.69 0.37 0.28 0.14];
hAx.FontSize = 12;

%% Shortwave incoming
max_v=500;
min_v=0;
X_posi = 0.21;
W_idth = 0.14;

% subplot(6,3,13)
subplot('position',[0.11 X_posi 0.28 0.14])

plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.SWin,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)
% set the
t1 = string({'01 Jun 2020 00:00'});
t2 = string({'30 Sep 2020 00:00'});
t3 = string({'05 May 2020 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
text(t2,min_v,'//','fontsize',10);
text(t2,max_v,'//','fontsize',10);
xlim([t3,t2]);
ylim([min_v,max_v]);
hAx=gca;
% ixminor=find(day(AWS_T123_Daily.Date_Time)==1);                    % ides of each month...
hAx.XAxis.TickLabel={'','','',''};
hAx.TickLength = [0.025 0.025] ;% set minor tick locations
hAx.YTick = [min_v max_v/2 max_v];

ylabel(hAx,strjoin({'Shortwave';'radiation';'(w m^{-2})'},'\n'),'FontSize',13);

yyaxis(hAx,'right')
plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.SWout,'Color',Color_Ou,'Linewidth',1)
ylim([min_v,max_v]);
hAx.YAxis(2).Visible='off';
% hAx.Position = [0.11 X_posi 0.28 0.14];
hAx.FontSize = 12;
%  set(axes1,'ContextMenu','XTickLabel',...
%     {'Jun 2020','Jul 2020','Aug 2020','Sep 2020'});
%
% subplot(6,3,14)
subplot('position',[0.40 X_posi 0.28 0.14])

plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.SWin,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)
% set the
t1 = string({'01 Jun 2021 00:00'});
t2 = string({'30 Sep 2021 00:00'});
t3 = string({'05 May 2021 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
text(t2,min_v,'//','fontsize',10);
text(t2,max_v,'//','fontsize',10);
xlim([t3,t2]);
ylim([min_v,max_v]);

yyaxis(hAx,'right')
plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.SWout,'Color',Color_Ou,'Linewidth',1)
ylim([min_v,max_v]);
hAx=gca;
hAx.XAxis.TickLabel={'','','',''};        % set minor tick locations
hAx.YAxis.Visible='off';
hAx.TickLength = [0.025 0.025] ;
% hAx.Position = [0.40 X_posi 0.28 0.14];
hAx.FontSize = 12;
%
% subplot(6,3,15)
subplot('position',[0.69 X_posi 0.28 0.14])

plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.SWin,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)

% set the
t1 = string({'01 Jun 2022 00:00'});
t2 = string({'30 Sep 2022 00:00'});
t3 = string({'05 May 2022 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
xlim([t3,t2]);
ylim([min_v,max_v]);
hAx=gca;
hAx.XAxis.TickLabel={'','','',''};

% set minor tick locations

hAx.YAxis(1).Visible='off';
hAx.TickLength = [0.025 0.025] ;
yyaxis(hAx,'right')
plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.SWout,'Color',Color_Ou,'Linewidth',1)
ylim([min_v,max_v]);
hAx.YTick = [min_v max_v/2 max_v];
hAx.YAxis(2).Visible='on';
% hAx.YAxis(2).Visible='on';
hAx.YTickLabel={'','','','','','',''};
hAx.YColor='k';
% hAx.Position = [0.69 X_posi 0.28 0.14];
hAx.FontSize = 12;
%% Longwave incoming/out
max_v=500;
min_v=0;
Y_posi = 0.05;
W_idth = 0.14;

% subplot(6,3,16)
subplot('position',[0.11 Y_posi 0.28 0.14])

yyaxis left
plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.LWin,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)
% set the
t1 = string({'01 Jun 2020 00:00'});
t2 = string({'30 Sep 2020 00:00'});
t3 = string({'05 May 2020 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
text(t2,min_v,'//','fontsize',10);
text(t2,max_v,'//','fontsize',10);
xlim([t3,t2]);
ylim([min_v,max_v]);
hAx=gca;
hAx.YColor = 'k';
hAx.TickLength = [0.025 0.025] ;
%set the Y Tick
hAx.YTick = [min_v max_v/2 max_v];
%  ylabel(hAx,['Longwave';'(w m^{-2})'],'FontSize',11);
ylabel(hAx,strjoin({'Longwave';'radiation';'(w m^{-2})'},'\n'),'FontSize',13);

yyaxis right
plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.LWout,'Color',Color_Ou,'Linewidth',1)
ylim([min_v,max_v]);
hAx=gca;
% hAx.XAxis.TickLabel={'Jun 2020','Jul 2020','Aug 2020','Sep 2020'};
hAx.XAxis.TickLabel={'Jun','Jul','Aug','Sep'};

hAx.YColor='k';
hAx.YAxis(2).Visible='off';

% Create xlabel
xlabel(hAx,'2020','FontSize',13);
% hAx.Position = [0.11 Y_posi 0.28 0.14];
hAx.FontSize = 12;
%  set(axes1,'ContextMenu','XTickLabel',...
%     {'Jun 2020','Jul 2020','Aug 2020','Sep 2020'});
%
% subplot(6,3,17)
subplot('position',[0.40 Y_posi 0.28 0.14])

yyaxis left
plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.LWin,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)
% set the
t1 = string({'01 Jun 2021 00:00'});
t2 = string({'30 Sep 2021 00:00'});
t3 = string({'05 May 2021 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
text(t2,min_v,'//','fontsize',10);
text(t2,max_v,'//','fontsize',10);
xlim([t3,t2]);
ylim([min_v,max_v]);
hAx=gca;
hAx.YColor='k';
hAx.TickLength = [0.025 0.025] ;
yyaxis right
plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.LWout,'Color',Color_Ou,'Linewidth',1)
ylim([min_v,max_v]);
hAx=gca;
% hAx.XAxis.TickLabel={'Jun 2021','Jul 2021','Aug 2021','Sep 2021'};        % set minor tick locations
hAx.XAxis.TickLabel={'Jun','Jul','Aug','Sep'};        % set minor tick locations

hAx.YAxis(1).Visible='off';
hAx.YAxis(2).Visible='off';
hAx.YColor='k';
%set the Y Tick
hAx.YTick = [min_v max_v/2 max_v];
% Create xlabel
xlabel(hAx,'2021','FontSize',13);

% hAx.Position = [0.40 Y_posi 0.28 0.14];
hAx.FontSize = 12;
%
% subplot(6,3,18)
subplot('position',[0.69 Y_posi 0.28 0.14])

yyaxis left

plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.LWin,'Color',Color_In,'Linewidth',1)
hold on
% plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.T_3m)

% set the
t1 = string({'01 Jun 2022 00:00'});
t2 = string({'30 Sep 2022 00:00'});
t3 = string({'05 May 2022 00:00'});
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
xlim([t3,t2]);
ylim([min_v,max_v]);


yyaxis right

plot(AWS_T123_Daily.Date_Time,AWS_T123_Daily.LWout,'Color',Color_Ou,'Linewidth',1)
ylim([min_v,max_v]);
hAx=gca;
hAx.YAxis(2).Visible='on';
hAx.TickLength = [0.025 0.025] ;
% hAx.YAxis(2).Visible='on';
hAx.YTickLabel={'','','','','','',''};
hAx.YColor='k';
% hAx.XAxis.TickLabel={'Jun 2022','Jul 2022','Aug 2022','Sep 2022'};
hAx.XAxis.TickLabel={'Jun','Jul','Aug','Sep'};

hAx.YAxis(1).Visible='off';
% hAx.Position = [0.69 Y_posi 0.28 0.14];
%set the Y Tick
hAx.YTick = [min_v max_v/2 max_v];
% Create xlabel
xlabel(hAx,'2022','FontSize',13);
hAx.FontSize = 12;

%%
% set(gcf,'windowstyle','normal');
% set(gcf,'Units','centimeters','position',[0 0 26 21]);
%% save the figure
PPath_v='H:\Eric_Kennicotte_AWS_DATA\Kennicotte_AWS_Ruitang\';
Nameinfo='Daily_AWS_Debris_Kenicott';
address_info_fig=strcat(PPath_v,'Fig\',Nameinfo,'.fig');
address_info_tif=strcat(PPath_v,'Tif\',Nameinfo,'.tif');
address_info_fig=char(address_info_fig);
address_info_tif=char(address_info_tif);
address_info_fig=char(address_info_fig);
address_info_tif=char(address_info_tif);
disp(address_info_tif)
savefig(address_info_fig)
saveas(gcf,address_info_tif)

