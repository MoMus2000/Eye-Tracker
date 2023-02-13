addpath('functions/')
referenceEdf = Edf2Mat('./ud1205g.edf');
rbEdf = Edf2Mat('/Users/desouza/Desktop/udichis project/rb1128g2.edf');

axEdf = Edf2Mat('/Users/desouza/Desktop/udichis project/ax1122g.edf');

% We get every single movement based on time
% Once we have the movement, we create two plot, 
% One for the reference file and the other for the participant

addpath('functions/')

edf1 =  Edf2Mat('/Users/desouza/Desktop/udichis project/ax1019g.edf');

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

% hold on

% filename = 'animation.gif';
% x = Movements(1, : );
% start = x(1);
% endTime = x(2);
% [x, y] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
% z = linspace(1, length(x), length(x));
% 
% plot3(x, y, z,'Color','none');
% 
% disp(length(x))
% disp(length(y))
% disp(length(z))
% 
% p = plot3(x(1),y(1),z(1),'b');
% m = scatter3(x(1),y(1),z(1),'filled','b');

k = 1;
l = length(Movements);

while k < l
    x = Movements(k, : );
    start = x(1);
    endTime = x(2);
    [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
    [pointSampleX, pointSampleY] = pointOfInterestFunc(edf1, start, endTime, samplesInASecond, '1');
    
    movementNum = strcat("Movement Num ", int2str(k));
    p1 = figure();
    
    hold on
    title("Reference Movement Plot")
    xlabel('X Axis Position')
    ylabel('Y Axis Position')
    
%     x = 1:length(pointSampleRefX);
%     pointSampleRefX(isnan(pointSampleRefX)) = interp1(x(~isnan(pointSampleRefX)),pointSampleRefX(~isnan(pointSampleRefX)),x(isnan(pointSampleRefX))) ;
    
%     x = 1:length(pointSampleRefY);
%     pointSampleRefY(isnan(pointSampleRefY)) = interp1(x(~isnan(pointSampleRefY)),pointSampleRefX(~isnan(pointSampleRefY)),x(isnan(pointSampleRefY))) ;
    
    for n=1:length(pointSampleRefX)
        if isnan(pointSampleRefX(n)) || isnan(pointSampleRefY(n))
            continue
        end
        plot(pointSampleRefX(n), pointSampleRefY(n), 'b-x'); 
        pause(0.01)
    end
    plot(pointSampleRefX, pointSampleRefY);
    hold off
    
    p2 = figure();
    
%     x = 1:length(pointSampleX);
%     pointSampleX(isnan(pointSampleX)) = interp1(x(~isnan(pointSampleX)),pointSampleX(~isnan(pointSampleX)),x(isnan(pointSampleX))) ;
    
%     x = 1:length(pointSampleY);
%     pointSampleY(isnan(pointSampleY)) = interp1(x(~isnan(pointSampleY)),pointSampleY(~isnan(pointSampleY)),x(isnan(pointSampleY))) ;
    
    hold on
    title("Participant Movement Plot")
    xlabel('X Axis Position')
    ylabel('Y Axis Position')
    for n=1:length(pointSampleX)
        if isnan(pointSampleRefX(n)) || isnan(pointSampleRefY(n))
            continue
        end
        plot(pointSampleX(n), pointSampleY(n), 'b-x'); 
        pause(0.01)
    end
    plot(pointSampleX, pointSampleY)
    hold off
    
    k=k+1;
    
    answer = questdlg('Continue to next movement?', ...
	movementNum, ...
	'Continue','Cancel', 'Replay', 'Continue');

    switch answer
        case 'Continue'
            disp("Next")
        case 'Cancel'
            close(p1);
            close(p2);
            break
        case 'Replay'
            k=k-1;
    end
    close(p1);
    close(p2);
end

% for i=1 : length(Movements)
%     x = Movements(i, : );
%     start = x(1);
%     endTime = x(2);
%     [pointSampleRefX, pointSampleRefY] = pointOfInterestFunc(referenceEdf, start, endTime, samplesInASecond, '1');
%     [pointSampleX, pointSampleY] = pointOfInterestFunc(edf1, start, endTime, samplesInASecond, '1');
%     
%     h1 = figure();
%     
%     time = linspace(1, length(pointSampleRefX), length(pointSampleRefX));
%     
%     plot3(pointSampleRefX, pointSampleRefY, time);
%     title("Reference Movement Plot")
% 
%     zlabel('Time Axis Position') 
%     ylabel('X Axis Postion')
%     xlabel('Y Axis Position')
%     
%     
%     h2 = figure();
%     time = linspace(1, length(pointSampleX), length(pointSampleX));
%     plot3(pointSampleX, pointSampleY, time);
%     title("Participant Movement Plot")
% 
%     zlabel('Time Axis Position') 
%     ylabel('X Axis Postion')
%     xlabel('Y Axis Position')
%     
%     waitfor(h1);
%     waitfor(h2);
%     
% end

% hold off