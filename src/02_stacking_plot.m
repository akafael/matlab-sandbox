%% STACKPLOT 
% Stacking two plots example from https://stackoverflow.com/questions/11757987/matlab-stacking-of-various-plots

%% Data
t  = 0:100;
f1 = 0.3;
f2 = 0.07;
u1 = sin(f1*t);   cu1 = 'r'; %red
u2 = cos(f2*t);   cu2 = 'b'; %blue
v1 = 5*u1.^2;     cv1 = 'm'; %magenta
v2 = 5*u2.^2;     cv2 = 'c'; %cyan

figure;
h(1) = subplot(2,1,1); % upper plot
plot(t,u1,'Color',cu1,'DisplayName','u1'); hold on;
plot(t,u2,'Color',cu2,'DisplayName','u2'); hold off;

xlabel('Time t [s]');
ylabel('u [some unit]');
legend(gca,'show');

h(2) = subplot(2,1,2); % lower plot
plot(t,v1,'Color',cv1,'DisplayName','v1'); hold on;
plot(t,v2,'Color',cv2,'DisplayName','v2'); hold off;

xlabel('Time t [s]');
ylabel('v [some unit^2]');
legend('show');

linkaxes(h,'x'); % link the axes in x direction (just for convenience)

%% Stack them together
pos=get(h,'position');
bottom=pos{2}(2);
top=pos{1}(2)+pos{1}(4);
plotspace=top-bottom;
pos{2}(4)=plotspace/2;
pos{1}(4)=plotspace/2;
pos{1}(2)=bottom+plotspace/2;

set(h(1),'position',pos{1});
set(h(2),'position',pos{2});
