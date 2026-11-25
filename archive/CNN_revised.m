%% train

digitDatasetPath = fullfile('D:\바탕화면_연구실컴퓨터\PHMAP2021 연구자료\CNN\rgb\224\train');
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');

labelCount = countEachLabel(imds);

img = readimage(imds,1);
size(img)
% A=zeros(200,1053,3);
% A(1:3601,1:500,1) = cnn_train;



numTrainFiles = 0.80;
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');


layers = [
    imageInputLayer([24 24 1])
    
    convolution2dLayer(5,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
%     maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(5,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
%     maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(5,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    globalAveragePooling2dLayer
    
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer];

options = trainingOptions('adam', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',10, ...
    'ValidationPatience' ,50,  ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',20, ...
    'LearnRateSchedule' , 'piecewise', ...
    'LearnRateDropPeriod', 20,...
    'MiniBatchSize',16, ...
    'Verbose',1, ...
    'ExecutionEnvironment','parallel', ...
    'Plots','training-progress');

net = trainNetwork(imdsTrain,layers,options);

YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;

accuracy = sum(YPred == YValidation)/numel(YValidation)

plotconfusion(YValidation,YPred);