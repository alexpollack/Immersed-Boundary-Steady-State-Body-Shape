%initialize.m
L=1.0
N=64 %64
h=L/N
ip=[(2:N),1]
im=[N,(1:(N-1))]
Nb=ceil(pi*(L/2)/(h/2))
dtheta=2*pi/Nb
%dtheta=pi/Nb
kp=[(2:Nb),1] %k+1
km=[Nb,(1:(Nb-1))] % k-1
% bend
%K=5 %was 1, now set to 5 fr target body system
K = 1
Ks = 0.00005 %0.00005
Kb = 1       % 1
rho=1
mu=0.01
tmax=4
dt=0.01
clockmax=ceil(tmax/dt)


for k=0:(Nb-1)
  theta=k*dtheta;
  
  % circle
%   shape = 'Cicle';
%   X(k+1,1)=(L/2)+(L/8)*cos(theta); %/6
%   X(k+1,2)=(L/2)+(L/8)*sin(theta) +.3; %/6
  
  
  %theta=theta+dtheta;
  %Oval
%   shape = 'Oval';
%   X(k+1,1)=(L/2)+(L/14)*cos(theta+pi); %/10
%   X(k+1,2)=(L/2)+(L/5)*sin(theta+pi)+.2;    %/4
  
  %upside down tear drop Ks 0.00005 (<= 0.005) Kb 1 or 5
%   shape = 'Upside Down Rain Drop';
%   X(k+1,1)=(L/2)+(L/15)*(1+sin(theta+pi))*cos(theta+pi);
%   X(k+1,2)=(L)+(L/4)*(sin(theta+pi)-1);
  
  %tear drop  Ks 0.00005 Kb 0.5 (<1)
%   shape = 'Rain Drop';
%   X(k+1,1)=(L/2)+(L/15)*(1-cos(theta+pi))*sin(theta+pi);
%   X(k+1,2)=(L)+(L/4)*(cos(theta+pi)-1);
  
  %oblong
%   shape = 'Blob'
%   X(k+1,1)=(L/2)+(L/2)*cos(theta+pi); %/2
%   X(k+1,2)=(L/2)+(L/12)*sin(theta+pi); %/10
%   X(k+1,1) = (1+0.8*X(k+1,1))*X(k+1,2);
%   X(k+1,1) = X(k+1,1) - 0.2;
%   X(k+1,2) = X(k+1,2) + 0.3;

  %Log
  shape = 'Log'
  X(k+1,1)=(L/2)+(L*.45)*cos(theta+pi); %L/4
  X(k+1,2)=(L/2)+(L/28)*sin(theta+pi) + 0.3; %L/50
  
  %Pole
%   shape = 'Pole'
%   X(k+1,1)=(L/2)+(L/28)*cos(theta+pi); %/50
%   X(k+1,2)=(L/2)+(L*.45)*sin(theta+pi) + 0.3; %/4
  


  % upside down "egg"
%   shape = 'Upside Down Egg';
%   X(k+1,1)=(L/2)+(L/10)*cos(theta+pi);
%   X(k+1,2)=(L/2)+(L/5)*sin(theta+pi);
%   X(k+1,2) = -0.5*(1+0.8*X(k+1,2))*(X(k+1,2))^2 +1;
  
  % "egg"
%   shape = 'Egg';
%   X(k+1,1)=(L/2)+(L/10)*cos(theta+pi);
%   X(k+1,2)=(L/2)+(L/5)*sin(theta+pi);
%   X(k+1,2) = 0.5*(1+0.8*X(k+1,2))*(X(k+1,2))^2+.5;

  
  
  %target points
  %XT(k+1,1)=(L/2)+(L/4)*sin(theta+(1/3)*pi);
  %XT(k+1,2)=(L/2)+(L/6)*cos(theta+pi);
end

u=zeros(N,N,2);
for j1=0:(N-1)
  x=j1*h;
  u(j1+1,:,2)=sin(2*pi*x/L);
end

vorticity=(u(ip,:,2)-u(im,:,2)-u(:,ip,1)+u(:,im,1))/(2*h);
dvorticity=(max(max(vorticity))-min(min(vorticity)))/5;
values= (-10*dvorticity):dvorticity:(10*dvorticity);
valminmax=[min(values),max(values)];
xgrid=zeros(N,N);
ygrid=zeros(N,N);
for j=0:(N-1)
  xgrid(j+1,:)=j*h;
  ygrid(:,j+1)=j*h;
end

set(gcf,'double','on')
contour(xgrid,ygrid,vorticity,values)
hold on
plot(X(:,1),X(:,2),'ko')
%plot(XT(:,1),XT(:,2),'ko')
axis([0,L,0,L])
caxis(valminmax)
axis equal
xlim([0 1])
ylim([0 1])
title(sprintf('%s, time = %7.5f',shape,0),'fontsize',18)
%axis manual
drawnow
hold off

