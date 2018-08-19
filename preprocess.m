function [trainX,trainY] = preprocess()

files = getAllFiles('cohn_kanade_train');

no_files = length(files);
disp(no_files);
trainX = zeros(no_files,177);
trainY = zeros(no_files,7);

disp('Training_data')
for i=1:no_files
    filename = files{i};
    Im = imread(filename);
    
    hist = featureDetect(Im);
    
    trainX(i,:) = hist;
     disp(filename(19));
    trainY(i,str2double(filename(19))+1) = 1;
    
    i
end

files = getAllFiles('cohn_kanade_test');


no_files = length(files);

testX = zeros(no_files,177);
testY = zeros(no_files,7);

disp('Test Data');
for i=1:no_files
    filename = files{i};
    
    Im = imread(filename);
    
    hist = featureDetect(Im);
    
    testX(i,:) = hist;
    
   
    testY(i,str2double(filename(18))+1) = 1;
   
    
    i
end


save('meradata.mat','trainX','trainY','testX','testY');

end