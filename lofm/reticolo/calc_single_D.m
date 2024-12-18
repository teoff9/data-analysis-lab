function row = calc_single_D(row1, row2)
    % Initial data
    d = 3.3700*10^(-6);
    % Calculate values for the row
    Righe = strcat(row1.nome, "-", row2.nome);
    Ordine = row1.ordine;
    Theta = min(row1.theta, row2.theta);
    dTheta = max(row1.theta, row2.theta) - Theta;
    dLambda = abs(row1.lamda - row2.lamda)*10^(-9);
    Dreal = dTheta / dLambda;
    Dteo = Ordine / (d * cos(Theta));

    % Create a table row
    row = table(Righe, Ordine, Theta, dTheta, dLambda, Dreal, Dteo);
end