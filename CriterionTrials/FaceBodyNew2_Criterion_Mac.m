
%Face/body recognition experiment
%% set up experimental parameters
%initiate random number generator
Screen('Preference', 'SkipSyncTests', 1);  %possible fix for screen error?
rand('twister',sum(100*clock));

%directories
stimuli_dir=[pwd '/stimuli'];
data_dir=[pwd '/data'];
functions_dir=[pwd '/functions'];
addpath(functions_dir);
NoiseMaskImageSize=[800 800]; %Change it to the size to the stimulus
%input subject id 
subj_id=input('Subject ID:','s');

%set stimuli path according to experimental condition, face or house
Condition=input('Experimental Condition, 1 for Face, 2 for Body:','s');
if str2double(Condition)==1 % condition 1, Face
    stimuli_dir=[stimuli_dir '/Face'];
elseif str2double(Condition)==2 % condition 2, House
    stimuli_dir=[stimuli_dir '/Body'];
end

%open a data file with subject id and condition as part of the file name
datafile=fopen([data_dir '/' subj_id '_Condition' Condition '_' date '.txt'],'a+');
%write the header line in the data file
fprintf(datafile, 'Session Trial TargetID ImageVersion DistractorID Response Correct ResposeTime\n');
%Session: 0-training, 1-testing;
%Response: 1-left, 2-right; 
%Example, for training trials, response and correct are not recorded,
%FoilID is 0
%Session Trial TargetID ImageVersion DistractorID  Response Correct ResponseTime
%0       10      14        1            0              0      0        0
%Example testing trials
%Session Trial TargetID ImageVersion DistractorID  Response Correct ResponseTime
%1       10      14         1           18            1      1         1.22
%1       11      12         2           13            2      0         1.34

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
                if keyCode(49) %keycode 32 is Space bar.  Mac 49
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
    ImgName=[stimuli_dir '/' num2str(Design_training(i,1)) '.jpg'];
elseif Design_training(i,2)==2 %image version 2
    ImgName=[stimuli_dir '/' num2str(Design_training(i,1)) 'g.jpg'];
end
Img=imread(ImgName);
Img=imresize(Img,0.9);
%display fixation cross
ImgDsp(fixation,wPtr,fixation_duration,gray,ifi);
%display the current image for Training duration
ImgDsp(Img,wPtr,Training_duration,gray,ifi);
%display noise mask
ImgDsp(NoiseMask,wPtr,NoiseMask_duration,gray,ifi);
%Write the trial information
fprintf(datafile,'%d %d %d %d %d %d %d %2.4f\n',0,i,Design_training(i,1),Design_training(i,2),0,0,0,0);
%ISI
WaitSecs(Training_ISI);
end



%% run testing session as a for loop
DrawFormattedText(wPtr, 'Press the space bar to start testing', 'center', 'center', 0);
Screen('Flip',wPtr);
 while 1
    [ keyIsDown, Secs, keyCode ] = KbCheck;%check key press
     if keyIsDown
                if keyCode(49) %keycode 32 is Space bar. Mac 49
                    while KbCheck; end %wait till release key press, only one key press is recognized
                    break;
                end
     end
 end
 
for i=1:nTrials_testing
%read the current images according to the design matrix

%target
if Design_testing(i,2)==1 %image version 1
    ImgName=[stimuli_dir '/' num2str(Design_testing(i,1)) '.jpg'];
elseif Design_testing(i,2)==2 %image version 2
    ImgName=[stimuli_dir '/' num2str(Design_testing(i,1)) 'g.jpg'];
end

%distractor
if Design_testing(i,4)==1 %image version 1
    ImgNameD=[stimuli_dir '/' num2str(Design_testing(i,3)) '.jpg'];
elseif Design_testing(i,4)==2 %image version 2
    ImgNameD=[stimuli_dir '/' num2str(Design_testing(i,3)) 'g.jpg'];
end

%image location
if Design_testing(i,5)==1 % target on the left
ImgL=imread(ImgName);
ImgL=imresize(ImgL,0.9);
ImgR=imread(ImgNameD);
ImgR=imresize(ImgR,0.9);
elseif Design_testing(i,5)==2 %target on the right
ImgR=imread(ImgName);
ImgR=imresize(ImgR,0.9);
ImgL=imread(ImgNameD);
ImgL=imresize(ImgL,0.9);    
end    
%display fixation cross
ImgDsp(fixation,wPtr,fixation_duration,gray,ifi);

S1=size(ImgL);
S2=size(ImgR);
S=S1;
dist=100;%distance between two images
%display the two testing images till response
tex1=Screen('MakeTexture', wPtr, ImgL);
tex2=Screen('MakeTexture', wPtr, ImgR);
%Screen('DrawText',wPtr,num2str(trial),5,5);
Screen('DrawTexture', wPtr, tex1,[],[(rect(3)- (S(2)*2+dist))/2+(S(2)-S1(2))/2 (rect(4)- S(1))/2+(S(1)-S1(1))/2 (rect(3)-dist)/2-(S(2)-S1(2))/2 (rect(4)+ S(1))/2-(S(1)-S1(1))/2]);
Screen('DrawTexture', wPtr, tex2,[],[(rect(3)+dist)/2+(S(2)-S2(2)) (rect(4)- S(1))/2+(S(1)-S2(1))/2 (rect(3)+ 2*S(2)+dist)/2+(S(2)-S2(2))/2 (rect(4)+ S(1))/2-(S(1)-S2(1))/2]);

Screen('Flip', wPtr);
Start=GetSecs;
Screen('Close',tex1);
Screen('Close',tex2);


% collect response. 
  while 1
    [ keyIsDown, Secs, keyCode ] = KbCheck;%check key press
     if keyIsDown
                if keyCode(16) %'f', 70 Left. Mac 16 
                    while KbCheck; end %wait till release key press, only one key press is recognized
                    fprintf(datafile,'%d %d %d %d %d %d %d %2.4f\n',1,i,Design_testing(i,1),Design_testing(i,2),Design_testing(i,3),1,Design_testing(i,5)==1,GetSecs-Start);
                    break;
                elseif keyCode(8) %'j', 74 Right. Mac 8
                    while KbCheck; end
                    fprintf(datafile,'%d %d %d %d %d %d %d %2.4f\n',1,i,Design_testing(i,1),Design_testing(i,2),Design_testing(i,3),2,Design_testing(i,5)==2,GetSecs-Start);
                    break;
                elseif keyCode(18) %'1', 76 know this person. Mac 18.
                    while KbCheck; end
                    fprintf(datafile,'%d %d %d %d %d %d %d %2.4f\n',1,i,Design_testing(i,1),Design_testing(i,2),Design_testing(i,3),3,3,0);
                    break;
                end  
     end
  end
  ImgDsp(NoiseMask,wPtr,NoiseMask_duration,gray,ifi);  % erase stimulus
  %ISI
  WaitSecs(Testing_ISI);
end


 %% end of the experiment
DrawFormattedText(wPtr, 'End of the testing session.', 'center', 'center', 0);
Screen('Flip',wPtr);
 while 1
    [ keyIsDown, Secs, keyCode ] = KbCheck;%check key press
     if keyIsDown
                if keyCode(49) %Space bar. Windows 32. Mac 49
                    while KbCheck; end %wait till release key press, only one key press is recognized
                    break;
                end
     end
 end
Screen('Flip',wPtr);
fclose(datafile);%close the data file
WaitSecs(0.5);
Screen('CloseAll');
ShowCursor;



