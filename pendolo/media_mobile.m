function [medie_mobili, dev_std_media_mobili, m, s] = media_mobile(dati)
    %determiniamo M come 2/3 di N
    N = length(dati);
    M = round(2*N/3);

    % Numero di medie mobili da calcolare
    K = N - M + 1;
    
    % Prealloca i vettori per le medie mobili e le loro deviazioni standard
    medie_mobili = zeros(1, K);
    dev_std_media_mobili = zeros(1, K);
    
    % Calcola le medie mobili
    for k = 1:K
        finestra = dati(k:k+M-1);
        medie_mobili(k) = mean(finestra);
        dev_std_media_mobili(k) = std(finestra)/sqrt(M);
    end
    
    % Calcola la media delle medie mobili
    m = mean(medie_mobili);
    
    % Calcola la deviazione standard della media delle medie mobili
    s = std(dati) / (M*sqrt(K));
    
    % Stampa i risultati
    fprintf('Medie mobili:\n');
    disp(medie_mobili);
    
    fprintf('Deviazioni standard delle medie mobili:\n');
    disp(dev_std_media_mobili);
    
    fprintf('Media delle medie mobili: %.4f\n', m);
    fprintf('Deviazione standard della media delle medie mobili: %.4f\n', s);
end
