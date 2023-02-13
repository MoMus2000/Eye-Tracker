function [] = movementArrow(wPtr, fontSize, x, y, movement)

if strcmp(movement, 'Center')
    Screen('TextSize',wPtr,fontSize);
    DrawFormattedText(wPtr, 'X',  x*2, y, 0);
    Screen('Flip',wPtr);
    WaitSecs(2);
end
  
if strcmp(movement, 'Right')
    Screen('TextSize',wPtr,fontSize);
    DrawFormattedText(wPtr, 'X',  (x*2) * 1.9 , y , 0);
    Screen('Flip',wPtr);     
    WaitSecs(2);
end

if strcmp(movement, 'Up')
    Screen('TextSize',wPtr,fontSize);
    DrawFormattedText(wPtr, 'X',  x*2, y*0.1, 0);
    Screen('Flip',wPtr);
    WaitSecs(2);
end

if strcmp(movement, 'Down')
    Screen('TextSize',wPtr,fontSize);
    DrawFormattedText(wPtr, 'X',  x*2, y*1.9 , 0);
    Screen('Flip',wPtr);
    WaitSecs(2);
end

if strcmp(movement, 'Left')
    Screen('TextSize',wPtr,fontSize);
    DrawFormattedText(wPtr, 'X',  (x*2) * 0.1, y, 0);  
    Screen('Flip',wPtr);
    WaitSecs(2);
end

end