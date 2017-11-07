function [note_volume] = noteVolume(transit_count,array_index)
%soundVolume returns a scalar magnitude (i.e volume) to correlate to the 
%               number of transit vehicles (transit_count) at a given time 
%               point(denoted by array_index). 
% Example:
%   [sound_volume] = soundVolume(transit_count,array_index)
%           transit_count - array of number of subway vehicles over a day
%           array_index - the index of transit_count to process

% Written by Rami Saab (Github: rami-codes)on 2017/10/31

min_count = min(transit_count);
max_count = max(transit_count);
mean_count = mean(transit_count);
range = max_count - min_count;

Z = zscore(transit_count);

note_volume = remap(transit_count(array_index),min_count,max_count,0.05,1);
end

