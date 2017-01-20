function change_label(source, callbackdata, main_fig, msg)
    current_label = getappdata(main_fig, 'current_label');
    if strcmp(msg, 'manual_label')
        current_label.String = source.String;
    else
        current_label.String = msg;
    end
end