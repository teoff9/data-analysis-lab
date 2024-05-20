function output = ampiezza (file_name, n)
    fprintf("\n\nSERIE: %s\n", file_name);
    
    % carica dati da file
    data = readmatrix(file_name);
    positions = data(:,2); %seconda colonna: posizione
    times = data(:,1); %prima colonna: tempo
    
    %determina max e min
    pks = findpeaks(positions, times, 'MinPeakDistance', 0);
    mins = -findpeaks(-positions, times, 'MinPeakDistance', 0);
    
    %mostra media e std pks e min
    fprintf("\nVALORI INIZIALI: \n");
    
    fprintf("Peaks (%i): %f +- %f\n",length(pks),mean(pks), std(pks));
    fprintf("Mins (%i): %f +- %f\n",length(mins), mean(mins), std(mins));
    
    %pulisci i dati se richiesto
    fprintf("VALORI FILTRATI:\n");
    if std(pks) > 0.5
        pks = pks(pks > mean(pks)-n*std(pks) & pks < mean(pks)+n*std(pks));
        fprintf("Peaks (%i): %f +- %f\n",length(pks),mean(pks), std(pks));
    end
    
    if std(mins) > 0.5
        mins = mins(mins > mean(mins)-n*std(mins) & mins < mean(mins)+n*std(mins));
       fprintf("Mins (%i): %f +- %f\n\n",length(mins), mean(mins), std(mins));
    end
    
    %output media e dev standard
    m = mean(mins);
    M = mean(pks);
    s= std(mins);
    S = std(pks);
    A = (M-m)/2;
    dev = 0.5*sqrt(s^(2)+S^(2));
    fprintf("\nA:  %f  +-  %f\n", A, dev);
    serie = regexprep(strcat("1,",regexp(file_name, '\d+\.csv$', 'match', 'once')), '\.csv$', '');
    max_p = max(positions);
    min_p = min(positions);
    output = [serie, A, dev, (max_p-min_p)/2];
end