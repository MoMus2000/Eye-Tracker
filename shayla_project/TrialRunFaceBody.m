%Trial Runs (no recording)

%% set up experimental parameters
%initiate random number generator
Screen('Preference', 'SkipSyncTests', 1);  %possible fix for screen error?
rand('twister',sum(100*clock));

%directories
PracticeStimuli_dir=[pwd '/PracticeStimuli'];
data_dir=[pwd '/DATA Face Body'];
functions_dir=[pwd '/functions'];
addpath(functions_dir);
NoiseMaskImageSize=[800 800]; %Change it to the size to the stimulus


%set stimuli path according to experimental condition, face or house
Condition=input('Experimental Condition, 1 for Face, 2 for Body:','s');
if str2double(Condition)==1 % condition 1, Face
    PracticeStimuli_dir=[PracticeStimuli_dir '/Face'];
elseif str2double(Condition)==2 % condition 2, House
    PracticeStimuli_dir=[PracticeStimuli_dir '/Body'];
end


%% Experimental Design
nTarget=5;          %number of targets
nDistractor=5;      %number of distractors
nTrials_training=nTarget;
nTrials_testing=nTarget;

AllImages=randperm(nTarget*2); %generate a random sequence
Targets=AllImages(1:nTarget);        %select the target images
Distractors=AllImages(nTarget+1:nTarget*2); %select the distractor images


%training trials
Design_training=zeros(nTrials_training,2);
Design_training(:,1)=Targets';              %image ID
Design_training(:,2)=randi(2,[nTarget 1]);  %image verion

%testing trials
Design_testing=zeros(nTrials_testing,5);
%targets
Design_testing(1:nTarget,1)=Design_training(:,1);   %target image ID
Design_testing(1:nTarget,2)=3-Design_training(:,2); %target image version
%distractors
Design_testing(1:nTarget,3)=Distractors';%distractor image ID
Design_testing(1:nTarget,4)=randi(2,[nDistractor 1]);   %distractor image version
%target and distractor position
Design_testing(1:nTarget,5)=randi(2,[nDistractor 1]);
%randomize the trial sequence
Design_testing=Design_testing(randperm(nTrials_testing),:);

%experiment timing
fixation_duration=.5;
Training_duration=15; %15
NoiseMask_duration=1;
Training_ISI=1;
Testing_ISI=1;

%% initial a psychtoolbox on screen window
screenNum=0;  %0 for native screen, 1 for external monitor
[wPtr, rect]=Screen('OpenWindow', screenNum);
ifi=Screen('GetFlipInterval',wPtr);
HideCursor;
gray=140;%background grayscale level, could be changed to a value of choice
fontSize=40;
Screen('FillRect', wPtr, gray); %fill the screen with gray value 
Screen('Flip',wPtr);

%press space bar to start the experiment
Screen('TextSize',wPtr,fontSize);
DrawFormattedText(wPtr, 'Press the space bar to start training', 'center', 'center', 0);
Screen('Flip',wPtr);
 while 1
    [ keyIsDown, Secs, keyCode ] = KbCheck;%check key press
     if keyIsDown
                if keyCode(44) %keycode 32 is Space bar. Mac 44
                    while KbCheck; end %wait till release key press, only one key press is recognized
                    break;
                end
     end
 end
 
%make a fixation cross
fixation=fixationcross(20,2,gray);
NoiseMask=uint8(randn(NoiseMaskImageSize)*50+gray); 

%% run training session as a for loop
for i=1:nTrials_training
%read the current image according to the design matrix
if Design_training(i,2)==1 %image version 1
    ImgName=[PracticeStimuli_dir '/' num2str(Design_training(i,1)) '.jpg'];
elseif Design_training(i,2)==2 %image version 2
    ImgName=[PracticeStimuli_dir '/' num2str(Design_training(i,1)) 'g.jpg'];
end
Img=imread(ImgName);
Img=imresize(Img,0.7);
%display fixation cross
PImgDsp(fixation,wPtr,fixation_duration,gray,ifi);
%display the current image for Training duration
PImgDsp(Img,wPtr,Training_duration,gray,ifi);
%display noise mask
PImgDsp(NoiseMask,wPtr,NoiseMask_duration,gray,ifi);
%ISI
WaitSecs(Training_ISI);
end



