function arry = waferstore(partno,quantity,costper)

[sizep1,sizep2] = size(partno);
[sizeq3,sizeq4] = size(quantity);
[sizec5,sizec6] = size(costper);

if (sizep1>1 && sizep2>1) || (sizeq3>1 && sizeq4>1) || (sizec5>1 && sizec6>1)
    error("The input values must be vectors");
end

if (sizep1~=sizeq3) || (sizeq3~=sizec5) || (sizec5 ~= sizep1)
    error("The vectors must be the same sizes e.g. all 1x3 or all 3x1");
end

if (sizep2~=sizeq4 || sizeq4~=sizec6 || sizec6 ~= sizep2)
    error("The vectors must be the same sizes e.g. all 1x3 or all 3x1");
end

if sizep1>1 %means all the inputs are this way so only need to check 1 
    partno = transpose(partno);%tranposed to give output asked for in question
    quantity = transpose(quantity);
    costper = transpose(costper);
end
p = num2cell(partno);
q = num2cell(quantity);
c = num2cell(costper);

arry = struct('partno',p,'quantity',q,'costper',c);
arrayp = cell2mat(p);
arrayq = cell2mat(q);
arrayc = cell2mat(c);

sumqc = arrayq.*arrayc; 
sumqc = transpose(sumqc);
arrayp = transpose(arrayp);
sumqc = [arrayp sumqc];

disp(sumqc);

end