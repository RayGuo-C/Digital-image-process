% Periodic noise

% Type:
% image signal is subject to a periodic, rather than a random disturbance

% Source:
% Remove Method: 

im = imread('twin.tif');

s=size(im);
[x,y]=meshgrid(1:s(2),1:s(1));
p=sin(x/3+y/5)+1;
im_pn=(im2double(im)+p/2)/2;
imwrite(im_pn,'periodic.tif');

% plot
subplot(2,2,1), imshow(im),title('original_img');
subplot(2,2,2), imhist(im);
subplot(2,2,3), imshow(im_pn),title('periodic');
subplot(2,2,4), imhist(im_pn);