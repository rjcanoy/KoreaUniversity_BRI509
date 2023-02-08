% BRI509 (Introduction to Brain Signal Processing)
% Assignment # 1
% Author: Raymart Jay E. Canoy
% Student ID #: 2020021376

% Notes:
% "The frequencies 440 Hz and 880 Hz both correspond to the musical note A,
% but one octave apart. In the western musical scale, there are 12 notes in
% every octave. These notes are evenly distributed (geometrically), so the
% next note above A, which is B flat, has frequency (440 x beta), where
% beta is the twelfth root of two."
% Source: https://ptolemy.berkeley.edu/eecs20/week8/scale.html

%% Part 1: Visualization
clear; clc; clf;

fs = 100;                   % sampling rate (small value for clear visualization)
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

% Plotting is done is done depending on the number of elemets in
% musical_scale_keys
set_NUM = floor(length(musical_scale_keys)/(3*2)); % (3x2) plots
for set_num = 1 : set_NUM
    disp(['set = ' num2str(set_num)])
    figure;
    for ind = (floor(length(musical_scale_keys)/2))*(set_num - 1) + 1 : set_num*floor(length(musical_scale_keys)/2)
        disp(['ind = ' num2str(ind)])
        subplot(floor(length(musical_scale_keys)/4), 2, ind - (set_num - 1)*floor(length(musical_scale_keys)/2))
        p = plot(t, music_octave(musical_scale_keys{ind}), 'k');
        set(p, 'LineWidth', 1.5);
        yticks([-1, 0, 1]);
        xlabel('$t \; [s]$', 'Interpreter', 'latex');
        ylabel('$\sin (2 \pi f t)$', 'Interpreter', 'latex');
        title([musical_scale_keys{ind}, '(f = ', num2str(440*(beta^(ind - 1))), ' Hz)'], 'FontName', 'Times', 'FontSize', 12);
    end
end

figure,
p = plot(t, music_octave(musical_scale_keys{13}), 'k');
set(p, 'LineWidth', 1.5);
yticks([-1, 0, 1]);
xlabel('$t \; [s]$', 'Interpreter', 'latex');
ylabel('$\sin (2 \pi f t)$', 'Interpreter', 'latex');
title([musical_scale_keys{13}, '(f = ', num2str(440*(beta^(13 - 1))), ' Hz)'], 'FontName', 'Times', 'FontSize', 12);