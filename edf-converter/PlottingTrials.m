help Ed2Mat

edf0 = Edf2Mat('/Users/desouza/Desktop/udichis project/rb1128g1.edf');

% Plotting the entire thing with all the trials
plot(edf0);

% We divide our samples by 5 of the total number of samples
% This will allow us to observe the samples for all 5 different trials

totalSamples = length(edf0.Samples.posX);

disp("These are the total number of samples");
disp(totalSamples);

dividedSamples = totalSamples/5;

trialOneStartIndex = round(dividedSamples);

disp(trialOneStartIndex);

% Slicing out the array to be able to divide the samples into 5 trial - to
% observe variation.
figure();
title("Trial One");
plot(edf0.Samples.posX(1: end-trialOneStartIndex*4), edf0.Samples.posY(1: end-trialOneStartIndex*4));


figure();
title("Trial Two");
plot(edf0.Samples.posX(trialOneStartIndex*1: end-trialOneStartIndex*3), edf0.Samples.posY(trialOneStartIndex*1: end-trialOneStartIndex*3));


figure();
title("Trial Three");
plot(edf0.Samples.posX(trialOneStartIndex*2: end-trialOneStartIndex*2), edf0.Samples.posY(trialOneStartIndex*2: end-trialOneStartIndex*2));

figure();
title("Trial Four");
plot(edf0.Samples.posX(trialOneStartIndex*3: end-trialOneStartIndex), edf0.Samples.posY(trialOneStartIndex*3: end-trialOneStartIndex));

figure();
title("Trial Five");
plot(edf0.Samples.posX(trialOneStartIndex*4: end), edf0.Samples.posY(trialOneStartIndex*4: end));