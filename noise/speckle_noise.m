% Speckle noise

% Type:
% multiplicative noise, and it can be modelled by random values multiplied by pixel values

% Source:
% Speckle noise is a major problem in some radar applications

% Remove Method:
% Gaussian noise and speckle noise appear superficially similar, but they are formed by two
% totally different methods, and, as we shall see, require different approaches for their removal.

im = imread('twin.tif');

im_spk=imnoise(im,'speckle');
imwrite(im_spk,'speckle.tif');

% plot
subplot(2,2,1), imshow(im),title('original_img');
subplot(2,2,2), imhist(im);
subplot(2,2,3), imshow(im_spk),title('sparkle');
subplot(2,2,4), imhist(im_spk);