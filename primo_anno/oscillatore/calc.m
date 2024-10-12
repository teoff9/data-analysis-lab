function calc(folder, n)
    files = dir(folder);
    amps = [];
    for i = 1:length(files)
        if ~files(i).isdir
            a = ampiezza(strcat(folder,"/",files(i).name),n);
            amps = [amps; [a]];
        end
    end
    writematrix(amps, "output.csv"); 
end