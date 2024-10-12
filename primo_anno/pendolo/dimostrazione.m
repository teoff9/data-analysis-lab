% Definisci N
N = 59;

% Prealloca l'array dei risultati
y = zeros(1, 60);
x = zeros(1,60);

% Calcola i valori per M che varia da 1 a 60
for M = 1:60
    y(M) = 1 / (M * sqrt(N - M + 1));
    x(M) = M;
end

% Visualizza i risultati
plot(x,y);
[minimo, i_min] = min(y);
x_min = x(i_min);
fprintf('(x,y) minimi: %.4f %.4f \n', x_min, minimo);
