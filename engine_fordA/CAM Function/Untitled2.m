im = img;

h=img;
netName = "squeezenet";
net = eval(netName);

inputSize = net.Layers(1).InputSize(1:2);
classes = net.Layers(end).Classes;
layerName = activationLayerName(netName);
h = figure('Units','normalized','Position',[0.05 0.05 0.9 0.8],'Visible','on');

while ishandle(h)
cd('C:\Users\USER\Desktop\FordA\withoutbackground_test\abnormal');
i=1
    jpgFiles = dir('file_*.jpg');
    numfiles = length(jpgFiles);
    mydata = cell(1,numfiles);
    j=1
        mydata{j} = imread(jpgFiles(j).name);
        
        im = mydata{j};
        
    imResized = imresize(im,[inputSize(1), NaN]);
    imageActivations = activations(net,imResized,layerName);
    scores = squeeze(mean(imageActivations,[1 2]));
    
    if netName ~= "squeezenet"
        fcWeights = net.Layers(end-2).Weights;
        fcBias = net.Layers(end-2).Bias;
        scores =  fcWeights*scores + fcBias;
        
        [~,classIds] = maxk(scores,3);
        
        weightVector = shiftdim(fcWeights(classIds(1),:),-1);
        classActivationMap = sum(imageActivations.*weightVector,3);
    else
        [~,classIds] = maxk(scores,3);
        classActivationMap = imageActivations(:,:,classIds(1));
    end
      scores = exp(scores)/sum(exp(scores));     
    maxScores = scores(classIds);
    labels = classes(classIds);
     subplot(1,2,1)
    imshow(im)
    
    subplot(1,2,2)
    CAMshow(im,classActivationMap)
    title(string(labels) + ", " + string(maxScores));
    
    drawnow
    
end