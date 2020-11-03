%% ================== Exercise 1 ==================
load 'salesfigs.dat'
y=salesfigs;
x = y(2,:);
y = y(1,:);

plot(y,'ko');
hold ON
plot(x,'k*');

xlabel('Quarter');
ylabel('Sales(billions)');
title('ABC Corporation Sales: 2013');
legend('Divison A','Division B')

% % %% ================== Exercise 5 ==================
figure
xy = randi([20 35],1000,2);
plot(xy(:,1),xy(:,2),'r*');
hold ON
grid ON
axis([-10 40 -5 40])
xticks(-10:10:40);
xy1= randn(1000,2);
x1 = 3 + 1.*xy1(:,1);
y1 = 5 + 1.*xy1(:,2);
plot(x1,y1,'b*');

%% ================== Exercise 6 ==================
figure
xyz = randn(10000,3);
w = xyz>0;
greaterz = (w(:,1) == 1) & (w(:,2) == 1) & (w(:,3) == 1);
xyz = xyz(greaterz,:);
xyz = normr(xyz);
plot3(xyz(:,1),xyz(:,2),xyz(:,3),'r*'); 
grid ON

%normr is from the deep learning toolbox needs to be downloaded or
%pre-installed to work