function [ note_pitch] = notePitch(transit_count,array_index,note_range)
%notePitch returns a pitch (i.e a frequency in Hz) to correlates to the
%               number of transit vehicles (transit_count) at a given time
%               point(denoted by the array_index). Pitch can be adjusted by
%               note_range to be either 'low', 'mid' or 'high'
% Example:
%   note_pitch = notePitch(subway_count,array_index,'low')
%           subway_count - array of number of subway vehicles over a day
%           array_index - the index of subway_count to process
%           'note_range' - use either 'high', 'mid' or 'low' for
%           chord/triads
%
% Written by Rami Saab (Github: rami-codes)on 2017/10/31

min_count = min(transit_count);
max_count = max(transit_count);
range = max_count - min_count;


Z = zscore(transit_count);
if Z(array_index) < -1.0
    fundamental_frequency = 233.08; % Note: A#3
elseif Z(array_index) < -0.5
    fundamental_frequency = 277.18; % Note: C#4
elseif ((Z(array_index) > -0.5) & (Z(array_index) < 0.5))
    fundamental_frequency = 369.99; % Note: F#4
elseif Z(array_index) <= 1.0
    fundamental_frequency = 466.16; % Note: A#4
else
    fundamental_frequency = 554.37; % Note: C#5
end


switch note_range
    case 'mid'
        note_pitch = fundamental_frequency*1.25;
    case 'high'
        note_pitch = fundamental_frequency*1.5;
    otherwise
        note_pitch = fundamental_frequency;
end

end

