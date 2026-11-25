%Number of Types
exact_match_mask = strcmp(filepath_list(:,3), '정상');
exact_match_locations = find(exact_match_mask);
NumberofNormal = size(exact_match_locations);
NumberofNormal = NumberofNormal(1,1);

exact_match_mask = strcmp(filepath_list(:,3), '축정렬불량');
exact_match_locations = find(exact_match_mask);
NumberofE1 = size(exact_match_locations);
NumberofE1 = NumberofE1(1,1);

exact_match_mask = strcmp(filepath_list(:,3), '회전체불평형');
exact_match_locations = find(exact_match_mask);
NumberofE2 = size(exact_match_locations);
NumberofE2 = NumberofE2(1,1);

exact_match_mask = strcmp(filepath_list(:,3), '베어링불량');
exact_match_locations = find(exact_match_mask);
NumberofE3 = size(exact_match_locations);
NumberofE3 = NumberofE3(1,1);

exact_match_mask = strcmp(filepath_list(:,3), '벨트느슨함');
exact_match_locations = find(exact_match_mask);
NumberofE4 = size(exact_match_locations);
NumberofE4 = NumberofE4(1,1);

IndexforNormal=1;
IndexforE1=1;
IndexforE2=1;
IndexforE3=1;
IndexforE4=1;

windowlength = 1500;

for m= 2:70
if filepath_list(m,3) == "정상"
    cd('D:\기계시설물고장예지센서\data\datafolder\stft data set\training\normal');
    filepath = filepath_list(m,5);
    data_folder2 = tabularTextDatastore(filepath,NumHeaderLines=9,ReadVariableNames=false,MissingValue=0,SelectedVariableNames="Var2");
    data_folder2.ReadSize='file';
    Numberoffolder = size(data_folder2.Files);
    Numberoffolder = Numberoffolder(1,1);
    for n=1:Numberoffolder
        T2= read(data_folder2);
        rawdata = table2array(T2);
        stft(rawdata,4000,"Window",hamming(windowlength,"periodic"),"OverlapLength",windowlength/2,"FFTLength",12000)
        set(gca, 'Visible', 'off');
        colorbar('off');
        

        set(gca, 'Visible', 'off');
        filename = sprintf('normal_%d.png',n);
        export_fig(gcf,filename,'-transparent');
        close(gcf);
        IndexforNormal = IndexforNormal+1;
    end

elseif filepath_list(m,3) == "축정렬불량"
    cd('D:\기계시설물고장예지센서\data\datafolder\stft data set\training\E1');
    filepath = filepath_list(m,5);
    data_folder2 = tabularTextDatastore(filepath,NumHeaderLines=9,ReadVariableNames=false,MissingValue=0,SelectedVariableNames=["Var1","Var2"]);
    data_folder2.ReadSize='file';
    Numberoffolder = size(data_folder2.Files);
    Numberoffolder = Numberoffolder(1,1);

        for n=1:Numberoffolder
            T2= read(data_folder2);
            rawdata = table2array(T2(:,2));
            stft(rawdata,4000,"Window",hamming(windowlength,"periodic"),"OverlapLength",windowlength/2,"FFTLength",12000)
            set(gca, 'Visible', 'off');
            colorbar('off');
            filename = sprintf('E1_%d.png',n);
            export_fig(gcf,filename,'-transparent');
            close(gcf);
            IndexforE1 = IndexforE1+1;

        end

elseif filepath_list(m,3) == "회전체불평형"
    cd('D:\기계시설물고장예지센서\data\datafolder\stft data set\training\E2');
    filepath = filepath_list(m,5);
    data_folder2 = tabularTextDatastore(filepath,NumHeaderLines=9,ReadVariableNames=false,MissingValue=0,SelectedVariableNames=["Var1","Var2"]);
    data_folder2.ReadSize='file';
    Numberoffolder = size(data_folder2.Files);
    Numberoffolder = Numberoffolder(1,1);

        for n=1:Numberoffolder
            T2= read(data_folder2);
            rawdata = table2array(T2(:,2));
            stft(rawdata,4000,"Window",hamming(windowlength,"periodic"),"OverlapLength",windowlength/2,"FFTLength",12000)
            set(gca, 'Visible', 'off');
            colorbar('off');
            filename = sprintf('E2_%d.png',n);
            export_fig(gcf,filename,'-transparent');
            close(gcf);
            IndexforE2 = IndexforE2+1;

        end

