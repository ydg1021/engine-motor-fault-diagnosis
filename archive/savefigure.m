% for i= 1:1846
%     gray = mat2gray(FordATRAIN1(i,1:500));
%     imshow(gray)
%     saveas (fig, ,png)
% end
%% normalize (robust)
train=normalize(pcascoreTrain1(:,1:66),'zscore','robust'); % ab:1~1846, nor:1847~3601
test=normalize(pcascoreTest1(:,1:66),'zscore','robust'); % ab:1~681, nor:682~1320




%% 배경 포함 이미지 저장하는 코드
for ii = 1:1860
    gray = mat2gray(FordBTRAIN_double(ii,2:501),[-6 6]);
    imclearborder(gray);
    imshow(gray);
    fn = sprintf('file_%s.jpg',num2str(ii,'%04i'));
    imwrite(gray,fn,'jpg');
%     saveas(gcf,fn,'png')
end

%% 배경(흰색)없이 이미지 저장하는 코드
%train
for ii = 1:1846 %abnormal class : -1
    gray = train(ii,:);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end

for ii = 1847:3601 %normal class : 1
    gray = train(ii,:);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end
%test
for ii = 1:681
    gray = test(ii,:);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end

for ii = 682:1320
    gray = test(ii,:);
    imclearborder(gray);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end

%% RGB ford A

xTrainImages{1,1} = rgb;
for ii = 1:1846
    mat=FordATRAIN1(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    imclearborder(rgb);
    imshow(rgb);
fn = sprintf('file_%s.png',num2str(ii,'%04i'));
imwrite(rgb,fn,'png');
end

for ii = 1847:3601
    mat=FordATRAIN1(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    imclearborder(rgb);
    imshow(rgb);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(rgb,fn,'png');
end

for ii = 1:681
    mat=FordATEST(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    imclearborder(rgb);
    imshow(rgb);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(rgb,fn,'png');
end

for ii = 682:1320
    mat=FordATEST(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    imclearborder(rgb);
    imshow(rgb);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(rgb,fn,'png');
end

%% RGB ford B

cd('C:\Users\USER\Desktop\FordB\RGB\h500000\size227\train_denoise\abnormal');
for ii = 1:1860
    mat=denoise_train(ii,1:500);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    imclearborder(rgb);
    imshow(rgb);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(rgb,fn,'png');
end


cd('C:\Users\USER\Desktop\FordB\RGB\h500000\size227\train_denoise\normal');
for ii = 1861:3636
    mat=denoise_train(ii,1:500);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    imclearborder(rgb);
    imshow(rgb);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(rgb,fn,'png');
end
cd('C:\Users\USER\Desktop\FordB\RGB\h500000\testdata_denoise\db14_3\6to6\test_abnormal_origin');
for ii = 1:401
    mat=denoise_test(ii,1:500);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    imclearborder(rgb);
    imshow(rgb);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(rgb,fn,'png');
end
cd('C:\Users\USER\Desktop\FordB\RGB\h500000\testdata_denoise\db14_3\6to6\test_normal_origin');
for ii = 402:810
    mat=denoise_test(ii,1:500);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    imclearborder(rgb);
    imshow(rgb);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(rgb,fn,'png');
end

%% pca rgb

cd('C:\Users\USER\Desktop\FordA\pca\train\abnormal');
for ii = 1:1846
    mat=pcadatanewtrain_double(ii,1:66);
    rgb = mat2im(mat,hot(100));
    imclearborder(rgb);
    imshow(rgb);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(rgb,fn,'png');
end
cd('C:\Users\USER\Desktop\FordA\pca\train\normal');
for ii = 1847:3601
    mat=pcadatanewtrain_double(ii,1:66);
    rgb = mat2im(mat,hot(100));
    imclearborder(rgb);
    imshow(rgb);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(rgb,fn,'png');
end
cd('C:\Users\USER\Desktop\FordA\pca\test\abnormal');
for ii = 1:681
    mat=pcadatanewtest_double(ii,1:66);
    rgb = mat2im(mat,hot(100));
    imclearborder(rgb);
    imshow(rgb);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(rgb,fn,'png');
end
cd('C:\Users\USER\Desktop\FordA\pca\test\normal');
for ii = 682:1320
    mat=pcadatanewtest_double(ii,1:66);
    rgb = mat2im(mat,hot(100));
    imclearborder(rgb);
    imshow(rgb);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(rgb,fn,'png');
end
%%

for ii = 1:3601
    mat=FordATRAIN1(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    xTrainImages{1,ii}=rgb;
%     imclearborder(rgb);
%     imshow(rgb);
%     fn = sprintf('file_%s.png',num2str(ii,'%04i'));
%     imwrite(rgb,fn,'png');
end

for ii = 1:1320
    mat=FordATEST(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    xTestImages{1,ii}=rgb;
%     imclearborder(rgb);
%     imshow(rgb);
%     fn = sprintf('file_%s.png',num2str(ii,'%04i'));
%     imwrite(rgb,fn,'png');
end

tTrain = zeros(2,3601);
tTrain(1,1:1846) = 1;
tTrain(2,1847:3601) = 1;

tTest = zeros(2,1320);
tTest(1,1:681) = 1;
tTest(2,682:1320) = 1;

rng('default')
hiddenSize1=500;

autoenc2 = trainAutoencoder(xTrainImages,hiddenSize1, 'MaxEpochs', 3000);,  'L2WeightRegularization',0.004, ...
    'SparsityRegularization',4, ...
    'SparsityProportion',0.15, ...
    'ScaleData', false);
feat2 = encode(autoenc2,xTrainImages);
softnet = trainSoftmaxLayer(feat1,tTrain,'MaxEpochs',3000);
stackednet = stack(autoenc2,softnet);
imageWidth = 1500;
imageHeight = 1;
inputSize = imageWidth*imageHeight;
xTest = zeros(inputSize,numel(xTestImages));
for i = 1:numel(xTestImages)
    xTest(:,i) = xTestImages{i}(:);
end
y=stackednet(xTest);
plotconfusion(tTest,y);

xTrain = zeros(inputSize,numel(xTrainImages));
for i = 1:numel(xTrainImages)
    xTrain(:,i) = xTrainImages{i}(:);
end

% Perform fine tuning
stackednet = train(stackednet,xTrain,tTrain);
y = stackednet(xTest);
plotconfusion(tTest,y);