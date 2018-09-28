% fourier transform of matrix
a = ones(8);
af = fft2(a);%make a fourier transforms
af_f = fftshift(af); % put the DC coefficient

% fourier transforms of image
b = [zeros(256,128) ones(256,128)];
bf = fft2(b);
bf_f = fftshift(bf);
% display the transforms
bf1 = log(1 + abs(bf_f));
bf_log = bf1/bf1(129,129);% is similar with : imshow(mat2gray(bf1));
imwrite(b, 'image.tif');

% fourier transforms of box
c = zeros(256,256);
c(96:160,96:160) = 1;
cf = fftshift(fft2(c));
cf_log = mat2gray(log(1+abs(cf)));
imwrite(c, 'box.tif');

% fourier transforms of rotated box whose angle is 45
[x, y] = meshgrid(1:256,1:256); % this method is a little complex
d =(x+y<329)&(x+y>182)&(x-y>-67)&(x-y<73);
df=fftshift(fft2(d));
df_log = mat2gray(log(1+abs(df)));
imwrite(d, 'rotated_box.tif');

% fourier transforms of small circle
[x1,y1]=meshgrid(-128:217,-128:127);
e=sqrt(x1.^2+y1.^2);
f=(e<15);
ef=fftshift(fft2(f));
ef_log = mat2gray(log(1+abs(ef)));
imwrite(f, 'cirlce.tif');

figure,
subplot(4,2,1), imshow(b),title('image');
subplot(4,2,2), imshow(bf_log),title('image_transform');
subplot(4,2,3), imshow(c),title('box');
subplot(4,2,4), imshow(cf_log),title('box_transform');
subplot(4,2,5), imshow(d),title('angled_box');
subplot(4,2,6), imshow(df_log),title('angle_box_transform');
subplot(4,2,7), imshow(f),title('circle');
subplot(4,2,8), imshow(ef_log),title('circle_transform');
