% make a motion blur to an image

im = imread('car.tif'); 
% make blur
len = 20; % leng specifies the length of mothion
thate = 0; % thate specifies the angle of mothion
f = fspecial('motion',len,thate);
im_blur = imfilter(im,f);
imwrite(im_blur,'car_blur.tif');
% simulate addtiontive noise
noise_mean = 0;
noise_var = 0.001;
im_noisy = imnoise(im_blur, 'gaussian', noise_mean, noise_var);
imwrite(im_noisy,'car_blur_noise.tif');

figure,
subplot(2,2,1), imshow(im),title('original_img');
subplot(2,2,2), imshow(im_blur),title('car_blur');
subplot(2,2,3), imshow(im_noisy),title('car_blur_noise');
