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

%% Part I: CTFT of the musical scales C4,D4,E4,F4,G4,A4,A5,B5,C5 

%% Having the container for the musical scales
clear; clc;

fs = 1200;                 % Sampling Frequency
T = 1/fs;                   % Sampling Period
dur  = 1;                   % duration, s
L = dur*fs;                 % Length of signal
t = (0:L-1)*T;       % One-second duration

% Sinusoid Signal
% y(t) = sin(2*pi*f*t), where f = 440*beta^(index), beta = 2^(1/12), and
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

%% Fourier Transform of the musical scales
musical_scale_CTFT_values = cell(length(musical_scale_keys),1);

n = 2*(2^nextpow2(L)); % So that I will get an amplitude of 0.5

for ind = 1 :length(musical_scale_keys)
    x = music_octave(musical_scale_keys{ind});
    X = fftshift(fft(x, n, 2));
    P2 = abs(X/L);
    musical_scale_CTFT_values{ind} = P2;
end

% Dictionary-type container -- keys: notes's names; values: CTFT values
music_scale_CTFT = containers.Map(musical_scale_keys, musical_scale_CTFT_values);


for set_num = 1 : 2
    figure;
    disp(['set = ' num2str(set_num)])
    for ind = (floor(length(musical_scale_keys)/2))*(set_num - 1) + 1 : set_num*floor(length(musical_scale_keys)/2)
        disp(['ind = ' num2str(ind)])
        subplot(floor(length(musical_scale_keys)/4), 2, ind - (set_num - 1)*floor(length(musical_scale_keys)/2))
        p = plot([-fs/2:fs/n:(fs/2)-(fs/n)], music_scale_CTFT(musical_scale_keys{ind}), 'k');
        set(p, 'LineWidth', 1.5);
        ylim([0 0.5])
        yticks([0 0.1 0.2 0.3 0.4 0.5]);
        xticks([-600 -500 -400 -300 -200 -100 0 100 200 300 400 500 600])
        xlabel('Frequency, $f \;\; (Hz)$', 'Interpreter', 'Latex', 'FontName', 'Times', 'FontSize', 12);
        ylabel('$|X(f)|$', 'Interpreter', 'Latex', 'FontName', 'Times', 'FontSize', 12)
        title([musical_scale_keys{ind}, '(f = ', num2str(440*(beta^(beta_exponents(ind)))), ' Hz)'], 'FontName', 'Times', 'FontSize', 12);
    end
end

