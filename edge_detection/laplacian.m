% Laplacian
% sceond differences
% it does have the advantage of detecting edges in all directions equally
% well, but it is extremly sensitive to noise
im = imread('circuit.tif');
mask_l = [0 1 0; 1 -4 1; 0 1 0];
im_l = conv2(im,mask_l);

% it also can be came ture by following commands
l_0=fspecial('laplacian',0);
im_l_0=filter2(l_0,im);

figure,
subplot(2,2,1), imshow(im),title('original_img');
subplot(2,2,2), imshow(im_l),title('laplacian');
subplot(2,2,3), imshow(im_l_0),title('laplacian');
