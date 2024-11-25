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

    % Initialize results as an empty table
    results = table([], [], [], [], [], [], [], ...
        'VariableNames', {'Righe', 'Ordine', 'Theta', 'dTheta', 'dLambda', 'Dreal', 'Dteo'});

    
end