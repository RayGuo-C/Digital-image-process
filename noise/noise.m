% To know what type of noise on the image is helpful and even necessary to choose the most appropriate method for reducing the effects 
% the result of quantily of image after removing the noise directly effects
% the late work, such as image segmentm, edge detection et al.

% convert jpg image into tif format  
I = imread('twin.jpg');
J = I(:,:,1);
imwrite(J,'twin.tif');

% Salt and pepper noise

% Gaussian noise
% I find it is difficult to efficiently remove Gaussian the noise

% Speckle noise

% Periodic noise