function D = distfun(XI, XJ, pvals)

switch pvals
    case 'euclidean'
        D = sqrt(sum((XJ - XI).^2, 2));
    case 'sqeuclidean'
        D = sum((XJ - XI).^2, 2);
    case 'cityblock'
        D = sum(abs(XJ - XI), 2);
    case 'chebyshev'
        D = max(abs(XJ - XI), [], 2);
    case 'canberra'
        D = sum(abs(XJ - XI) ./ (abs(XJ) + abs(XI)), 2);
    case 'cosine'
        normXI = sqrt(sum(XI.^2, 2));
        normXJ = sqrt(sum(XJ.^2, 2));
        D = 1 - (sum(XI .* XJ, 2) ./ (normXI .* normXJ));
        D(abs(D) < 1e-10) = 0; % Set very small values to zero
    case 'corr'
        meanXI = mean(XI, 2);
        meanXJ = mean(XJ, 2);
        numerator = sum((XI - meanXI) .* (XJ - meanXJ), 2);
        denominator = sqrt(sum((XI - meanXI).^2, 2) .* sum((XJ - meanXJ).^2, 2));
        D = 1 - (numerator ./ denominator);
        D(isnan(D)) = 1; % Handle cases where denominator is zero
    case 'clark'
        D = sqrt(sum((abs(XJ - XI) ./ (XJ + XI)).^2, 2));
    case 'soergel'
        numerator = sum(abs(XJ - XI), 2);
        denominator = sum(max(XJ, XI), 2);
        D = numerator ./ denominator;
    case 'hamming'
        XI = categorical(XI);
        XJ = categorical(XJ);
        D = sum(XI ~= XJ, 2); % Assumes XI and XJ are categorical arrays
    case 'jaccard'
        XI_str = categorical(XI);
        XJ_str = categorical(XJ);
        intersection = sum(XI_str == XJ_str, 2);
        union = sum(XI_str ~= "" | XJ_str ~= "", 2); % Use empty string for categorical comparison
        D = 1 - (intersection ./ union);
    case 'dice'
        A = categorical(XI);
        B = categorical(XJ);
        intersection = sum(A == B, 2); % Count matches
        D = 1 - (2 * intersection) ./ (sum(A ~= ' ') + sum(B ~= ' '));
    otherwise
        error('Invalid distance parameter.');
end

end

