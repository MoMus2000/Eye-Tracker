% Main Code for Shayla's Project
% Date 11th February 2022
% Contributor(s): Mustafa Muhammad 

Screen('Preference', 'SkipSyncTests', 1); % Removes any unsolved errors
stimuli_dir = [pwd '/pics'];
function_dir = [pwd '/functions'];
NoiseMaskImageSize=[1080 720]; %Change it to the size to the stimulus
data_dir = [pwd, 'data'];

fixation_duration=.5;
Training_duration=3600; %used to be 15
NoiseMask_duration=1;
Training_ISI=1;

gray=140;%background grayscale level, could be changed to a value of choice
fontSize=40;

fixation=fixationcross(20,2,gray);
NoiseMask=uint8(randn(NoiseMaskImageSize)*50+gray); 



addpath(function_dir);
subj_id=input('Subject ID:','s');
Condition=input('Experimental Condition, 1 for Geology, 2 for Fiction, 3 for Art and 4 for Russian :','s');

if str2double(Condition)==1 % condition 1, Geology
    stimuli_dir=[stimuli_dir '/geology_pics'];
    imgload_stim_dir='../pics/geology_pics/Geology-';
    num_of_img = 4;
elseif str2double(Condition)==2 % condition 2, Fiction
    stimuli_dir=[stimuli_dir '/fiction_pics'];
    imgload_stim_dir='../pics/fiction_pics/Fiction-';
    num_of_img = 8;
elseif str2double(Condition)==3 %condition 3, Art
    stimuli_dir=[stimuli_dir '/art_pics'];
    imgload_stim_dir='../pics/art_pics/Art-';
    num_of_img = 4;
elseif str2double(Condition)==4 %condition 4, Russian
    stimuli_dir=[stimuli_dir '/russian_pics'];
    imgload_stim_dir='../pics/russian_pics/Russian_History-';
    num_of_img = 5;
end

datafile=fopen([data_dir '/' subj_id '_Condition' Condition '_' date '.txt'],'a+');

prompt = {'Enter tracker EDF file name (1 to 8 letters or numbers)'};
dlg_title = 'Create EDF file';
num_lines= 1;
def     = {'EDF_N'};
answer  = inputdlg(prompt,dlg_title,num_lines,def);
%edfFile= 'DEMO.EDF'
edfFile = answer{1};
fprintf('EDFFile: %s\n', edfFile);



% Opening the Pysch Tool Box Screen
%0 for native screen, 1 for external monitor

dummymode=0;
screenNum=0;  
[wPtr, rect]=Screen('OpenWindow', screenNum);
ifi=Screen('GetFlipInterval',wPtr);
HideCursor;
[width, height]=Screen('WindowSize', screenNum);

%Optional Hide mouse cursor

Screen('HideCursorHelper', wPtr);


% Setting up the eye tracker
% 
el=EyelinkInitDefaults(wPtr);
% 
% 
% % Initialization of the connection with the Eyelink Gazetracker.
% % exit program if this fails.
if ~EyelinkInit(dummymode)
    fprintf('Eyelink Init aborted.\n');
    cleanup;  % cleanup function
    return;
end
% 
% 
[v vs]=Eyelink('GetTrackerVersion');
fprintf('Running experiment on a ''%s'' tracker.\n', vs );
% 
% % open file to record data to
i = Eyelink('Openfile', edfFile);
if i~=0
    fprintf('Cannot create EDF file ''%s'' ', edffilename);
    Eyelink( 'Shutdown');
    Screen('CloseAll');
    return;
