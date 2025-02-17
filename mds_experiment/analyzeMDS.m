function analyzeMDS(current_dataset, iterator, Y_vals)
%This function creates a plot of the MDS data for the current dataset.

load(current_dataset);

figure('name', current_dataset);
plot(Y_vals{iterator}(:,1), Y_vals{iterator}(:,2), '.');
text(Y_vals{iterator}(:,1)+0.01, Y_vals{iterator}(:,2), labs); % fruit subcategory labels (labs) is assumed to be a part of the current dataset)
axis auto square;

%% Save figure as png to _output directory
% variable to hold name of the output directory
output_dir = '_output/';

% check if directory already exists, if not, create it
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

% retrieve current file name
[~,name,ext] = fileparts(current_dataset);
current_file_name = [name ext];

% now write figure to output dir
fig_output_filename = [pwd '/' output_dir current_file_name '_figure.png'];
saveas(gcf, fig_output_filename);

%% Save list of fruit subcategories to txt file
subcat_output_filename = [pwd '/' output_dir current_file_name '_subcategories.txt'];
dlmwrite(subcat_output_filename, labs, '');
end