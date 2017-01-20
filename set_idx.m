function set_idx(source, callbackdata, fig_h)
    dlg_res = inputdlg('Select image index:');
    new_idx = str2double(dlg_res{1});
    
    img_files = getappdata(fig_h, 'img_files');
    if new_idx > 0 && new_idx <= numel(img_files)
        setappdata(fig_h, 'img_idx', new_idx);
        change_img(source, callbackdata, fig_h);
    end
    
end