function [X,Y,height,width] = violaJones(img)
% Viola Jones is performed here

load('TrainData.mat')

faces = detectFace(integralImage(img),TrainData);




X = mean(faces(:,1));
Y = mean(faces(:,2));
height = mean(faces(:,3));
width = mean(faces(:,4));
dwidth = 0.25*width;
width = width - dwidth;
X = X + 0.5*dwidth;

dheight = 0.175*height;
height = height - dheight - 0.05*height;
Y = Y + dheight;

end




