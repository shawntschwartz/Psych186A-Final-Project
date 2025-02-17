function [featuresTest] = fruitClassification(imdsTest, all_images, is_bw)
%This function classifies each fruit image and its fc7 Fully Connected
% layer.

fprintf('\n\nBeginning Fruit Classification...');

%% Initailize AlexNet as FruitNet
FruitNet = alexnet;
fprintf('\n\nFruitNet Initialization Successfull!');

%% Read In and Resize All Images
for i = 1:length(all_images)
    for j = 1:length(all_images{i})
        cur_image = imread([all_images{i}(j).folder() '/' all_images{i}(j).name()]);
        net_layer_size = FruitNet.Layers(1).InputSize;
        cur_image = imresize(cur_image, [227 227]);
        
        % Setting Controlled Section: B&W Scale Parameter - START
        if (is_bw == 1)
            % make dimension fillers for grayscale
            cur_image = rgb2gray(cur_image);
            filler = zeros(size(cur_image),'uint8');
            cur_image = cat(3,cur_image,filler,filler);
        end
        % Setting Controlled Section: B&W Scale Parameter - END
        
        augimdsTest = augmentedImageDatastore(net_layer_size(1:2), cur_image);
        
        layer = 'fc7';
        
        featuresTest{i}{j} = activations(FruitNet, augimdsTest, layer, 'OutputAs', 'rows');
        
        fprintf('\n\nFruit Subcategory %d with Fruit %d Successfully Imported', i, j);
    end
end
end