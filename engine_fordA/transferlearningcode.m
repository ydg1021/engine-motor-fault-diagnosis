net = alexnet;
net = resnet18;
net = googlenet;
net = squeezenet;
net = shufflenet;


digitDatasetPath = fullfile('C:\Users\USER\Desktop\FordB\RGB\h500000\size224\train');
imds_pca = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');

labelCount = countEachLabel(imds_pca);

img = readimage(imds_pca,1);
size(img)

numTrainFiles = 0.80;
[imdsTrain,imdsValidation] = splitEachLabel(imds_pca,numTrainFiles,'randomize');




inputSize = net.Layers(1).InputSize
layersTransfer = net.Layers(1:end-3);
numClasses = numel(categories(imdsTrain.Labels))
layers = [
    layersTransfer
    fullyConnectedLayer(numClasses,'WeightLearnRateFactor',20,'BiasLearnRateFactor',20)
    softmaxLayer
    classificationLayer];

pixelRange = [-30 30];
imageAugmenter = imageDataAugmenter( ...
    'RandXReflection',true, ...
    'RandXTranslation',pixelRange, ...
    'RandYTranslation',pixelRange);
augimdsTrain = augmentedImageDatastore(inputSize(1:2),imdsTrain, ...
    'DataAugmentation',imageAugmenter);

%augimdsTrain = augmentedImageDatastore(inputSize(1:2),imdsTrain);
augimdsValidation = augmentedImageDatastore(inputSize(1:2),imdsValidation);
options = trainingOptions('sgdm', ...
    'MiniBatchSize',10, ...
    'MaxEpochs',8, ...
    'InitialLearnRate',1e-4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',augimdsValidation, ...
    'ValidationFrequency',3, ...
    'Verbose',false, ...
    'Plots','training-progress');
netTransfer = trainNetwork(augimdsTrain,layers,options);

digitDatasetPath = fullfile('C:\Users\USER\Desktop\FordB\RGB\h500000\size224\test');
imdsTest = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');


% augimdsTest = augmentedImageDatastore(inputSize(1:2),imdsTest);
%% testing

YPred = classify(trainedNetwork_9,imdsTest,'MiniBatchSize',128);
YTest = imdsTest.Labels;

accuracy = sum(YPred == YTest)/numel(YTest)


plotconfusion(YTest,YPred);

