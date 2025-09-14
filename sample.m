clc; clear; close all;

rng(0);

%% Numerical data distance metric.

points = rand(10,2);

% Using pre defined function
D = compdist(points, "euclidean");
disp(D);

% Using pdist2
D = pdist2(points, points, @(XI, XJ) distfun(XI, XJ, "euclidean"));
disp(D);

%% Categorical data distance metric.
% Generate synthetic dataset
Gender = {'m'; 'f'; 'm'; 'f'; 'm'; 'm'; 'f'; 'm'};
Hobby = {'music'; 'writing'; 'football'; 'tennis'; 'basketball'; 'tennis'; 'writing'; 'music'};
T = table(Gender, Hobby);
X_categorical = T{:,:}; % Convert table to array
D = compdist(X_categorical, 'hamming');
disp(D);