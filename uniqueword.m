
function outputstr = uniqueword(str)

persistent numb;
if isempty(numb)
    numb = 0;
end

numb = numb+1;

if numb>5  
error ("5 words have already been created, you cannot enter anymore")
end

number = num2str(numb);
outputstr = strcat(str,number);
end