elseif filepath_list(m,3) == "베어링불량"
    cd('D:\기계시설물고장예지센서\data\datafolder\stft data set\training\E3');
    filepath = filepath_list(m,5);
    data_folder2 = tabularTextDatastore(filepath,NumHeaderLines=9,ReadVariableNames=false,MissingValue=0,SelectedVariableNames=["Var1","Var2"]);
    data_folder2.ReadSize='file';
    Numberoffolder = size(data_folder2.Files);
    Numberoffolder = Numberoffolder(1,1);

        for n=1:Numberoffolder
            T2= read(data_folder2);
            rawdata = table2array(T2(:,2));
            stft(rawdata,4000,"Window",hamming(windowlength,"periodic"),"OverlapLength",windowlength/2,"FFTLength",12000)
            set(gca, 'Visible', 'off');
            colorbar('off');
            filename = sprintf('E3_%d.png',n);
            export_fig(gcf,filename,'-transparent');
            close(gcf);
            IndexforE3 = IndexforE3+1;

        end

elseif filepath_list(m,3) == "벨트느슨함"
    cd('D:\기계시설물고장예지센서\data\datafolder\stft data set\training\E4');
    filepath = filepath_list(m,5);
    data_folder2 = tabularTextDatastore(filepath,NumHeaderLines=9,ReadVariableNames=false,MissingValue=0,SelectedVariableNames=["Var1","Var2"]);
    data_folder2.ReadSize='file';
    Numberoffolder = size(data_folder2.Files);
    Numberoffolder = Numberoffolder(1,1);

        for n=1:Numberoffolder
            T2= read(data_folder2);
            rawdata = table2array(T2(:,2));
            stft(rawdata,4000,"Window",hamming(windowlength,"periodic"),"OverlapLength",windowlength/2,"FFTLength",12000)
            set(gca, 'Visible', 'off');
            colorbar('off');
            filename = sprintf('E4_%d.png',n);
            export_fig(gcf,filename,'-transparent');
            close(gcf);
            IndexforE4 = IndexforE4+1;

        end

end

end
%% validation
exact_match_mask = strcmp(filepath_list_validation(:,3), '정상');
exact_match_locations = find(exact_match_mask);
NumberofNormal = size(exact_match_locations);
NumberofNormal = NumberofNormal(1,1);

exact_match_mask = strcmp(filepath_list_validation(:,3), '축정렬불량');
exact_match_locations = find(exact_match_mask);
NumberofE1 = size(exact_match_locations);
NumberofE1 = NumberofE1(1,1);

exact_match_mask = strcmp(filepath_list_validation(:,3), '회전체불평형');
exact_match_locations = find(exact_match_mask);
NumberofE2 = size(exact_match_locations);
NumberofE2 = NumberofE2(1,1);

exact_match_mask = strcmp(filepath_list_validation(:,3), '베어링불량');
exact_match_locations = find(exact_match_mask);
NumberofE3 = size(exact_match_locations);
NumberofE3 = NumberofE3(1,1);

exact_match_mask = strcmp(filepath_list_validation(:,3), '벨트느슨함');
exact_match_locations = find(exact_match_mask);
NumberofE4 = size(exact_match_locations);
NumberofE4 = NumberofE4(1,1);

IndexforNormal=1;
IndexforE1=1;
IndexforE2=1;
IndexforE3=1;
IndexforE4=1;

windowlength = 1500;

for m= 2:70
if filepath_list_validation(m,3) == "정상"
    cd('D:\기계시설물고장예지센서\data\datafolder\stft data set\validation\normal');
    filepath = filepath_list_validation(m,5);
    data_folder2 = tabularTextDatastore(filepath,NumHeaderLines=9,ReadVariableNames=false,MissingValue=0,SelectedVariableNames=["Var1","Var2"]);
    data_folder2.ReadSize='file';
    Numberoffolder = size(data_folder2.Files);
    Numberoffolder = Numberoffolder(1,1);
    for n=1:Numberoffolder
        T2= read(data_folder2);
        rawdata = table2array(T2(:,2));
        stft(rawdata,4000,"Window",hamming(windowlength,"periodic"),"OverlapLength",windowlength/2,"FFTLength",12000)
        set(gca, 'Visible', 'off');
        colorbar('off');
        filename = sprintf('normal_%d.png',n);
        export_fig(gcf,filename,'-transparent');
        close(gcf);
        IndexforNormal = IndexforNormal+1;

    end

