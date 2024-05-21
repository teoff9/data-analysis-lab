%funziona con vettori n*2 con n numero pari, meta punti prima e meta punti
%dopo il minimo...

function [x, y, dx] = nodi(punti)
    prima = punti(1:length(punti)/2, :);
    dopo = punti((length(punti)/2+1): size(punti,1), :);
    
    % genera gli errori come sull'ultima cifra
    dyp = [];
    dyd = [];
    for i = 1:length(prima(:,2))
        dyp = [dyp ; incertezza(prima(i,2))];
    end
    for i = 1:length(dopo(:,2))
        dyd = [dyd ; incertezza(dopo(i,2))];
    end
    prima = [prima dyp];
    dopo = [dopo dyd];

    %calcola entrambe le regressioni lineari
    [M1, C1, dM1, dC1] = reglin(prima);
    [M2, C2, dM2, dC2] = reglin(dopo);
    disp(M1); disp(C1); disp(M2); disp(C2);

    %calcola intersezione e relativi errori
    x = (C1-C2)/(M2-M1);
    y = M1*x + C1;
    dm12 = dM1^2 + dM2^2;
    dc12 = dC1^2 + dC2^2;
    dx = sqrt( ((1/(M2-M1))^2)*dc12 + (((C1-C2)/(M2-M1)^2)^2)*dm12);
end

