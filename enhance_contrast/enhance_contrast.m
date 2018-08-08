% From the histogram, we can know the number of times each gray level
% The purpose of histogram is make the picture clear, so that wee can get the accurate results on the picture
% There are two kinds of methods to enhace the contrast of picture
% The first is gray various method including linear transformation, gamma transformation, contrast contrasting and histogram equalization


% read the image
img = imread('map.png');
img = rgb2gray(img);
[rows, cols] = size(img);


% liear transformation 
% through this method, we can enhance the whole region of picture
img_lin = img;

for row = 1:rows
    for col = 1:cols
	    img_lin(row,col) = img_lin(row,col) + 50;
    end
end

imwrite(img_lin,'linear_transformation_plus_50.png');
imshow(img_lin), title('linear_transformation');


% gamma transformation
img_gam = img;

% while gamma < 1, it can enhance the low gray area of the picture
r_1 = 0.5
% while gamma > 1, it can enhance the high gray area of the picture
r_2 = 3

img_gam_1 = imadjust(img_gam,[],[],r_1);
img_gam_2 = imadjust(img_gam,[],[],r_2);

imwrite(img_gam_1, 'gamma_transformation_0.5');
figure;
subplot(1,2,1), imshow(img_gam_1),title('gamma_transformation_0.5');
subplot(1,2,2), imhist(img_gam_1);
figure;
imwrite(img_gam_2, 'gamma_transformation_3');
subplot(1,2,1), imshow(img_gam_2),title('gamma_transformation_3');
subplot(1,2,2), imhist(img_gam_2);


% contrast stretching
% through this method, we can enhance the low contrast image to high contrast image
% there are two parameters m and e, we can choose any one by ourselves. But in order to get great results, we choose following methods.
img_con = img;

Min_img = min(min(img));
Max_img = max(max(img));
m = (Min_img + Max_img)/2;

out_put_min = 0.05;
Out_put_max = 0.95;
E_1 = log(1/out_put_min - 1)/log(m/(Min_img + eps));
E_2 = log(1/out_put_max - 1)/log(m/(Max_img + eps));
e = ceil(min(E_1,E_2)-1);

img_con = 1./(1+(m./(img_con+eps)).^e);

imwrite(img_con,'contrast stretching');
subplot(1,2,1), imshow(img_con);
subplot(1,2,2), imhist(img_con);

% histogram equalization


