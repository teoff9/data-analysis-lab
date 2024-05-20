function Format(fileName)
    % Leggi il contenuto del file
    newIn = fileread(fileName);
    
    % Sostituisci le virgole con punti
    newIn = regexprep(newIn, ',', '.');
    
    % Sostituisci le virgole tra virgolette con virgole
    newIn = regexprep(newIn, '"."', ',');
    
    % Rimuovi le virgolette
    newIn = regexprep(newIn, '"', '');
    
    % Scrivi il nuovo contenuto nel file
    in = fopen(fileName, "w");
    fwrite(in, newIn);
    fclose(in);
end



