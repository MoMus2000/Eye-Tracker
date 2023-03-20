addpath('functions/')
referenceEdf = Edf2Mat('/Users/mmuhammad/Documents/MATLAB/edf-converter/edfData/ud1205g.edf');


askhan1 = Edf2Mat('/Users/mmuhammad/Documents/MATLAB/edf-converter/edfData/ax1027g.edf');
ashkan2 = Edf2Mat('/Users/mmuhammad/Documents/MATLAB/edf-converter/edfData/ax1026g.edf');
ashkan3 = Edf2Mat('/Users/mmuhammad/Documents/MATLAB/edf-converter/edfData/ax1103g.edf');
ashkan4 = Edf2Mat('/Users/mmuhammad/Documents/MATLAB/edf-converter/edfData/ax1109g.edf');


rebecca1 = Edf2Mat('/Users/mmuhammad/Documents/MATLAB/edf-converter/edfData/rb1107g.edf');
rebecca2 = Edf2Mat('/Users/mmuhammad/Documents/MATLAB/edf-converter/edfData/rb1128g1.edf');
rebecca3 = Edf2Mat('/Users/mmuhammad/Documents/MATLAB/edf-converter/edfData/rb1128g2.edf');

left = -1;
right = 1;
center  = 0; 

xMovements = [left center right center left center right center center center center center left right center center center right center left center center center center center left center right center center center center center right center left center center center center center right center left center];

% x = 0:45;
% figure();
% stairs(xMovements);
% xticks(x);

% For rebecca

[refT1, refT2, refT3, refT4, refT5] = userPlotMovement(referenceEdf, false);



[rb1T1, rb1T2, rb1T3, rb1T4, rb1T5] = userPlotMovement(rebecca1, false);
similarities1 = [
    calculateCosineSimilarity(refT1, rb1T1)
    calculateCosineSimilarity(refT2, rb1T2)
    calculateCosineSimilarity(refT3, rb1T3)
    calculateCosineSimilarity(refT4, rb1T4)
    calculateCosineSimilarity(refT5, rb1T5)
    ];



[rb2T1, rb2T2, rb2T3, rb2T4, rb2T5] = userPlotMovement(rebecca2, false);
similarities2 = [
    calculateCosineSimilarity(refT1, rb2T1)
    calculateCosineSimilarity(refT2, rb2T2)
    calculateCosineSimilarity(refT3, rb2T3)
    calculateCosineSimilarity(refT4, rb2T4)
    calculateCosineSimilarity(refT5, rb2T5)
    ];


[rb3T1, rb3T2, rb3T3, rb3T4, rb3T5] = userPlotMovement(rebecca3, false);
similarities3 = [
    calculateCosineSimilarity(refT1, rb3T1)
    calculateCosineSimilarity(refT2, rb3T2)
    calculateCosineSimilarity(refT3, rb3T3)
    calculateCosineSimilarity(refT4, rb3T4)
    calculateCosineSimilarity(refT5, rb3T5)
    ];



plot([mean(similarities1) mean(similarities2) mean(similarities3)]);
ylabel("Rebecca Cumulatative Similarity");
xlabel("Sessions");
xticks([1 2 3]);
% 
% plot1 = userPlotMovement(referenceEdf, false);
% plot2 = userPlotMovement(rebecca2, false);
% x2 = calculateCosineSimilarity(plot1, plot2);
% 
% plot1 = userPlotMovement(referenceEdf, false);
% plot2 = userPlotMovement(rebecca1, false);
% x3 = calculateCosineSimilarity(plot1, plot2);
% 
% plot([x1 x2 x3]);