function [c, sigma_c] = calc_c(f2, D, w, w_0, a, delta_d, sigma_D, sigma_a, sigma_f2)
%RESTITUISCE IL VALORE 'c' E INCERTEZZA 'sigma_c' DAI DATI
    delta_w = w-w_0;
    c = 4*f2*D^(2)*(delta_w)/(delta_d*(D+a-f2));
    dc_dD = (4*f2*delta_w/delta_d)*(D^2+2*D*(a+f2))/(D+a-f2)^2;
    dc_da =4*f2*D^2*delta_w/(delta_d*(D+a-f2)^2);
    dc_df = 4*D^2*delta_w/delta_d*(D+a)/(D+a-f2)^2;
    sigma_c = sqrt( (sigma_D * dc_dD)^2 + (sigma_a * dc_da)^2 + (sigma_f2*dc_df)^2 );
end
