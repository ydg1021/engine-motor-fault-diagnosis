datalength(:,1) = length(grayimage_abnormal);
datalength(:,2) = length(grayimage_normal);
datalength(:,3) = length(rgbimage_abnormal);
datalength(:,4) = length(rgbimage_normal);
datalength(:,5) = length(test_grayimage_abnormal);
datalength(:,6) = length(test_grayimage_normal);
datalength(:,7) = length(test_rgbimage_abnormal);
datalength(:,8) = length(test_rgbimage_normal);

cd('E:\바탕화면_연구실컴퓨터\FordA\new_imageset\train\gray\abnormal')
for n=1:datalength(:,1)
        imshow(grayimage_abnormal{n});
        set(gca, 'Visible', 'off');
        colorbar('off');
        filename = sprintf('grayimage_abnormal_%d.png',n);
        export_fig(gcf,filename,'-transparent');
        close(gcf);
end

cd('E:\바탕화면_연구실컴퓨터\FordA\new_imageset\train\gray\normal')
for n=1:datalength(:,2)
        imshow(grayimage_normal{n});
        set(gca, 'Visible', 'off');
        colorbar('off');
        filename = sprintf('grayimage_normal_%d.png',n);
        export_fig(gcf,filename,'-transparent');
        close(gcf);
end

cd('E:\바탕화면_연구실컴퓨터\FordA\new_imageset\train\rgb\abnormal')
for n=1:datalength(:,3)
        imshow(rgbimage_abnormal{n});
        set(gca, 'Visible', 'off');
        colorbar('off');
        filename = sprintf('rgbimage_abnormal_%d.png',n);
        export_fig(gcf,filename,'-transparent');
        close(gcf);
end

cd('E:\바탕화면_연구실컴퓨터\FordA\new_imageset\train\rgb\normal')
for n=1:datalength(:,4)
        imshow(rgbimage_normal{n});
        set(gca, 'Visible', 'off');
        colorbar('off');
        filename = sprintf('rgbimage_normal_%d.png',n);
        export_fig(gcf,filename,'-transparent');
        close(gcf);
end

cd('E:\바탕화면_연구실컴퓨터\FordA\new_imageset\test\gray\abnormal')
for n=1:datalength(:,5)
        imshow(test_grayimage_abnormal{n});
        set(gca, 'Visible', 'off');
        colorbar('off');
        filename = sprintf('test_grayimage_abnormal_%d.png',n);
        export_fig(gcf,filename,'-transparent');
        close(gcf);
end

cd('E:\바탕화면_연구실컴퓨터\FordA\new_imageset\test\gray\normal')
for n=1:datalength(:,6)
        imshow(test_grayimage_normal{n});
        set(gca, 'Visible', 'off');
        colorbar('off');
        filename = sprintf('test_grayimage_normal_%d.png',n);
        export_fig(gcf,filename,'-transparent');
        close(gcf);
end

cd('E:\바탕화면_연구실컴퓨터\FordA\new_imageset\test\rgb\abnormal')
for n=1:datalength(:,7)
        imshow(test_rgbimage_abnormal{n});
        set(gca, 'Visible', 'off');
        colorbar('off');
        filename = sprintf('test_rgbimage_abnormal_%d.png',n);
        export_fig(gcf,filename,'-transparent');
        close(gcf);
end

cd('E:\바탕화면_연구실컴퓨터\FordA\new_imageset\test\rgb\normal')
for n=1:datalength(:,8)
        imshow(test_rgbimage_normal{n});
        set(gca, 'Visible', 'off');
        colorbar('off');
        filename = sprintf('test_rgbimage_normal_%d.png',n);
        export_fig(gcf,filename,'-transparent');
        close(gcf);
end