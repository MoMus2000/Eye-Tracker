addpath('functions/')
% Method to be able to calculate the error between a reference edf and
% another edf file. 
% We can do that by comparing the positions between the two files and
% storing the mean squared error and plotting it out to be an obervable
% decrease if the subject is learning the dance properly.

edf1 = Edf2Mat('/Users/desouza/Desktop/udichis project/rb1107g.edf');
edf2 = Edf2Mat('/Users/desouza/Desktop/udichis project/rs1110g.edf');
edf3 = Edf2Mat('/Users/desouza/Desktop/udichis project/rs1123g.edf');
edf4 = Edf2Mat('/Users/desouza/Desktop/udichis project/rb1128g1.edf');
edf5 = Edf2Mat('/Users/desouza/Desktop/udichis project/rb1128g2.edf');
edf6 = Edf2Mat('/Users/desouza/Desktop/udichis project/rs1207g.edf');

edf8 = Edf2Mat('./ud1205g.edf');


msq1 = calcRootMeanSqErrorFunc(edf1, edf8);
msq2 = calcRootMeanSqErrorFunc(edf2, edf8);
msq3 = calcRootMeanSqErrorFunc(edf3, edf8);
msq4 = calcRootMeanSqErrorFunc(edf4, edf8);
msq5 = calcRootMeanSqErrorFunc(edf5, edf8);
msq6 = calcRootMeanSqErrorFunc(edf6, edf8);

errorArray = [msq1 msq2 msq3 msq4 msq5 msq6];


figure();
plot(errorArray);
title("Actual error for Royz")


errorMovingAverage = movmean(errorArray, 3);
figure();
plot(errorMovingAverage);
title("Moving average error for Royz")

% For Ashkan

edf1 =  Edf2Mat('/Users/desouza/Desktop/udichis project/ax1019g.edf');
edf2 =  Edf2Mat('/Users/desouza/Desktop/udichis project/ax1026g.edf');
edf3 =  Edf2Mat('/Users/desouza/Desktop/udichis project/ax1027g.edf');
edf4 =  Edf2Mat('/Users/desouza/Desktop/udichis project/ax1102g.edf');
edf5 =  Edf2Mat('/Users/desouza/Desktop/udichis project/ax1103g.edf');
edf6 =  Edf2Mat('/Users/desouza/Desktop/udichis project/ax1109g.edf');
edf7 =  Edf2Mat('/Users/desouza/Desktop/udichis project/ax1122g.edf');

msq1 = calcRootMeanSqErrorFunc(edf1, edf8);
msq2 = calcRootMeanSqErrorFunc(edf2, edf8);
msq3 = calcRootMeanSqErrorFunc(edf3, edf8);
msq4 = calcRootMeanSqErrorFunc(edf4, edf8);
msq5 = calcRootMeanSqErrorFunc(edf5, edf8);
msq6 = calcRootMeanSqErrorFunc(edf6, edf8);
msq7 = calcRootMeanSqErrorFunc(edf7, edf8);

figure();
errorArray = [msq1 msq2 msq3 msq4 msq5 msq6 msq7];
plot(errorArray)
title("Actual error for Ashkan")

figure();
errorMovingAverage = movmean(errorArray, 3);
plot(errorMovingAverage)
title("Moving average error for Ashkan")


% Rebecca 

edf1 =  Edf2Mat('/Users/desouza/Desktop/udichis project/rb1107g.edf');
% edf2 =  Edf2Mat('/Users/desouza/Desktop/udichis project/rb1107g2.edf');
edf3 =  Edf2Mat('/Users/desouza/Desktop/udichis project/rb1128g1.edf');
edf4 =  Edf2Mat('/Users/desouza/Desktop/udichis project/rb1128g2.edf');

edf5 = Edf2Mat('./ud1205g.edf');


msq1 = calcRootMeanSqErrorFunc(edf1, edf5);
% msq2 = calcRootMeanSqErrorFunc(edf2, edf5);
msq3 = calcRootMeanSqErrorFunc(edf3, edf5);
msq4 = calcRootMeanSqErrorFunc(edf4, edf5);


figure();
errorArray = [msq1 msq3 msq4];
plot(errorArray);
title("Actual error for Rebecca")

figure();
errorMovingAverage = movmean(errorArray, 3);
plot(errorMovingAverage);
title("Moving average error for Rebecca")


plotTrialsFunc(edf1, 'Rebecca 1107g');
plotTrialsFunc(edf3, 'Rebecca 1128g1');
plotTrialsFunc(edf4, 'Rebecca 1128g2');
plotTrialsFunc(edf5, 'Udichi Reference');