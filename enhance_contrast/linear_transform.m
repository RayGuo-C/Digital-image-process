% liear transformation 
% through this method, we can enhance the whole region of picture
img = imread('block.tif');
[rows, cols] = size(img);
img_lin = img;

for row = 1:rows
    for col = 1:cols
	    img_lin(row,col) = img_lin(row,col) + 50;
    end
end

imwrite(img_lin,'linear_transformation_plus_50.tif');

subplot(2,2,1), imshow(img),title('original_img');
subplot(2,2,2), imhist(img);
subplot(2,2,3), imshow(img_lin),title('linear_transformation_plus_50');
subplot(2,2,4), imhist(img_lin);
