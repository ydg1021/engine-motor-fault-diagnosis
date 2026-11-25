for i = 1:400
    figure(1)
        data = normal_train(:,i)
        stft(data)
%         caxis([0 5])
figure(2)
data2 = normal_test(:,i)
stft(data2)

 
 xticks([ ])
 yticks([ ])
 xlabel(' ')
 ylabel(' ')
% 
%  colorbar('off')
%  title(' ')
% saveas(figure (1), sprintf('KH1_test_p3_%d', i), 'jpg')
% close all
end

for ii = 1:1860
    gray = mat2gray(FordBTRAIN_double(ii,2:501),[-6 6]);
%     fn = sprintf('file_%s.jpg',num2str(i,'%04i'))
%     data = imread(fn);
%     data2 = im2double(data);
    gray_abnormal_train{1,ii} = gray ;
end
j=1;
for ii = 1861:3636
    gray = mat2gray(FordBTRAIN_double(ii,2:501),[-6 6]);
%     fn = sprintf('file_%s.jpg',num2str(i,'%04i'))
%     data = imread(fn);
%     data2 = im2double(data);
    gray_normal_train{1,j} = gray ;
    j=j+1;
end

for ii = 1:401
    gray = mat2gray(FordBTEST_double(ii,2:501),[-6 6]);
%     fn = sprintf('file_%s.jpg',num2str(i,'%04i'))
%     data = imread(fn);
%     data2 = im2double(data);
    gray_abnormal_test{1,ii} = gray ;
end
j=1;
for ii = 402:810
    gray = mat2gray(FordBTEST_double(ii,2:501),[-6 6]);
%     fn = sprintf('file_%s.jpg',num2str(i,'%04i'))
%     data = imread(fn);
%     data2 = im2double(data);
    gray_normal_test{1,j} = gray ;
    j=j+1;
end
rng('default')
for i = 1:4
hiddenSize1 = [200,400,600,800,1000];
autoenc1 = trainAutoencoder(gray_normal_train,hiddenSize1(1,i), ...
    'MaxEpochs',1500, ...
    'DecoderTransferFunction','purelin');
%     'L2WeightRegularization',0.004, ...
%     'SparsityRegularization',4, ...
%     'SparsityProportion',0.15, ...
%     'ScaleData', false,
% 
XReconstructed1 = predict(autoenc1,gray_normal_train);
mseError3(1,i) = mse(cellfun(@minus,gray_normal_train,XReconstructed1,'Un',0));
XReconstructed2 = predict(autoenc1,gray_abnormal_train);
mseError3(2,i) = mse(cellfun(@minus,gray_abnormal_train,XReconstructed2,'Un',0));
XReconstructed3 = predict(autoenc1,gray_normal_test);
mseError3(3,i) = mse(cellfun(@minus,gray_normal_test,XReconstructed3,'Un',0));
XReconstructed4 = predict(autoenc1,gray_abnormal_test);
mseError3(4,i) = mse(cellfun(@minus,gray_abnormal_test,XReconstructed4,'Un',0));
end
bar(mseError3)