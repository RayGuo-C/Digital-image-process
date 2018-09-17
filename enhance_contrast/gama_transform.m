% gamma transformation
im = imread('block.tif');
[rows, cols] = size(img);
img_gam = img;

% while gamma < 1, it can enhance the low gray area of the picture
r_1 = 0.5;
% while gamma > 1, it can enhance the high gray area of the picture
r_2 = 3;

img_gam_1 = imadjust(img_gam,[],[],r_1);
img_gam_2 = imadjust(img_gam,[],[],r_2);

imwrite(img_gam_1, 'gamma_transformation_0.5.tif');
imwrite(img_gam_2, 'gamma_transformation_3.tif');

subplot(3,2,1), imshow(img),title('original_img');
subplot(3,2,2), imhist(img);
subplot(3,2,3), imshow(img_gam_1),title('gamma_0.5');
subplot(3,2,4), imhist(img_gam_1);
subplot(3,2,5), imshow(img_gam_2),title('gamma_3');
subplot(3,2,6), imhist(img_gam_2);