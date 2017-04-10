%% Import the data from each session and calculate the summary of 
% performance for trials vs correction trials

% The results are saved as a CSV file per animal in Dir
    % filename: Results_Group_animal.csv
    % if the file already exists data is added (different sessions per
    % animal are all saved in the same file)
    % file will contain :    
    % Condition, GroupCount, mean_Response, mean_RT, mean_RewardTime, 
    % mean_TimeDiff, sum_ScreenPokes, sum_FrontBeam, sum_BackBeam, 
    % sum_RewardPokes, Date
    
clc;clear all;

% Import data: .csv files created by PD_extractData.m containing
% session information

Dir = 'C:\Users\u0105250\Documents\mouse Touchscreen Exp\';
subDir = 'Mouse PD_group45_ freq3\';        % schedule name
filenames = dir([Dir subDir '*.csv']);
filenames.name;
n = size(filenames,1) % Number of files in subDir

%% for every file a results table is created containing performance level and significance

for i = 1:n
   
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Read in the CSV file into a table named DATA
    
    fileName = filenames(i).name
    formatSpec = '%d%d%d%d%d%.3f%.3f%.3f%d%d%d%d';
    DATA = readtable([Dir subDir fileName],'Delimiter',',','Format',formatSpec, 'ReadVariableNames', false);
    DATA.Properties.VariableNames =  {'Trial' 'Response' 'CorrectP' 'TouchP' 'Correction' 'Time' ...
    'RT' 'RewardTime' 'ScreenPokes' 'FrontBeam' 'BackBeam' 'RewardPokes'};
    DATA.Properties.Description = fileName;
    
    DATA.TimeDiff = [diff(DATA.Time); nan];
      
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % calculate the summary statistics for this session per condition 
    % (type of stimulus presentation) based on the valid trials
    
    Trials1 = grpstats(DATA, {'Correction'} , 'mean' , 'DataVars', ...
        {'Response' , 'RT', 'RewardTime', 'TimeDiff' }) ;
    Trials2 = grpstats(DATA, {'Correction'} , 'sum' , 'DataVars', ...
        {'ScreenPokes', 'FrontBeam', 'BackBeam' , 'RewardPokes'});
    Trials = [Trials1, Trials2(:,3:6)];

    sep = find(fileName == '_');
    Trials.Date = repmat(fileName(sep(2)+1:end-4),2,1);
   
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % export the results table to an CSV file
    
    outFile = [Dir 'Results_' fileName(1:sep(2) - 1) '.csv'];
    try    
         T = readtable(outFile);
         C = table2cell(Trials);
         Results2 = [T ; C];   
         writetable(Results2, outFile,'WriteRowNames',false, 'Delimiter', ',')
    catch
         writetable(Trials, outFile,'WriteRowNames',false, 'Delimiter', ',')
    end
     fclose('all');
    
    % export the Correction trials table to an CSV file
%     outFile2 = [Dir  'Correction_' fileName(1:sep(2) - 1) '.csv'];
%     try
%         T = readtable(outFile2);
%         C = table2cell(Correction);
%         Results = [T ; C];
%         writetable(Results, outFile2,'WriteRowNames',false, 'Delimiter', ',')
%     catch
%         writetable(Correction, outFile2,'WriteRowNames', false , 'Delimiter', ',')
%     end
%     
    clear DATA Response Results Correction Trial outfile*
end 

clear all
