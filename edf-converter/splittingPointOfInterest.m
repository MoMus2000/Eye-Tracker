addpath('functions/')
referenceEdf = Edf2Mat('./ud1205g.edf');
rbEdf = Edf2Mat('/Users/desouza/Desktop/udichis project/rb1128g2.edf');
axEdf = Edf2Mat('/Users/desouza/Desktop/udichis project/ax1122g.edf');


POVX = 1;
POVY = POVX + 105;

% For Udichi

samples = referenceEdf.Samples;

time = referenceEdf.Samples.time;

% Beyond trial one there is a 30s delay where the eye tracker kept on
% recording, hence to account for the samples, we try to remove those from
% the calculations.


totalSamples = length(samples.time);
totalSampleTime = 460;

totalSamplesInATrial = (totalSamples/totalSampleTime * 68);

samplesInASecond = round(totalSamplesInATrial / 68);

[pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, POVX, POVY, samplesInASecond, '1');

figure(); 
plot(pointSampleRefX)
title("Udichi X value against time")
xlabel('time') 
ylabel('Position X')

figure();
plot(pointSampleRefY)
title("Udichi Y value against time")
xlabel('time') 
ylabel('Position Y')

figure();
plot(pointSampleRefX, pointSampleRefY)
title("Udichi X against Y")
xlabel('X') 
ylabel('Y')

% For Rebecca

totalSamples = length(samples.time);
totalSampleTime = 460;

totalSamplesInATrial = (totalSamples/totalSampleTime * 68);

samplesInASecond = round(totalSamplesInATrial / 68);


[pointSampleX, pointSampleY] = pointOfInterestFunc(rbEdf, POVX, POVY, samplesInASecond, '1');

figure();
plot(pointSampleX)
title("Rebecca X value against time")
xlabel('time') 
ylabel('Position X')

figure();
plot(pointSampleY)
title("Rebecca Y value against time")
xlabel('time') 
ylabel('Position Y')

figure();
plot(pointSampleX, pointSampleY)
title("Rebecca X against Y")
xlabel('X') 
ylabel('Y')

errorResult = pointOfInterestError(pointSampleX, pointSampleRefX);
disp("X Error between rebecca and udichi");
disp(errorResult);

errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
disp("Y Error between rebecca and udichi");
disp(errorResult);

% For Ashkan

totalSamples = length(samples.time);
totalSampleTime = 460;

totalSamplesInATrial = (totalSamples/totalSampleTime * 68);

samplesInASecond = round(totalSamplesInATrial / 68);


[pointSampleX, pointSampleY] = pointOfInterestFunc(axEdf, POVX, POVY, samplesInASecond, '1');

figure();
plot(pointSampleX)
title("Askhan X value against time")
xlabel('time') 
ylabel('Position X')

figure();
plot(pointSampleY)
title("Askhan Y value against time")
xlabel('time') 
ylabel('Position Y')

figure();
plot(pointSampleX, pointSampleY)
title("Askhan X against Y")
xlabel('X') 
ylabel('Y')

errorResult = pointOfInterestError(pointSampleX, pointSampleRefX);
disp("X Error between askhan and udichi");
disp(errorResult);
errorResult = pointOfInterestError(pointSampleY, pointSampleRefY);
disp("Y Error between askhan and udichi");
disp(errorResult);
