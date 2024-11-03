function [e, sigma_e] = calc_e(file_name, Q, q_prova, delta, N)
%CALCOLA e MINIMIZZANDO L'ERRORE
% file_name = [Qi]
% q_prova : carica di prova
% delta : range attorno al valore di prova
% N : determina densita' del range
    q = q_prova;

    if file_name ~= ""
        Q = load(file_name);
    else
        Q = Q;
    end
    %genera range di qi di prova
    qi = linspace(q-delta, q+delta, N);
    S = zeros(length(qi), 1);
    for i=1:length(qi)
        S(i) = calc_Sq(qi(i), Q);
    end
    
    %trova 'e' e stampala
    [minS, i] = min(S);
    e = qi(i);  %questo è già il valore di e: usando la funzione min di matlab, oppure ora calcolo il minimo come derivata nulla
    fprintf("S(e) = %e - e is : %e (%.3f%%)\n", minS, e, (e-q_prova)*100/q_prova);
    %plot(e, minS, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    hold on;
    ki = round(Q/e);
    e = sum( Q./ ki) / length(Q);
    sigma_e = sqrt( minS/( length(Q)*(length(Q)-1) ) );
    fprintf("S(e) = %e - e is : %e +- %e (%.3f%%)\n", calc_Sq(e, Q), e, sigma_e, (e-q_prova)*100/q_prova);
    
    %plotta il grafico
    scatter(qi, S);
    legend("S(q)", "Minimo");
    hold on;
    plot(e, calc_Sq(e, Q), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');

end