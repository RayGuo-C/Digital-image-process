% Gaussian noise

% Type:
% which also called white noise, and it can be modelled by random values that belong to normally distributed

% Source:
% Principal sources of Gaussian noise in digital images arise during acquisition e.g. sensor noise caused
% by poor illumination and/or high temperature, and/or transmission e.g. electronic circuit noise.

% Remove Method: 
% Gaussian noise can be reduced using a spatial filter, though when smoothing an image, an undesirable outcome
% may result in the blurring of fine-scaled image edges and details because they also correspond to blocked high frequencies.

% add and remove noise 
im = imread('twin.tif');

% add_gaussian_noise
im_ga=imnoise(im,'gaussian');
imwrite(im_ga,'gaussian.tif');

% remove_gaussian_noise
%1. make a avarage for all of noised images
% it only efficent for mean of noise distribution that is equal to zero
I = size(im);
im_ga10 = zeros(I(1),I(2),10);
for i = 1:10
    im_ga10(:,:,i) = imnoise(im,'gaussian');
end
   im_ga10_av=mean(im_ga10,3);
   im_ga10_av=uint8(im_ga10_av);

   im_ga100 = zeros(I(1),I(2),100);
for i = 1:100
   im_ga100(:,:,i) = imnoise(im,'gaussian');
end
   im_ga100_av=mean(im_ga100,3);
   im_ga100_av=uint8(im_ga100_av);

%2. Average Filter
% it only efficent for mean that is equal to zero
a3=fspecial('average',[3,3]); % fspecial creates a two-dimensional filter 
im_ga_av=filter2(a3,im_ga);
im_ga_av = uint8(im_ga_av);

%3. Wiener Filter
im_wi_3=wiener2(im_ga);
im_wi_5=wiener2(im_ga,[5,5]);

figure,
subplot(3,2,1), imshow(im),title('original_img');
subplot(3,2,2), imhist(im);
subplot(3,2,3), imshow(im_ga10_av),title('make a avarage 10');
subplot(3,2,4), imhist(im_ga10_av);
subplot(3,2,5), imshow(im_ga100_av),title('make a avarage 100');
subplot(3,2,6), imhist(im_ga100_av);

figure,
subplot(3,2,1), imshow(im_ga_av),title('Average Filter');
subplot(3,2,2), imhist(im_ga_av);
subplot(3,2,3), imshow(im_wi_3),title('Wiener Filter');
subplot(3,2,4), imhist(im_wi_3);
subplot(3,2,5), imshow(im_wi_5),title('Wiener Filter');
subplot(3,2,6), imhist(im_wi_5);