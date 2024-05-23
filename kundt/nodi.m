%funziona con vettori n*2 con n numero pari, meta punti prima e meta punti
%dopo il minimo...

data = readmatrix("data_2317.csv");

output = [];
for i=0:(length(data)/4)-1
    input = data(4*i + 1 : 4*i + 4, :);
    [x, dx] = intersezione(input);
    output = [output; x dx];
end

function [x, dx] = intersezione(punti)
    prima = punti(1:length(punti)/2, :);
    dopo = punti((length(punti)/2+1): size(punti,1), :);

    [M, dM, Q, dQ] = regLin([prima(:,1); dopo(:,1)], [prima(:,2); -dopo(:,2)]);
    
    x = -Q/M;
    dx = sqrt((1/M)^2*dQ^2 + (Q/(M^2))^2*dM^2);
end

function [A, dA, B, dB] = regLin(X, Y)
    dY = repmat(abs(((Y(4)-Y(1))/(X(4)-X(1)))*0.1), 4, 1); %errore originale dY trascurabile: uso Mtest calcolato tra primo e ultimo punto

    X2 = [];
    XY = [];
    dY2 = [];
    XdY2 = [];
    X2dY2 = [];
    XYdY2 = [];
    YdY2 = [];

    for i=1:length(X)
        X2 = [X2; X(i)^2];
        XY = [XY; X(i)*Y(i)];
        dY2 = [dY2; 1/(dY(i)^2)];
        XdY2 = [XdY2; X(i)/(dY(i)^2)];
        X2dY2 = [X2dY2; X2(i)/(dY(i)^2)];
        XYdY2 = [XYdY2; XY(i)/(dY(i)^2)];
        YdY2 = [YdY2; Y(i)/(dY(i)^2)];
    end

    Det = sum(dY2)*sum(X2dY2)-sum(XdY2)^2;
    B = (1/Det)*(sum(X2dY2)*sum(YdY2)-sum(XdY2)*sum(XYdY2));
    A = (1/Det)*(sum(dY2)*sum(XYdY2)-sum(XdY2)*sum(YdY2));
    dB = sqrt((1/Det)*sum(X2dY2));
    dA = sqrt((1/Det)*sum(dY2));
    fprintf("A: %f +- %f - B: %f +- %f\n", A, dA, B, dB);

    figure();
    scatter(X, Y);
    errorbar(X,Y,dY,dY,"LineStyle","none");
    LX = [X(1) X(end)];
    LY = A*LX + B;
    hold on
    plot(LX, LY);
end