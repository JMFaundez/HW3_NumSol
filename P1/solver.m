function [x,t,U,A] = solver(alpha, beta,dx,dt)
    
    tf = 2;
    x = 0:dx:2*pi;
    t = 0:dt:tf;
    N = length(x);
    Nt = length(t);
    mu1 = beta*dt/dx^4;
    mu2 = alpha*dt/dx^2
    
    
    % finite difference matrix
    b_2 = mu1*ones(N,1);
    b_1 = (mu2 - 4*mu1)*ones(N,1);
    b0 = (1 - 2*mu2 + 6*mu1)*ones(N,1);
    b1 = (mu2 - 4*mu1)*ones(N,1);
    b2 = mu1*ones(N,1);
    A = spdiags([b_2 b_1 b0 b1 b2],-2:2, N,N);
    
    % Apply BC
    A(1,N-1) = b_1(1);
    A(1,N-2) = b_2(1);
    A(N,2) = b1(1);
    A(N,3) = b2(1);
    A(N,N) = 0;
    A(N,1) = A(1,1);
    
    U = zeros(Nt,N);
    U(1,:) = sin(x);
    for i=2:Nt
        U(i,:) = A*U(i-1,:)';
    end
end