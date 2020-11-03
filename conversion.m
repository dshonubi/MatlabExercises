% CS 5810  -- Programming for data analysis 
%
%  Assignment 1 | Prof. Alberto Paccanaro
%
% 
% Insert BELOW your function for exercise 3

function convertedVal = conversion(disType, val)

if(length(disType)>1)
    error('The conversion must either be ''f'' for feet or ''m'' for meters.'); 
else
    if((disType ~= 'm') && (disType ~= 'f'))
        error('The conversion must either be ''f'' for feet or ''m'' for meters.'); 
    else
        if(disType == 'm')
            convertedVal=val./100; %assuming the val is centimeters to meters.
        else
            convertedVal=val./12; %assuming the val is inches to feet.
        end
    end
end    
        
