addpath('functions/')  
WINDOW_LENGTH = 10;

referenceEdf = Edf2Mat('./ud1205g.edf');
rbEdf = Edf2Mat('/Users/desouza/Desktop/udichis project/rb1128g2.edf');

edf1 =  Edf2Mat('/Users/desouza/Desktop/udichis project/ax1019g.edf');
edf2 =  Edf2Mat('/Users/desouza/Desktop/udichis project/ax1026g.edf');
edf3 =  Edf2Mat('/Users/desouza/Desktop/udichis project/ax1027g.edf');
edf4 =  Edf2Mat('/Users/desouza/Desktop/udichis project/ax1102g.edf');
edf5 =  Edf2Mat('/Users/desouza/Desktop/udichis project/ax1103g.edf');
edf6 =  Edf2Mat('/Users/desouza/Desktop/udichis project/ax1109g.edf');
edf7 =  Edf2Mat('/Users/desouza/Desktop/udichis project/ax1122g.edf');

samples = referenceEdf.Samples;

time = referenceEdf.Samples.time;

% Beyond trial one there is a 30s delay where the eye tracker kept on
% recording, hence to account for the samples, we try to remove those from
% the calculations.


totalSamples = length(samples.time);
totalSampleTime = 460;

totalSamplesInATrial = ((totalSamples/totalSampleTime) * 68);

disp('Total Samples in A trial')
disp(round(totalSamplesInATrial))

samplesInASecond = round(totalSamplesInATrial / 68);

disp('Total Samples in a second')
disp(round(samplesInASecond))


Movements = [1 2; 2 3; 4 5; 5 6; 7 8; 8 9; 10 11; 12 13; 13 14; 15 16; 
    17 18; 18 19; 19 21; 21 22; 23 24; 25 26; 26 27; 27 28; 28 29; 29 30;
    31 32; 32 33; 34 35; 36 37; 37 39; 39 40; 40 41; 42 43; 44 45; 45 47;
    47 48; 48 49; 50 51; 52 53; 53 54; 55 56; 56 57; 58 59; 59 60; 60 62;
    63 64; 64 65; 65 66; 66 67; 67 68;];

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1);
    endTime = x(2);
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf1, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T1 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1);
    endTime = x(2);
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf2, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T2 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1);
    endTime = x(2);
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf3, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T3 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1);
    endTime = x(2);
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf4, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end


errorArray = movmean(errorArray, WINDOW_LENGTH);
T4 = mean(errorArray);
 
errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1);
    endTime = x(2);
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf5, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

T5 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1);
    endTime = x(2);
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf6, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T6 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1);
    endTime = x(2);
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf7, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T7 = mean(errorArray);
 
% % Trial 2
% 
errorArray = zeros(1,numel(length(Movements)));
% 
for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+97;
    endTime = x(2)+97;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf1, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end
errorArray = movmean(errorArray, WINDOW_LENGTH);
T8 = mean(errorArray);
 
errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+97;
    endTime = x(2)+97;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf2, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end
errorArray = movmean(errorArray, WINDOW_LENGTH);
T9 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+97;
    endTime = x(2)+97;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf3, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end
errorArray = movmean(errorArray, WINDOW_LENGTH);
T10 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));
for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+97;
    endTime = x(2)+97;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf4, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end
errorArray = movmean(errorArray, WINDOW_LENGTH);
T11 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+97;
    endTime = x(2)+97;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf5, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T12 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+97;
    endTime = x(2)+97;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf6, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end
errorArray = movmean(errorArray, WINDOW_LENGTH);
T13 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+97;
    endTime = x(2)+97;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf7, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T14 = mean(errorArray);
 
errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+195;
    endTime = x(2)+195;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf1, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T15 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+195;
    endTime = x(2)+195;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf2, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T16 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+195;
    endTime = x(2)+195;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf3, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T17 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));
for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+195;
    endTime = x(2)+195;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf4, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T18 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+195;
    endTime = x(2)+195;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf5, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T19 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+195;
    endTime = x(2)+195;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf6, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T20 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+195;
    endTime = x(2)+195;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf7, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T21 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+293;
    endTime = x(2)+293;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf1, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T22 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+293;
    endTime = x(2)+293;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf2, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T23 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));
for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+293;
    endTime = x(2)+293;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf3, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end
errorArray = movmean(errorArray, WINDOW_LENGTH);
T24 = mean(errorArray);
 
errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+293;
    endTime = x(2)+293;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf4, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T25 = mean(errorArray);
 
errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+293;
    endTime = x(2)+293;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf5, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
T26 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+293;
    endTime = x(2)+293;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf6, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T27 = mean(errorArray);
% 
% 
errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+293;
    endTime = x(2)+293;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf7, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T28 = mean(errorArray);

 
errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+391;
    endTime = x(2)+391;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf1, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
T29 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+391;
    endTime = x(2)+391;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf2, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
T30 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+391;
    endTime = x(2)+391;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf3, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T31 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+391;
    endTime = x(2)+391;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf4, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T32 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+391;
    endTime = x(2)+391;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf5, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

errorArray = movmean(errorArray, WINDOW_LENGTH);
T33 = mean(errorArray);


errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+391;
    endTime = x(2)+391;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf6, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
T34 = mean(errorArray);

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+391;
    endTime = x(2)+391;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf7, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
T35 = mean(errorArray);


qa = [
 T1 T8 T15 T22 T29; % First Trials
 T2 T9 T16 T24 T31; % Second Trials
 T3 T10 T17 T24 T31; % Third Trials and so on ...
 T4 T11 T18 T25 T32;
 T5 T12 T19 T26 T33;
 T6 T13 T20 T27 T34;
 T7 T14 T21 T28 T25;
];

qa = transpose(qa);

file1 = [T1 T2 T3 T4 T5 T6 T7];
file2 = [T8 T9 T10 T11 T12 T13 T14];
file3 = [T15 T16 T17 T18 T19 T20 T21];
file4 = [T22 T23 T24 T25 T26 T27 T28];
file5 = [T29 T30 T31 T32 T33 T34 T35];

figure();
yyaxis left
bar(qa)
colororder('default')
yyaxis right

hold on

col = [0.4940 0.1840 0.5560];
xx  = linspace(1, 5, 300);
yy1 = interp1([1, 2, 3, 4, 5], [T4 T11 T18 T25 T32], xx, 'cubic');
p = plot(xx, yy1, 'r-', 'Color', col);
ylim([0 3500])
p.LineWidth = 2;


col = [0.9290 0.6940 0.1250];
xx  = linspace(1, 5, 200);
yy1 = interp1([1, 2, 3, 4, 5], [T3 T10 T17 T24 T31], xx, 'cubic');
p = plot(xx, yy1, 'r-', 'Color', col);
ylim([0 3500])
p.LineWidth = 2;

col = [0.6350 0.0780 0.1840];
xx  = linspace(1, 5, 200);
yy1 = interp1([1, 2, 3, 4, 5], [T7 T14 T21 T28 T25], xx, 'cubic');
p = plot(xx, yy1, 'r-', 'Color', col);
ylim([0 3500])
p.LineWidth = 2;

hold off

title("Error Plot")
xlabel('Trial No') 
ylabel('Error')