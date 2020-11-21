
function m = mysin(arg1,arg2)

choice1 = menu('Choose a color for the points.','red','blue','green');
choice2 = menu('Choose a style for the points.','star','circle');

points2pi = arg1-1; %0 is the starting point leaving the remainder
                   %to get to 2Pi ==6.2832
xval = (1:points2pi);
xval = (xval./points2pi).*(pi*2);
yval = sin(xval);
xval = [0 xval];
yval = [0 yval];

tiledlayout(2,1);

nexttile
colour = ['r','b','g'];
style = ["-*","-o"];
plot(xval,yval,strcat(colour(choice1),style(choice2)));
title1= num2str(arg1);
title(strcat(title1,' points'));
yticks(-1:0.5:1);
grid on;

points2pi2 = arg2-1; %0 is the starting point leaving the remainder
                   %to get to 2Pi ==6.2832
xval2 = (1:points2pi2);
xval2 = (xval2./points2pi2).*(pi*2);
yval2 = sin(xval2);
xval2 = [0 xval2];
yval2 = [0 yval2];

nexttile
plot(xval2,yval2,strcat(colour(choice1),style(choice2)));
title2= num2str(arg2);
title(strcat(title2,' points'));
yticks(-1:0.5:1);

grid on;
m="";%no output necessary but given an error when no output is returned
end