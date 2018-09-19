% Zero crossings & LoG
% A more appropriate use for the Laplacian is to find the position of edges by locating zero crossings
im = imread('circuit.tif');
l=fspecial('laplacian',0);
im_z=edge(im,'zerocross',l);

% Laplacian of Gaussian
% To eliminate some grey level changes interpreted by directly operating zerocross, we may first smooth the image with a Gaussian filter. 
% 1. smooth the image with a Gaussian filter,
% 2. convolve the result with a laplacian,
% 3. find the zero crossings.
log = fspecial('log',13,2);
im_log = edge(im,'zerocross',log);

figure,
subplot(2,2,1), imshow(im),title('original_img');
subplot(2,2,2), imshow(im_z),title('zero cross');
subplot(2,2,3), imshow(im_log),title('log');

