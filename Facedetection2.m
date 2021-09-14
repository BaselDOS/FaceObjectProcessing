%% loading the image
[name,path]=uigetfile('*.*','Select the input file');
location=strcat(path,name);
Im=imread(location);

%% creating the detector
faceDetector=vision.CascadeObjectDetector('FrontalFaceCART');
faceDetector.MergeThreshold=7;
bboxes=step(faceDetector,Im);

%% cheking if we detect a face

if(~isempty(bboxes))
    ImFaceDetected=insertObjectAnnotation(Im,'rectangle',bboxes,'Face','LineWidth',3);
    imshow(ImFaceDetected);
    title('Detected Face');
else
    position=[0 0];
    label('Sorry! No Face Detected');
    ImNoFaceDetected=insertText(Im,position,label,'FontSize',25,'Boxopacity',1);
    imshow(ImNoFaceDetected);
end













