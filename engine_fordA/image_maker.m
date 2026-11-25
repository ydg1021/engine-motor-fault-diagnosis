grayimage_abnormal = cell(1,1846);
data_abnormal = zeros(20,25);

for m= 1:1846
for n= 1:20
data_abnormal(n,:) = train_abnormal(m,25*(n-1)+1:25*n);

end
grayimage_abnormal{m} = mat2gray(data_abnormal);
end

grayimage_normal = cell(1,1755);
data_normal = zeros(20,25);

for m= 1:1755
    for n=1:20
        data_normal(n,:) = train_normal(m,25*(n-1)+1:25*n);

end
grayimage_normal{m} = mat2gray(data_normal);
end


for m= 1:639
    for n=1:20
        data_normal(n,:) = train_normal(m,25*(n-1)+1:25*n);

end
test_grayimage_normal{m} = mat2gray(data_normal);
end

for m= 1:681
    for n=1:20
        data_abnormal(n,:) = train_abnormal(m,25*(n-1)+1:25*n);

end
test_grayimage_abnormal{m} = mat2gray(data_abnormal);
end
%% RGB

for m= 1:1846
for n= 1:20
data_abnormal_train(n,:) = train_abnormal(m,25*(n-1)+1:25*n);

end
rgbimage_abnormal{m} = mat2im(data_abnormal_train,hot(500000));
end

for m= 1:1755
    for n=1:20
        data_normal_train(n,:) = train_normal(m,25*(n-1)+1:25*n);

end
rgbimage_normal{m} = mat2im(data_normal_train,hot(500000));
end


for m= 1:639
    for n=1:20
        data_normal_test(n,:) = train_normal(m,25*(n-1)+1:25*n);

end
test_rgbimage_normal{m} = mat2im(data_normal_test,hot(500000));
end

for m= 1:681
    for n=1:20
        data_abnormal_test(n,:) = train_abnormal(m,25*(n-1)+1:25*n);

end
test_rgbimage_abnormal{m} = mat2im(data_abnormal_test,hot(500000));
end