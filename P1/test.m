clear all
close all

alpha = 1;
beta = 0;
dx = 0.04;
dt = 0.0002;
[x,t,U,M] = solver(alpha,beta,dx,dt);
A = full(M);


tp = linspace(min(t),max(t),5);
ind = zeros(size(tp));
for i=1:length(tp)
    [val, ind(i)] = min(abs(t-tp(i)));
end

figure(1000)
hold on
for i=1:length(tp)
    name = ['t=',num2str(tp(i))];
    plot(x,U(ind(i),:),'DisplayName',name)
end
legend()
xlabel('x')
ylabel('u')

xp = linspace(min(x),max(x),5);
indx = zeros(size(xp));
for i=1:length(xp)
    [val, indx(i)] = min(abs(x-xp(i)));
end

figure(2000)
hold on
for i=1:length(xp)
    name = ['x=',num2str(xp(i))];
    plot(t,U(:,indx(i)),'DisplayName',name)
end
xlabel('t')
ylabel('u')
legend()