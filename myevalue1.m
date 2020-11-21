 
n=1;
x=0;
val = 1/exp(1);
while val-x>0.0001
    x= (1-(1/n))^n;
    n=n+1;
end

disp(x); % default is to 4 decimal places for both values - format short(default) not necessary
disp(1/exp(1)); % for in built e not e
disp(n-1); % adds 1 to n at the end of the loop so the previous number is the correct one