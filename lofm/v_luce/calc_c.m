function [c, sigma_c, sD, sa, sf2, sdeltad] = calc_c(f2, D, delta_w, a, delta_d, sigma_D, sigma_a, sigma_f2)
%RESTITUISCE IL VALORE 'c' E INCERTEZZA 'sigma_c' sistematico DAI DATI
    c = 4*f2*D^(2)*(delta_w)/(delta_d*(D+a-f2));
    dc_dD = (4*f2*delta_w/delta_d)*(D^2+2*D*(a-f2))/(D+a-f2)^2;
    dc_da =4*f2*D^2*delta_w/(delta_d*(D+a-f2)^2);
    dc_df = (4*D^2*delta_w/delta_d)*(D+a)/(D+a-f2)^2;
    sD = (sigma_D * dc_dD);
    sa = (sigma_a * dc_da);
    sf2 = (sigma_f2*dc_df);

    dc_deltad = 4*f2*D^(2)*(delta_w)/(delta_d^(2)*(D+a-f2));
    sdeltad = 0.00003 * dc_deltad;

    sigma_c = sqrt( sD^2 + sa^2 + sf2^2 + sdeltad^2);
end
