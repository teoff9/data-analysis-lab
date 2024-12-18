
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
    dR = 0.002;
    dI = mu0*(4/5)^(3/2)*N*0.001/Rb;
    dRb = -mu0*(4/5)^(3/2)*N*I*0.002/(Rb^2);
    dB = sqrt(dI.^2 + dRb.^2);
    dy = sqrt((dR * 2 * R .* B.^2).^2 + (dB * 2 .* B .* R.^2).^2);
    
    %calcola regressione lineare
    x = dV.*2;
    y = (B.*R).^2;
    [m, q, dm, dq] = weighted_reglin(x, y, dy);
    
    %chi2
    chi2rid = chi2(x, y, dy, m, q);

    %calcola correzione Q
    ds = R.*(-1)+sqrt(R.^2+(-1)*q./(B.^2));
    d = mean(ds);
    dD = std(ds);
    dd = dD/sqrt(length(ds));

    %genera grafico
    %graph_with_uncertanties(x,y,dy, m, q, "X = 2$\Delta$V [V]", "Y = $B^2R^2$ [$T^2m^2$]");
    
    %output dei dati
    fprintf("m = %e +- %e | q = %e +- %e\n", m, dm, q, dq);
    fprintf("e / m  =  %e +- %e\n", m^(-1), (m)^(-2) * dm);
    fprintf("err perc: %f\n", (m)^(-2) * dm/m^(-1)*100);
    fprintf("Chi2 ridotto = %f\n", chi2rid);
    fprintf("correzione R: %f +- %f   with sigma = %f\n", d, dd, dD);
end