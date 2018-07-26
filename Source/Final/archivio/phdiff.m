function PhDiff = phdiff(x, y)

% function: PhDiff = phdiff(x, y)
% x - first signal in the time domain
% y - second signal in the time domain
% PhDiff - phase difference Y -> X, rad

% represent x as column-vector if it is not
if size(x, 2) > 1
    x = x';
end

% represent y as column-vector if it is not
if size(y, 2) > 1
    y = y';
end

% fft of the first signal
X = fft(x);

% fft of the second signal
Y = fft(y);

% phase difference calculation
[~, indx] = max(abs(X));
[~, indy] = max(abs(Y));
PhDiff = angle(Y(indy))/max(abs(Y)) - angle(X(indx))/max(abs(X));

end