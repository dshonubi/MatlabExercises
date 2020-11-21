
n=0;
x=0;
m = [];
while exp(1)-x>0.0001
    x=0;
    m = [m n]; %do not preallocate as I don't know how many n values are needed
    x=x+sum(1./factorial(m));
    n=n+1;
end

disp(x); % default is to 4 decimal places for both values - format short(default) not necessary
disp(exp(1));
disp(m(end)); % starting from 0 : 8 numbers 7 being the last number - n