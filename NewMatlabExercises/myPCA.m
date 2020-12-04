function [eigVecSorted,eigValSorted] = myPCA(matInput)


%Creates a covariance matrix then applies the eig function to the matrix 
%to get the eigenvectors and eigenvalues
mc = cov(matInput);
[eigVec,eigVal] = eig(mc);

%Sorts the eigenvector and eigenvalues from largest to smallest
eigVal = diag(eigVal);
[~,g] = sort(eigVal,'descend');
x = transpose(g);
eigVecSorted = eigVec(:,x);
eigValSorted = eigVal(g,:);

end