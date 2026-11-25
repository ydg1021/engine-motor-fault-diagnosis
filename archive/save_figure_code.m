% for i = 1:10
% 
%  stft(abnormal_test(:,i))
% set(gca, 'Visible', 'off');
% colorbar('off');
% export_fig(gcf,'file_%d.jpg')
% end

%% save figure
%train

cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\origin\train\abnormal');
for ii = 1:1846 %abnormal class : -1

    gray = mat2gray(FordATRAIN1(ii,2:501),[-6 6]);
    imclearborder(gray);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end

cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\origin\train\normal');
for ii = 1847:3601 %abnormal class : -1
    gray = mat2gray(FordATRAIN1(ii,2:501),[-6 6]);
    imclearborder(gray);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end
%test1
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\origin\test1\abnormal');
for ii = 1:681 %abnormal class : -1
    gray = mat2gray(FordATEST(ii,2:501),[-6 6]);
    imclearborder(gray);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\origin\test1\normal');
for ii = 682:1320 %abnormal class : -1
    gray = mat2gray(FordATEST(ii,2:501),[-6 6]);
    imclearborder(gray);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end
%test2
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\origin\test2\abnormal');
for ii = 1:401 %abnormal class : -1
    gray = mat2gray(FordBTEST_double(ii,2:501),[-6 6]);
    imclearborder(gray);
    imshow(gray);
    fn = sprintf('file_%s.png',num2str(ii,'%04i'));
    imwrite(gray,fn,'png');
end
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\origin\test2\normal');
for ii = 402:810 %abnormal class : -1
    gray = mat2gray(FordBTEST_double(ii,2:501),[-6 6]);
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
    imclearborder(rgb);
    imshow(rgb);
fn = sprintf('file_%s.png',num2str(ii,'%04i'));
imwrite(rgb,fn,'png');
end

cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\origin\train\normal');
for ii = 1847:3601 %abnormal class : -1
mat=FordATRAIN1(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
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
    imclearborder(rgb);
    imshow(rgb);
fn = sprintf('file_%s.png',num2str(ii,'%04i'));
imwrite(rgb,fn,'png');
end
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\origin\test1\normal');
for ii = 682:1320 %abnormal class : -1
mat=FordATEST(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
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
    imclearborder(rgb);
    imshow(rgb);
fn = sprintf('file_%s.png',num2str(ii,'%04i'));
imwrite(rgb,fn,'png');
end
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\origin\test2\normal');
for ii = 402:810 %abnormal class : -1
mat=FordBTEST_double(ii,2:501);
    rgb = mat2im(mat,hot(500000),[-6,6]);
    imclearborder(rgb);
    imshow(rgb);
fn = sprintf('file_%s.png',num2str(ii,'%04i'));
imwrite(rgb,fn,'png');
end
% 
% %stft
% cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\stft\origin\train\abnormal');
% for ii = 1:1846
% stft(FordATRAIN1(ii,2:501))
%        
%  caxis([-25 35])
%  set(gca, 'Visible', 'off')
%  colorbar('off')
% fn = sprintf('file_%s.png',num2str(ii,'%04i'));
% export_fig(gcf, fn)
% 
% end
% 
% cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\stft\origin\train\normal');
% for ii = 1847:3601
% stft(FordATRAIN1(ii,2:501))
%        
%  caxis([-25 35])
%  set(gca, 'Visible', 'off')
%  colorbar('off')
% fn = sprintf('file_%s.png',num2str(ii,'%04i'));
% export_fig(gcf, fn)
% 
% end
% 
% cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\stft\origin\test1\abnormal');
% for ii = 1:681
% stft(FordATEST(ii,2:501))
%        
%  caxis([-25 35])
%  set(gca, 'Visible', 'off')
%  colorbar('off')
% fn = sprintf('file_%s.png',num2str(ii,'%04i'));
% export_fig(gcf, fn)
% 
% end
% 
% cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\stft\origin\test1\normal');
% for ii = 682:1320
% stft(FordATEST(ii,2:501))
%        
%  caxis([-25 35])
%  set(gca, 'Visible', 'off')
%  colorbar('off')
% fn = sprintf('file_%s.png',num2str(ii,'%04i'));
% export_fig(gcf, fn)
% 
% end
% 
% cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\stft\origin\test2\abnormal');
% for ii = 1:401
% stft(FordBTEST_double(ii,2:501))
%        
%  caxis([-25 35])
%  set(gca, 'Visible', 'off')
%  colorbar('off')
% fn = sprintf('file_%s.png',num2str(ii,'%04i'));
% export_fig(gcf, fn)
% 
% end
% 
% cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\stft\origin\test2\normal');
% for ii = 402:810
% stft(FordBTEST_double(ii,2:501))
%        
%  caxis([-25 35])
%  set(gca, 'Visible', 'off')
%  colorbar('off')
% fn = sprintf('file_%s.png',num2str(ii,'%04i'));
% export_fig(gcf, fn)
% 
% end