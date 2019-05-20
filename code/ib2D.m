% ib2D.m
% This script is the main program.

global dt Nb N h rho mu ip im a;
global kp km dtheta K Kb Ks shape;

initialize
init_a
area = zeros(clockmax,2);
xypos = zeros(clockmax,3);
%%%% initialize movie setup and plot setup %%%%
myVideo = VideoWriter(strcat(shape,'Body.avi'), 'Uncompressed AVI');
open(myVideo)
F(clockmax) = struct('cdata',[],'colormap',[]);
ax = gca;
ax.Units = 'pixels';
ax.NextPlot = 'replaceChildren';
%pos = ax.Position;
%ti = ax.TightInsert;
%rect = [-ti(1), -ti(2), pos(3)+ti(1)+ti(3), pos(4)+ti(2)+ti(4)];


for clock=1:clockmax
  area(clock, 1) = clock/100;
  area(clock, 2) = polyarea(X(:,1),X(:,2));
  
  XX=X+(dt/2)*interp(u,X);
  ff=spread(Force(XX),XX);
  %new call to force, spread including target points
  %ff=spread(Force(XX,XT),XX); 
  [u,uu]=fluid(u,ff);
  X=X+dt*interp(uu,XX);
  
  xypos(clock, 1) = clock/100;
  xypos(clock, 2) = mean(XX(:,1));
  xypos(clock, 3) = mean(XX(:,2));
  
  %dX =dt*interp(uu,XX);
  %X(:,2)=X(:,2)+dX(:,2); %like its falling
  %X(:,1)=X(:,1)+dX(:,1);

  Xg = X;
  % y
  for i = 1:Nb
    if Xg(i,2) <= 0 && Xg(i,2) > -1
        Xg(i,2) = Xg(i,2) + 1;
    elseif Xg(i,2) <= -1 && Xg(i,2) > -2
        Xg(i,2) = Xg(i,2) + 2;
    elseif Xg(i,2) <= -2 && Xg(i,2) > -3
        Xg(i,2) = Xg(i,2) + 3;
    elseif Xg(i,2) <= -3 && Xg(i,2) > -4
        Xg(i,2) = Xg(i,2) + 4;
    elseif Xg(i,2) <= -4 && Xg(i,2) > -5
        Xg(i,2) = Xg(i,2) + 5;
    elseif Xg(i,2) <= -5 && Xg(i,2) > -6
        Xg(i,2) = Xg(i,2) + 6;
    end
  end
  % y
  for i = 1:Nb
    if Xg(i,2) >= 1 && Xg(i,2) < 2
        Xg(i,2) = Xg(i,2) - 1;
    elseif Xg(i,2) >= 2 && Xg(i,2) < 3
        Xg(i,2) = Xg(i,2) - 2;
    elseif Xg(i,2) >= 3 && Xg(i,2) < 4
        Xg(i,2) = Xg(i,2) - 3;
    end
  end
  % x
  for i = 1:Nb
    if Xg(i,1) >= 1 && Xg(i,1) < 2
        Xg(i,1) = Xg(i,1) - 1;
    elseif Xg(i,1) >= 2 && Xg(i,1) < 3
        Xg(i,1) = Xg(i,1) - 2;
    elseif Xg(i,1) >= 3 && Xg(i,1) < 4
        Xg(i,1) = Xg(i,1) - 3;
    end
  end
  for i = 1:Nb
    if Xg(i,1) <= 0 && Xg(i,1) > -1
        Xg(i,1) = Xg(i,1) + 1;
    elseif Xg(i,1) <= -1 && Xg(i,1) > -2
        Xg(i,1) = Xg(i,1) + 2;
    elseif Xg(i,1) <= -2 && Xg(i,1) > -3
        Xg(i,1) = Xg(i,1) + 3;
    end
  end
  
  %animation:
  vorticity=(u(ip,:,2)-u(im,:,2)-u(:,ip,1)+u(:,im,1))/(2*h);
  contour(xgrid,ygrid,vorticity,values)
  hold on
  %plot(X(:,1),X(:,2),'ko')
  
  plot(Xg(:,1),Xg(:,2),'ko')
  axis([0,L,0,L])
  caxis(valminmax)
  axis equal
  xlim([0 1])
  ylim([0 1])
  title(sprintf('%s, time = %7.5f',shape,clock/100),'fontsize',18)%, drawnow
  %axis manual
  drawnow
  F(clock) = getframe(gcf);  
  hold off
  

end
%%%%% write movie %%%%%
writeVideo(myVideo, F);
close(myVideo);

figure
plot(area(:,1),area(:,2))
xlabel('Time')
ylabel('Area')
title(shape);