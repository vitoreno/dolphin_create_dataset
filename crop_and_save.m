function crop_and_save(source, callbackdata, fig_h)
	current_label = getappdata(fig_h, 'current_label');
    if ~strcmp(current_label.String, 'NOT LABELLED')
        cropped_image = imcrop();
        
        execution_datetime = getappdata(fig_h, 'execution_datetime');
        output_path = getappdata(fig_h, 'output_path');
        output_date = getappdata(fig_h, 'output_date');
        img_idx = getappdata(fig_h, 'img_idx');
        img_files = getappdata(fig_h, 'img_files');

        output_file = fullfile(output_path, ...
                            sprintf('%s_%s_%03d.png', current_label.String, output_date, img_idx));
        
        disp([get_datetime_str(), ';', ...
                fullfile(img_files(img_idx).folder, img_files(img_idx).name), ';', ...
                output_file]);
        imwrite(cropped_image, output_file);
    end
end