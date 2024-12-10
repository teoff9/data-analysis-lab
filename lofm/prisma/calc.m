function calc()
    data = load("data.txt");
    l = data(:, 1)*1e3;
    n = data(:,2);
    err_n = data(:,3);
    err_l = data(:, 4);

    x = l.^(-2);
    y = n.^2;
    err_y = 2*n.*err_n;
    err_x =2 * l.^(-3).*err_l;
    m = reglin([x,y,err_y]);
    err_y = (err_y.^2 + (err_x.*m).^2).^0.5;
    [m,q, dm, dq] = reglin([x,y,err_y]);
    chi = chi2(x,y,err_y,m,q);
    
    graph_with_uncertanties(x,y,err_y, m, q, "", "");
    
    disp(err_x*m);
    disp(err_y);

    fprintf("M: %e +- %e\nQ: %e +- %e\n", m, dm, q, dq);
    fprintf("Chi2: %f\n", chi);



end