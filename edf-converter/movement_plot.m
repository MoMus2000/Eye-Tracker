addpath('functions/')
referenceEdf = Edf2Mat('/Users/mmuhammad/Documents/MATLAB/edf-converter/edfData/ud1205g.edf');
axEdf = Edf2Mat('/Users/mmuhammad/Documents/MATLAB/edf-converter/edfData/ax1103g.edf');

% 
% % figure();
% % xValues = axEdf.Samples.posX;
% % % timeTicks = linspace(0, 68, 9);
% % % disp(round(timeTicks));
% % plot(xValues);
% % xticks([1 2 3 4 5 6 7 8 9 10]);
% % xlabel('time') 
% % ylabel('Position X')
% 
% figure();
% yValues = movmean(referenceEdf.Samples.posY, 25);
% time = linspace(0, 68, length(referenceEdf.Samples.posY));
% plot(yValues);
% 
% 
% medianArray = zeros(1,length(referenceEdf.Samples.posY));
% 
% avg = 0;
% counter = 0;
% for n=1:length(referenceEdf.Samples.posY)
%     if isnan(referenceEdf.Samples.posY(n))
%         continue;
%     end
%     avg = avg + referenceEdf.Samples.posY(n);
%     medianArray(n) = referenceEdf.Samples.posY(n);
%     counter = counter + 1;
% end
% 
% meanThreshold = (avg/counter);
% 
% yline(meanThreshold,'-','Mean Threshold');
% 
% medianThreshold = median(medianArray(1:counter-1));
% yline(medianThreshold,'-','Median Threshold');

% timeTicks = linspace(0, 68, 9);
% disp(round(timeTicks));
% % xticks(timeTicks);
% xlabel('time') 
% ylabel('Position Y')
% 
% movementPlotFunc(referenceEdf, "Udichi Position Y", 1);
% movementPlotFunc(referenceEdf, "Udichi Position Y", 10);
% movementPlotFunc(referenceEdf, "Udichi Position Y", 25);
% movementPlotFunc(referenceEdf, "Udichi Position Y", 50);
% movementPlotFunc(referenceEdf, "Udichi Position Y", 100);
% movementPlotFunc(referenceEdf, "Udichi", 25);

movementPlotFunc(axEdf, "Ashkan 15", 15);
movementPlotFunc(axEdf, "Ashkan 25", 25);

