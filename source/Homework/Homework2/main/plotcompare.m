function plotcompare(tol,err,steps,time)

% ----------------------------- Plots ------------------------------------%
figure;
hold on;

subplot(3,1,1);
plot(tol,err,'-o');
legend('ode45','odesymp','Location','north');

subplot(3,1,2);
plot(tol,steps,'-o');
legend('ode45','odesymp','Location','north');

subplot(3,1,3);
plot(tol,time,'-o');
legend('ode45','odesymp','Location','north');

P1 = subplot(3,1,1);
set( get(P1,'YLabel') ,'String','Error');
P1.XScale = 'log';

P2 = subplot(3,1,2);
set( get(P2,'YLabel') ,'String','Steps');
P2.XScale = 'log';

P3 = subplot(3,1,3);
set( get(P3,'YLabel') ,'String','Time');
set( get(P3,'XLabel') ,'String','tol');
P3.XScale = 'log';

set(gcf,'Units','points','Position',[1000,100,500,700])
set(gcf,'Name','Confronto')

a = axes;
t1 = title('Confronto tra vari algoritmi');
a.Visible = 'off'; % set(a,'Visible','off');
t1.Visible = 'on'; % set(t1,'Visible','on');

hold off;
end