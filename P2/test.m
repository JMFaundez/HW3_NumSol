clear all
close all

N = 1501;
c = 0.2;
eps = 0.6;
tf = 3;
c0 = 0.8;

[U1,U2,x,t] = solver(N,c,eps,tf,c0);
[X,T] = meshgrid(x,t);

% 
% figure(2000)
% surf(T,X,U1,'EdgeColor','none')
% xlabel('Time [s]')
% ylabel('x [m]')
% zlabel('h [m]')
% colorbar()

tp = [0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.];
ind = zeros(size(tp));
for i=1:length(tp)
    [val ind(i)] = min(abs(t-tp(i)));
end

figure(3000)
hold on
for i=1:length(tp)
    name = ['t=',num2str(tp(i))];
    plot(x,U1(ind(i),:),'DisplayName',name)
end
legend()