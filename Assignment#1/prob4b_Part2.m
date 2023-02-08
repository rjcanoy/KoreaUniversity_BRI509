% BRI509 (Introduction to Brain Signal Processing)
% Assignment # 1
% Author: Raymart Jay E. Canoy
% Student ID #: 2020021376

%% Part II: MP3 file containing scale A4~A5 one second each
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

mp4_file = [];
filename = 'Assignment1_2020021376_CanoyRaymartJay_prob4b_part2.mp4';
for ind = 1 : length(musical_scale_keys)
    mp4_file = [mp4_file; [music_octave(musical_scale_keys{ind}) zeros(1, 100)]'];
end

% Just for listening the sound
soundsc(mp4_file, fs)

% Saving the sound as an mp4 file
audiowrite(filename, mp4_file, fs)