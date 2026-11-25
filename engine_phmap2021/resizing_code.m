%% gray
% 224
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\224\train\abnormal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:1846
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[224 224]);
        myfilename = sprintf('data_%d.png',j);
        imwrite(image,myfilename);
    end
    delete file_*.png
end



n=1846;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\224\train\normal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:1755
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[224 224]);
        myfilename = sprintf('data_%d.png',j+n);
        imwrite(image,myfilename);
    end
    delete file_*.png
end


cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\224\test1\abnormal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:681
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[224 224]);
        myfilename = sprintf('data_%d.png',j);
        imwrite(image,myfilename);
    end
    delete file_*.png
end



n=681;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\224\test1\normal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:639
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[224 224]);
        myfilename = sprintf('data_%d.png',j+n);
        imwrite(image,myfilename);
    end
    delete file_*.png
end


cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\224\test2\abnormal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:401
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[224 224]);
        myfilename = sprintf('data_%d.png',j);
        imwrite(image,myfilename);
    end
    delete file_*.png
end



n=401;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\224\test2\normal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:409
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[224 224]);
        myfilename = sprintf('data_%d.png',j+n);
        imwrite(image,myfilename);
    end
    delete file_*.png
end

% 227

cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\227\train\abnormal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:1846
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[227 227]);
        myfilename = sprintf('data_%d.png',j);
        imwrite(image,myfilename);
    end
    delete file_*.png
end



n=1846;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\227\train\normal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:1755
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[227 227]);
        myfilename = sprintf('data_%d.png',j+n);
        imwrite(image,myfilename);
    end
    delete file_*.png
end


cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\227\test1\abnormal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:681
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[227 227]);
        myfilename = sprintf('data_%d.png',j);
        imwrite(image,myfilename);
    end
    delete file_*.png
end



n=681;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\227\test1\normal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:639
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[227 227]);
        myfilename = sprintf('data_%d.png',j+n);
        imwrite(image,myfilename);
    end
    delete file_*.png
end


cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\227\test2\abnormal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:401
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[227 227]);
        myfilename = sprintf('data_%d.png',j);
        imwrite(image,myfilename);
    end
    delete file_*.png
end



n=401;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\gray\227\test2\normal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:409
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[227 227]);
        myfilename = sprintf('data_%d.png',j+n);
        imwrite(image,myfilename);
    end
    delete file_*.png
end
%% rgb
% 224
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\224\train\abnormal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:1846
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[224 224]);
        myfilename = sprintf('data_%d.png',j);
        imwrite(image,myfilename);
    end
    delete file_*.png
end



n=1846;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\224\train\normal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:1755
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[224 224]);
        myfilename = sprintf('data_%d.png',j+n);
        imwrite(image,myfilename);
    end
    delete file_*.png
end


cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\224\test1\abnormal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:681
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[224 224]);
        myfilename = sprintf('data_%d.png',j);
        imwrite(image,myfilename);
    end
    delete file_*.png
end



n=681;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\224\test1\normal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:639
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[224 224]);
        myfilename = sprintf('data_%d.png',j+n);
        imwrite(image,myfilename);
    end
    delete file_*.png
end


cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\224\test2\abnormal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:401
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[224 224]);
        myfilename = sprintf('data_%d.png',j);
        imwrite(image,myfilename);
    end
    delete file_*.png
end



n=401;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\224\test2\normal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:409
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[224 224]);
        myfilename = sprintf('data_%d.png',j+n);
        imwrite(image,myfilename);
    end
    delete file_*.png
end

% 227

cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\227\train\abnormal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:1846
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[227 227]);
        myfilename = sprintf('data_%d.png',j);
        imwrite(image,myfilename);
    end
    delete file_*.png
end



n=1846;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\227\train\normal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:1755
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[227 227]);
        myfilename = sprintf('data_%d.png',j+n);
        imwrite(image,myfilename);
    end
    delete file_*.png
end


cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\227\test1\abnormal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:681
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[227 227]);
        myfilename = sprintf('data_%d.png',j);
        imwrite(image,myfilename);
    end
    delete file_*.png
end



n=681;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\227\test1\normal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:639
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[227 227]);
        myfilename = sprintf('data_%d.png',j+n);
        imwrite(image,myfilename);
    end
    delete file_*.png
end


cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\227\test2\abnormal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:401
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[227 227]);
        myfilename = sprintf('data_%d.png',j);
        imwrite(image,myfilename);
    end
    delete file_*.png
end



n=401;
cd('C:\Users\USER\Desktop\PHMAP2021 연구자료\CNN\rgb\227\test2\normal');
for i=1
    pngFiles = dir('file_*.png');
    numfiles = length(pngFiles);
    mydata = cell(1,numfiles);
    for j=1:409
        mydata{j} = imread(pngFiles(j).name);
        image = imresize(mydata{j},'OutputSize',[227 227]);
        myfilename = sprintf('data_%d.png',j+n);
        imwrite(image,myfilename);
    end
    delete file_*.png
end