function change_models_folder(source, callbackdata, models_path, models_fig, main_fig)
    models_subfolder = fullfile(models_path, source.String{source.Value});
    files = dir(models_subfolder);
    files([files.isdir]) = [];
    files(cellfun(@(x)strcmp(x(1), '.'), {files.name})) = [];
    if ~isfield(files, 'folder')
        for i = 1:numel(files)
            files(i).folder = models_subfolder;
        end
    end
    
    models_fig_subplot_h = getappdata(models_fig, 'models_fig_subplot_h');
    delete(models_fig_subplot_h);
    
    figure(models_fig);
    
    models_fig_cols = 4;
    models_fig_rows = ceil(numel(files) / models_fig_cols);
    
    models_fig_subplot_h = [];
    for idx = 1:numel(files)
        tmp_im = imread(fullfile(files(idx).folder, files(idx).name));
        h = subplot(models_fig_rows, models_fig_cols, idx);
        im = imagesc(tmp_im);
        ss = strsplit(files(idx).name, '_');
        im.Parent.XTick = [];
        im.Parent.YTick = [];
        im.ButtonDownFcn = {@change_label, main_fig, ss{1}};
        models_fig_subplot_h = [models_fig_subplot_h, h];
    end
    annotation('line', [0.515 0.515], [0.1 0.9]);
    setappdata(models_fig, 'models_fig_subplot_h', models_fig_subplot_h);
end