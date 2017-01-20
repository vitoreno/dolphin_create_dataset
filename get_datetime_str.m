function dt_str = get_datetime_str()
    clk = clock();
    dt_str = '';
    for i=1:3
        dt_str = strcat(dt_str, num2str(round(clk(i)),'%02d'));
    end
    dt_str = [dt_str, '_'];
    for i=4:6
        dt_str = strcat(dt_str, num2str(round(clk(i)),'%02d'));
    end
end