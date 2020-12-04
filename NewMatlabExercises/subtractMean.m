function [matInput,meanCol] = subtractMean(matInput)

%Gets the length of the input dataset, used this method in case the row 
%length of the dataset is ever longer than the column length 
[m,n] = size(matInput);

%Getting the mean for each column and subtracting it by each value in its
%column to get new values
meanCol = mean(matInput);
matInput = matInput - meanCol;

end