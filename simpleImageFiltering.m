%% loading the image
[name,path]=uigetfile('*.*','Select an image');
loc=strcat(path,name);
im=imread(loc);

%% 
imd=im2double(im);
f=ones(3,3)/9;
imf1=imfilter(imd,f);
figure;
imshowpair(im,imf1,'montage');
%% creating special filters
hsize=[3,3];
h1=fspecial('average',hsize);
radius=3;
h2=fspecial('disk',radius);
hsize=[3,3];sigma=0.8;
h3=fspecial('gaussian',hsize,sigma);
alpha=0.8;
h4=fspecial('laplacian',alpha);
len=2.5;theta=0.6;
h5=fspecial('motion',len,theta);
h6=fspecial('prewitt');
h7=fspecial('sobel');

im1=imfilter(imd,h1);
im2=imfilter(imd,h2);
im3=imfilter(imd,h3);
im4=imfilter(imd,h4);
im5=imfilter(imd,h5);
im6=imfilter(imd,h6);
im7=imfilter(imd,h7);
figure(1)
imshow(im1);
figure(2)
imshow(im2);
figure(3)
imshow(im3);
figure(4)
imshow(im4);
figure(5)
imshow(im5);
figure(6)
imshow(im6);
figure(7)
imshow(im7);
figure(8) 
imshow(im);