end
% 
Eyelink('command', 'add_file_preamble_text ''YU Shayla Thesis''');
% 
% 
% % STEP 5    
% % SET UP TRACKER CONFIGURATION
% % Setting the proper recording resolution, proper calibration type, 
% % as well as the data file content;
Eyelink('command','screen_pixel_coords = %ld %ld %ld %ld', 0, 0, width-1, height-1);
Eyelink('message', 'DISPLAY_COORDS %ld %ld %ld %ld', 0, 0, width-1, height-1);                
% % set calibration type.
Eyelink('command', 'calibration_type = HV9');
% % set parser (conservative saccade thresholds)
% 
% % set EDF file contents using the file_sample_data and
% % file-event_filter commands
% % set link data thtough link_sample_data and link_event_filter
Eyelink('command', 'file_event_filter = LEFT,RIGHT,FIXATION,SACCADE,BLINK,MESSAGE,BUTTON,INPUT');
Eyelink('command', 'link_event_filter = LEFT,RIGHT,FIXATION,SACCADE,BLINK,MESSAGE,BUTTON,INPUT');
% 
% % check the software version
% % add "HTARGET" to record possible target data for EyeLink Remote
% 
Eyelink('command', 'file_sample_data  = LEFT,RIGHT,GAZE,AREA,HTARGET,GAZERES,STATUS,INPUT');
Eyelink('command', 'link_sample_data  = LEFT,RIGHT,GAZE,GAZERES,AREA,HTARGET,STATUS,INPUT');
% 
% 
% % allow to use the big button on the eyelink gamepad to accept the 
% % calibration/drift correction target
Eyelink('command', 'button_function 5 "accept_target_fixation"');
% 
% 
% % make sure we're still connected.
if Eyelink('IsConnected')~=1 && dummymode == 0
    fprintf('not connected, clean up\n');
    Eyelink( 'Shutdown');
    Screen('CloseAll');
    return;
end
% 
el.backgroundcolour = [140 140 140];
el.calibrationtargetcolour = [0 0 0];

% parameters are in frequency, volume, and duration
% set the second value in each line to 0 to turn off the sound
el.cal_target_beep=[600 0.5 0.05];
el.drift_correction_target_beep=[600 0.5 0.05];
el.calibration_failed_beep=[400 0.5 0.25];
el.calibration_success_beep=[800 0.5 0.25];
el.drift_correction_failed_beep=[400 0.5 0.25];
el.drift_correction_success_beep=[800 0.5 0.25]
% you must call this function to apply the changes from above
EyelinkUpdateDefaults(el);


EyelinkDoTrackerSetup(el);

% Setting up the background


Screen('FillRect', wPtr, gray); %fill the screen with gray value 
Screen('Flip',wPtr);


Screen('TextSize',wPtr,fontSize);
DrawFormattedText(wPtr, 'Press the space bar to start reading...', 'center', 'center', 0);
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
 
EyelinkDoDriftCorrection(el);
Eyelink('StartRecording');    
Eyelink('Message', 'Collecting eye movement');

QUIT = 0
while QUIT == 0
%display fixation cross
ImgDsp(fixation,wPtr,fixation_duration,gray,ifi,1,'None',0,0);
%display the current image for Training duration
while 1
    [ keyIsDown, Secs, keyCode ] = KbCheck;%check key press
     if keyIsDown
                if keyCode(9) %'f', 70 Left. Mac 9 
                    while KbCheck; end %wait till release key press, only one key press is recognized?xv
                    Eyelink('StopRecording');
                    break;
                elseif keyCode(13) %'j', 74 Right. Mac 13
                    while KbCheck; end
%                     Eyelink('StopRecording');
                    Eyelink('StartRecording');
                    break;
                elseif keyCode(44) %'Space Bar', 76 know this person. Mac 15.
                    while KbCheck; end
                    QUIT=1;
                    break;
                end  
     end
end
end

% end of the experiment
DrawFormattedText(wPtr, 'End of Reading Session.', 'center', 'center', 0);
Screen('Flip',wPtr);
Eyelink('Message', 'Done recording');
Eyelink('StopRecording');


WaitSecs(5);

% Get the EDF file

try
    fprintf('Receiving data file ''%s''\n', edfFile);
    status=Eyelink('ReceiveFile');
    if status > 0
        fprintf('ReceiveFile status %d\n', status);
    end
    if 2==exist(edfFile, 'file')
        fprintf('Data file ''%s'' can be found in ''%s''\n', edfFile, pwd );
    end
catch
    fprintf('Problem receiving data file ''%s''\n', edfFile );
end

Eyelink('ShutDown');
Screen('CloseAll');
ShowCursor;