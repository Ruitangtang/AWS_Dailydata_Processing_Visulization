function []= TimeSeries_Xaxis_Breaks(X_datetime,YLeft_value,YRight_value,max_v,min_v,t1,t2,t3,...
    Color_In,Color_Ou,Index_Sub,Position_s,Index_Break,Y_Name,XTicklabel,Y_Visible,XLabel_T,fontsize)
%% This function is used to plot the timeseries data with the period break (Xaxis)
%% copyright
% Ruitang Yang (University of Oslo, ruitang.yang@geo.uio.no)
%% Input parameters
% X_datetime
% Y_value
% max_v / min_v : the limit value of the y axis
% t1,t2,t3, the start/end/start_show time of the datetime,with the format
% of {'01 Jun 2020 00:00'}, t3 is the start_show time earlier than t1, just
% to set spaces after the xaxis break, the default is two breaks, and be
% adjusted if necessary
% Index_Sub = 1/0, 1 refers to subplot;0 not
% Position_s, the postion of the subplot,if Index_Sub =0, the
% Position_s=[], otherwise it's a 1*4 array, [x,y,height,width]
% Index_Break = 1/0, 1 refers to show the axis break //; 0 not
% Y_Name : Ylabel, Y_Name = strjoin({'Longwave';'(w m^{-2})'},'\n');
% XTticklabel: xticklabel,  XTicklabel = {'Jun','Jul','Aug','Sep'};
% Y_Visble, the axis visible or not, 0: None of them visible; 1:right side unvisble;
% 2: leftside unvisible; 3 both side visble
% XLabel_T: xlabel,  XLabel_T='2020';
% fontsize of the gca
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% plot
% subplot or not
if Index_Sub == 1
    subplot('position',Position_s)
else
    figure
end
%% left yaxis
yyaxis left
plot(X_datetime,YLeft_value,'Color',Color_In,'Linewidth',1)
hold on
% set the x limitation, here 
t1 = string(t1);
t2 = string(t2);
t3 = string(t3);
t1 = datetime(t1, 'Format', 'dd MMM yyy HH:mm');
t2 = datetime(t2, 'Format', 'dd MMM yyy HH:mm');
t3 = datetime(t3, 'Format', 'dd MMM yyy HH:mm');
% generate the xaxis breaks, can be adjusted if necessary
if Index_Break == 1
    text(t2,min_v,'//','fontsize',fontsize);
    text(t2,max_v,'//','fontsize',fontsize);
end
% set the X, Y lim
xlim([t3,t2]);
ylim([min_v,max_v]);
hAx=gca;
hAx.YColor = 'k';
hAx.TickLength = [0.025 0.025] ;
%set the Y Tick
hAx.YTick = [min_v max_v/2 max_v];
%hAx.YTickLabel ={};
%  ylabel(hAx,['Longwave';'(w m^{-2})'],'FontSize',11);
% Y_Name = strjoin({'Longwave';'(w m^{-2})'},'\n');
ylabel(hAx,Y_Name,'FontSize',fontsize+1);
%% right yaxis
yyaxis right
if ~isempty(YRight_value)
    plot(X_datetime,YRight_value,'Color',Color_Ou,'Linewidth',1)
end
ylim([min_v,max_v]);
hAx=gca;
% hAx.XAxis.TickLabel={'Jun 2020','Jul 2020','Aug 2020','Sep 2020'};
% XTicklabel = {'Jun','Jul','Aug','Sep'};
hAx.XAxis.TickLabel=XTicklabel;

% set the yAxis visible or not
hAx.YColor='k';
if Y_Visible == 0
    hAx.YAxis(1).Visible='off';
    hAx.YAxis(2).Visible='off';
elseif Y_Visible == 1
    hAx.YAxis(1).Visible='on';
    hAx.YAxis(2).Visible='off';
elseif Y_Visible == 2
    hAx.YAxis(1).Visible='off';
    hAx.YAxis(2).Visible='on';
else
    hAx.YAxis(1).Visible='on';
    hAx.YAxis(2).Visible='on';
end

% Create xlabel
% XLabel_T='2020';
xlabel(hAx,XLabel_T,'FontSize',fontsize);
% hAx.Position = [0.11 Y_posi 0.28 0.14];
hAx.FontSize = fontsize;
end
