I = imread('wobats.tif');% read the image
% show the image
imshow(I) % directly show the image
imshow(I,[low,high]) % show the image that grayvalue range is between low and high
imshow(I,'InitialMagnification','fit') % solve the image which is too big to fit on screen
imshow(I,[]) % enhace the contrast of image whose the grayvaule is small into 0-255. 
% the data type of image
% grayscale image consiste of pixels whose values are of data types unit8, and each pixel need only one byte to store. But arithmetic operation only can on the double type.%
whos I 
% image size 
size(I)

% convert images
% grayscale image: 
J = gray2rgb(I); 
% true color image: consist of three dimension array which represent Red, Green and Blue respectively  

[Y,map] = gray2ind(I,c); % the color map returned as a c-by-3 numeric array and is produced is equivalent to gray(c)
% index image; color map associated with indexed image y. For color information is not directly carried by the image pixel data, but is
% stored in a color map(color palette).And index image can save computer memory and file storage, while speeding up display refresh and file transfers.
imshow(Y,map);

Z = im2wb(I);
% binary image: each pixel is just black or write (0 or 1);