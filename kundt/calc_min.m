function calc_min(folder)
    files = dir(folder);
    mins = [];
    for i = 1:length(files)
        if ~files(i).isdir
            a = process_file(strcat(folder,"/",files(i).name),n);
            mins = [amps; [a]];
        end
    end
    writematrix(mins, "output.csv"); 
end