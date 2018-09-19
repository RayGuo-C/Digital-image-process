% Wiener filtering
% de_blur
% but how to know the various parameters of psf and noise/signal for a
% gvien iamge
im_blur = im2double(imread('car_blur.tif'));
im_blur_noise = im2double(imread('car_blur_noise.tif'));

len = 20; 
thate = 0;
psf = fspecial('motion',len,thate);

% restore the blurred image
im_wnr1 = deconvwnr(im_blur,psf,0);

% restore the blurred and noisy image
im_wnr2 = deconvwnr(im_blur_noise,psf, 0);
signal_var = var(im_blur(:));
im_wnr3 = deconvwnr(im_blur_noise, psf, noise_var/signal_var); % estimate the noise/signal is pretty impotant

figure,
subplot(2,2,1), imshow(im),title('original_img');
subplot(2,2,2), imshow(im_wnr1),title('de_blur');
subplot(2,2,3), imshow(im_wnr2),title('de_blur_noise');
subplot(2,2,4), imshow(im_wnr3),title('de_blur_noise_NSR');


