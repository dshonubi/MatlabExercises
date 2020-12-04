
function zMat = projectData(inputMat,eigenVec,k)

%Multiplies K eigenvectors by the dataset
zMat = inputMat * eigenVec(:,1:k);

end