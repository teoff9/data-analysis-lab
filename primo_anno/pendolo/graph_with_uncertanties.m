function graph_with_uncertanties(X_Y_dY, M, Q, titleX, titleY)
%graph_with_uncertanties Produci grafico per regressioni lineari con
%incertezze
%  y = Mx + Q, X_Y_dY = [x y dy]
    x = X_Y_dY(:,1);
    y = X_Y_dY(:,2);
    dy = X_Y_dY(:,3);

    figure("DefaultAxesFontSize", 22);
    points = scatter(x, y);
    hold on
    LX = [0, x'];
    LY = M*LX + Q;
    line = plot(LX, LY);
    error = errorbar(x, y, dy, dy, "LineStyle","none");

    grid on
    grid minor
    points.LineWidth = 2.5;
    points.SizeData = 70;
    points.DisplayName = "Misurazioni";
    line.LineWidth = 2.5;
    line.DisplayName = "Fit Lineare";
    error.LineWidth = 3;
    error.DisplayName = "Dev. Std";
    legend();
    xlabel(titleX, "Interpreter","latex");
    ylabel(titleY, "Interpreter","latex");

end