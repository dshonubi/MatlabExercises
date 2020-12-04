
function output = myplotarea(filename,n)

%Opens the file, scans it from x x-value y y-value, stores as cell array
%then converted into x,y vectors
fileID = fopen(filename);
values=textscan(fileID, '%s %f %s %f');
x = cell2mat(values(2));
y = cell2mat(values(4));

%checks whether n is greater than the amount of points
%checks n against x and y in case more x values than y values or other way
%around
if n>length(x) || n>length(y)
    error ('n exceeds the number of points available.')
end

%generates new x and y vectors with the specified n
x = setdiff(x,[x(n+1:length(x))],'stable');
y = setdiff(y,[y(n+1:length(y))],'stable');

%plots the data using the area function and titles it with the number of
%points
str1 = num2str(n);
str1 = strcat(str1,' points');
area(x,y);
title(str1);

%outpurt not necessary so it is left unset
end
