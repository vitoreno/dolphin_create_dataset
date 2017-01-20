function change_img(source, callbackdata, fig_h)
    img_idx = getappdata(fig_h, 'img_idx');
    img_files = getappdata(fig_h, 'img_files');
    main_txt = getappdata(fig_h, 'main_txt');
    counter_txt = getappdata(fig_h, 'counter_txt');
    current_label = getappdata(fig_h, 'current_label');

    display_im = false;
    if strcmp(source.String, 'Next')
        if img_idx < numel(img_files)
            img_idx = img_idx + 1;
            display_im = true;
        end
    elseif strcmp(source.String, 'Prev')
        if img_idx > 1
            img_idx = img_idx - 1;
            display_im = true;
        end
    else
        display_im = true;
    end
    
    if display_im
        main_txt.String = fullfile(img_files(img_idx).folder, img_files(img_idx).name);
        counter_txt.String = sprintf('%03d/%03d', img_idx, numel(img_files));
        current_label.String = 'NOT LABELLED';
        tmp_im = imread(fullfile(img_files(img_idx).folder, img_files(img_idx).name));
        figure(fig_h);
        im = imagesc(tmp_im);
        im.Parent.XTick = [];
        im.Parent.YTick = [];
        setappdata(fig_h, 'img_idx', img_idx);
        
        im.ButtonDownFcn = {@crop_and_save, fig_h};
    end
end