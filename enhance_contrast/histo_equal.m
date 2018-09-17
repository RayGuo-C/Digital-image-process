% histogram equalization
% it can effectively improve the contrast of image
% 1:  
% 2; to calcualte the probalility for different grayvalue,that is probalility histogram
% 3: to get the accumulative histogram
% 4: to get the  according to the accumulation histogram
% 5: to get the each mapped pixel 
img = imread('block.tif');
[rows, cols, nDims] = size(img);
img_hist = img;

r = zeros(1,256);
 for i = 1:rows
     for j = 1:cols
         r(img(i,j)+1) = r(img(i,j)+1)+1; % ?to calculate the count of grayvalue for different graylevel from 1 to 256 
     end
 end
 
s = zeros(1,256);
s(1) = r(1);
for i = 2:256
    s(i) = s(i-1) + r(i);% cumulation histogram: the relevant mount of grayvalue 
end

for i = 1:256
    s(i) = floor((256-1)*s(i)/(rows*cols));%pixel mapping function
end

for i = 1:rows
    for j = 1:cols
        img_hist(i,j) = s(img(i,j)+1);
    end
end

imwrite(img_hist,'hist_equal.tif');

img_imadjust = imadjust(img,[]);imadjust saturates the bottom 1% and the top 1% of all pixel values. This operation increases the contrast of the output image 

subplot(3,2,1), imshow(img),title('original_img');
subplot(3,2,2), imhist(img);
subplot(3,2,3), imshow(img_hist),title('img_hist');
subplot(3,2,4), imhist(img_hist);
subplot(3,2,5), imshow(img_imadjust),title('img_imadjust');
subplot(3,2,6), imhist(img_imadjust); 



