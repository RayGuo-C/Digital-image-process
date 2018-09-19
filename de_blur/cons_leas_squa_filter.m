% Constrained least squares filter
% the effect of de_blur is better than wiener filter
% there are some problems

im = imread('car.tif');
im_blur_noise = imread('car_blur_noise.tif');
[rows,cols] = size(im_blur_noise);

len = 20; 
thate = 0;
psf = fspecial('motion',len,thate);
Pf = psf2otf(psf,[rows,cols]);%�˻�������FFT

p = [0 -1 0;-1 4 -1;0 -1 0];%������˹ģ��
P = psf2otf(p,[rows,cols]);
gama = 0.001;
If = fft2(im_blur_noise);
numerator = conj(Pf);%conj������������һ�������ĸ�����
denominator = Pf.^2 + gama*(P.^2);
deblurred2 = ifft2( numerator.*If./ denominator );%Լ����С���˷��˲���Ƶ�����еı��ʽ

figure,
subplot(1,2,1), imshow(im),title('original_img');
subplot(1,2,2), imshow(deblurred2),title('de_blur_noise');

