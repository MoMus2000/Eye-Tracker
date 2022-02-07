%display image for a certain duration
function []=ImgDsp(Img,wPtr,Duration,white,ifi,trialComponent,imgName,width,height)
numifis=round(Duration/ifi);% duration as number of frames
texIndex=Screen('MakeTexture', wPtr, Img);
Screen('DrawTexture', wPtr, texIndex);
vbl=Screen('Flip', wPtr);
if trialComponent == 1
     Eyelink('Message', 'DISPLAY_FIXATION_CROSS');
elseif trialComponent == 2
     Eyelink('Message', 'DISPLAY_IMAGE');
%XXXXXXXXXX Note from Marcus
% You will likely need to fix width/4, heigh/2 and width*3/4, height/2 for
% the following lines to represent the actual position
%you will also likely have to add two extra arguments for actual width and
%height of images used -- these would go after width/2 and height/2 and you
%see below
     Eyelink('Message', '!V IMGLOAD CENTER %s %d %d', imgName, width/2, height/2);
     %YOU PROBABLY WANT TO DO SOMETHING LIKE THE FOLLOWING, where imgWidth is the width of the image and imgHeight is
    %the height of the image
    %imgWidth = 200
    %imgHeight = 400
    %Eyelink('Message', '!V IMGLOAD CENTER %s %d %d %d %d', imgR, width/4, height/2, imgWidth, imgHeight);
    %Eyelink('Message', '!V IMGLOAD CENTER %s %d %d %d %d', imgR, 3*width/4, height/2, imgWidth, imgHeight);
elseif trialComponent == 3
     Eyelink('Message', 'DISPLAY_MASK');
     Eyelink('Message', 'CLEAR 140 140 140');
end
Screen('Close',texIndex);
tdeadline=vbl+numifis*ifi-0.5*ifi;
Screen('FillRect', wPtr, white);
Screen('Flip', wPtr,tdeadline);  % erase stimulus
Eyelink('Message', 'CLEAR_SCREEN');
end
