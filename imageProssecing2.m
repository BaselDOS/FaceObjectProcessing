originalColor=imread('C:\Users\manso\Desktop\work\MATLABPractice\histo.jpg');
imshow(originalColor);
%imtool(im);
%% 
figure
imhist(originalColor(:,:,1));

%% step 3 plotting all bands
r=originalColor(:,:,1);
g=originalColor(:,:,2);
b=originalColor(:,:,3);

figure
plot3(r(:),g(:),b(:),'.');
grid on;
xlabel('Red (Band 3)');
ylabel('Green (Band 2)');
zlabel('Blue (Band 1)');
title('Scatterplot of the visible Bands');

%% step 4 enhance true color comosite with contrast stretch
stretched_originalColor=imadjust(originalColor,stretchlim(originalColor));
figure
imshow(stretched_originalColor);
title('Original Color Composite after Contrast Stretch');

%% check histogram after stretching
figure
imhist(stretched_originalColor(:,:,1));
title('Histogram of Red Band (Band 3) after Contrast Stretch');

%% Decorrelation Stretch
decorrstretched_OriginalColor=decorrstretch(originalColor,'Tol',0.01);

figure
imshow(decorrstretched_OriginalColor);
title('Original Color Composite after decorrelation Stretch');
%%
r=decorrstretched_OriginalColor(:,:,1);
g=decorrstretched_OriginalColor(:,:,2);
b=decorrstretched_OriginalColor(:,:,3);

figure
plot3(r(:),g(:),b(:),'.');
grid on;
xlabel('Red (Band 3)');
ylabel('Green (Band 2)');
zlabel('Blue (Band 1)');
title('Scatterplot of the visible Bands');









