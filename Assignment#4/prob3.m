% BRI509 (Introduction to Brain Signal Processing)
% Assignment # 4
% Author: Raymart Jay E. Canoy
% Student ID #: 2020021376

% Notes:
% "The frequencies 440 Hz and 880 Hz both correspond to the musical note A,
% but one octave apart. In the western musical scale, there are 12 notes in
% every octave. These notes are evenly distributed (geometrically), so the
% next note above A, which is B flat, has frequency (440 x beta), where
% beta is the twelfth root of two."
% Source: https://ptolemy.berkeley.edu/eecs20/week8/scale.html

%% Draw the Bode diagrams of:
%  (a) Do(C4)
%  (b) Mi(E4)
%  (c) Sol(G4)
%  (d) Chord(C4+E4+G4)

% (00) Initialization
clear; clc;

fs = 48000;;
T = 1/fs;
dur = 1;
L = dur*fs;
t = (0:L-1)*T;

% (01) Sinusoid signal
beta = 2^(1/12);
beta_exponents = [-9, -7, -5, -4, -2, 0, 2, 3];
note = @(index) sin(2*pi*(440*(beta^(index)))*t);

% C major
musical_scale_keys = {'C4', 'D4', 'E4', 'F4', 'G4', 'A4', 'B4', 'C5'};
musical_scale_values = cell(length(musical_scale_keys), 1);

for ind = 1 : length(musical_scale_keys)
    musical_scale_values{ind} = note(beta_exponents(ind));
end

% (02) Sofege for C major
music_octave = containers.Map(musical_scale_keys, musical_scale_values);

%% (03) Chord
chord = music_octave('C4') + music_octave('E4') + music_octave('G4');

%% (04) Filter
path = uigetdir();
cd(path)
bpf_do_num = load('Assignment4_2020021376_CanoyRaymartJay_do_coefficients.mat');
bpf_mi_num = load('Assignment4_2020021376_CanoyRaymartJay_mi_coefficients.mat');
bpf_so_num = load('Assignment4_2020021376_CanoyRaymartJay_so_coefficients.mat');

%% (05) Individual musical tone

% Do
do = filter(bpf_do_num.bpf_do_num, 1, chord);
audiowrite('Assigment4_2020021376_CanoyRaymartJay_do.mp4', do, fs)

% Mi
mi = filter(bpf_mi_num.bpf_mi_num, 1, chord);
audiowrite('Assigment4_2020021376_CanoyRaymartJay_mi.mp4', mi, fs)

% So
so = filter(bpf_so_num.bpf_so_num, 1, chord);
audiowrite('Assigment4_2020021376_CanoyRaymartJay_so.mp4', so, fs)