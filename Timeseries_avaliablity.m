% Script Name: Timeseries_avaliablity.m
% Author: [Ruitang Yang; tangruiyang123@gmail.com]
% Date: [ August 30, 2024]
% Version: 1.0
% Description: This script performs visulizing the data avaliability of
%               AWS dataset"]
% Copyright (c) [2024], [University of Oslo]. All rights reserved.
% License: [ MIT License]
% Contact: [tangruiyang123@gmail.com]
% Revision History:
%   v1.0 - Initial version (August 30, 2024)
%% load the dataset

load('H:\Eric_Kennicotte_AWS_DATA\Kennicotte_AWS_Ruitang\Kennicotte_AWS_Data_RTY.mat')

%% plot the period avaliablity of data of all stations

figure
hold on
% The number of stations
[~,num_stations]=size(AWS_T);
for i=1:num_stations
    nan_v=AWS_T_NoNAN{1,i};
%     minY= i-0.2;
%     maxY= i+0.2;
    if ~isempty(nan_v)
        start_x=nan_v.Date_Time(1);
        end_x=nan_v.Date_Time(end);
        [n_v,~]=size(nan_v.Date_Time);
        plot(nan_v.Date_Time,i*ones(n_v,1), 'Marker','.','LineStyle','none',...
            'Color',[0 0 0]);
        hold on
    end
end
% set the figure properites
ylim([0,num_stations+1])
ytickPosition=1:1:num_stations;
ytickLabels={'LaChappelle\_Glacier','Gates Glacier','Amazon Creek','Kenn6100\_T',...
    'Gates3600\_T','Debris\_EB\_2020','Debris\_EB\_2021','Debris\_EB\_2022','Debris\_T1',...
    'Debris\_T2','Debris\_T3'};
yticks(ytickPosition)
yticklabels(ytickLabels)
t1 = string({'01 Jan 2015 00:00'});
t2 = string({'31 Dec 2023 00:00'});
% t3 = string(t3);
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
xlim([t1,t2]);
% t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
% set the x minor tick
hAx=gca;
% longest period
Long_v=Gates_Glacier_Daily;
ixminor=find((day(Long_v.Date_Time)==1 & month(Long_v.Date_Time)==7 ));                    % ides of each month...
hAx.XAxis.MinorTickValues=Long_v.Date_Time(ixminor);        % set minor tick locations
hAx.XAxis.MinorTick='on';
hAx.Position=[0.21,0.1,0.72,0.85];
hAx.FontSize =12;
hAx.XGrid='on';
hAx.GridLineStyle ='--';

% add the text

text(1444, 9.15, 'Off-glacier', 'FontSize', 12, 'Rotation', 90);
text(1444, 3.06, 'On-glacier', 'FontSize', 12, 'Rotation', 90);
annotation(gcf,'line',[0.935 0.997619047619047],...
    [0.736 0.736],'LineStyle','--');
box on

%% save the figure
% save the figure
set(gcf,'windowstyle','normal');
set(gcf,'Units','centimeters','position',[0 0 20 10]);
PPath_v='H:\Eric_Kennicotte_AWS_DATA\Kennicotte_AWS_Ruitang\';
Nameinfo='Timeseries_availability_All_11_stations';
address_info_fig=strcat(PPath_v,'Fig\',Nameinfo,'.fig');
address_info_tif=strcat(PPath_v,'Tif\',Nameinfo,'.tif');
address_info_fig=char(address_info_fig);
address_info_tif=char(address_info_tif);
address_info_fig=char(address_info_fig);
address_info_tif=char(address_info_tif);
disp(address_info_tif)
savefig(address_info_fig)
saveas(gcf,address_info_tif)
