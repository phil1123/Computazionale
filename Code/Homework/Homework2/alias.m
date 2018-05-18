function [y wu au] = alias(s,w,tol,x)
%
% A matlab implementation of alias algorithm.
%
% INPUT
% s, integer sample Size
% w, weights: to be normalized if not already. If w is a RxC matrix, a
% RC-dim column vector is extracted
% tol, tolerance in balancing probability gaps
% x,  (optional) observables attached to weights: defualt is (
% 1, 2, ... size(w(:))
%
% OUTPUT
% y, random column vector of dimension s distributed according to w;
% wu, accepting probabilities
% au, rejecting probabilities (alias), |au+wu-1| <  tol



test = false;    % set to 'false' in non debug-mode



if nargin == 0  % demo stub
    tol = 1e-3;
    s = 1e2;
    w = [0.5 0.5];
    x = [0 1];
    %w = [ 1/2 1/3 1/12 1/12 ]';
    %x = [ 1 2 3 4]';
end


% parameter checks
%
if (nargin < 3 && nargin >0)
    error('alias.m:InputCheck:NotEnoughInputs');
end

if nargin==4 && ~( isequal(size(w), size(x)) )
    error('alias.m:InputCheck:WXSizeIncongruency');
end


w=abs(w(:));
if size(w,2)>1
    w = w';
end

if nargin==4
    x=x(:);
    
    if size(x,2)>1
        x = x';
    end
end


N = numel(w);


if nargin==3
    x=(1:N)';
end


if sum(abs(w)) ~= 1 % if not, non negative weights are normalized
    w = abs(w)./sum(abs(w));
end


% Some of the following vectors are coupled aside with the original index
% to retrieve position after sorting
%
% NOTE: naming convention for sorted / unsorted vectors
% xu -> x(unsorted)
% xs -> x(sorted)
%
wu = w.*N;
du = [ wu-1 (1:N)'];

    if test == true; 
        sprintf('first sum(du) %d\n', sum(du(:,1)))
    end;


    
% preallocation
%
au = zeros(N,2);            % alias table
y = zeros(N,1);             % output random vector



% tables set-up
%
from = 1;
to   = N;
treshold = to;

count1 = 1;
count2 = 1;

ds = du;

while norm(ds(:,1),2) > tol
    
    % debug mode checks
    %
    if test == true;
        sprintf('count1 %i sum(du) = %d \n', count1, sum(du(:,1)))
    end;
 
    if test == true; count1 = count1+1; end;
    
    if (test == true && count1 > 1/tol);
        sprintf('loop1\n')
        break; 
    end;
    
    
    % sort first column and rearrange indexes accordingly
    %
    % NOTE: naming convention for sorted / unsorted vectors
    % xu -> x(unsorted)
    % xs -> x(sorted)
    %
    % NOTE: variable 'trashold' is returned from the inner loop and 
    % contains the position of the last, and lower, positive gap
    %
    if treshold < N
        ds = ds(1:treshold,:);
    end
 
    [temp,perm] = sort(ds(:,1),'descend');
    ds = [temp ds(perm,2)];
        
        if test == true; ds; end;

            
    % variables must now run all along ds
    from = 1;
    to = treshold;
    
    % M  = ds(1,1);    % maximum positive gap (bumps) ...
    uM = ds(1,2);    % .. its position in du, wu
    m  = ds(to,1)  ;    % minimum negative gap (hole) ...
    um = ds(to,2)  ;    % ... its position in du, wu
    
    
    while (1)        
        
        % NOTE: in this inner loop both 'from' and 'to' are moved toward
        % the center of ds and at each step positive and negative gaps
        % are balanced.
        %
        % The underlying idea is that n-th order maximum and n-order
        % minimum almost counterbalance in a big randomly filled w matrix.
        %
     
        % debug mode checks
        %
        if test == true; count2 = count2+1; end;
        if (test == true && count2 > 1/tol);
            sprintf('loop2\n')
            break; 
        end;
        
        
        % Gap balancing: fill hole and void bumps.
        % if M < |m| a new hole is generated to be processed
        % at the next iteration of the outer loop that will sort it
        % in the right side of ds.
        %
        % if M>|m| the hole is filled and it will be ignored at the next
        % outer loop, while a reminder  M+m maybe generated to be processed
        % at the next iteration of the outerloop.
        %
        ds(from,1) = ds(from,1)+m;  % void bumps
        wu(uM  ,1) = wu(uM  ,1)+m;
        
        ds(to,1)   = 0;             % fill hole 
        % NOTE: nothing to do in wu(um,1)
        
        
        % update alias
        au(um,1) = -m;  % alias value = minus the negative gap
        au(um,2) = uM;  % alias reference = positive gap index from which is filled
        
        % step forward
        from = from+1;
        to = to-1;
        
        
        % First exit condition:
        % in this case all available holes are filled
        % and will be ignored in the next iteration of the outer loop
        %
        if to>=0
            treshold = to;
            break;
        end;
        
        
        % Second exit condition:
        % in this case bumps are numerically lower than holes
        % but the processed holes are only the one from to, to+1, ..
        %
        if from<=0
            treshold = to;
            break;
        end
        
        % equivalently:
        % if (from<=0 || to>=0)
        %   treshold = to
        %   break;
        % end
    
        
        % TBD
        %M  = ds(from,1);
        uM = ds(from,2);
        m  = ds(to,1)  ;
        um = ds(to,2)  ;
        
    end
        
    
end



if test == true;
    sprintf('count1 = %i , count2 = %i', count1, count2);
end;




% pseudo-random generation
%
for n = 1:s

    die = floor(rand*N) + 1;
    
    if  rand < wu(die,1)
             y(n) = x(die);
        else y(n) = au(die,2);
    end
    
end