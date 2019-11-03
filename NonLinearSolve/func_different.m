function v=func_different(f,var_num,coord)
    %Returns the parial derivative of a function defined by the function handle f
    % w.r.t. the (var_num)th variable at the coordinates coord. 
    h=1e-7;
    coord1=coord;
    coord1(var_num)=coord1(var_num)+h;
    c1=num2cell(coord1);
    coord2=coord;
    coord2(var_num)=coord2(var_num)-h;
    c2=num2cell(coord2);
    v=(f(c1{:})-f(c2{:}))/(2*h);
    
    
    if (~isreal(v) || isnan(v) )
       coord1(var_num)=coord1(var_num)-h; 
       c1=num2cell(coord1);
       v=(f(c1)-f(c2))/(h);
    end
    
     if (~isreal(v) || isnan(v) )
       coord2(var_num)=coord2(var_num)+2*h; 
       c2=num2cell(coord2);
       v=(f(coord2)-f(coord1))/(h);
    end
end