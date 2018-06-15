function x = slowrandp(N,p)
% x = slowrandp(N,p) returns column vector x of N pseudorandom
% integers extracted from the probability 1D array p by means of the 
% simple search algorithm;

narginchk(2,2)
[~,nc] = size(p);
if nc > 1
    p = p.';
    [~,nc] = size(p);
    if nc > 1
        error('the second input must be a 1D array')
    end
end
if any(p) < 0
    error('probabilities must be nonnegative')
end
if sum(p) == 0
    error('at least one probability must be positive')
end

p = p/sum(p);					% make sure p is properly normalized
b = cumsum(p);

x = zeros(N,1); 
for j=1:N; 
    x(j) = find(b > rand,1); 
end


