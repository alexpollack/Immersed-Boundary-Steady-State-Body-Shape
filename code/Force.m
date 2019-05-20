function F=Force(X)
%function F=Force(X, XT)
global kp km dtheta Ks Kb K Nb;


%F = K * (XT - X) %new force function including target points
%F=K*(X(kp,:)+X(km,:)-2*X)/(dtheta*dtheta); %old force function
%Ks 0.00005 (<= 0.005)
%Kb 1 or 5 
Fs = Ks*(abs(X(kp,:)-X)/(dtheta)-1).*((X-X(kp,:))./abs(X(kp,:)-X));
Fb = Kb*1*(X(kp,:)+X(km,:)-2*X)/(dtheta*dtheta);
F = Fs + Fb;

F(:,2) = F(:,2) - 0.08; % gravity ~0.08 is ideal
% frce = 2;
% for k=1:Nb
%     F(k,2) = F(k,2) - frce;
%     if k < Nb/2
%         frce = frce/2;
%     elseif k > Nb/2
%         frce = frce*2;
%     end
%         
% end

% F=Ks.*abs((X(kp,:)-X)./dtheta-1).*((X(kp,:)-X)./abs(X(kp,:)-X)) + ...
%     Kb.*abs((X(kp,:)+X(km,:)-2.*X)./(dtheta*dtheta))./dtheta ...
%     .*((X(kp,:)+X(km,:)-2.*X)./abs(X(kp,:)+X(km,:)-2.*X));
%F=Ks.*abs((X(kp,:)-X)./dtheta-1) + Kb.*abs((X(kp,:)+X(km,:)-2.*X)./(dtheta*dtheta))./dtheta;
%Fs = -2*(X(kp,:)+X(km,:)-2*X)/(dtheta^3);
%Fb = (abs(X(kp,:)-X)/dtheta -1).*((X-X(kp,:))./abs(X(kp,:)-X));
%F= Fs + Fb;