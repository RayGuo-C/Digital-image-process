% unsharp masking
% the idea of sharp masking is to substract a scaled 'unsharp' version of
% the image from the original.
im = imread('cat.tif');
f = fspecial('average');
im_f = filter2(f,im);
im_u = double(im) - im_f/1.5;
im_u = im_u/80;

% directly use command
im_f_u = fspecial('unsharp',0.5);
im_un = filter2(im_f_u, im);

figure,
subplot(2,2,1), imshow(im),title('original_img');
subplot(2,2,2), imshow(im_u),title('unsharp_enhancement');
subplot(2,2,3), imshow(im_un/255),title('unsharp_enhancement_unsharp');

