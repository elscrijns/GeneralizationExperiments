clearvars -except Animals Correction Results
load('CollectAll.mat')
load('Results_All.mat')

%% Read in the data per rat and organize per measure: 1 datapoint for each SF
% Animals is a structure containing 'data' and 'All' with fillowing columns
% {'Condition' , 'GroupCount' , 'Response' , 'RT', 'RewardTime', 'Time', 'ScreenPokes', 'FrontBeam', 'BackBeam' , 'RewardPokes', 'Date'}

% Animals are devided into 3 groups based on their performance
% group1 = [8,11];
% group2 = [4,6,7];
% group3 = [1,2,3,5,9,10,12];

% Combining the data per SF for different measures 
Response     = nan(6,12);
RT           = nan(6,12);
RewardTime   = nan(6,12);
ScreenPokes  = nan(6,12);
FrontBeam    = nan(6,12);
BackBeam     = nan(6,12);
Time         = nan(6,12);
Count        = nan(6,12);

for i = 1:12
    
    l = size(Results(i).PD1.Response,1);
    
    Response(1:l,i)     = Results(i).PD1.Response;
    RT(1:l,i)           = Results(i).PD1.RT;
    RewardTime(1:l,i)   = Results(i).PD1.RewardTime;
    Time(1:l,i)         = Results(i).PD1.Time;
    ScreenPokes(1:l,i)  = Results(i).PD1.ScreenPokes;
    FrontBeam(1:l,i)    = Results(i).PD1.FrontBeam;
    BackBeam(1:l,i)     = Results(i).PD1.BackBeam;
    Count(1:l,i)        = double(Results(i).PD1.GroupCount);
    
end

clear i l 

%% graphing: Interval Measuers for each SF (last training day)
subplot(3,3,1)
    groupResponse(:,1) = mean(Response(:,group1), 2, 'omitnan');
    groupResponse(:,2) = mean(Response(:,group2), 2, 'omitnan');
    groupResponse(:,3) = mean(Response(:,group3), 2, 'omitnan');
    bar(groupResponse);
    ylabel('Performance');
    title('Response');
    hold on
    stem([0.8 1.8 2.8 3.8], Response(:,group1),'filled', 'LineStyle','none', 'Color' , 'k', 'MarkerSize', 3)
    stem(Response(:,group2), 'filled','LineStyle','none', 'Color' , 'k' , 'MarkerSize', 3)
    stem([1.2 2.2 3.2 4.2], Response(:,group3),'filled', 'LineStyle','none', 'Color' , 'k', 'MarkerSize', 3)
    hold off
    ax = gca;
    ax.XTickLabel = {'0.06' '0.12' '0.24' '0.48'};
    
subplot(3,3,[2 3])
    Count2(1,:) = Count(1,:)/33;
    Count2(2:4,:) = Count(2:4,:)/50;
    groupCount(:,1) = mean(Count2(:,group1), 2, 'omitnan');
    groupCount(:,2) = mean(Count2(:,group2), 2, 'omitnan');
    groupCount(:,3) = mean(Count2(:,group3), 2, 'omitnan');
    bar(groupCount);
    ylabel('Percentage of trials');
    ylim([0 0.5]);
    title('Trial count');
    legend('group1: 2 rats reached 0.48 cpd','group2: 3 rats reached 0.24 cpd','group3: 7 rats reached 0.12 cpd ',...
         'Location','bestoutside');
    hold on
    stem([0.8 1.8 2.8 3.8], Count(:,group1),'filled', 'LineStyle','none', 'Color' , 'k', 'MarkerSize', 3)
    stem(Count(:,group2), 'filled','LineStyle','none', 'Color' , 'k', 'MarkerSize', 3 )
    stem([1.2 2.2 3.2 4.2], Count(:,group3),'filled', 'LineStyle','none', 'Color' , 'k', 'MarkerSize', 3)
    hold off
    ax = gca;
    ax.XTickLabel = {'0.06' '0.12' '0.24' '0.48'};
    
subplot(3,3,4)
    groupTime(:,1) = mean(Time(:,group1), 2, 'omitnan');
    groupTime(:,2) = mean(Time(:,group2), 2, 'omitnan');
    groupTime(:,3) = mean(Time(:,group3), 2, 'omitnan');
    bar(groupTime);
    ylim([20 50]);
    ylabel('Time in sec')
    title('Inter-Trial Interval');
    hold on
    stem([0.8 1.8 2.8 3.8], Time(:,group1),'filled', 'LineStyle','none', 'Color' , 'k', 'MarkerSize', 3)
    stem(Time(:,group2), 'filled','LineStyle','none', 'Color' , 'k', 'MarkerSize', 3 )
    stem([1.2 2.2 3.2 4.2], Time(:,group3),'filled', 'LineStyle','none', 'Color' , 'k', 'MarkerSize', 3)
    hold off
    ax = gca;
    ax.XTickLabel = {'0.06' '0.12' '0.24' '0.48'};
    