%% run testing session as a for loop
DrawFormattedText(wPtr, 'Press the space bar to start testing', 'center', 'center', 0);
Screen('Flip',wPtr);
 while 1
    [ keyIsDown, Secs, keyCode ] = KbCheck;%check key press
     if keyIsDown
                if keyCode(44) %keycode 32 is Space bar. Mac 44
                    while KbCheck; end %wait till release key press, only one key press is recognized
                    break;
                end
     end
 end
 
for i=1:nTrials_testing
%read the current images according to the design matrix

%target
if Design_testing(i,2)==1 %image version 1
    ImgName=[PracticeStimuli_dir '/' num2str(Design_testing(i,1)) '.jpg'];
elseif Design_testing(i,2)==2 %image version 2
    ImgName=[PracticeStimuli_dir '/' num2str(Design_testing(i,1)) 'g.jpg'];
end

%distractor
if Design_testing(i,4)==1 %image version 1
    ImgNameD=[PracticeStimuli_dir '/' num2str(Design_testing(i,3)) '.jpg'];
elseif Design_testing(i,4)==2 %image version 2
    ImgNameD=[PracticeStimuli_dir '/' num2str(Design_testing(i,3)) 'g.jpg'];
end

%image location
if Design_testing(i,5)==1 % target on the left
ImgL=imread(ImgName);
ImgL=imresize(ImgL,0.7);
ImgR=imread(ImgNameD);
ImgR=imresize(ImgR,0.7);
elseif Design_testing(i,5)==2 %target on the right
ImgR=imread(ImgName);
ImgR=imresize(ImgR,0.7);
ImgL=imread(ImgNameD);
ImgL=imresize(ImgL,0.7);    
end    
%display fixation cross
PImgDsp(fixation,wPtr,fixation_duration,gray,ifi);

S1=size(ImgL);
S2=size(ImgR);
S2(2)=S2(2)/(S2(1)/S1(1)); 
S2(1)=S1(1); %Same hight
dist=100;%distance between two images
%display the two testing images till response
tex1=Screen('MakeTexture', wPtr, ImgL);
tex2=Screen('MakeTexture', wPtr, ImgR);
%Screen('DrawText',wPtr,num2str(trial),5,5);
%screen position left top right bottom
Screen('DrawTexture', wPtr, tex1,[],[(rect(3)- (S1(2)*2+dist))/2 (rect(4)- S1(1))/2 (rect(3)-dist)/2 (rect(4)+ S1(1))/2]);
Screen('DrawTexture', wPtr, tex2,[],[(rect(3)+dist)/2 (rect(4)- S2(1))/2 (rect(3)+ 2*S2(2)+dist)/2 (rect(4)+ S2(1))/2]);

Screen('Flip', wPtr);
Start=GetSecs;
Screen('Close',tex1);
Screen('Close',tex2);


% collect response. 
  while 1
    [ keyIsDown, Secs, keyCode ] = KbCheck;%check key press
     if keyIsDown
                if keyCode(9) %'f', 70 Left. Mac 9 
                    while KbCheck; end %wait till release key press, only one key press is recognized
                    break;
                elseif keyCode(13) %'j', 74 Right. Mac 13
                    while KbCheck; end
                    break;
                elseif keyCode(15) %'1', 76 know this person. Mac 15.
                    while KbCheck; end
                    break;
                end  
     end
  end
  PImgDsp(NoiseMask,wPtr,NoiseMask_duration,gray,ifi);  % erase stimulus
  %ISI
  WaitSecs(Testing_ISI);
end


 %% end of the experiment
DrawFormattedText(wPtr, 'End of the trial session.', 'center', 'center', 0);
Screen('Flip',wPtr);
 while 1
    [ keyIsDown, Secs, keyCode ] = KbCheck;%check key press
     if keyIsDown
                if keyCode(44) %Space bar. Windows 32. Mac 44
                    while KbCheck; end %wait till release key press, only one key press is recognized
                    break;
                end
     end
 end
Screen('Flip',wPtr);
WaitSecs(0.5);
Screen('CloseAll');
ShowCursor;