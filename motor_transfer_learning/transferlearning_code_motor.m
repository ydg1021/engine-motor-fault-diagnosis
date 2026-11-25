%% alexnet_stft
net = shufflenet; %2

digitDatasetPath = fullfile('D:\dataset\data\Case1');
imds_pca = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');
labelCount = countEachLabel(imds_pca);
img = readimage(imds_pca,1);
size(img)
numTrainFiles = 0.80;
[imdsTrain,imdsValidation] = splitEachLabel(imds_pca,numTrainFiles,'randomized');

inputSize = net.Layers(1).InputSize
layersTransfer = net.Layers(1:end-3);
lgraph = layerGraph(net); 
numClasses = numel(categories(imdsTrain.Labels))
newLearnableLayer = fullyConnectedLayer(numClasses, ...
    'Name','new_fc', ...
    'WeightLearnRateFactor',10, ...
    'BiasLearnRateFactor',10);   
lgraph = replaceLayer(lgraph,'fc8',newLearnableLayer);
newClassLayer = classificationLayer('Name','new_classoutput');
lgraph = replaceLayer(lgraph,'output',newClassLayer);
pixelRange = [-30 30];
imageAugmenter = imageDataAugmenter( ...
    'RandXReflection',true, ...
    'RandXTranslation',pixelRange, ...
    'RandYTranslation',pixelRange);
augimdsTrain = augmentedImageDatastore(inputSize(1:2),imdsTrain);
augimdsValidation = augmentedImageDatastore(inputSize(1:2),imdsValidation);
options = trainingOptions('sgdm', ...
    'MiniBatchSize',128, ...
    'MaxEpochs',30, ...
    'InitialLearnRate',1e-4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',augimdsValidation, ...
    'ValidationFrequency',1, ...
    'Verbose',false, ...
    'Plots','training-progress', ...
    'OutputFcn',@(info)stopIfAccuracyNotImproving(info));
netTransfer = trainNetwork(augimdsTrain,lgraph,options);
%% testing

digitDatasetPath = fullfile('D:\dataset\data\Test');
imdsTest = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');


augimdsTest = augmentedImageDatastore(inputSize(1:2),imdsTest);


YPred = classify(netTransfer,augimdsTest,'MiniBatchSize',128);
YTest = imdsTest.Labels;

accuracy = sum(YPred == YTest)/numel(YTest)
% 
% 
% plotconfusion(YTest,YPred);
cd('D:\기계시설물고장예지센서\data\datafolder')
save ('alexnet_stft','accuracy','netTransfer') 

%% alexnet_stft_perWatt
net = alexnet; %2

digitDatasetPath = fullfile('D:\기계시설물고장예지센서\data\datafolder\stft data set\perWatt\training');
imds_pca = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');
labelCount = countEachLabel(imds_pca);
img = readimage(imds_pca,1);
size(img)
numTrainFiles = 0.80;
[imdsTrain,imdsValidation] = splitEachLabel(imds_pca,numTrainFiles,'randomized');

inputSize = net.Layers(1).InputSize
layersTransfer = net.Layers(1:end-3);
lgraph = layerGraph(net); 
numClasses = numel(categories(imdsTrain.Labels))
newLearnableLayer = fullyConnectedLayer(numClasses, ...
    'Name','new_fc', ...
    'WeightLearnRateFactor',10, ...
    'BiasLearnRateFactor',10);   
lgraph = replaceLayer(lgraph,'fc8',newLearnableLayer);
newClassLayer = classificationLayer('Name','new_classoutput');
lgraph = replaceLayer(lgraph,'output',newClassLayer);
pixelRange = [-30 30];
imageAugmenter = imageDataAugmenter( ...
    'RandXReflection',true, ...
    'RandXTranslation',pixelRange, ...
    'RandYTranslation',pixelRange);
augimdsTrain = augmentedImageDatastore(inputSize(1:2),imdsTrain);
augimdsValidation = augmentedImageDatastore(inputSize(1:2),imdsValidation);
options = trainingOptions('sgdm', ...
    'MiniBatchSize',128, ...
    'MaxEpochs',15, ...
    'InitialLearnRate',1e-4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',augimdsValidation, ...
    'ValidationFrequency',3, ...
    'Verbose',false, ...
    'Plots','training-progress');
netTransfer = trainNetwork(augimdsTrain,lgraph,options);

%% testing

digitDatasetPath = fullfile('D:\기계시설물고장예지센서\data\datafolder\stft data set\perWatt\validation');
imdsTest = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');


augimdsTest = augmentedImageDatastore(inputSize(1:2),imdsTest);


YPred = classify(netTransfer,augimdsTest,'MiniBatchSize',128);
YTest = imdsTest.Labels;

