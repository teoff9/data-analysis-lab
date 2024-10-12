function [e, sigma_e] = calc_e(file_name, q_prova, delta, N)
%CALCOLA e MINIMIZZANDO L'ERRORE
% file_name = [Qi]
% q_prova : carica di prova
% delta : range attorno al valore di prova
% N : determina densita' del range
    q = q_prova;
    Q = load(file_name);
    %genera range di qi di prova
    qi = linspace(q-delta, q+delta, N);
    S = zeros(length(qi), 1);
    for i=1:length(qi)
        S(i) = calc_Sq(qi(i), Q);
    end
    
    %trova 'e' e stampala
    [minS, i] = min(S);
    q_min = qi(i);  %questo potrebbe essere gia' e...
    ki = floor(Q/q_min + 0.5);
    e = sum( Q./ ki) / length(Q);
    sigma_e = sqrt( minS/( length(Q)*(length(Q)-1) ) );
    fprintf("e is : %e +- %e", e, sigma_e);

    
    
    %plotta il grafico
    plot(qi, S);
    hold on;
    plot(e, minS, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');

end