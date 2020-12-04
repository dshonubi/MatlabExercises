%%%%%%%%%%%%%%%%%%%%%%%%%%% PART 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%loaded the pcadata file and created the plot
load 'pcadata.mat';
h = scatter(X(:,1),X(:,2));
h.MarkerEdgeColor = 'b';
h.Marker = 'o';
axis([0 7 2 8]);

%Implemented the subtractMean function and myPCA function
%which subtracts the mean and gets the eigenvectors and eigenvalues
[Xmu, mu] = subtractMean(X);
[U,S] = myPCA(Xmu);

%Allows for the line to be plotted on the same figure above
hold on;

%Mean was subtracted so must be added before plot is made, so this is done
%below, also displaying the coordinates of PC1 in the command window
%whilst putting the PC1 line and PC2 line on to the figure
disp(U(1,1) + mu(1));
disp(U(2,1) + mu(2));
line([U(1,1) + mu(1);mu(1)],[U(2,1)+ mu(2);mu(2)],'Color','red');
line([U(1,2) + mu(1);mu(1)],[U(2,2)+ mu(2);mu(2)],'Color','green');
title('Datapoints and their 2 principal components');
hold off;

%Implementing the projectData function and displaying the first 3 points on
%the command line
K=1;
Z = projectData(Xmu,U,K);
disp(Z(1:3, :));

%Recvering the data using the recoverData function and plotting the dataset
%again, then plotting the recovered data on top of it
Xrec = recoverData(Z,U,K,mu);
figure;
h2 = scatter(X(:,1),X(:,2));
h2.MarkerEdgeColor = 'b';
h2.Marker = 'o';
axis([0 7 2 8]);

hold on;
h3 = scatter(Xrec(:,1),Xrec(:,2));
h3.MarkerFaceColor = 'red';
h3.Marker = '*';
title('Datapoints and their reconstruction');
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%% PART 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%loaded the pcafaces file and created the figure
load 'pcafaces.mat';
figure;
displayData(X(1:100, :));

%Subtracting the mean from the dataset
[Xmu, mu] = subtractMean(X);

%Getting the principal components(eigenvectors)
[U,S] = myPCA(Xmu);

%Projecting the data onto the first 200 principal components
K=200;
Z = projectData(Xmu,U,K);

%Recovering the data
Xrec = recoverData(Z,U,K,mu);

%Producing the side by side plots in the figure
figure;
tiledlayout(1,2);
nexttile;
displayData(X(1:100, :));
title('Original Faces');

nexttile;
displayData(Xrec(1:100, :));
title('Recovered Faces');