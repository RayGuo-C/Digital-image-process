% Canny
% step1: Soomth the image with a Guassian filter
% step2: Calculate the magnitude and direction of gradient using finite
% difference of first-order partial derivate
% step3: Non-maximal suppression of gradient magnitude
% step4: Detect and link edge using double threshold algorithm

im = imread('circuit.tif');
im_canny = edge(im,'Canny',0.3);
im_p=edge(im,'Prewitt');
im_s=edge(im,'Sobel');

subplot(2,2,1), imshow(im),title('original_img');
subplot(2,2,2), imshow(im_canny),title('Canny');
subplot(2,2,3), imshow(im_p),title('prewitt');
subplot(2,2,4), imshow(im_s),title('sobel');
