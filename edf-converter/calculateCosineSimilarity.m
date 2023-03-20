function [cosineSimilarity] = calculateCosineSimilarity(plot1,plot2)
    plot1 = zscore(plot1);
    plot2 = zscore(plot2);
    cosineSimilarity = pdist2(plot1, plot2);
end