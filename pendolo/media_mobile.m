function [medie_mobili, dev_std_mobili, media_totale, dev_std_media] = media_mobile(dati)
    %determiniamo M come 2/3 di N
    N = length(dati);
    M = floor(2*N/3);

    % Numero di medie mobili da calcolare
    K = N - M + 1;
    
    % Prealloca i vettori per le medie mobili e le loro deviazioni standard
    medie_mobili = zeros(1, K);
    dev_std_mobili = zeros(1, K);
    
    % Calcola le medie mobili
    for k = 1:K
        finestra = dati(k:k+M-1);
        medie_mobili(k) = mean(finestra);
    end
    
    % Calcola la media delle medie mobili
    media_totale = mean(medie_mobili);
    
    % Calcola le deviazioni standard delle finestre mobili usando la media delle medie mobili
    for k = 1:K
        finestra = dati(k:k+M-1);
        dev_std_mobili(k) = sqrt(sum((finestra - media_totale).^2) / (M-1));
    end
    
    % Calcola la deviazione standard della media delle medie mobili
    dev_std_media = std(medie_mobili) / sqrt(K);
    
    % Stampa i risultati
    fprintf('Medie mobili:\n');
    disp(medie_mobili);
    
    fprintf('Deviazioni standard delle medie mobili (usando la media delle medie):\n');
    disp(dev_std_mobili);
    
    fprintf('Media delle medie mobili: %.4f\n', media_totale);
    fprintf('Deviazione standard della media delle medie mobili: %.4f\n', dev_std_media);
end
