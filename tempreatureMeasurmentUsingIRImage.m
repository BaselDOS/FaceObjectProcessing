%%

Moving=imread('C:\Users\manso\Desktop\work\MATLABPractice\mansFaceWebcamImage.png');
Fixed=imread('C:\Users\manso\Desktop\work\MATLABPractice\mansFaceWebcamIRImage.png');
Moving=rgb2gray(Moving);

%% view both
imshow(Moving);
imtool(Fixed);

%% view both in a montage
figure;
imshowpair(Fixed,Moving,'montage');

%% configure parameters in imreconfig

[optimizer,metric]=imregconfig('Multimodal');

%% default registiration 
registerated=imregister(Moving,Fixed,'translation',optimizer,metric);
figure;
imshowpair(registerated,Fixed);
title('falseColor');

