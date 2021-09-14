im=imread('friends.jpg'); %load the image
%%
imshow(im); %show the image
[file,path]=uigetfile('*.*','Select an image');%getting file name and path
loc=strcat(path,file);% connecting the file name to the path 
%%
pic=imread(loc);% saving the image from the location to a parameter
imshow(pic);% displaying the image
%%
imgray=rgb2gray(pic);%converting image from RGB to GrayScale image
imshow(imgray); %Displaying the image


