%semipulite = [2 4 6 7 8 9 10 11 12 14];
%combinazioni = nchoosek(1:15, 10);

hopeBest = [2 4 5 6 7 8 9 10 11 14];

%bestE = 0;
%
%for i=1:length(combinazioni)

    Q = [];

    for j=1:10
        %Q = [Q; load("goccia_"+combinazioni(i,j)+".txt")];
        Q = [Q; load("data/goccia_"+hopeBest(1, j)+".txt")];
    end

    %disp(combinazioni(i,:));
    [e, sigma_e] = calc_e("", Q, 1.60217663e-19, 0.2e-19, 1000000);

    %if bestE == 0
    %    bestE = e;
    %else
    %    if abs((bestE - 1.6019e-19)*100/(1.6019e-19)) > abs((e - 1.6019e-19)*100/(1.6019e-19))
    %        bestE = e;
    %    end
    %end
%end

%fprintf("Miglior valore di e: %e", bestE);