function calc_e_m(file_name, correzioneB)
    %CALC_E_M
    %CALCOLA REGRESSIONE LINEARE DI E/M, GENERA GRAFICO E CHI2
    % file_name = /path/to/file del tipo [dV, I, 2R]
    
    %dati iniziali
    N = 130; %numero di spire
    mu0 = 4*pi*10^(-7); %permeabilita' magnetica
    Rb = 0.156; %raggio bobine = distanza bobine

    %carica dati
    data = load(file_name);
    dV = data(:, 1);
    I = data(:, 2);
    R = data(:, 3)/2000;
    B = I*8*mu0*N/(5*sqrt(5)*Rb) + correzioneB;
    
    %calcola errori su y
    dy = 0.001 * sqrt(2) * B .* sqrt(R);

    %calcola regressione lineare
    x = dV.*2;
    y = (B.*R).^2;
    [m, q, dm, dq] = weighted_reglin(x, y, dy);
    
    %chi2

    %genera grafico
    graph_with_uncertanties(x,y,dy, m, q, "", "");

    %output dei dati
    fprintf(" e / m  =  %e \n", m^(-1));
    fprintf("m, q, dm, dq  = %e %e %e %e\n", m, q, dm, dq);


end