%funziona con vettori n*2 con n numero pari, meta punti prima e meta punti
%dopo il minimo...

function [x, y] = intersezione(punti)
    prima = punti(1:length(punti)/2, :);
    dopo = punti((length(punti)/2+1): size(punti,1), :);
    if length(punti) == 4
        %calcola coeff. angolari
        M1 = (prima(2,2)-prima(1,2))/(prima(2,1)-prima(1,1));
        M2 = (dopo(2,2)-dopo(1,2))/(dopo(2,1)-dopo(1,1));
        %calcola intercette 
        C1 = -M1*prima(1,1)+prima(1,2);
        C2 = -M2*dopo(1,1)+dopo(1,2);
    
    else
        % Costruisci la matrice A dei punti prima e B dei punti dopo
        A = [prima(:,1), ones(length(prima(:,1)), 1)];
        B = [dopo(:,1), ones(length(dopo(:,1)), 1)];
        % Risolvi il sistema lineare A * coeff = y per ottenere i coefficienti
        coeff1 = A \ prima(:, 2);
        coeff2 = B \ dopo(:,2);
        % Estrai i coefficienti della retta
        M1 = coeff1(1);  % Pendenza
        C1 = coeff1(2);  % Intercetta
        M2 = coeff2(1);  % Pendenza
        C2 = coeff2(2);  % Intercetta

    end

    %calcola intersezione
    x = (C1-C2)/(M2-M1);
    y = M1*x + C1;
end