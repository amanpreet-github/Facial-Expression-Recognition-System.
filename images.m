url= 'http://192.168.43.178:8080/shot.jpg';
img = imread(url);
imshow(img);

%// this is where and what your image will be saved
counter  = 1;
baseDir  = 'C:\Users\aman\Desktop\sir_file\fer\sample\';
baseName = 'image_';
newName  = [baseDir baseName num2str(counter) '.jpg'];
while exist(newName,'file')
    counter = counter + 1;
    newName = [baseDir baseName num2str(counter) '.jpg'];
end    
imwrite(img, newName);