accuracy = sum(YPred == YTest)/numel(YTest)
% 
% 
% plotconfusion(YTest,YPred);
cd('D:\기계시설물고장예지센서\data\datafolder')
save ('alexnet_stft_perWatt','accuracy','netTransfer') 
%% shufflenet_stft
net = shufflenet; % 1
digitDatasetPath = fullfile('D:\기계시설물고장예지센서\data\datafolder\stft data set\training');
imds_pca = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');
labelCount = countEachLabel(imds_pca);
img = readimage(imds_pca,1);
size(img)
numTrainFiles = 0.80;
[imdsTrain,imdsValidation] = splitEachLabel(imds_pca,numTrainFiles,'randomized');
inputSize = net.Layers(1).InputSize
layersTransfer = net.Layers(1:end-3);
lgraph = layerGraph(net); 
numClasses = numel(categories(imdsTrain.Labels))
newLearnableLayer = fullyConnectedLayer(numClasses, ...
    'Name','new_fc', ...
    'WeightLearnRateFactor',10, ...
    'BiasLearnRateFactor',10);
    
lgraph = replaceLayer(lgraph,'node_202',newLearnableLayer);
newClassLayer = classificationLayer('Name','new_classoutput');
lgraph = replaceLayer(lgraph,'ClassificationLayer_node_203',newClassLayer);
pixelRange = [-30 30];
imageAugmenter = imageDataAugmenter( ...
    'RandXReflection',true, ...
    'RandXTranslation',pixelRange, ...
    'RandYTranslation',pixelRange);
augimdsTrain = augmentedImageDatastore(inputSize(1:2),imdsTrain);
augimdsValidation = augmentedImageDatastore(inputSize(1:2),imdsValidation);
options = trainingOptions('sgdm', ...
    'MiniBatchSize',128, ...
    'MaxEpochs',15, ...
    'InitialLearnRate',1e-4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',augimdsValidation, ...
    'ValidationFrequency',3, ...
    'Verbose',false, ...
    'Plots','training-progress');
netTransfer = trainNetwork(augimdsTrain,lgraph,options);

digitDatasetPath = fullfile('D:\기계시설물고장예지센서\data\datafolder\stft data set\validation');
imdsTest = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');

augimdsTest = augmentedImageDatastore(inputSize(1:2),imdsTest);


YPred = classify(netTransfer,augimdsTest,'MiniBatchSize',128);
YTest = imdsTest.Labels;

accuracy = sum(YPred == YTest)/numel(YTest)
% 
% 
% plotconfusion(YTest,YPred);
cd('D:\기계시설물고장예지센서\data\datafolder')
save ('shufflenet_stft','accuracy','netTransfer') 

%% shufflenet_stft_perWatt
net = shufflenet; % 1
digitDatasetPath = fullfile('D:\기계시설물고장예지센서\data\datafolder\stft data set\perWatt\training');
imds_pca = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');
labelCount = countEachLabel(imds_pca);
img = readimage(imds_pca,1);
size(img)
numTrainFiles = 0.80;
[imdsTrain,imdsValidation] = splitEachLabel(imds_pca,numTrainFiles,'randomized');
inputSize = net.Layers(1).InputSize
layersTransfer = net.Layers(1:end-3);
lgraph = layerGraph(net); 
numClasses = numel(categories(imdsTrain.Labels))
newLearnableLayer = fullyConnectedLayer(numClasses, ...
    'Name','new_fc', ...
    'WeightLearnRateFactor',10, ...
    'BiasLearnRateFactor',10);
    
lgraph = replaceLayer(lgraph,'node_202',newLearnableLayer);
newClassLayer = classificationLayer('Name','new_classoutput');
lgraph = replaceLayer(lgraph,'ClassificationLayer_node_203',newClassLayer);
pixelRange = [-30 30];
imageAugmenter = imageDataAugmenter( ...
    'RandXReflection',true, ...
    'RandXTranslation',pixelRange, ...
    'RandYTranslation',pixelRange);
augimdsTrain = augmentedImageDatastore(inputSize(1:2),imdsTrain);
augimdsValidation = augmentedImageDatastore(inputSize(1:2),imdsValidation);
options = trainingOptions('sgdm', ...
    'MiniBatchSize',128, ...
    'MaxEpochs',15, ...
    'InitialLearnRate',1e-4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',augimdsValidation, ...
    'ValidationFrequency',3, ...
    'Verbose',false, ...
    'Plots','training-progress');
netTransfer = trainNetwork(augimdsTrain,lgraph,options);

digitDatasetPath = fullfile('D:\기계시설물고장예지센서\data\datafolder\stft data set\perWatt\validation');
imdsTest = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');

augimdsTest = augmentedImageDatastore(inputSize(1:2),imdsTest);


YPred = classify(netTransfer,augimdsTest,'MiniBatchSize',128);
YTest = imdsTest.Labels;

accuracy = sum(YPred == YTest)/numel(YTest)
% 
% 
% plotconfusion(YTest,YPred);
cd('D:\기계시설물고장예지센서\data\datafolder')
save ('shufflenet_stft_perWatt','accuracy','netTransfer') 





