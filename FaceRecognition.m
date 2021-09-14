%%
faceDatabase=imageSet('CelebrityDataBase','recursive');

%%
figure;
montage(faceDatabase(1).ImageLocation);
title('Images of single Face');