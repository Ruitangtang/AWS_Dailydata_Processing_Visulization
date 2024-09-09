function []=TimeSeries(X_DateTime,Y_Left,Y_Right,Color_L,Color_R,t1,t2,fontsize,Y_Name,Ind_XTickLabel)
% Script Name: TimeSeries.m
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
% t1: {'01 Jun 2020 00:00'}
% t2: {'30 Sep 2022 00:00'}
fontsize = 11;
plot(X_DateTime,Y_Left,'Color',Color_L,'Linewidth',1)
hold on
if ~isempty(Y_Right)
    plot(X_DateTime,Y_Right,'Color',Color_R,'Linewidth',1)
end
% set the figure properties
% x
t1 = string(t1);
t2 = string(t2);
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
xlim([t1,t2]);
% y
% max_v_L =max(Y_Left);
% min_v_L =min(Y_Left);
% max_v_R =max(Y_Right);
% min_v_R =min(Y_Right);
% max_v=max(max_v_L,max_v_R);
% min_v=max(min_v_L,min_v_R);
% ylim([min_v,max_v]);
% 
hAx=gca;
% hAx.YTick = [min_v,mid_v,max_v];
ixminor=find(day(X_DateTime)==1);                    % ides of each month...
hAx.XAxis.MinorTickValues=X_DateTime(ixminor);        % set minor tick locations
hAx.XAxis.MinorTick='on';
hAx.YAxis.MinorTick= 'on';
ixmajor=find(day(X_DateTime)==1 & ( month(X_DateTime)==1 | month(X_DateTime)==7)); %
% ixmajor=find(day(X_DateTime)==1 & ( month(X_DateTime)==1 )); 
hAx.XAxis.TickValues=X_DateTime(ixmajor); 

%% get the XTICKLABELS
years = year(X_DateTime(ixmajor));
months = month(X_DateTime(ixmajor));

% initial the xticklabel
tick_labels = cell(1, numel(ixmajor));
numLabels = numel(ixmajor);


if Ind_XTickLabel ==0
    for i = 1:numLabels
        tick_labels{i} = ''; % Empty string for each tick label
    end
    hAx.XAxis.TickLabel=tick_labels;
else
  
    for i = 1:numel(ixmajor)
        if months(i) == 1 
            tick_labels{i} = 'Jan'; 
        elseif months(i) == 7 
            tick_labels{i} = 'Jul';
        end
    end
    hAx.XAxis.TickLabel=tick_labels;
    % add YEAR
    hold on;
    for i = 1:numel(ixmajor)-1
        if years(i) == years(i+1)
            % if the neighborhood are belong to the same year
            mid_index = (ixmajor(i) + ixmajor(i+1)) / 2;
            text(mid_index, min(ylim), num2str(years(i)), ...
                'HorizontalAlignment', 'center', 'VerticalAlignment', 'top', 'Color', 'k','Fontsize',fontsize);
        end
    end
    hold off;
    
end

hAx.FontSize = fontsize;
%hAx.FontSize = 11;
ylabel(hAx,Y_Name,'FontSize',fontsize+1);
end
