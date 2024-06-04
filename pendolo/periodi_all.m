function periodi_all(folder)
    f = dir(folder);
    files = f(~[f.isdir]);
    fnames = {files.name};
    filename = string(fnames);
    ms = [];
    for i = 1:length(filename)
        full_path = strcat(folder,"/",filename(i));
        [~, ~, m, s] = media_mobile(readmatrix(full_path), filename(i));
        ms = [ms; [m, s]];
    end
    T = table(filename', ms(:,1), ms(:,2));
    writetable(T, "output.csv");
end