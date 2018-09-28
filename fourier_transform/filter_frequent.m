% filter in the frequency domain


% filter matrix
[x1,y1]=meshgrid(-128:127,-128:127);
e=sqrt(x1.^2+y1.^2);
f1 = (e<10);
f2 = (e>10);
% make a box image
c = zeros(256,256);
c(96:160,96:160) = 1;
% make a fourier transform
cf1 = fftshift(fft2(c));
cf_log = mat2gray(log(1+abs(cf1)));

% low pass filter in frequent
cf2 = cf1.* f1;
cf2_log = mat2gray(log(1+abs(cf2)));
% high pass filer in frequent
cf3 = cf1.* f2;
cf3_log = mat2gray(log(1+abs(cf3)));

% inverse fourier transform
cf2i = ifft2(cf2);
cf3i = ifft2(cf3);

figure,
subplot(3,2,1), imshow(c),title('box');
subplot(3,2,2), imshow(cf_log),title('box_transform');
subplot(3,2,3), imshow(cf2_log),title('low_filter_transform');
subplot(3,2,4), imshow(abs(cf2i)),title('box_low_filter');
subplot(3,2,5), imshow(cf3_log),title('high_filter_transform');
subplot(3,2,6), imshow(abs(cf3i)),title('box_high_filter');
