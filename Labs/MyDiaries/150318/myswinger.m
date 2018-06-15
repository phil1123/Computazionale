function swinger(x0,y0,nplotskip,odesolver)
% SWINGER  Classic double pendulum.
%   SWINGER(x,y) starts the pendulum at the given initial position.
%   The initial position can reset with the mouse.
%
%   SWINGER with no arguments starts at (x,y) = (0.862,-0.994).
%   What is interesting about the resulting orbit?
%
%   SWINGER(0,2) starts in an unstable vertical position.
%   How long does it stay there and what causes it to move?
%
%   The model is a pair of coupled second order nonlinear odes for
%   two angles.  The model is rewriten as first order system involving 
%      u = [theta1, theta2, theta1dot, theta2dot]'
%   The resulting equations are in implicit form, M*udot = f.

%   Copyright 2014 Cleve Moler
%   Copyright 2014 The MathWorks, Inc.

   
   % ------------------------
   
   function M = swingmass(~,u)
   
      % Mass matrix for classic double pendulum.
      c = cos(u(1)-u(2));
      M = [1 0 0 0; 0 1 0 0; 0 0 2 c; 0 0 c 1];
   end
      
   % ------------------------
      
   function f = swingrhs(~,u)
      % Driving force for classic double pendulum
      s = sin(u(1)-u(2));
      f = [u(3); u(4); -2*g*sin(u(1))-s*u(4)^2; -g*sin(u(2))+s*u(3)^2];
      c = cos(u(1)-u(2));
      E = u(3)^2 + 0.5*u(4)^2 + u(3)*u(4)*c + g*(3 - 2*cos(u(1)) - cos(u(2)));
   end
      
   % ------------------------
      
   function theta = swinginit(x,y)
      % Angles to starting point.
      %   swinginit(0,-2) = [0 0]'
      %   swinginit(sqrt(2),0) = [3*pi/4 pi/4]'
      %   swinginit(0,2) = [pi pi]'
      
      r = norm([x,y]);
      if r > 2
         alpha = 0;
      else
         alpha = acos(r/2);
      end
      beta = atan2(y,x) + pi/2;
      theta = [beta+alpha; beta-alpha];
   end
      
   % ------------------------
      
   function status = swingplot(t,u,task)
      % Plot function for classic double pendulum.
      %%%%destri: removed version-dependent erasemode

      persistent plt orb titl jskip
      
      if ~isequal(task,'done')
      
         % Coordinates of both bobs
         
         theta = u(1:2);
         x = cumsum(sin(theta));
         y = cumsum(-cos(theta));
         
         switch task
         
            case 'init'
         
               % Initialize plot
               
               hold off
               plt = plot([0; x],[0; y],'mo-','markerfacecolor','m');
               if get(orbit,'value')
                   hold on                                                 %questo tiene il pendolo quando disegno l'orbita
                   %set(plt(2),'vis','off')
                   drawnow
                   orb = animatedline([x(2) x(2)],[y(2) y(2)]);
               else
                   hold off
               end
               axis(2.25*[-1 1 -1 1])
               axis square
               xlabel('Click to reinitialize');
               titl = title(sprintf('t = %-8.1f',t));
               
               %%%%destri: added
               E0 = g*(y(1) + y(2) + 3);  % initial energy
               jskip = 0;
               
            case ''
         
               % Update plot
               
               %%%%destri-added
               if jskip < nplotskip
                   jskip = jskip+1;
                   status = 0;
                   return;
               end
               jskip = 0;
               
               set(plt,'xdata',[0; x],'ydata',[0; y])
               if get(orbit,'value')
                   hold on
                   addpoints(orb,x(2),y(2))
               else
                   hold off
               end
         
               % Display time and energy change in title
               str = sprintf('t = %-8.1f',t); 
               str = [str ' ,  ' sprintf('E-E0 = %-+2.2e',E-E0)];
               set(titl,'string',str);
               drawnow
         end
         
         % Terminate ode solver after mouse click      
         status = ~isempty(get(gca,'userdata'));
         
      end
   end

   % ------------------------

   %%%% destri: added
   if nargin < 4
       odesolver = @ode23;
   end
   if nargin < 3
       nplotskip = 1;
   end

   
   % Default initial position
   if nargin < 2
      x0 = 0.862;
      y0 = -0.994;
   end

   % Initialize figure and buttons.
   % Click on figure to save the point in current axis userdata.   
   clf reset
   shg
   set(gcf,'name','Swinger','menu','none','numbertitle','off', ...
      'windowbuttonup','set(gca,''userdata'',get(gca,''currentpoint''))')
   orbit = uicontrol('style','toggle','string','orbit','value',0, ...
      'units','normalized','position',[.02 .02 .09 .05], ...
      'callback','set(gca,''userdata'',''orbit'')');
   stop = uicontrol('style','toggle','string','stop','value',0, ...
      'units','normalized','position',[.90 .02 .09 .05], ...
      'callback','set(gca,''userdata'',''stop'')');
   
   g = 1;  % gravity
   E0 = 0; E = 0; % energy initializations %%%%destri: added
   
   % Restart ode solver after each mouse click
   
   while get(stop,'value') == 0
      axisdata = get(gca,'userdata');
      if isempty(axisdata)
         theta0 = swinginit(x0,y0);
      elseif ischar(axisdata)
         theta0 = get(gcf,'userdata');
      else
         x0 = axisdata(1,1);
         y0 = axisdata(1,2);
         % If close to vertical, make it exactly vertical
         if abs(x0) < .01 && y0 > 2
            x0 = 0; y0 = 2;
         end
         theta0 = swinginit(x0,y0);
      end
      set(gcf,'userdata',theta0)
      set(gca,'userdata',[])
   
      % Start the ode solver
   
      u0 = [theta0; 0; 0];
      tspan = [0 1.e6];
      opts = odeset('mass',@swingmass,'outputfcn',@swingplot, ...
          'maxstep',0.02,'refine',1,'reltol', 1e-5);
      odesolver(@swingrhs,tspan,u0,opts);
   end
   delete(orbit);
   set(stop,'style','push','string','close','callback','close(gcf)');
    
end

         
         
