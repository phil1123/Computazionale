function X = metropolis(N,p,depth)
% X = metropolis(N,p,depth) returns column vector X of N pseudorandom
% integers extracted from the probability distribution in p by means of the 
% metropolis algorithm; p can either be: 
% 1. a structure, where: p.f is a function handle to a probability density,
%    not necessarily normalized; p.start and p.sigma are the start value
%    of the Montecarlo chain and the width of its Gaussian steps;
%    p.I=[a b]  (optional defaulting to a=-inf and b=inf) fixes the 
%    interval such that a < X < b; 
% 2. a one-dimensional array of discrete probabilities, not necessarily 
%    normalized and uniform metropolis is performed;
% depth sets the number of steps taken before the pseudorandom integer 
% is returned.

narginchk(2,3)
if nargin == 2
	depth = 1;					% return pseudorandom integer at every step
end
if ~isnumeric(p) && ~isstruct(p)
   error('second input must be a numerical array or a struct')
end

X = zeros(N,1);
r = rand(N,depth);				% pre-store all flat (0,1) rands

if isnumeric(p) 
    if any(p) < 0
        error('probabilities must be nonnegative')
    end
    if sum(p) == 0
        error('at least one probability must be positive')
    end

    %p = p/sum(p);					% no real need to enforce normalization
    np = length(p);

    x0 = randi(np);					% random start
    for j = 1:N
        for k = 1:depth
            x = randi(np);			% new proposal
            if r(j,k) < p(x)/p(x0)
                x0 = x;				% accept
            else
                x = x0;				% reject
            end
        end
        X(j) = x;					% return pseudorandom integer
    end
    
else
    % no check on positivity performed here
    if ~isfield(p,'f')
        error('missing probability density field in second-input struct')
    end
    if isfield(p,'start')
        x0 = p.start;
    else
       error('missing start field in second-input struct') 
    end
    if isfield(p,'sigma')
        sigma = p.sigma;
    else
       error('missing sigma field in second-input struct') 
    end
    if isfield(p,'I') && ~isempty(p.I)
        a = p.I(1);
        b = p.I(2);
        if a >= b
            error('interval must have I(1) < I(2)')
        end
        p.f = @(x)p.f(x).*(x>a).*(x<b);
    end
        
    for j = 1:N
        for k = 1:depth
            x = x0 + sigma*randn;	% new proposal
            if r(j,k) < p.f(x)/p.f(x0)
                x0 = x;				% accept
            else
                x = x0;				% reject
            end
        end
        X(j) = x;					% return pseudorandom integer
    end
            
end

    
   