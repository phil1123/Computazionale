function tf = translate(f,a,method)
% translate(f,a) translates columnwise f by a using linear interpolation
% for the fractional part of a; a can be a scalar or a row array with as 
% many rows as f;
% translate(f,a,method) uses a specific method that can be 'linear, 'pchip'
% or 'spline' for interpolation or 'fft' for fft translation;  
% tf = translate(f,...) assigns translated f to tf;
% array f is assumed to be periodic along columns.
% TODO: other types of boundary conditions.


	narginchk(2,3);
    if nargin < 3
        method = 'linear';
    end
	fname = inputname(1);
    [nr,nc] = size(f);
    if isscalar(a)
        a = a*ones(1,nc);
    elseif length(a) ~= nc
        error('dimension mismatch');
    end
    a = mod(a,nr);
    
    % integer part
    na = floor(a);
    for j = 1:nc
        Ia = [na(j)+1:nr,1:na(j)];
        f(Ia,j) = f(:,j);
    end
    
    % fractional part
    ra = a - na;
    if ra > 0
        if strcmp(method,'fft')
            n = floor(nr/2);
            nn = floor((nr-1)/2);
            k = (2*pi/nr)*[0:nn,-n:-1]';
%            k = (2*pi/nr)*(-n:nn)';
            f = fft(f);
%            f = sfft(f);
            for j = 1:nc
                f(:,j) = exp(-1i*k*a(j)).*f(:,j);
                f = ifft(f);
%                f = isfft(f);
            end
        else
            for j = 1:nc
                y = [f(nr,j); f(:,j)];
                f(:,j) = interp1(0:nr,y,(1:nr)-ra(j),method);
            end
        end
    end
        
	if nargout == 0
		% act on input f
		assignin('caller',fname,f);
    else
        tf = f;
	end
	

