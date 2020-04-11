clear all
close all

N = 1501;
c = 0.1;
eps = 0.4;
tf = 3;
c0 = 0.8;

[U1,U2,x,t] = solver(N,c,eps,tf,c0);
[X,T] = meshgrid(x,t);

%[u1T, u2T, E1, E2, Et] = Energy(U1,U2,x);
%figure(1999)
%subplot(221)
%plot(t,u1T)
%xlabel('time [s]')
%ylabel('Height')
%subplot(222)
%plot(t,u2T)
%xlabel('time [s]')
%ylabel('Momentum')
%subplot(223)
%plot(t,E1)
%xlabel('time [s]')
%ylabel('Height Energy')
%subplot(224)
%plot(t,E2)
%xlabel('time [s]')
%ylabel('Momentum Energy')
%figure(2003)
%plot(t, Et)
%xlabel('time [s]')
%ylabel('Total Energy')
figure(2000)
surf(T,X,U1,'EdgeColor','none')
xlabel('Time [s]')
ylabel('x [m]')
zlabel('h [m]')
colorbar()


figure(2001)
surf(T,X,U2./U1,'EdgeColor','none')
colorbar()
%view(2)
