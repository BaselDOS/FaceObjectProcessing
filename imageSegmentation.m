%% loading the image
im=imread('C:\Users\manso\Desktop\work\MATLABPractice\imageprossesingpractice\ToysCandy.jpg');
imshow(im);

%% convert to grayscale
Igray=rgb2gray(im);
imshow(Igray);

%% illumination doesn't allow for easy segmentation

level=0.6;% anything above it is going to be white and below it black
Ithresh=im2bw(Igray,level);
imshowpair(im,Ithresh,'montage');

%% RGB color space

rmat=im(:,:,1);
gmat=im(:,:,2);
bmat=im(:,:,3);

figure;
subplot(2,2,1),imshow(rmat);
title('Red Plane');
subplot(2,2,2),imshow(gmat);
title('Green Plane');
subplot(2,2,3),imshow(bmat);
title('Blue Plane');
subplot(2,2,4),imshow(im);
title('Original Image');

%% 
levelr=0.63;
levelg=0.5;
levelb=0.4;
i1=im2bw(rmat,levelr);
i2=im2bw(gmat,levelg);
i3=im2bw(bmat,levelb);
isum=(i1&i2&i3);

figure;
subplot(2,2,1),imshow(i1);
title('Red Plane');
subplot(2,2,2),imshow(i2);
title('Green Plane');
subplot(2,2,3),imshow(i3);
title('Blue Plane');
subplot(2,2,4),imshow(isum);
title('Sum of all the planes Image');

%% complement and filling the image

Icomp=imcomplement(isum);
Ifilled=imfill(Icomp,'holes');
figure;imshow(Ifilled);

%% 
se=strel('disk',25);
Iopenned=imopen(Ifilled,se);
figure;imshow(Iopenned);

%% Ectract features
Iregion=regionprops(Iopenned,'centroid');
[labeled,objectsNumber]=bwlabel(Iopenned,4);
stats=regionprops(labeled,'Eccentricity','Area','BoundingBox');
areas=[stats.Area];
eccentricities=[stats.Eccentricity];

%% use features analysis to count skittles objects

idxOfSkittles=find(eccentricities);
statsDefects=stats(idxOfSkittles);
figure;imshow(im);
hold on;
for idx=1:length(idxOfSkittles)
    h=rectangle('Position',statsDefects(idx).BoundingBox,'LineWidth',3);
    set(h,'EdgeColor',[.75 0 0]);
    hold on;
end
if (idx>10)
    title(['There are ',num2str(objectsNumber),' objects in the image']);
end
hold off


















