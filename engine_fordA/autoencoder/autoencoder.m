X = FordATRAIN1(1847:3601,2:501)';
Xab = FordATRAIN1(1:1755,2:501)';
Y = FordATEST(682:1320,2:501)';
autoenc = trainAutoencoder(X,800,'MaxEpochs',3000,'DecoderTransferFunction','purelin');
Xreconstructed = predict(autoenc,Xab);
mseError = mse(X-Xreconstructed)
XTrain = digitTrainCellArrayData;
train(1,1)=FordATRAIN1(1,2:501)



hiddenSize = 300;
autoenc = trainAutoencoder(grayimage_normal,hiddenSize,...
        'EncoderTransferFunction','satlin',...
        'DecoderTransferFunction','purelin',...
        'L2WeightRegularization',0.01,...
        'SparsityRegularization',4,...
        'SparsityProportion',0.10, ...
        'MaxEpochs',3000);
xReconstructed = predict(autoenc,test_grayimage_normal);
xReconstructed2 = predict(autoenc,test_grayimage_abnormal);
xReconstructed3 = predict(autoenc,grayimage_normal);
xReconstructed4 = predict(autoenc,grayimage_abnormal);

% for i=1:1846
% err(i) = immse(xReconstructed4{i},grayimage_abnormal{i});
% end
% mean(err)
% mseError = mse(grayimage_normal-xReconstructed);
C = cellfun(@immse, test_grayimage_normal, xReconstructed, 'UniformOutput' , false);
C2 = cellfun(@immse, test_grayimage_abnormal, xReconstructed2, 'UniformOutput' , false);
C3 = cellfun(@immse, grayimage_normal, xReconstructed3, 'UniformOutput' , false);
C4 = cellfun(@immse, grayimage_abnormal, xReconstructed4, 'UniformOutput' , false);
d=mean(cell2mat(C))
d2=mean(cell2mat(C2))
d3=mean(cell2mat(C3))
d4=mean(cell2mat(C4))



figure;
plot(X,'r.');
hold on
plot(xReconstructed,'go');

mseError = mse(X-xReconstructed)

%% dataset
abnormal_train = FordBTRAIN_double(1:1860,2:501);
normal_train = FordBTRAIN_double(1861:3636,2:501);
abnormal_test = FordBTEST_double(1:401,2:501);
normal_test = FordBTEST_double(402:810,2:501);
%% example
X = normal_train;
autoenc = trainAutoencoder(X);


autoenc = trainAutoencoder(X,800,'MaxEpochs',500,'DecoderTransferFunction','purelin');
XReconstructed = predict(autoenc,X);
mseError = mse(X-XReconstructed) %0.0019

% test
X = abnormal_train;
XReconstructed = predict(autoenc,X);
mseError = mse(X-XReconstructed) %0.0289

X = normal_test;
XReconstructed = predict(autoenc,X);
mseError = mse(X-XReconstructed) %0.0086

error = [0.0019,0.0289,0.0086];
bar(error)
ylim([0 1])

%
X=normal_train;
Y=abnormal_train;
Z=normal_test;
for i = 1:4
    hidden = [200,400,600,1000];
autoenc = trainAutoencoder(X,hidden(1,i),'MaxEpochs',500,'DecoderTransferFunction','purelin');
XReconstructed = predict(autoenc,X);
mseError(i,1) = mse(X-XReconstructed);
XReconstructed2 = predict(autoenc,Y);
mseError(i,2) = mse(Y-XReconstructed2);
XReconstructed3 = predict(autoenc,Z);
mseError(i,3) = mse(Z-XReconstructed3);
end

for i = 1:4
    hidden = [200,400,600,1000];
autoenc = trainAutoencoder(X,hidden(1,i),'MaxEpochs',500,'DecoderTransferFunction','purelin');
XReconstructed = predict(autoenc,X);
mseError(i,1) = mse(X-XReconstructed);
XReconstructed2 = predict(autoenc,Y);
mseError(i,2) = mse(Y-XReconstructed2);
XReconstructed3 = predict(autoenc,Z);
mseError(i,3) = mse(Z-XReconstructed3);
end

X1 = normal_train(:,1:500);
X1(:,501:1576) = normal_train(:,701:1776);
X2 = normal_train(:,501:700);
Y=abnormal_train;
Z=normal_test;
XYZ = abnormal_test;

for i = 1:1
    hidden = [400,200,400,600,1000];
autoenc = trainAutoencoder(X1,hidden(1,i),'MaxEpochs',500,'DecoderTransferFunction','purelin');
XReconstructed = predict(autoenc,X1);
mseError2(i,1) = mse(X1-XReconstructed);
XReconstructed1 = predict(autoenc,X2);
mseError2(i,2) = mse(X2-XReconstructed1);
XReconstructed2 = predict(autoenc,Y);
mseError2(i,3) = mse(Y-XReconstructed2);
XReconstructed3 = predict(autoenc,Z);
mseError2(i,4) = mse(Z-XReconstructed3);
XReconstructed4 = predict(autoenc,XYZ);
mseError2(i,5) = mse(XYZ-XReconstructed4);

pause(0.5)

end
bar(mseError2)

X1 = abnormal_train(:,1:1500);
X2 = abnormal_train(:,1501:1860);
Y=normal_train;
Z=abnormal_test;

for i = 1:1
    hidden = [200,200,400,600,1000];
autoenc = trainAutoencoder(X1,hidden(1,i),'MaxEpochs',500,'DecoderTransferFunction','purelin','SparsityProportion',0.05,'SparsityRegularization',0.5);
XReconstructed = predict(autoenc,X1);
mseError2(i,1) = mse(X1-XReconstructed);
XReconstructed1 = predict(autoenc,X2);
mseError2(i,2) = mse(X2-XReconstructed1);
XReconstructed2 = predict(autoenc,Y);
mseError2(i,3) = mse(Y-XReconstructed2);
XReconstructed3 = predict(autoenc,Z);
mseError2(i,4) = mse(Z-XReconstructed3);
pause(0.5)

end
bar(mseError2)