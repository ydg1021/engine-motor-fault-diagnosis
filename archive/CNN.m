%% train

digitDatasetPath = fullfile('C:\Users\USER\Desktop\FordA\nBG_Norm_dataset\train');
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');

labelCount = countEachLabel(imds);

img = readimage(imds,1);
size(img)

numTrainFiles = 0.80;
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');


layers = [
    imageInputLayer([28 28 1], 'Normalization','none')
        
    
    convolution2dLayer(3,64,'Padding','same','Name','conv_1')
    batchNormalizationLayer('Name','BN_1')
    reluLayer('Name','relu_1')
    
%     maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer( 3,64,'Padding','same','Name','conv_2')
    batchNormalizationLayer('Name','BN_2')
    reluLayer('Name','relu_2')
    
%     maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer( 3,64,'Padding','same','Name','conv_3')
    batchNormalizationLayer('Name','BN_3')
    reluLayer('Name','relu_3')
    
    globalAveragePooling2dLayer
    fullyConnectedLayer(100)
    fullyConnectedLayer(50)
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer];

options = trainingOptions('adam', ...
    'InitialLearnRate',0.0001, ...
    'MaxEpochs',300, ...
    'ValidationFrequency',20, ...
    'Shuffle','every-epoch', ...
    'ValidationPatience' ,50,  ...
    'ValidationData',imdsValidation, ...
    'LearnRateSchedule' , 'piecewise', ...
    'LearnRateDropPeriod', 20,...
    'LearnRateDropFactor',0.5,...
    'MiniBatchSize',256, ...
    'Verbose',1, ...
    'Plots','training-progress');
%     'LearnRateSchedule' , 'piecewise', ...
%     'LearnRateDropPeriod', 20,...
%     'LearnRateDropFactor',0.5,...
%     'Shuffle','every-epoch', ...
%     'ValidationPatience' ,50,  ...
net = trainNetwork(imdsTrain,layers,options);
%%
digitDatasetPath = fullfile('C:\Users\USER\Desktop\FordA\nBG_Norm_dataset back up\test');
imdsTest = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');

YPred = classify(net,imdsTest,'MiniBatchSize',64);
YTest = imdsTest.Labels;

accuracy = sum(YPred == YTest)/numel(YTest)


plotconfusion(YTest,YPred);