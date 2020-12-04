
%Read in the files using filereader and changing the words from char
%strings to normal strings so they can easily be compared. Changed all
%documents to lowercase in order to compare each word.
text  = fileread('RedRidingHood.txt');
doc1 = lower(string(strsplit(text)));

text1  = fileread('Cinderella.txt');
doc2 = lower(string(strsplit(text1)));

text2  = fileread('PrincessPea.txt');
doc3 = lower(string(strsplit(text2)));

text3  = fileread('CAFA1.txt');
doc4 = lower(string(strsplit(text3)));

text4  = fileread('CAFA2.txt');
doc5 = lower(string(strsplit(text4)));

text5  = fileread('CAFA3.txt');
doc6 = lower(string(strsplit(text5)));

corpus = 6;

combine1 = union(doc1,doc2);
combine2 = union(combine1,doc3);
combine3 = union(combine2,doc4);
combine4 = union(combine3,doc5);
combine5 = union(combine4,doc6);

%generates empty string = "" (not sure why)
%not necessary
combine5(1) = [];

%created matrix to store all the words at the same element for each
%document for tf values (1:6) then calculate idf in (8)
%For or while loop is the only way I found to iterate these values. e.g.
%sum(combine5(1:length(combine5))==doc1) gives error.
mdoc = zeros(7);
for i = 1:length(combine5)
    mdoc(i,1) = sum(combine5(i) == doc1);
end
for i = 1:length(combine5)
    mdoc(i,2) = sum(combine5(i) == doc2);
end
for i = 1:length(combine5)
    mdoc(i,3) = sum(combine5(i) == doc3);
end
for i = 1:length(combine5)
    mdoc(i,4) = sum(combine5(i) == doc4);
end
for i = 1:length(combine5)
    mdoc(i,5) = sum(combine5(i) == doc5);
end
for i = 1:length(combine5)
    mdoc(i,6) = sum(combine5(i) == doc6);
end

%Calculated the documents with a term appearing in each one and stored it
%in the matrix column (7)
docTerm = mdoc((1:length(mdoc)),(1:6))>0;
mdoc(:,7) = sum(docTerm,2);
mdoc(:,8) = log10(6./mdoc(:,7));

%Calculated the tf-idf vector values in the (9:14) colunmns of the matrix
% part a)
mdoc(:,9) = mdoc(:,8) .* mdoc(:,1); %Red Riding Hood
mdoc(:,10) = mdoc(:,8) .* mdoc(:,2); %Cinderella
mdoc(:,11) = mdoc(:,8) .* mdoc(:,3); %Princess and the pea
mdoc(:,12) = mdoc(:,8) .* mdoc(:,4); %CAFA1
mdoc(:,13) = mdoc(:,8) .* mdoc(:,5); %CAFA2
mdoc(:,14) = mdoc(:,8) .* mdoc(:,6); %CAFA3

%Stored the cosine distance between every pair of tf-idf vectors in matrix 
%cosM
% part b) and c)

%Used subspace to get the angle between each pair of vectors then I used 
%the cosine function and subtracted from 1

%Initialising the matrix
cosM = zeros(6);

%Red Riding Hood to each document
cosM(1,1) = 1 - cos(0); 
cosM(1,2) = 1 - cos(subspace(mdoc(:,9),mdoc(:,10)));
cosM(1,3) = 1 - cos(subspace(mdoc(:,9),mdoc(:,11))); 
cosM(1,4) = 1 - cos(subspace(mdoc(:,9),mdoc(:,12))); 
cosM(1,5) = 1 - cos(subspace(mdoc(:,9),mdoc(:,13))); 
cosM(1,6) = 1 - cos(subspace(mdoc(:,9),mdoc(:,14))); 

%Cinderella to each document
cosM(2,1) = 1 - cos(subspace(mdoc(:,10),mdoc(:,9)));
cosM(2,2) = 1 - cos(0); 
cosM(2,3) = 1 - cos(subspace(mdoc(:,10),mdoc(:,11))); 
cosM(2,4) = 1 - cos(subspace(mdoc(:,10),mdoc(:,12))); 
cosM(2,5) = 1 - cos(subspace(mdoc(:,10),mdoc(:,13))); 
cosM(2,6) = 1 - cos(subspace(mdoc(:,10),mdoc(:,14))); 

%Princess and the pea to each document
cosM(3,1) = 1 - cos(subspace(mdoc(:,11),mdoc(:,9)));
cosM(3,2) = 1 - cos(subspace(mdoc(:,11),mdoc(:,10)));
cosM(3,3) = 1 - cos(0);  
cosM(3,4) = 1 - cos(subspace(mdoc(:,11),mdoc(:,12))); 
cosM(3,5) = 1 - cos(subspace(mdoc(:,11),mdoc(:,13))); 
cosM(3,6) = 1 - cos(subspace(mdoc(:,11),mdoc(:,14))); 

%CAFA1 to each document
cosM(4,1) = 1 - cos(subspace(mdoc(:,12),mdoc(:,9)));
cosM(4,2) = 1 - cos(subspace(mdoc(:,12),mdoc(:,10)));
cosM(4,3) = 1 - cos(subspace(mdoc(:,12),mdoc(:,11)));   
cosM(4,4) = 1 - cos(0); 
cosM(4,5) = 1 - cos(subspace(mdoc(:,12),mdoc(:,13))); 
cosM(4,6) = 1 - cos(subspace(mdoc(:,12),mdoc(:,14)));

%CAFA2 to each document
cosM(5,1) = 1 - cos(subspace(mdoc(:,13),mdoc(:,9)));
cosM(5,2) = 1 - cos(subspace(mdoc(:,13),mdoc(:,10)));
cosM(5,3) = 1 - cos(subspace(mdoc(:,13),mdoc(:,11))); 
cosM(5,4) = 1 - cos(subspace(mdoc(:,13),mdoc(:,12))); 
cosM(5,5) = 1 - cos(0); 
cosM(5,6) = 1 - cos(subspace(mdoc(:,13),mdoc(:,14)));

%CAFA3 to each document
cosM(6,1) = 1 - cos(subspace(mdoc(:,14),mdoc(:,9)));
cosM(6,2) = 1 - cos(subspace(mdoc(:,14),mdoc(:,10)));
cosM(6,3) = 1 - cos(subspace(mdoc(:,14),mdoc(:,11)));  
cosM(6,4) = 1 - cos(subspace(mdoc(:,14),mdoc(:,12))); 
cosM(6,5) = 1 - cos(subspace(mdoc(:,14),mdoc(:,13))); 
cosM(6,6) = 1 - cos(0);

%Creates the figure from the matrix
imagesc(cosM);
colormap("gray");
colorbar;
title('Cosine Distance');
xticklabels({'RRH','PPea','Cind','CAFA1','CAFA2','CAFA3'});
yticklabels({'RRH','PPea','Cind','CAFA1','CAFA2','CAFA3'});
