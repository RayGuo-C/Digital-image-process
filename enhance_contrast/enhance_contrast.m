% From the histogram, we can know the number of times each gray level
% The purpose of histogram is make the picture clear, so that wee can get the accurate results on the picture
% There are two kinds of methods to enhace the contrast of picture
% The first is gray various method including linear transformation, gamma transformation, contrast contrasting
% And the second is histogram equalization


% read the image
im = imread('block.jpg');
im = rgb2gray(im); % only read the first dimension that is equal to img = img(:,:,1).
% img = (img(:,:,1) + img(:,:,2) + img(:,:,3))/3; % this transform is the method of imageJ
imwrite(im,'block.tif');
img = inread('block.tif');
[rows, cols] = size(img);


%1. liear transformation 
%   through this method, we can enhance the whole region of picture

%2. gamma transformation
% while gamma < 1, it can enhance the low gray area of the picture
% while gamma > 1, it can enhance the high gray area of the picture

%3. contrast 
% imshow(img,[]);
%3. histogram equalization


