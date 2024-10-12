% Costante di carica dell'elettrone
e = 1.602176634e-19;  % Carica dell'elettrone in Coulomb

% Numero di misure
N = 50;

% Array per le misure
measures = zeros(1, N);

% Generazione delle misure
for i = 1:N
    % Genera un valore casuale per k tra 1 e 10
    k = randi([1, 10]);
    
    % Calcola la carica Q = k * e
    Q = k * e;
    
    % Aggiungi una fluttuazione entro l'1% (deviazione standard)
    fluctuation = Q * 0.01 * randn();  % Fluttuazione gaussiana
    
    % Salva la misura con la fluttuazione
    measures(i) = Q + fluctuation;
end

% Apri il file in modalità scrittura
fileID = fopen('misure.txt', 'w');

% Scrivi i dati nel file
for i = 1:N
    fprintf(fileID, '%e\n', measures(i));  % Formato scientifico
end

% Chiudi il file
fclose(fileID);

disp('Misure salvate nel file "misure.txt".');
