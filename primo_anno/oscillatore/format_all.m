function format_all(folder)
    files = dir(folder);
    for i = 1:length(files)
        if ~files(i).isdir
            Format(strcat(folder,"/",files(i).name));
        end
    end
end