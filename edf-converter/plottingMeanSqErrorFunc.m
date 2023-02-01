function [meanSquaredError] = plottingMeanSqErrorFunc(edf0 , edf1)

    len0 = length(edf0.Samples.posX);
    len1 = length(edf1.Samples.posX);
    
    smaller = -1;

    if len0 < len1
        smaller = len0;
    else
        smaller = len1;
    end
    
    errorArray = zeros(1,numel(smaller));
    
    meanSquaredError = 0.0;
    
    for n=1 : smaller
    
    sample0 = edf0.Samples.posX(n);
    sample1 = edf1.Samples.posX(n);
    
    if isnan(sample0) || isnan(sample1)
        continue; 
    end
  
    
    error = power(sample1 - sample0, 2); % Try out different errors (RSE, MSE)
    
    if ~isnan(error) && error < 0
        error = error * -1;
    end
    
    if  isnan(error)
        continue;
    end
        
    errorArray(n) = error;
    
    meanSquaredError = meanSquaredError + error;
    
    end
    
%     plot(errorArray);
end