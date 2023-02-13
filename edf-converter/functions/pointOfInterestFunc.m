function [positionSampleX, positionSampleY] = pointOfInterestFunc(edf, start, endTime, samplesInASecond, trial)

if strcmp(trial, '1')
    if start == 0
        start = 1;
    else
        start = samplesInASecond*start;
    end

    endTime = samplesInASecond*endTime;

    positionSampleX = zeros(1, endTime-start);
    positionSampleY = zeros(1, endTime-start);

    for n=start : endTime
        valX = edf.Samples.posX(n);
        valY = edf.Samples.posY(n);

        positionSampleX(n) = valX;
        positionSampleY(n) = valY;    
    end
end

if strcmp(trial, '2')
    start = samplesInASecond * start;
    endTime = samplesInASecond * endTime;
    
    positionSampleX = zeros(1, endTime-start);
    positionSampleY = zeros(1, endTime-start);
    
    
    for n=start : endTime
        valX = edf.Samples.posX(n);
        valY = edf.Samples.posY(n);

        positionSampleX(n) = valX;
        positionSampleY(n) = valY;    
    end
    
end

end

