function [] = plottingErrorFunc(edf0 , edf1)

    len0 = length(edf0.Samples.posX);
    len1 = length(edf1.Samples.posX);
    
    smaller = -1;

    if len0 < len1
        smaller = len0;
    else
        smaller = len1;
    end
    
    errorArray = zeros(1,numel(smaller));
    
    for n=1 : smaller
    
    sample0 = edf0.Samples.posX(n);
    sample1 = edf1.Samples.posX(n);
    
    error = sample1 - sample0 % Try out different errors (RSE, MSE)
    
    if ~isnan(error) && error < 0
        error = error * -1;
    end
    
    if  isnan(error)
        error = -50;
    end
        
    errorArray(n) = error;
    
    end
    
    plot(errorArray);

end


