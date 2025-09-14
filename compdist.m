function D = compdist(points, dname)

n = size(points, 1);

D = zeros(n, n);

for i = 1:n
    for j = i:n
        D(i, j) = distfun(points(i, :), points(j, :), dname);
        D(j, i) = D(i, j);
    end
end

end