subplot(3,3,5)
    groupRT(:,1) = mean(RT(:,group1), 2, 'omitnan');
    groupRT(:,2) = mean(RT(:,group2), 2, 'omitnan');
    groupRT(:,3) = mean(RT(:,group3), 2, 'omitnan');
    bar(groupRT);
    ylim([0 10]);
    title('Response time');
    hold on
    stem([0.8 1.8 2.8 3.8], RT(:,group1),'filled', 'LineStyle','none', 'Color' , 'k', 'MarkerSize', 3)
    stem(RT(:,group2), 'filled','LineStyle','none', 'Color' , 'k' , 'MarkerSize', 3)
    stem([1.2 2.2 3.2 4.2], RT(:,group3),'filled', 'LineStyle','none', 'Color' , 'k' , 'MarkerSize', 3)
    hold off
    ax = gca;
    ax.XTickLabel = {'0.06' '0.12' '0.24' '0.48'};

subplot(3,3,6)
    groupRewardTime(:,1) = mean(RewardTime(:,group1), 2, 'omitnan');
    groupRewardTime(:,2) = mean(RewardTime(:,group2), 2, 'omitnan');
    groupRewardTime(:,3) = mean(RewardTime(:,group3), 2, 'omitnan');
    bar(groupRewardTime);
    ylim([0 2])
    title('Reward collection time');
    hold on
    stem([0.8 1.8 2.8 3.8], RewardTime(:,group1),'filled', 'LineStyle','none', 'Color' , 'k', 'MarkerSize', 3)
    stem(RewardTime(:,group2), 'filled','LineStyle','none', 'Color' , 'k', 'MarkerSize', 3 )
    stem([1.2 2.2 3.2 4.2], RewardTime(:,group3),'filled', 'LineStyle','none', 'Color' , 'k', 'MarkerSize', 3)
    hold off
    ax = gca;
    ax.XTickLabel = {'0.06' '0.12' '0.24' '0.48'};
    
subplot(3,3,7)
    groupScreenPokes(:,1) = mean(ScreenPokes(:,group1), 2, 'omitnan');
    groupScreenPokes(:,2) = mean(ScreenPokes(:,group2), 2, 'omitnan');
    groupScreenPokes(:,3) = mean(ScreenPokes(:,group3), 2, 'omitnan');
    bar(groupScreenPokes)
    ylabel('Amount')
    ylim([0 5])
    title('Screen Pokes during ITI');
    hold on
    stem([0.8 1.8 2.8 3.8], ScreenPokes(:,group1),'filled', 'LineStyle','none', 'Color' , 'k', 'MarkerSize', 3)
    stem(ScreenPokes(:,group2), 'filled','LineStyle','none', 'Color' , 'k', 'MarkerSize', 3 )
    stem([1.2 2.2 3.2 4.2], ScreenPokes(:,group3),'filled', 'LineStyle','none', 'Color' , 'k', 'MarkerSize', 3)
    hold off
    ax = gca;
    ax.XTickLabel = {'0.06' '0.12' '0.24' '0.48'};
    
subplot(3,3,8)
    groupFrontbeam(:,1) = mean(FrontBeam(:,group1), 2, 'omitnan');
    groupFrontbeam(:,2) = mean(FrontBeam(:,group2), 2, 'omitnan');
    groupFrontbeam(:,3) = mean(FrontBeam(:,group3), 2, 'omitnan');
    bar(groupFrontbeam)
    title('Frontbeam crosses during ITI');
    ylim([0 10])
    hold on
    stem([0.8 1.8 2.8 3.8], FrontBeam(:,group1),'filled', 'LineStyle','none', 'Color' , 'k', 'MarkerSize', 3)
    stem(FrontBeam(:,group2), 'filled','LineStyle','none', 'Color' , 'k', 'MarkerSize', 3 )
    stem([1.2 2.2 3.2 4.2], FrontBeam(:,group3),'filled', 'LineStyle','none', 'Color' , 'k', 'MarkerSize', 3)
    hold off
    ax = gca;
    ax.XTickLabel = {'0.06' '0.12' '0.24' '0.48'};

subplot(3,3,9)
    groupBackbeam(:,1) = mean(BackBeam(:,group1), 2, 'omitnan');
    groupBackbeam(:,2) = mean(BackBeam(:,group2), 2, 'omitnan');
    groupBackbeam(:,3) = mean(BackBeam(:,group3), 2, 'omitnan');
    bar(groupBackbeam)
    title('Backbeam crosses during ITI');
    hold on
    stem([0.8 1.8 2.8 3.8], BackBeam(:,group1),'filled', 'LineStyle','none', 'Color' , 'k', 'MarkerSize', 3)
    stem(BackBeam(:,group2), 'filled','LineStyle','none', 'Color' , 'k', 'MarkerSize', 3 )
    stem([1.2 2.2 3.2 4.2], BackBeam(:,group3),'filled', 'LineStyle','none', 'Color' , 'k', 'MarkerSize', 3)
    hold off
    ax = gca;
    ax.XTickLabel = {'0.06' '0.12' '0.24' '0.48'};
    

   

