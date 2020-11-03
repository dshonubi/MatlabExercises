% CS 5810  -- Programming for data analysis 
%
%  Assignment 1 | Prof. Alberto Paccanaro
%
% 
% Insert BELOW your function for exercise 4

function oddVal = evenodd(inputVal)
vec = randi([0 30],1,inputVal);
aka = find(mod(vec,2)==0);
oddVal = sum(mod(aka,2)~=0);

