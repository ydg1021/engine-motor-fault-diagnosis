%% train

digitDatasetPath = fullfile('E:\바탕화면_연구실컴퓨터\FordA\new_imageset\train\gray');
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');

labelCount3 = countEachLabel(imds);

img = readimage(imds,1);
size(img)

numTrainFiles = 0.80;
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');


layers = [
    imageInputLayer([20 25 1],'Normalization','none')
    
    convolution2dLayer(3,4,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    averagePooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,8,'Padding','same')
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
        
    globalMaxPooling2dLayer('Name','gmp1')
    fullyConnectedLayer(32,'Name','fc2')
    dropoutLayer(0.2)
    fullyConnectedLayer(16,'Name','fc3')
    dropoutLayer(0.2)
    fullyConnectedLayer(2,'Name','fc3')
    softmaxLayer('Name','softmax')
    classificationLayer('Name','classoutput')];




options = trainingOptions('adam', ...
    'InitialLearnRate',0.001, ...
    'MaxEpochs',100, ...
    'ValidationFrequency',20, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation, ...
    'Verbose',0, ...
    'Plots','training-progress');
%     'LearnRateSchedule' , 'piecewise', ...
%     'LearnRateDropPeriod', 20,...
%     'LearnRateDropFactor',0.5,...
%     'Shuffle','every-epoch', ...
%     'ValidationPatience' ,50,  ...
net = trainNetwork(imdsTrain,layers,options);
%%
digitDatasetPath = fullfile('C:\Users\Yuk\Desktop\matlab\stftdataset\perWatt\validation');
imdsTest = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');

YPred = classify(net,imdsTest,'MiniBatchSize',16);
YTest = imdsTest.Labels;


accuracy = sum(YPred == YTest)/numel(YTest)
class={'W1-Normal','W1-E1','W1-E2','W1-E3', 'W1-E4', 'W2-Normal','W2-E1','W2-E2','W2-E3','W3-Normal','W3-E1','W4-Normal','W4-E1','W4-E2','W4-E3','W4-E4','W5-Normal','W5-E1','W5-E3','W5-E4','W6-Normal','W6-E1','W6-E2','W6-E3','W6-E4','W7-Normal', ...
 'W7-E2','W7-E3','W7-E4','W8-Normal','W8-E3','W8-E4','W9-Normal','W9-E1','W9-E2','W9-E4','W10-Normal','W10-E1','W11-Normal','W11-E1','W12-Normal','W12-E2','W12-E4'    }';

class={'Normal','E1','E2','E3','E4'}';
figure
cm = confusionchart(YTest,YPred);
value = cm.NormalizedValues;
percent = value/3450*100;
heatmap(class,class,percent,'CellLabelColor','none')

plotconfusion(YTest,YPred);