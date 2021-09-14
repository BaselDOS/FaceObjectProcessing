warning('off');
pic=imread('C:\Users\manso\Desktop\work\MATLABPractice\test.jpg');
imshow(pic);

box=[500 500 100 100];
pic2=insertShape(pic,'rectangle',box,'LineWidth',3,'Color','blue');
imshow(pic2);

polypoints=[500 500 750 250 1000 500 1000 1000 500 1000];
pic3=insertShape(pic2,'polygon',polypoints,'LineWidth',5,'Color','Yellow');
imshow(pic3);
%%
pos=[510 510;590 550;560 540];
pic4=insertMarker(pic3,pos,'+','Color','Yellow','Size',10);
imshow(pic4);
%%
cor=detectMinEigenFeatures(rgb2gray(pic),'ROI',[500 500 600 600]);
picpts=insertMarker(pic,cor,'+');
imshow(picpts);