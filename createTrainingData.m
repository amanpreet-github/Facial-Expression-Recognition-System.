% this code creates the Training_data folder which contains the expression
% categorised files in respective folders from extended cohn-kanade

mkdir('Training_data\0');
mkdir('Training_data\1');
mkdir('Training_data\2');
mkdir('Training_data\3');
mkdir('Training_data\4');
mkdir('Training_data\5');
mkdir('Training_data\6');
mkdir('Training_data\7');

% code for adding cohn-kanade files
emotion_files=getAllFiles('Emotion_labels');
for i=1:size(emotion_files)
    file_path=emotion_files{i};
    disp(file_path);
    file_name=file_path(15:41);
    disp(file_name);
   peak_image_path=strcat('extended-cohn-kanade-images\cohn-kanade-images',file_name,'.png');
   disp(peak_image_path);
    neutral_image_path=strcat('extended-cohn-kanade-images\cohn-kanade-images',file_name(1:19),'00000001.png');
    disp(neutral_image_path);
    fileID=fopen(file_path,'r');
    emotion=fscanf(fileID,'%d');
    fclose(fileID);
    
    I = imread(peak_image_path);
   
    
    emotion=int2str(emotion);
  
    f=strcat('Training_data\',emotion,'\',file_name(11:27),'.png');
    
    fid=fopen(f,'w+');
    imwrite(I,f);
    fclose(fid);
    
    %adding the neutral image
    I = imread(neutral_image_path);
    f=strcat('Training_data\0\',neutral_image_path(57:77));
    fid=fopen(f,'w+');
    imwrite(I,f);
    fclose(fid);
end

