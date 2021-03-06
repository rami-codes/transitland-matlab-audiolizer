function [beat] = noteTempo(note_low,note_mid,note_high,transit_count,array_index)
%noteTempo returns a tempo to correlate to the number of transit vehicles 
%               (transit_count) at a given time Point(denoted by 
%               array_index). 
% Example:
%   %[beat] = noteTempo(note_low,note_mid,note_high,bus_count,index,array_index)
%           returns a tempo to correlate to the number of transit vehicles 
%           vus_count - array of number of bus vehicles over a day
%           array_index - the index of bus_count to process
%           
%
% Written by Rami Saab (Github: rami-codes)on 2017/10/31

min_buscount = min(transit_count);
max_buscount = max(transit_count);
range = max_buscount - min_buscount;
full_beat = note_low;
Z = zscore(transit_count);

if Z(array_index) < -1.0
    beat = full_beat(1:floor(size(note_low,2)/2));
    rest = zeros(1,floor(length(full_beat)/2));
    beat = [beat rest]; % half note with half note rest
elseif Z(array_index) < -0.5
    beat = full_beat(1:floor(size(note_low,2)/4));
    rest = zeros(1,floor(length(full_beat)/4));
    beat = [beat rest beat rest]; % quarter note with quarter note rest
elseif ((Z(array_index) > -0.5) & (Z(array_index) < 0.5))
    beat = full_beat(1:floor(size(note_low,2)/8));
    rest = zeros(1,floor(length(full_beat)/8));
    beat = [beat rest beat rest beat rest beat rest]; % eighth note...
    %with eighth note rest
elseif Z(array_index) <= 1.0
    beat = full_beat(1:floor(size(note_low,2)/16));
    rest = zeros(1,floor(length(full_beat)/16));
    beat = [beat rest beat rest beat rest beat rest beat rest beat rest...
        beat rest beat rest]; %sixteenth note with sixteenth note rest
else 
    beat = full_beat(1:floor(size(note_low,2)/32));
    rest = zeros(1,floor(length(full_beat)/32));
    beat = [beat rest beat rest beat rest beat rest beat rest beat rest...
        beat rest beat rest beat rest beat rest beat rest beat rest beat...
        rest beat rest beat rest beat rest]; %1/32 note with 1/32 note rest
end

beat = [beat zeros(1,length(full_beat)-length(beat))];

end

