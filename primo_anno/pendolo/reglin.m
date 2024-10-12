function [m, q, dm, dq] = reglin(data)
%REGLIN Regressione lineare con minimi quadrati, include incertezze. y=mx+q
%   Regressione lineare con minimi quadrati, include incertezze.
%   [x, y, dy] formato di data
%   assume dy tutti uguali per ogni y

    %variabili
    x = data(:, 1);
    y = data(:, 2);
    dy2 = data(1, 3)^2; % assumendo dy tutti uguali

    %sommatorie varie e determinante
    s_x = sum(x);
    s_y = sum(y);
    s_xy = sum(x.*y);
    s_x2 = sum(x.*x);
    N = length(x);
    det = N*s_x2-s_x^2;

    %calcolo m, q e incertezze relative
    m = ( N*s_xy - s_x*s_y )/det;
    q = ( s_x2*s_y - s_x*s_xy )/det;
    dm = (N/det)*dy2;
    dq = dy2*s_x2/det;

end