elseif filepath_list_validation(m,3) == "축정렬불량"
    cd('D:\기계시설물고장예지센서\data\datafolder\stft data set\validation\E1');
    filepath = filepath_list_validation(m,5);
    data_folder2 = tabularTextDatastore(filepath,NumHeaderLines=9,ReadVariableNames=false,MissingValue=0,SelectedVariableNames=["Var1","Var2"]);
    data_folder2.ReadSize='file';
    Numberoffolder = size(data_folder2.Files);
    Numberoffolder = Numberoffolder(1,1);

        for n=1:Numberoffolder
            T2= read(data_folder2);
            rawdata = table2array(T2(:,2));
            stft(rawdata,4000,"Window",hamming(windowlength,"periodic"),"OverlapLength",windowlength/2,"FFTLength",12000)
            set(gca, 'Visible', 'off');
            colorbar('off');
            filename = sprintf('E1_%d.png',n);
            export_fig(gcf,filename,'-transparent');
            close(gcf);
            IndexforE1 = IndexforE1+1;

        end

elseif filepath_list_validation(m,3) == "회전체불평형"
    cd('D:\기계시설물고장예지센서\data\datafolder\stft data set\validation\E2');
    filepath = filepath_list_validation(m,5);
    data_folder2 = tabularTextDatastore(filepath,NumHeaderLines=9,ReadVariableNames=false,MissingValue=0,SelectedVariableNames=["Var1","Var2"]);
    data_folder2.ReadSize='file';
    Numberoffolder = size(data_folder2.Files);
    Numberoffolder = Numberoffolder(1,1);

        for n=1:Numberoffolder
            T2= read(data_folder2);
            rawdata = table2array(T2(:,2));
            stft(rawdata,4000,"Window",hamming(windowlength,"periodic"),"OverlapLength",windowlength/2,"FFTLength",12000)
            set(gca, 'Visible', 'off');
            colorbar('off');
            filename = sprintf('E2_%d.png',n);
            export_fig(gcf,filename,'-transparent');
            close(gcf);
            IndexforE2 = IndexforE2+1;

        end

elseif filepath_list_validation(m,3) == "베어링불량"
    cd('D:\기계시설물고장예지센서\data\datafolder\stft data set\validation\E3');
    filepath = filepath_list_validation(m,5);
    data_folder2 = tabularTextDatastore(filepath,NumHeaderLines=9,ReadVariableNames=false,MissingValue=0,SelectedVariableNames=["Var1","Var2"]);
    data_folder2.ReadSize='file';
    Numberoffolder = size(data_folder2.Files);
    Numberoffolder = Numberoffolder(1,1);

        for n=1:Numberoffolder
            T2= read(data_folder2);
            rawdata = table2array(T2(:,2));
            stft(rawdata,4000,"Window",hamming(windowlength,"periodic"),"OverlapLength",windowlength/2,"FFTLength",12000)
            set(gca, 'Visible', 'off');
            colorbar('off');
            filename = sprintf('E3_%d.png',n);
            export_fig(gcf,filename,'-transparent');
            close(gcf);
            IndexforE3 = IndexforE3+1;

        end

elseif filepath_list_validation(m,3) == "벨트느슨함"
    cd('D:\기계시설물고장예지센서\data\datafolder\stft data set\validation\E4');
    filepath = filepath_list_validation(m,5);
    data_folder2 = tabularTextDatastore(filepath,NumHeaderLines=9,ReadVariableNames=false,MissingValue=0,SelectedVariableNames=["Var1","Var2"]);
    data_folder2.ReadSize='file';
    Numberoffolder = size(data_folder2.Files);
    Numberoffolder = Numberoffolder(1,1);

        for n=1:Numberoffolder
            T2= read(data_folder2);
            rawdata = table2array(T2(:,2));
            stft(rawdata,4000,"Window",hamming(windowlength,"periodic"),"OverlapLength",windowlength/2,"FFTLength",12000)
            set(gca, 'Visible', 'off');
            colorbar('off');
            filename = sprintf('E4_%d.png',n);
            export_fig(gcf,filename,'-transparent');
            close(gcf);
            IndexforE4 = IndexforE4+1;

        end

end
end


