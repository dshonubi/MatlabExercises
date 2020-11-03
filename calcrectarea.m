% CS 5810  -- Programming for data analysis 
%
%  Assignment 1 | Prof. Alberto Paccanaro
%
% 
% Insert BELOW your function for exercise 2

function area = calcrectarea(len,width)
if(length(len) ~= length(width))
    error('Two vectors provided as inputs do not have the same length.');
else    
    area = len .* width;
end


