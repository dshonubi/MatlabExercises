
function arry = buildrandomstrings(n)

alphabet = ('a':'z');
                                       
if n>0  
arry = {};

for i = 1:n

if isempty(arry)    
    letter = alphabet(randi([1,length(alphabet)]));
    arry{i} = letter; 
    
else    
    letter = alphabet(randi([1,length(alphabet)]));
    word = strcat(arry{i-1},letter);
    arry{i} = word;
end
end %returning as a cell array keeps the curly braces which is what is asked for
    %although the example does not seem to have it

else

n=n*-1;
word = alphabet(randi([1,length(alphabet)],1,n)); %make the negative input positive
arry={};

for i = 1:n

if isempty(arry)    
    
    arry{i} = word;
    
else  
    if i == 1
       break;
    end   
    word = arry{i-1}(1:(n-(i-1))); %matlab doesn't use index 0 so this is an alternative
    arry{i} = word;
end
end
end
end
