rng('default')
for i = 1:5
hiddenSize1 = [5,10,15,20,25];
autoenc1 = trainAutoencoder(gray_normal_train,hiddenSize1(1,i), ...
    'MaxEpochs',1000, ...
    'DecoderTransferFunction','purelin');
%     'L2WeightRegularization',0.004, ...
%     'SparsityRegularization',4, ...
%     'SparsityProportion',0.15, ...
%     'ScaleData', false,
% 
XReconstructed1 = predict(autoenc1,gray_normal_train);
mseError_gray(1,i) = mse(cellfun(@minus,gray_normal_train,XReconstructed1,'Un',0));

XReconstructed2 = predict(autoenc1,gray_normal_test1);
mseError_gray(2,i) = mse(cellfun(@minus,gray_normal_test1,XReconstructed2,'Un',0));

XReconstructed3 = predict(autoenc1,gray_abnormal_test1);
mseError_gray(3,i) = mse(cellfun(@minus,gray_abnormal_test1,XReconstructed3,'Un',0));

XReconstructed4 = predict(autoenc1,gray_normal_test2);
mseError_gray(4,i) = mse(cellfun(@minus,gray_normal_test2,XReconstructed4,'Un',0));

XReconstructed5 = predict(autoenc1,gray_abnormal_test2);
mseError_gray(5,i) = mse(cellfun(@minus,gray_abnormal_test2,XReconstructed5,'Un',0));

XReconstructed_denoisegray1 = predict(autoenc1,gray_denoised_normal_test2_6to6);
mseError_gray(6,i) = mse(cellfun(@minus,gray_denoised_normal_test2_6to6,XReconstructed_denoisegray1,'Un',0));


XReconstructed_denoisegray2 = predict(autoenc1,gray_denoised_abnormal_test2_6to6);
mseError_gray(7,i) = mse(cellfun(@minus,gray_denoised_abnormal_test2_6to6,XReconstructed_denoisegray2,'Un',0));


XReconstructed_denoisegray3 = predict(autoenc1,gray_denoised_normal_test2_4to4);
mseError_gray(8,i) = mse(cellfun(@minus,gray_denoised_normal_test2_4to4,XReconstructed_denoisegray3,'Un',0));


XReconstructed_denoisegray4 = predict(autoenc1,gray_denoised_abnormal_test2_4to4);
mseError_gray(9,i) = mse(cellfun(@minus,gray_denoised_abnormal_test2_4to4,XReconstructed_denoisegray4,'Un',0));
fn = sprintf('autoenc1_%s.mat',num2str(i,'%04i'));
save(fn,'autoenc1','mseError_gray')
end
subplot(1,2,1)
bar(mseError_gray')
xlabel('Hidden Layer Node Size')
ylabel('MSE')
title('Autoencoder (Gray image)')
ylim([0 13.5*10^-3])
subplot(1,2,2)
bar(mseError_rgb')
xlabel('Hidden Layer Node Size')
ylabel('MSE')
title('Autoencoder (RGB image)')
ylim([0 13.5*10^-3])
%%

for i = 1:1
hiddenSize1 = [5,10,15,20,25];
autoenc2 = trainAutoencoder(rgb_normal_train,hiddenSize1(1,i), ...
    'MaxEpochs',1000, ...
    'DecoderTransferFunction','purelin');
%     'L2WeightRegularization',0.004, ...
%     'SparsityRegularization',4, ...
%     'SparsityProportion',0.15, ...
%     'ScaleData', false,
% 
XReconstructed6 = predict(autoenc2,rgb_normal_train);
mseError_rgb(1,i) = mse(cellfun(@minus,rgb_normal_train,XReconstructed6,'Un',0));

XReconstructed7 = predict(autoenc2,rgb_normal_test1);
mseError_rgb(2,i) = mse(cellfun(@minus,rgb_normal_test1,XReconstructed7,'Un',0));

XReconstructed8 = predict(autoenc2,rgb_abnormal_test1);
mseError_rgb(3,i) = mse(cellfun(@minus,rgb_abnormal_test1,XReconstructed8,'Un',0));

XReconstructed9 = predict(autoenc2,rgb_normal_test2);
mseError_rgb(4,i) = mse(cellfun(@minus,rgb_normal_test2,XReconstructed9,'Un',0));

XReconstructed10 = predict(autoenc2,rgb_abnormal_test2);
mseError_rgb(5,i) = mse(cellfun(@minus,rgb_abnormal_test2,XReconstructed10,'Un',0));

XReconstructed_denoisergb1 = predict(autoenc2,rgb_denoised_normal_test2_6to6);
mseError_rgb(6,i) = mse(cellfun(@minus,rgb_denoised_normal_test2_6to6,XReconstructed_denoisergb1,'Un',0));


XReconstructed_denoisergb2 = predict(autoenc2,rgb_denoised_abnormal_test2_6to6);
mseError_rgb(7,i) = mse(cellfun(@minus,rgb_denoised_abnormal_test2_6to6,XReconstructed_denoisergb2,'Un',0));


XReconstructed_denoisergb3 = predict(autoenc2,rgb_denoised_normal_test2_4to4);
mseError_rgb(8,i) = mse(cellfun(@minus,rgb_denoised_normal_test2_4to4,XReconstructed_denoisergb3,'Un',0));


XReconstructed_denoisergb4 = predict(autoenc2,rgb_denoised_abnormal_test2_4to4);
mseError_rgb(9,i) = mse(cellfun(@minus,rgb_denoised_abnormal_test2_4to4,XReconstructed_denoisergb4,'Un',0));
fn = sprintf('autoenc2_%s.mat',num2str(i,'%04i'));
save(fn,'autoenc2','mseError_rgb')
end
