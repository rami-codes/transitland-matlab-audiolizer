% transitland_music
% Data audiolization system for transitland
% Written by Rami Saab (Github: rami-codes)on 2017/10/31

%% Import transitland vehicle counts
bus_table = importTransitlandCSV("vehicle_counts/buses_3600.csv");
bus_count = table2array(bus_table(:,3));

streetcar_table = importTransitlandCSV("vehicle_counts/trams_3600.csv");
streetcar_count = table2array(streetcar_table(:,3));

subway_table = importTransitlandCSV("vehicle_counts/metros_3600.csv");
subway_count = table2array(subway_table(:,3));

num_items = max([length(bus_count) length(streetcar_count)...
    length(subway_count)]);

%% Initialize variables for data and sampling
fs = 10000;
video_length = 60; % in seconds

% Downsample by decimating
downsample_factor = 60;
bus_count = decimate(bus_count, downsample_factor);
streetcar_count = decimate(streetcar_count, downsample_factor);
subway_count = decimate(subway_count, downsample_factor);

note_low = zeros(floor(num_items/downsample_factor),fs);
note_mid = zeros(floor(num_items/downsample_factor),fs);
note_high = zeros(floor(num_items/downsample_factor),fs);

song = [];
t = 0:1/fs:(1 - 1/fs);

%% Process transitland counts into audio
for note_index=1:floor(num_items/downsample_factor)

    note_low(note_index,:) = sin(2*pi*notePitch(subway_count,...
        note_index,'low')*t');

    % chords removed
        %note_mid(note_index,:) = sin(2*pi*noteFrequency(subway_count,
        %array_index,'mid')*t');
        %note_high(note_index,:) =
        %sin(2*pi*noteFrequency(subway_count,array_index,'high')*t'); 
    
    beat = noteTempo(note_low(note_index,:),note_mid(note_index,:),...
        note_high(note_index,:),bus_count,note_index);
    song = [song noteVolume(streetcar_count,note_index)*beat];

end

%% Output audio file
filename = 'output.wav';
audiowrite(filename,song,fs);

%% Plot result
figure
plot(linspace(1,video_length,size(song,2)),song)
xlabel('Time (s)');
ylabel('Magnitude');
title('Audio waveform output');


