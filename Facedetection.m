%% Loading the image
im=imread('friends.jpg');%load image
[file,path]=uigetfile('*.*','Select an image'); %select file and path
loc=strcat(path,file);% connect the file name and the path
pic=imread(loc); % read the image using the location we got
graypic=rgb2gray(pic); %convert the image to grayscale
%% Detecting the faces
detectorFace=vision.CascadeObjectDetector('FrontalFaceCART');%creat a model to detect the face using vision tool box
detectorFace.MergeThreshold=7;
boundingBox=step(detectorFace,pic);%star the bounding box corner points of the facedetected using step function
detpic=insertObjectAnnotation(pic,'Rectangle',boundingBox,'Face','LineWidth',3);
imshow(detpic);

