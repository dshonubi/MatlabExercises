function cfmatrix = mytemperature(minFh,maxFh)

if minFh>maxFh
    cfmatrix = transpose((maxFh:minFh)); 
else
    cfmatrix = transpose((minFh:maxFh));   
end

cfmatrix(:,2) = (cfmatrix(:,1) - 32) * 5/9;
temp(cfmatrix); % The contents of this function is displayed to the command window first

end

function subcfmatrix = temp(matr)
subcfmatrix = matr;
disp(subcfmatrix);
end