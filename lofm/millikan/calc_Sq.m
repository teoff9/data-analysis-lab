function Sq = calc_Sq(q_prova, Qi)
%calcola data la carica di prova q_prova, lo scarto quadratico medio
%rispetto a Qi array di cariche misurate
    ki = floor(Qi/q_prova + 0.5);
    Sq = sum((Qi./ki - q_prova).^2);

end