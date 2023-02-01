
% Method to be able to calculate the error between a reference edf and
% another edf file. 
% We can do that by comparing the positions between the two files and
% storing the mean squared error and plotting it out to be an obervable
% decrease if the subject is learning the dance properly.

edf0 = Edf2Mat('/Users/desouza/Desktop/udichis project/ax1122g.edf');
edf1 = Edf2Mat('./ud1205g.edf');

disp(length(edf0.Samples.posX));
disp(length(edf1.Samples.posX));

len0 = length(edf0.Samples.posX);
len1 = length(edf1.Samples.posX);


smaller = -1;

if len0 < len1
    smaller = len0
else
    smaller = len1
end
    
disp(smaller);

errorArray = zeros(1,numel(smaller));

meanSquaredError = 0.0;

for n=1 : smaller
    
    sample0 = edf0.Samples.posX(n);
    sample1 = edf1.Samples.posX(n);
   
%     disp(sample0);
%     disp(sample1);
    
    error = power(sample1 - sample0, 2); % Try out different errors (RSE, MSE)
    
    if ~isnan(error) && error < 0
        error = error * -1;
    end
    
    if  isnan(error)
        error = -50;
    end
    
    meanSquaredError  = meanSquaredError + error;
    
    errorArray(n) = error;
    
end



plot(errorArray);

disp("The mean squared error is : ")
disp(meanSquaredError/smaller)
