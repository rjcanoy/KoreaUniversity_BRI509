% BRI509 (Introduction to Brain Signal Processing)
% Assignment # 1
% Author: Raymart Jay E. Canoy
% Student ID #: 2020021376

%% Part 3: A Major
clear; clc;

fs = 48000;                 % Accepted framerate for the audiowrite function
dur  = 1;                   % duration, s
t = [0 : 1/fs : dur];       % One-second duration

% Sinusoid Signal
% y(t) = sin(2*pi*f*t), where f = 440*beta^(n - 1), beta = 2^(1/12), and
% n is the index, i.e., n = [1, 13]
beta = 2^(1/12);
note = @(index) sin(2*pi*(440*(beta^(index - 1)))*t); % a sinusoid function

% musical_scale_keys: Names of the notes
musical_scale_keys = {'A4', 'A4#', 'B4', 'C5', 'C5#', 'D5', 'D5#', 'E5', 'F5', 'F5#', 'G5', 'G5#', 'A5'};
% musical_scale_values: An empty 13x1 cell, and will hold the notes' values
musical_scale_values = cell(length(musical_scale_keys), 1);

% Assigns the values of each note to musical_scale_values
for ind = 1 : length(musical_scale_keys)
    musical_scale_values{ind} = note(ind);
end

% Dictionary-type container -- keys: notes's names; values: notes' values
music_octave = containers.Map(musical_scale_keys, musical_scale_values);

% A-Major
solfege_A_Major = {'A4', 'B4', 'C5#', 'D5', 'E5', 'F5#', 'G5#', 'A5'};

for ind = 1 : length(solfege_A_Major)
   index = strcmp(solfege_A_Major(ind), musical_scale_keys);
   solfege_index(ind) = find(index);
end

solfege_a_major = [];
for k1 = 1:length(solfege_index)
    solfege_a_major = [solfege_a_major; [note(solfege_index(k1))  zeros(1,100)]'];
end

soundsc(solfege_a_major, fs);
filename_a_major = 'Assignment1_2020021376_CanoyRaymartJay_prob4b_Part3_AMajor.mp4';
audiowrite(filename_a_major, solfege_a_major, fs);
