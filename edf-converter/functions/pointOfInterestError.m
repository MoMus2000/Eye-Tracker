function [errorResult] = pointOfInterestError(pointSampleX, refenrenceSampleX)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

len0 = length(pointSampleX);
len1 = length(refenrenceSampleX);
    
if len0 < len1
    smaller = len0;
else
    smaller = len1;
end

meanSquaredError = 0.0;

for n=1 : smaller
   if isnan(pointSampleX(n)) || isnan(refenrenceSampleX(n))
       continue;
   end
   
   error = power(pointSampleX(n) - refenrenceSampleX(n), 2);
   
   if ~isnan(error) && error < 0
        error = error * -1;
   end
    
   if isnan(error)
       continue;
   end
      
   meanSquaredError = meanSquaredError + error;
   
end

errorResult = power(meanSquaredError, 0.5);

end

