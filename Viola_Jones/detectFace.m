function faces= detectFace(InImages,TrainData)


scaleWidth = InImages.width/TrainData.size(1);
scaleHeight = InImages.height/TrainData.size(2);

if(scaleHeight < scaleWidth )
    Startscale =  scaleHeight;
else
    Startscale = scaleWidth;
end

scaleUpdateRatio = 1/1.2;

% Calculate maximum of search scale itterations
maxitr=ceil(log(1/Startscale)/log(scaleUpdateRatio));

faces = [];

for i=1:maxitr
    scale = Startscale*scaleUpdateRatio^(i-1);
    
  
    w = floor(TrainData.size(1)*scale);
    h = floor(TrainData.size(2)*scale);
    
    stepsize = floor(max( scale, 2 ));
    [x,y]=ndgrid(0:stepsize:(InImages.width-w-1),0:stepsize:(InImages.height-h-1));
    x=x(:); y=y(:);
    
    if(~isempty(x))
        
        [x,y] = oneScale( InImages, TrainData, x, y, scale, w, h);
       
       
        for k=1:length(x);
            faces = [faces;[x(k) y(k) w h]];
        end
        
       
        
    end
end
