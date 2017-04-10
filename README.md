# PairwiseDiscriminationExperiments

Contains all scripts required to analyze a pairwise discrimination experiment in the ABET touchscreen set-up

- AbetSch : Schedule used to run experiment in ABET VideoTouch 
- ABETas  : Analysis performed within ABET
- abetRpt : exporting the variables from the analysis for further analysis outside ABET (as a csv file)

# matlab scripts

- extractData: Converts the exported CSV file to separate CSV files per animal for each schedule
- calculateResults: calculates the performance measures making a distinction between correction trial or not
- calculateResults_LvsR: calculates the performance measures for the valid trials making a distinction between presentation on L or R screen
