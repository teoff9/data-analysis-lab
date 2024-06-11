function [m, q, dm, dq] = weighted_reglin(data)
%REGLIN Regressione lineare pesata, include incertezze. y = mx +q
%   Regressione lineare pesata, include incertezze.
%   [x, y, dy] formato di data

    %variabili
    x = data(:, 1);
    y = data(:, 2);
    dy2 = data(:,3).^2;

    %sommatorie varie e determinante
    xi_dy2 = sum(x./dy2);
    yi_dy2 = sum(y./dy2);
    dy2_1 = sum(dy2.^(-1));
    xy_dy2 = sum(x.*y./dy2);
    x2_dy2 = sum(x.*x./dy2);
    det = dy2_1*x2_dy2-xi_dy2^2;

    %calcolo m, q e incertezze relative
    m = ( dy2_1*xy_dy2-xi_dy2*yi_dy2 )/det;
    q = ( x2_dy2*yi_dy2-xi_dy2*xy_dy2 )/det;
    dm = sqrt(dy2_1/det);
    dq = sqrt(x2_dy2/det);
end

