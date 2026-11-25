for ii = 1:1846 %abnormal class : -1

    gray = mat2gray(FordATRAIN1(ii,2:501),[-6 6]);
    gray_abnormal_train{1,ii} = gray;
end
j=1;
for ii = 1847:3601 %abnormal class : -1
    gray = mat2gray(FordATRAIN1(ii,2:501),[-6 6]);
    gray_normal_train{1,j} = gray;
    j=j+1;
end
for ii = 1:681 %abnormal class : -1
    gray = mat2gray(FordATEST(ii,2:501),[-6 6]);
    gray_abnormal_test1{1,ii} = gray;
end
j=1;
for ii = 682:1320 %abnormal class : -1
    gray = mat2gray(FordATEST(ii,2:501),[-6 6]);
    gray_normal_test1{1,j} = gray;
    j=j+1;
end
for ii = 1:401 %abnormal class : -1
    gray = mat2gray(FordBTEST_double(ii,2:501),[-6 6]);
    gray_abnormal_test2{1,ii} = gray;
end
j=1;
for ii = 402:810 %abnormal class : -1
    gray = mat2gray(FordBTEST_double(ii,2:501),[-6 6]);
    gray_normal_test2{1,j} = gray;
    j=j+1;
end
% rgb
for ii = 1:1846 %abnormal class : -1
    mat=FordATRAIN1(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    rgb_abnormal_train{1,ii}=rgb;
end
j=1;
for ii = 1847:3601 %abnormal class : -1
mat=FordATRAIN1(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    rgb_normal_train{1,j}=rgb;
    j=j+1;
end
for ii = 1:681 %abnormal class : -1
mat=FordATEST(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    rgb_abnormal_test1{1,ii}=rgb;
end
j=1;
for ii = 682:1320 %abnormal class : -1
mat=FordATEST(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
        rgb_normal_test1{1,j}=rgb;
        j=j+1;
end
for ii = 1:401 %abnormal class : -1
mat=FordBTEST_double(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
        rgb_abnormal_test2{1,ii}=rgb;
end
j=1;
for ii = 402:810 %abnormal class : -1
mat=FordBTEST_double(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
        rgb_normal_test2{1,j}=rgb;
        j=j+1;
end