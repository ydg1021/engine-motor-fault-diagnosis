XTrain = table2array(FordATRAINcategory(:,2:501));

YTrain = FordATRAINcategory.abnormaly;

XTest = table2array(FordATESTcategory(:,2:501));

YTest = FordATESTcategory.abnormaly;

[coeff,scoreTrain,~,~,explained,mu] = pca(XTrain);

explained;


sum_explained = 0;
idx = 0;
while sum_explained < 95
    idx = idx + 1;
    sum_explained = sum_explained + explained(idx);
end
idx

scoreTrain95 = scoreTrain(:,1:66);


[coeff,scoreTrain,~,~,explained,mu] = pca(XTest);

explained;


sum_explained = 0;
idx = 0;
while sum_explained < 95
    idx = idx + 1;
    sum_explained = sum_explained + explained(idx);
end
idx

scoreTest95 = scoreTrain(:,1:66);
