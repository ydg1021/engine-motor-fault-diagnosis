net = squeezenet;
%% data setting


digitDatasetPath = fullfile('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\224\train');
imds_pca = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');

labelCount = countEachLabel(imds_pca);

img = readimage(imds_pca,1);
size(img)

numTrainFiles = 0.80;
[imdsTrain,imdsValidation] = splitEachLabel(imds_pca,numTrainFiles,'randomize');


%

digitDatasetPath = fullfile('C:\Users\USER\Desktop\FordA\RGB_dataset\size227\h500000\train');
imdsTest = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');



%% layer, option
layers = [
    imageInputLayer([224 224 3],'Normalization','none')
    
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    averagePooling2dLayer(2,'Stride',2)
    
        convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    averagePooling2dLayer(2,'Stride',2)

    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    dropoutLayer

    
    fullyConnectedLayer(3000,'Name','fc1')
    dropoutLayer
    fullyConnectedLayer(1500,'Name','fc2') 
    dropoutLayer
    fullyConnectedLayer(300,'Name','fc3')
    dropoutLayer
    fullyConnectedLayer(50,'Name','fc4')
    dropoutLayer
    fullyConnectedLayer(2,'Name','fc5')
    softmaxLayer('Name','softmax')
    classificationLayer('Name','classoutput')];



options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.0001, ...
    'MaxEpochs',200, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',15, ...
    'Verbose',false, ...
    'Plots','training-progress');

net = trainNetwork(imdsTrain,layers,options);

%%

net = alexnet;
%227 train ford A
digitDatasetPath = fullfile('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\denoised_test2\rgb\4to4\224');
imdsTest = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');
%224 train ford A
digitDatasetPath = fullfile('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\224\test2');
imdsTest = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');


YPred = classify(net,imdsTest,'MiniBatchSize',128);
YTest = imdsTest.Labels;

accuracy = sum(YPred == YTest)/numel(YTest)


plotconfusion(YTest,YPred);
