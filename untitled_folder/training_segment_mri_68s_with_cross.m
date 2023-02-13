% Main Code for Udichi's Project (MRI)
% Date 9th February 2023
% Contributor(s): Mustafa Muhammad 

Screen('Preference', 'SkipSyncTests', 1); % Removes any unsolved errors
% function_dir = [pwd '/functions'];
NoiseMaskImageSize=[1080 720]; %Change it to the size to the stimulus

gray=140;%background grayscale level, could be changed to a value of choice
fontSize=40;

% fixation=fixationcross(20,2,gray);
NoiseMask=uint8(randn(NoiseMaskImageSize)*50+gray); 


% addpath(function_dir); 


dummymode=0;
screenNum=0;
[wPtr, rect]=Screen('OpenWindow', screenNum);
ifi=Screen('GetFlipInterval',wPtr);
[width, height]=Screen('WindowSize', screenNum);

Screen('FillRect', wPtr, gray); %fill the screen with gray value 
Screen('Flip',wPtr);

% Screen('TextSize',wPtr,fontSize);
% DrawFormattedText(wPtr, 'Press the space bar to start the study...', 'center', 'center', 0);
% Screen('Flip',wPtr);
%  while 1
%     [ keyIsDown, Secs, keyCode ] = KbCheck;%check key pressclc
%      if keyIsDown
%                 if keyCode(44) %keycode 32 is Space bar. Mac 44
%                     while KbCheck; end %wait till release key press, only one key press is recognized
%                     break;
%                 end
%      end
%  end

% MRI SYNC
triggerkey = KbName('5%');

while KbCheck; end

while 1
    [keyIsDown, secs, keyCode] = KbCheck(-1);
    if keyCode(triggerkey)
        start_time = GetSecs;
        break
    end
end

try 
      movie_path = '/Users/desouza/Desktop/untitled_folder/IMG_8095_resized.mp4';
catch e
    disp(e.message)
    debug();
end


Screen('TextSize',wPtr,fontSize);
DrawFormattedText(wPtr, 'X', 'center', 'center', 0);
Screen('Flip',wPtr);
WaitSecs(30); 

% Trial 1
movie_ptr = Screen('OpenMovie', wPtr, movie_path);
Screen('PlayMovie', movie_ptr,  1);
while 1
    tex = Screen('GetMovieImage', wPtr, movie_ptr);
    if tex<=0
        break
    end  
    Screen('DrawTexture', wPtr, tex, [], [], 0);
    Screen('Flip', wPtr);
    Screen('Close', tex);  
end

Screen('TextSize',wPtr,fontSize);
DrawFormattedText(wPtr, 'X', 'center', 'center', 0);
Screen('Flip',wPtr);
WaitSecs(30);

% Trial 2
movie_ptr = Screen('OpenMovie', wPtr, movie_path);
Screen('PlayMovie', movie_ptr,  1);
while 1
    tex = Screen('GetMovieImage', wPtr, movie_ptr);
    if tex<=0
        break
    end  
    Screen('DrawTexture', wPtr, tex, [], [], 0);
    Screen('Flip', wPtr);
    Screen('Close', tex);  
end

Screen('TextSize',wPtr,fontSize);
DrawFormattedText(wPtr, 'X', 'center', 'center', 0);
Screen('Flip',wPtr);
WaitSecs(30);

% Trial 3
movie_ptr = Screen('OpenMovie', wPtr, movie_path);
Screen('PlayMovie', movie_ptr,  1);
while 1
    tex = Screen('GetMovieImage', wPtr, movie_ptr);
    if tex<=0
        break
    end  
    Screen('DrawTexture', wPtr, tex, [], [], 0);
    Screen('Flip', wPtr);
    Screen('Close', tex);  
end

Screen('TextSize',wPtr,fontSize);
DrawFormattedText(wPtr, 'X', 'center', 'center', 0);
Screen('Flip',wPtr);
WaitSecs(30);

% Trial 4
movie_ptr = Screen('OpenMovie', wPtr, movie_path);
Screen('PlayMovie', movie_ptr,  1);
while 1
    tex = Screen('GetMovieImage', wPtr, movie_ptr);
    if tex<=0
        break
    end  
    Screen('DrawTexture', wPtr, tex, [], [], 0);
    Screen('Flip', wPtr);
    Screen('Close', tex);  
end

Screen('TextSize',wPtr,fontSize);
DrawFormattedText(wPtr, 'X', 'center', 'center', 0);
Screen('Flip',wPtr);
WaitSecs(30); 

% Trial 5
movie_ptr = Screen('OpenMovie', wPtr, movie_path);
Screen('PlayMovie', movie_ptr,  1);
while 1
    tex = Screen('GetMovieImage', wPtr, movie_ptr);
    if tex<=0
        break
    end  
    Screen('DrawTexture', wPtr, tex, [], [], 0);
    Screen('Flip', wPtr);
    Screen('Close', tex);  
end

Screen('CloseAll');