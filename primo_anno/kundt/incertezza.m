function dy = incertezza(n)
    % Converti il numero in una stringa con notazione scientifica
    nStr = sprintf('%.2e', n);
    % Estrai l'esponente dalla notazione scientifica
    [~, exponent] = strtok(nStr, 'e');
    exponent = str2double(exponent(2:end));
    % Calcola l'incertezza come 10^(esponente - 2)
    % -2 perché stiamo considerando 3 cifre significative
    dy = 10^(exponent - 3);
end


