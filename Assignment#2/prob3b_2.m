% BRI509 (Introduction to Brain Signal Processing)
% Assignment # 2
% Author: Raymart Jay E. Canoy
% Student ID #: 2020021376

% Notes:
% "The frequencies 440 Hz and 880 Hz both correspond to the musical note A,
% but one octave apart. In the western musical scale, there are 12 notes in
% every octave. These notes are evenly distributed (geometrically), so the
% next note above A, which is B flat, has frequency (440 x beta), where
% beta is the twelfth root of two."
% Source: https://ptolemy.berkeley.edu/eecs20/week8/scale.html

%% Part II: MP4 file containing the musical scales C4,D4,E4,F4,G4,A4,A5,B5,C5 one second each
clear; clc;

fs = 48000;                 % Sampling Frequency
T = 1/fs;                   % Sampling Period
dur  = 1;                   % duration, s
L = dur*fs;                 % Length of signal
t = (0:L-1)*T;       % One-second duration

% Sinusoid Signal
% y(t) = sin(2*pi*f*t), where f = 440*beta^(n - 1), beta = 2^(1/12), and
% n is the index, i.e., n = [1, 13]
beta = 2^(1/12);
beta_exponents = [-9, -7, -5, -4, -2, 0, 2, 3];
note = @(index) sin(2*pi*(440*(beta^(index)))*t); % a sinusoid function

% musical_scale_keys: Names of the notes
musical_scale_keys = {'C4', 'D4', 'E4', 'F4', 'G4', 'A4', 'B4', 'C5'};
% musical_scale_values: An empty 13x1 cell, and will hold the notes' values
musical_scale_values = cell(length(musical_scale_keys), 1);

% Assigns the values of each note to musical_scale_values
for ind = 1 : length(musical_scale_keys)
    musical_scale_values{ind} = note(beta_exponents(ind));
end

% Dictionary-type container -- keys: notes's names; values: notes' values
music_octave = containers.Map(musical_scale_keys, musical_scale_values);

mp3_file = [];
filename = 'prob3b.mp4';
for ind = 1 : length(musical_scale_keys)
    mp3_file = [mp3_file; [music_octave(musical_scale_keys{ind}) zeros(1, 100)]'];
end

soundsc(mp3_file, fs)
audiowrite(filename, mp3_file, fs)