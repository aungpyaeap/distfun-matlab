clc; clear; close all;

rng('shuffle');

% For numerical dataset.

X_numerical = rand(10,2);
D = compdist(X_numerical, 'euclidean');
disp(D);

% For categorical dataset.
% Generate synthetic dataset
Gender = {'m'; 'f'; 'm'; 'f'; 'm'; 'm'; 'f'; 'm'};
Hobby = {'music'; 'writing'; 'football'; 'tennis'; 'basketball'; 'tennis'; 'writing'; 'music'};
T = table(Gender, Hobby);
X_categorical = T{:,:}; % Convert table to array
D = compdist(X_categorical, 'hamming');
disp(D);