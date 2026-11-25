
for ii = 1:1860
    mat=FordBTRAIN_double(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
%     fn = sprintf('file_%s.jpg',num2str(i,'%04i'))
%     data = imread(fn);
%     data2 = im2double(data);
    rgb_abnormal_train{1,ii} = rgb ;
end
j=1;
for ii = 1861:3636
    mat=FordBTRAIN_double(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
%     fn = sprintf('file_%s.jpg',num2str(i,'%04i'))
%     data = imread(fn);
%     data2 = im2double(data);
    rgb_normal_train{1,j} = rgb ;
    j=j+1;
end

for ii = 1:401
   mat=FordBTEST_double(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
%     fn = sprintf('file_%s.jpg',num2str(i,'%04i'))
%     data = imread(fn);
%     data2 = im2double(data);
    rgb_abnormal_test{1,ii} = rgb ;
end
j=1;
for ii = 402:810
    mat=FordBTEST_double(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
%     fn = sprintf('file_%s.jpg',num2str(i,'%04i'))
%     data = imread(fn);
%     data2 = im2double(data);
    rgb_normal_test{1,j} = rgb ;
    j=j+1;
end
rng('default')
for i = 1:4
hiddenSize1 = [200,400,600,800,1000];
autoenc2 = trainAutoencoder(rgb_normal_train,hiddenSize1(1,i), ...
    'MaxEpochs',1500, ...
    'DecoderTransferFunction','purelin');
%     'L2WeightRegularization',0.004, ...
%     'SparsityRegularization',4, ...
%     'SparsityProportion',0.15, ...
%     'ScaleData', false,
% 
XReconstructed5 = predict(autoenc2,rgb_normal_train);
mseError_rgb(1,i) = mse(cellfun(@minus,rgb_normal_train,XReconstructed5,'Un',0));
XReconstructed6 = predict(autoenc2,rgb_abnormal_train);
mseError_rgb(2,i) = mse(cellfun(@minus,rgb_abnormal_train,XReconstructed6,'Un',0));
XReconstructed7 = predict(autoenc2,rgb_normal_test);
mseError_rgb(3,i) = mse(cellfun(@minus,rgb_normal_test,XReconstructed7,'Un',0));
XReconstructed8 = predict(autoenc2,rgb_abnormal_test);
mseError_rgb(4,i) = mse(cellfun(@minus,rgb_abnormal_test,XReconstructed8,'Un',0));
end
bar(mseError_rgb')