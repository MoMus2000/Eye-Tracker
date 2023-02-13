addpath('functions/')  
WINDOW_LENGTH = 10;

referenceEdf = Edf2Mat('./ud1205g.edf');
rbEdf = Edf2Mat('/Users/desouza/Desktop/udichis project/rb1128g2.edf');

edf1 =  Edf2Mat('/Users/desouza/Desktop/udichis project/rs1017gr.edf');
edf2 =  Edf2Mat('/Users/desouza/Desktop/udichis project/rs1017g2.edf');
edf3 =  Edf2Mat('/Users/desouza/Desktop/udichis project/rs1019g.edf');
edf4 =  Edf2Mat('/Users/desouza/Desktop/udichis project/rs1102g.edf');
edf5 =  Edf2Mat('/Users/desouza/Desktop/udichis project/rs1110g.edf');
edf6 =  Edf2Mat('/Users/desouza/Desktop/udichis project/rs1123g.edf');
edf7 =  Edf2Mat('/Users/desouza/Desktop/udichis project/rs1207g.edf');

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

figure();

hold on

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
plot(errorArray)

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
plot(errorArray, 'LineWidth',2.0)

disp("error values")
disp(errorArray)

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
plot(errorArray)

disp("error values")
disp(errorArray)

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

disp("error values")
disp(errorArray)

errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)

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

disp("error values")
disp(errorArray)

plot(errorArray)

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
plot(errorArray)


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

disp("error values")
disp(errorArray)

errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray,'LineWidth',2.0)

lgd = legend('ax1019g','ax1026g','ax1027g', 'ax1102g', 'ax1103g', 'ax1109g', 'ax1122g');
lgd.FontSize = 8;
lgd.Orientation = 'vertical';
title("Error plots for Royz Trial 1 over time")
xlabel('Movements') 
ylabel('Error')


hold off

figure();

% Trial 2

hold on

errorArray = zeros(1,numel(length(Movements)));

for i=1 : length(Movements)
    x = Movements(i, : );
    start = x(1)+97;
    endTime = x(2)+97;
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf1, start, endTime, samplesInASecond, '1');
    errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
    errorArray(i) = errorResult;
end

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)

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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray,'LineWidth',2.0)


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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)

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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)


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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)


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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)


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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray,'LineWidth',2.0)

lgd = legend('ax1019g','ax1026g','ax1027g', 'ax1102g', 'ax1103g', 'ax1109g', 'ax1122g');
lgd.FontSize = 8;
lgd.Orientation = 'vertical';
title("Error plots for Royz Trial 2 over time")

xlabel('Movements') 
ylabel('Error')

hold off

% Trial 3
figure();

hold on

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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)

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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray,'LineWidth',2.0)


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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)

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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)


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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)


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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)


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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray,'LineWidth',2.0)

lgd = legend('ax1019g','ax1026g','ax1027g', 'ax1102g', 'ax1103g', 'ax1109g', 'ax1122g');
lgd.FontSize = 8;
lgd.Orientation = 'vertical';
title("Error plots for Royz Trial 3 over time")

xlabel('Movements') 
ylabel('Error')

hold off

% Trial 4

figure();

hold on

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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)

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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray,'LineWidth',2.0)


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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)

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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)


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
plot(errorArray)


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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)


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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray,'LineWidth',2.0)

lgd = legend('ax1019g','ax1026g','ax1027g', 'ax1102g', 'ax1103g', 'ax1109g', 'ax1122g');
lgd.FontSize = 8;
lgd.Orientation = 'vertical';
title("Error plots for Royz Trial 4 over time")

xlabel('Movements') 
ylabel('Error')

hold off

% Trial 5

figure();

hold on

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
plot(errorArray)

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
plot(errorArray,'LineWidth',2.0)


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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)

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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)


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

disp("error values")
disp(errorArray)
errorArray = movmean(errorArray, WINDOW_LENGTH);
plot(errorArray)


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
plot(errorArray)


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
plot(errorArray,'LineWidth',2.0)

lgd = legend('ax1019g','ax1026g','ax1027g', 'ax1102g', 'ax1103g', 'ax1109g', 'ax1122g');
lgd.FontSize = 8;
lgd.Orientation = 'vertical';
title("Error plots for Royz Trial 5 over time")

xlabel('Movements') 
ylabel('Error')

hold off