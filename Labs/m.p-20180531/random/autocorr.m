function [R,P,RL,RU] = autocorr(y,I)
% [R,P,RL,RU] = autocorr(y,I) is a wrapper for the MATLAB primitive
% corrcoef(A), where A is built from the 1D numeric array y and translated
% copies of it (with cyclic closure) as defined by the index set I.
% For example, autocorr(y,[2 4]) will return the correlation matrix
% built from y, y([2:end 1]) and y([4:end 1:3]).
 
narginchk(2,2)

[nr,nc] = size(y);
if nc > 1
    y = y.';
    [nr,nc] = size(y);
    if nc > 1
        error('the first input must be a 1D array')
    end
end
nI = length(I);

Y = [y zeros(nr,nI)];
for j = 1:nI
    Y(:,j+1) = y([I(j):nr 1:I(j)-1]);
end
[R,P,RL,RU] = corrcoef(Y);
