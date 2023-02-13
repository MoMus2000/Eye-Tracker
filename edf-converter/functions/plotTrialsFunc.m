function [] = plotTrialsFunc(edf, trialName)
plot(edf);
totalSamples = length(edf.Samples.posX);
disp("These are the total number of samples");
disp(totalSamples);

dividedSamples = totalSamples/5;

trialOneStartIndex = round(dividedSamples);

disp(trialOneStartIndex);

% Slicing out the array to be able to divide the samples into 5 trial - to
% observe variation.

figure();
plot(edf.Samples.posX(1: end-trialOneStartIndex*4), edf.Samples.posY(1: end-trialOneStartIndex*4));
title(strcat(trialName, ' 1'));

figure();
plot(edf.Samples.posX(trialOneStartIndex*1: end-trialOneStartIndex*3), edf.Samples.posY(trialOneStartIndex*1: end-trialOneStartIndex*3));
title(strcat(trialName, ' 2'));

figure();
plot(edf.Samples.posX(trialOneStartIndex*2: end-trialOneStartIndex*2), edf.Samples.posY(trialOneStartIndex*2: end-trialOneStartIndex*2));
title(strcat(trialName, ' 3'));

figure();
plot(edf.Samples.posX(trialOneStartIndex*3: end-trialOneStartIndex), edf.Samples.posY(trialOneStartIndex*3: end-trialOneStartIndex));
title(strcat(trialName, ' 4'));

figure();
plot(edf.Samples.posX(trialOneStartIndex*4: end), edf.Samples.posY(trialOneStartIndex*4: end));
title(strcat(trialName, ' 5'));

end