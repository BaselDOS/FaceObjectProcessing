%%
[file,path]=uigetfile('*.*','Select an image');
loc=strcat(path,file);
pic=imread(loc);

%%
figure(1)
subplot(1,2,1)
imshow(pic);
grayscaled=rgb2gray(pic);
subplot(1,2,2)
imshow(grayscaled);

%%
faceDetector=vision.CascadeObjectDetector('FrontalFaceCART');
faceDetector.MergeThreshold=10;
bbox=step(faceDetector,pic);
quaryface=insertShape(pic,'rectangle',bbox,'LineWidth',1);
figure(2)
imshow(quaryface);
title('Detected Face');

%%
qface=imcrop(quaryface,bbox);
scalefacor=150/size(quaryface,1);
qface=imresize(qface,scalefacor);
figure;imshow(qface);title('Face');

%%
gray=rgb2gray(qface);
imwrite(rgb2gray(qface),loc);

