function [c, sigma_c] = calc_all(file_name, f2, D, a, sigma_f2, sigma_a, sigma_D)
%CALCOLA LA VELOCITA C MEDIA CON ERRORE ASSOCIATO CALCOLATO COME SOMMA IN
%QUADRATURA DI MEDIA DI ERRORI SISTEMATICI E DEV STANDARD MEDIA
% file_name = [delta_w, delta_d]
    % Carica i dati dal file (presumibilmente il file contiene w e d)
    data = load(file_name);
    
    % Supponiamo che il file contenga due colonne: w e delta_d
    delta_w = data(:, 1);  % prima colonna: valori di w
    delta_d = data(:, 2)./1000;  % seconda colonna: valori di delta_d
    
    % Array per i valori di c e sigma_c per ciascun set di w e delta_d
    N = length(delta_w);
    c_vals = zeros(N, 1);
    sigma_c_vals = zeros(N, 1);
    
    % Loop attraverso i dati e calcolo delle singole velocità e incertezze
    for i = 1:N
        [c_vals(i), sigma_c_vals(i)] = calc_c(f2, D, delta_w(i), a, delta_d(i), sigma_D, sigma_a, sigma_f2);
    end
    
    % Calcola la media delle velocità c
    c = mean(c_vals);
    
    % Errore associato: somma in quadratura dell'errore sistematico (media degli errori)
    % e la deviazione standard della media
    sigma_c_sys = mean(sigma_c_vals);  % media degli errori sistematici
    sigma_c_stat = std(c_vals) / sqrt(N);  % errore statistico (dev standard della media)
    
    % Errore totale combinato
    sigma_c = sqrt(sigma_c_sys^2 + sigma_c_stat^2);

    fprintf("Err sys:  %f  | Err stat:  %f\n", sigma_c_sys, sigma_c_stat);
    fprintf("C = %f +- %f", c, sigma_c);
end
