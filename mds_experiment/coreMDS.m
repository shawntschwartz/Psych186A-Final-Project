%% Get All Dataset Files from mds_datasets directory
all_datasets = dir('mds_datasets/*.mat');
num_datasets = length(all_datasets);

%% Create data structures to hold values from getMDSEigenVals
Y_vals = {};
eig_vals = {};

%% Run getMDSEigenVals for each dataset from dir
for i = 1:num_datasets
    current_file = [all_datasets(i).folder() '/' all_datasets(i).name()];
    [Y_vals{i}, eig_vals{i}] = getMDSEigenVals(current_file);
    
    % Run analyzeMDS script
    analyzeMDS(current_file,i,Y_vals);
end