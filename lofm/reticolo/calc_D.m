function results = calc_D()
    % Function to calculate D
    % input data should be [order, theta, lambda, nome]

    % Load data
    blu = readtable("data/blu.csv");
    giallo1 = readtable("data/giallo1.csv");
    giallo2 = readtable("data/giallo2.csv");
    verde1 = readtable("data/verde1.csv");
    verde2 = readtable("data/verde2.csv");
    viola = readtable("data/viola.csv");
    rosso = readtable("data/rosso.csv");

    data = containers.Map({'blu', 'giallo1', 'giallo2', 'verde1', 'verde2', 'viola', 'rosso'}, ...
                          {blu, giallo1, giallo2, verde1, verde2, viola, rosso});

    % Load combinations
    combinations = readtable("combinations.txt", 'Delimiter', ',', 'ReadVariableNames', false, 'TextType', 'string');

    % Initialize the results
    results = table([], [], [], [], [], [], [], ...
                    'VariableNames', {'Righe', 'Ordine', 'Theta', 'dTheta', 'dLambda', 'Dreal', 'Dteo'});

    % Calcola combinazioni di D
    for i = 1:height(combinations)
        colore1 = data(combinations.Var1{i});
        colore2 = data(combinations.Var2{i});
        
        % Ensure ordine is a vector
        ordini1 = colore1.ordine(:);
        ordini2 = colore2.ordine(:); 
        
        % Find common ordini
        ordini = intersect(ordini1, ordini2);

        for o = ordini'
            % Extract matching rows
            rows1 = colore1(colore1.ordine == o, :);
            rows2 = colore2(colore2.ordine == o, :);

            % Generate combinations of matching rows
            for j = 1:height(rows1)
                for k = 1:height(rows2)
                   %fprintf("Combination: %s - %s : %f - %f\n", colore1.nome{j}, colore2.nome{k}, colore1.ordine(j), colore2.ordine(k));
                   results = [results; calc_single_D(rows1(j, :), rows2(k, :))];
                end
            end
        end
    end
end
