% Image Segmentation
% Image segmentation is the process to partition a digital image into
% multiple segments. 
% Goal:
% The goal of image segmentation is to simplify/ or change the
% representation of image into something that is more meaningful and easier
% to analyze.

% method:
% 1. thresholding
% Thresholding method which is the simplest method to segment image, is
% based on a thresholding value to turn a graylevel image into binary image
% Otsu

% 2. region-growning methods
% Region-growning methods rely mainly on the assumption that neighboring
% pixels with one region have similar values
% 2.1 region growth method
% seeded region growing requires seeds as additional input, the 
% segmentation results are dependent on the choice of seeds, and noise in 
% the image can cause the seeds to be poorly placed.
% 2.2 regional split and merge method

% 3. whatersheld method
% Morphological whatesheld provides a complementary approach to
% segmentation of objects. It is exspecially useful to segment objects that
% are toughing one anothor.

