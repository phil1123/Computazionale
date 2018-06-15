function sierpinski(N)
%SIERPINSKI  Sierpinski's triangle.
%   This version runs forever, or until stop is toggled.
%   See also FINITESIERPINSKI.

if nargin == 0
    N = 40;
end
figure
set(gcf,'color','white', ...
   'numbertitle','off','name','Sierpinski''s triangle')
x = [0; 0];
h = animatedline(x(1),x(2),'LineStyle','none','Marker','.');
darkgreen = [0 2/3 0];
set(h,'markersize',1,'color',darkgreen);
axis([0 1 0 1])
axis square
axis off
stop = uicontrol('style','toggle','string','stop', ...
   'background','white');
drawnow

% Define three affine transformations, x = A*x + bk.

A = [1/2 0; 0 1/2];
b1 = [0  0]';
b2 = [1/2  0]';
b3 = [1/4  sqrt(3)/4]';

% Run forever

cnt = 1;
tic
while ~get(stop,'value')
    X = zeros(2,N);
    for j = 1:N
        r = ceil(3*rand);
        switch r
            case 1, x = A*x + b1;
            case 2, x = A*x + b2;
            case 3, x = A*x + b3;
        end
        X(:,j) = x;
    end
    addpoints(h,X(1,:),X(2,:));
    drawnow
    cnt = cnt + N;
end
t = toc;
s = sprintf('%8.0f points in %6.3f seconds',cnt,t);
text(0.17,1,s,'fontweight','bold');
set(stop,'style','pushbutton','string','close','callback','close(gcf)')
