addpath('functions/')
referenceEdf = Edf2Mat('./ud1205g.edf');
axEdf = Edf2Mat('/Users/desouza/Desktop/udichis project/ax1122g.edf');


figure();
xValues = axEdf.Samples.posX;
% timeTicks = linspace(0, 68, 9);
% disp(round(timeTicks));
plot(xValues);
xticks([1 2 3 4 5 6 7 8 9 10]);
xlabel('time') 
ylabel('Position X')

figure();
yValues = axEdf.Samples.posY;
time = linspace(0, 68, length(axEdf.Samples.posY));
plot(yValues);
% timeTicks = linspace(0, 68, 9);
% disp(round(timeTicks));
% xticks(timeTicks);
xlabel('time') 
ylabel('Position Y')