function F = F2(u1,u2,alpha)
	g = 9.61;
	f = u2.^2./u1 + 0.5*g*u1.^2;
	F = 0.5*(f(2:end)+f(1:end-1) - alpha*(u2(2:end)-u2(1:end-1)));
end
