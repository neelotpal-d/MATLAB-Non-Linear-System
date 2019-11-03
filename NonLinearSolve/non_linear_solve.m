function y=non_linear_solve(f,x0,tol)
    % non_linear_solve solves a nonlinear system of  equations using
    % Newton's method
    % y=nol_linear_solve(f,x0,tol) solves the non linear set of n equations
    % f={f1,f2..fn}, where each fi=f(x1,x2...xn)=0 is a function of n
    % variables. f is a cell array containing the function handles. x0 is a
    % column vector with initial guess. tol is the tolerence of the result.
    % x0 should be choosen such that the jacobian of f is non-singular at
    % x0. 
    %Example:
    %   f1=@(x,y)(x^2+y^2-1)
    %   f2=@(x,y)(x+y-5)
    %   y=non_linear_solve({f1,f2},[1;3],1e-3);
    %**NOTE: The function has not been tested for exceptions and will be
    %added in subsequent revisions.
    %------------------Created by: Neelotpal Dutta-------------------------
    y=x0;
    n=length(f);
    z=1000;
    while(abs(z)>=tol)
        J=zeros(n);
        for i=1:n
            for j=1:n
                J(i,j)=func_different(f{i},j,y);
            end
        end
 
         m=num2cell(y);
        fk=ones(n,1);
        for i=1:n
            fk(i)=f{i}(m{:});
        end
        h=linsolve(J,fk);
        
        y=y-h;
        z=0;
        for i=1:n
            z=z+abs(f{i}(m{:}));
        end
        
    end
    
end