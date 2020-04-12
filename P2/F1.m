function F = F1(u1,u2,alpha)
	f = u2;
	F = 0.5*(f(2:end)+f(1:end-1) - alpha*(u1(2:end)-u1(1:end-1)));
end
