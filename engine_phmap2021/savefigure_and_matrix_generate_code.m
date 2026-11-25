
%% save figure
%train

cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\origin\train\abnormal');
for ii = 1:1846 %abnormal class : -1

    gray = mat2gray(FordATRAIN1(ii,2:501),[-6 6]);
    gray_abnormal_train{1,ii} = gray;
    imclearborder(gray);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end
j=1;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\origin\train\normal');
for ii = 1847:3601 %abnormal class : -1
    gray = mat2gray(FordATRAIN1(ii,2:501),[-6 6]);
    gray_normal_train{1,j} = gray;
    j=j+1;
    imclearborder(gray);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end
%test1
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\origin\test1\abnormal');
for ii = 1:681 %abnormal class : -1
    gray = mat2gray(FordATEST(ii,2:501),[-6 6]);
    gray_abnormal_test1{1,ii} = gray;
    imclearborder(gray);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end
j=1;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\origin\test1\normal');
for ii = 682:1320 %abnormal class : -1
    gray = mat2gray(FordATEST(ii,2:501),[-6 6]);
    gray_normal_test1{1,j} = gray;
    j=j+1;
    imclearborder(gray);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end
%test2
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\origin\test2\abnormal');
for ii = 1:401 %abnormal class : -1
    gray = mat2gray(FordBTEST_double(ii,2:501),[-6 6]);
    gray_abnormal_test2{1,ii} = gray;
    imclearborder(gray);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end
j=1;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\origin\test2\normal');
for ii = 402:810 %abnormal class : -1
    gray = mat2gray(FordBTEST_double(ii,2:501),[-6 6]);
    gray_normal_test2{1,j} = gray;
    j=j+1;
    imclearborder(gray);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end

%rgb

cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\origin\train\abnormal');
for ii = 1:1846 %abnormal class : -1
    mat=FordATRAIN1(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    rgb_abnormal_train{1,ii}=rgb;
    imclearborder(rgb);
    imshow(rgb);
fn = sprintf('file_%s.png',num2str(ii,'%04i'));
imwrite(rgb,fn,'png');
end
j=1;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\origin\train\normal');
for ii = 1847:3601 %abnormal class : -1
    mat=FordATRAIN1(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    rgb_normal_train{1,j}=rgb;
    j=j+1;
    imclearborder(rgb);
    imshow(rgb);
fn = sprintf('file_%s.png',num2str(ii,'%04i'));
imwrite(rgb,fn,'png');
end
%test1
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\origin\test1\abnormal');
for ii = 1:681 %abnormal class : -1
    mat=FordATEST(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    rgb_abnormal_test1{1,ii}=rgb;
    imclearborder(rgb);
    imshow(rgb);
fn = sprintf('file_%s.png',num2str(ii,'%04i'));
imwrite(rgb,fn,'png');
end
j=1;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\origin\test1\normal');
for ii = 682:1320 %abnormal class : -1
mat=FordATEST(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    rgb_normal_test1{1,j}=rgb;
    j=j+1;
    imclearborder(rgb);
    imshow(rgb);
fn = sprintf('file_%s.png',num2str(ii,'%04i'));
imwrite(rgb,fn,'png');
end
%test2
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\origin\test2\abnormal');
for ii = 1:401 %abnormal class : -1
mat=FordBTEST_double(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    rgb_abnormal_test2{1,ii}=rgb;
    imclearborder(rgb);
    imshow(rgb);
fn = sprintf('file_%s.png',num2str(ii,'%04i'));
imwrite(rgb,fn,'png');
end
j=1;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\origin\test2\normal');
for ii = 402:810 %abnormal class : -1
mat=FordBTEST_double(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    rgb_normal_test2{1,j}=rgb;
    j=j+1;
    imclearborder(rgb);
    imshow(rgb);
fn = sprintf('file_%s.png',num2str(ii,'%04i'));
imwrite(rgb,fn,'png');
end


%%

cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\denoised_test2\origin_4to4\abnormal');
for ii = 1:401 %abnormal class : -1
    gray = mat2gray(denoised_test_abnormal(ii,1:500),[-4 4]);
    gray_denoised_abnormal_test2_4to4{1,ii} = gray;
    imclearborder(gray);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end

cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\denoised_test2\origin_4to4\normal');
for ii = 1:409 %abnormal class : -1
    gray = mat2gray(denoised_test_normal(ii,1:500),[-4 4]);
    gray_denoised_normal_test2_4to4{1,ii} = gray;
    imclearborder(gray);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end




cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\denoised_test2\rgb\origin_6to6\abnormal');
for ii = 1:401 %abnormal class : -1
mat=denoised_test_abnormal(ii,1:500);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    rgb_denoised_abnormal_test2_6to6{1,ii}=rgb;
    imclearborder(rgb);
    imshow(rgb);
fn = sprintf('file_%s.png',num2str(ii,'%04i'));
imwrite(rgb,fn,'png');
end

cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\denoised_test2\rgb\origin_6to6\normal');
for ii = 1:409 %abnormal class : -1
mat=denoised_test_normal(ii,1:500);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    rgb_denoised_normal_test2_6to6{1,ii}=rgb;
    imclearborder(rgb);
    imshow(rgb);
fn = sprintf('file_%s.png',num2str(ii,'%04i'));
imwrite(rgb,fn,'png');
end


cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\denoised_test2\rgb\origin_4to4\abnormal');
for ii = 1:401 %abnormal class : -1
mat=denoised_test_abnormal(ii,1:500);
    rgb = mat2im(mat,hot(500000),[-4,4]);
    rgb_denoised_abnormal_test2_4to4{1,ii}=rgb;
    imclearborder(rgb);
    imshow(rgb);
fn = sprintf('file_%s.png',num2str(ii,'%04i'));
imwrite(rgb,fn,'png');
end

cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\denoised_test2\rgb\origin_4to4\normal');
for ii = 1:409 %abnormal class : -1
mat=denoised_test_normal(ii,1:500);
    rgb = mat2im(mat,hot(500000),[-4,4]);
    rgb_denoised_normal_test2_4to4{1,ii}=rgb;
    imclearborder(rgb);
    imshow(rgb);
fn = sprintf('file_%s.png',num2str(ii,'%04i'));
imwrite(rgb,fn,'png');
end