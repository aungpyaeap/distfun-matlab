function D = ComputeDist(dataPoints, dname)

% Get number of data points
n = size(dataPoints, 1);

% Initialize dissimilarity matrix
D = zeros(n, n);

for i = 1:n
    for j = 1:n
        D(i, j) = distfun(dataPoints(i, :), dataPoints(j, :), dname);
    end
end

end