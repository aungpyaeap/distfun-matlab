clc; clear; close all;

rng('shuffle');

% For numerical dataset.
X_numerical = rand(10,2);
D = compdist(X_numerical, 'euclidean');
disp('Dissimilarity matrix.');
disp(D);

% For categorical dataset.
% Generate synthetic dataset
Gender = {'m'; 'f'; 'm'; 'f'; 'm'; 'm'; 'f'; 'm'};
Hobby = {'music'; 'writing'; 'football'; 'tennis'; 'basketball'; 'tennis'; 'writing'; 'music'};
T = table(Gender, Hobby);
X_categorical = T{:,:}; % Convert table to array
D = compdist(X_categorical, 'hamming');
disp('Dissimilarity matrix.');
disp(D);

% Distance between two numerical points
m = 5; % for example, 5 features
x_i = rand(1, m); % Random data point x_i
x_j = rand(1, m); % Random data point x_j
disp('Distance between two numerical points');
disp(['Euclidean distance is ', num2str(distfun(x_i, x_j, 'euclidean'))]);

% Distance between two categorical points
numCategories = 3; % for example, 3 categories: 'A', 'B', 'C'
categories = {'A', 'B', 'C'};
x_i = categories(randi(numCategories, 1, m)); % Random data point x_i
x_j = categories(randi(numCategories, 1, m)); % Random data point x_j
disp('Distance between two categorical points.');
disp(['Hamming distance is ', num2str(distfun(x_i, x_j, 'hamming'))]);