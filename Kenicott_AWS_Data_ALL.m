% Script Name: Kennicott_AWS_Data.m
% Author: [Ruitang Yang; tangruiyang123@gmail.com]
% Date: [ August 30, 2024]
% Version: 1.0
% Description: This script performs data read/analysis on the provided 
%              timeseries of AWS dataset and visualizes the results."]
% Copyright (c) [2024], [University of Oslo]. All rights reserved.
% License: [ MIT License]
% Contact: [tangruiyang123@gmail.com]
% Revision History:
%   v1.0 - Initial version (August 30, 2024)
%% READ THE AWS CSV File
% the path where the original dataset are stored
Path='H:\Eric_Kennicotte_AWS_DATA\Kennicotte_AWS_Ruitang\';
% get all the csv file
csvfiles = dir(fullfile(Path, '*.csv'));
% read the csv file and put them into
% T20=readtable('H:\Eric_Kennicotte_AWS_DATA\AWS_Debris_2020.csv');
AWS_T={};
AWS_Name={};
for i = 1:length(csvfiles)
    % get the filename
    file_name = csvfiles(i).name;
    idx= strfind(file_name,'.');
    AWS_Name{i}={file_name(1:idx-1)};
    % generate the fullpath filename
    file_name_FP = strcat(Path,file_name);
 
    % read the file as Table
    T = readtable(file_name_FP);
    % convert table to timetable
    TT = table2timetable(T);
    % get the daily mean
    TTD = retime(TT,'daily',@(x)mean(x,'omitnan'));
    % save it in AWS_T
    AWS_T{i}= TTD;
end
%% Preprocessing of the dataset, removing nan data, and interplot them as time continuous
% The number of stations
[~,num_stations]=size(AWS_T);
%  split the stations
Amazon_Creek=AWS_T{1,1};
AWS_Deb_2020=AWS_T{1,2};
AWS_Deb_2021=AWS_T{1,3};
AWS_Deb_2022=AWS_T{1,4};
Debris_Air_Temp_1=AWS_T{1,5};
Debris_Air_Temp_2=AWS_T{1,6};
Debris_Air_Temp_3=AWS_T{1,7};
Gates3600=AWS_T{1,8};
Gates_Glacier=AWS_T{1,9};
Kenn6100=AWS_T{1,10};
LaChappelle_Glacier=AWS_T{1,11};
% remove the rows with all nan value
AWS_Deb_2020_NoNAN=rmmissing(AWS_Deb_2020,1,'MinNumMissing',size(AWS_Deb_2020,2));
AWS_Deb_2021_NoNAN=rmmissing(AWS_Deb_2021,1,'MinNumMissing',size(AWS_Deb_2021,2));
AWS_Deb_2022_NoNAN=rmmissing(AWS_Deb_2022,1,'MinNumMissing',size(AWS_Deb_2022,2));
Amazon_Creek_NoNAN=rmmissing(Amazon_Creek,1,'MinNumMissing',size(Amazon_Creek,2));
Debris_Air_Temp_1_NoNAN=rmmissing(Debris_Air_Temp_1,1,'MinNumMissing',size(Debris_Air_Temp_1,2));
Debris_Air_Temp_2_NoNAN=rmmissing(Debris_Air_Temp_2,1,'MinNumMissing',size(Debris_Air_Temp_2,2));
Debris_Air_Temp_3_NoNAN=rmmissing(Debris_Air_Temp_3,1,'MinNumMissing',size(Debris_Air_Temp_3,2));
Gates3600_NoNAN=rmmissing(Gates3600,1,'MinNumMissing',size(Gates3600,2));
Gates_Glacier_NoNAN=rmmissing(Gates_Glacier,1,'MinNumMissing',size(Gates_Glacier,2));
Kenn6100_NoNAN=rmmissing(Kenn6100,1,'MinNumMissing',size(Kenn6100,2));
LaChappelle_Glacier_NoNAN=rmmissing(LaChappelle_Glacier,1,'MinNumMissing',size(LaChappelle_Glacier,2));
% the cell without nan, with new sequence, to make sure it same as the
% Table (or other places)
AWS_T_NoNAN={LaChappelle_Glacier_NoNAN,Gates_Glacier_NoNAN,Amazon_Creek_NoNAN,...
    Kenn6100_NoNAN,Gates3600_NoNAN,AWS_Deb_2020_NoNAN,AWS_Deb_2021_NoNAN,AWS_Deb_2022_NoNAN,...
    Debris_Air_Temp_1_NoNAN,Debris_Air_Temp_2_NoNAN,Debris_Air_Temp_3_NoNAN};
% iNTERPLOTE THE TIMETABLE AS A CONTINUOUS ONE
AWS_Deb_2020_Daily=retime(AWS_Deb_2020,'daily');
AWS_Deb_2021_Daily=retime(AWS_Deb_2021,'daily');
AWS_Deb_2022_Daily=retime(AWS_Deb_2022,'daily');
Amazon_Creek_Daily=retime(Amazon_Creek,'daily');
Debris_Air_Temp_1_Daily=retime(Debris_Air_Temp_1,'daily');
Debris_Air_Temp_2_Daily=retime(Debris_Air_Temp_2,'daily');
Debris_Air_Temp_3_Daily=retime(Debris_Air_Temp_3,'daily');
Gates3600_Daily=retime(Gates3600,'daily');
Gates_Glacier_Daily=retime(Gates_Glacier,'daily');
Kenn6100_Daily=retime(Kenn6100,'daily');
LaChappelle_Glacier_Daily=retime(LaChappelle_Glacier,'daily');
%% Save the dataset as mat file
save('H:\Eric_Kennicotte_AWS_DATA\Kennicotte_AWS_Ruitang\Kennicotte_AWS_Data_RTY.mat')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
