%display image for a certain duration
function []=ImgDsp(Img,wPtr,Duration,white,ifi)
numifis=round(Duration/ifi);% duration as number of frames
texIndex=Screen('MakeTexture', wPtr, Img);
Screen('DrawTexture', wPtr, texIndex);
vbl=Screen('Flip', wPtr);
Screen('Close',texIndex);
tdeadline=vbl+numifis*ifi-0.5*ifi;
Screen('FillRect', wPtr, white);
Screen('Flip', wPtr,tdeadline);  % erase stimulus
end
