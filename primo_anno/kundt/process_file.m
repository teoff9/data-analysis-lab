%output della forma [frequenza; x1 y1; x2 y2 ....]

function output = process_file(file)
    fprintf("\n %s", file);
    output = [file]; %init output
    data = readmatrix(file);
    if 



end