% whatershed
% whatershed segmentation is often used to separate touching objects in an
% image
% The key is whether we can identify or mark foreground objects and
% background location
% Method:
%1. Compute a segmentation function. This is an image whose dark regions are 
% the objects you are trying to segment.
%2. Compute foreground markers. These are connected blobs of pixels within 
% each of the objects.
%3. Compute background markers. These are pixels that are not part of any object.
%4. Modify the segmentation function so that it only has minima at the
% foreground and background marker locations.
%5. Compute the watershed transform of the modified segmentation function.

rgb = imread('Pears1.jpg');
I = rgb2gray(rgb);

%1. Use the Gradient Magnitude as the Segmentation Function
% use the Sobel edge masks, imfilter, and some simple arithmetic to compute
% the gradient magnitude. The gradient is high at the borders of the 
% objects and low (mostly) inside the objects.
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(I), hy, 'replicate');
Ix = imfilter(double(I), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);
% gmag = imgradient(I);% equal to directly use build-in function by matlab 
% note: if we directly segment the image by using whatershed transform on 
% the gradient magnitude, the image often be 'oversegmentation'

%2. Mark the Foreground Objects
% A variety of procedures, such openning or closing method could be applied
% here to find the foreground markers, which must be connected blobs of 
% pixels inside each of the foreground objects.


% opening which is errose followed by close
se = strel('disk', 20);
Io = imopen(I, se); % opening opertion which is errose followed by close
Ic = imclose(I, se);% closing opertion which is errose followed by close
Ie = imerode(I, se); % errosing operation
Id = imdilate(I, se); % closing operation

% based on reconstraction to make a opening and closing operation
Ioer = imreconstruct(Ie, I); % opening by reconstruction after eroding operation using imerode and imreconstruct.
Ioerd = imdilate(Ioer, se); 
Ioercbr = imreconstruct(imcomplement(Ioerd), imcomplement(Ioer)); 

Ioercbr = imcomplement(Ioercbr); %  reconstruction-based opening and closing is better than opening-closing operation
% Calculate the regional maxima of Iobrcbr to obtain good foreground markers.
fgm = imregionalmax(Ioercbr);
% to make more marked objects and  segmented various properly
se2 = strel(ones(5,5));
fgm2 = imclose(fgm, se2);
fgm3 = imerode(fgm2, se2);
% remove some stray isolated pixels 
fgm4 = bwareaopen(fgm3, 20);
% superimpose the foreground marker image on the  original image
It1 = rgb(:, :, 1);
It2 = rgb(:, :, 2);
It3 = rgb(:, :, 3);
It1(fgm4) = 255; It2(fgm4) = 0; It3(fgm4) = 0;
I3 = cat(3, It1, It2, It3);

%3. Compute Background Markers
% In the clean-up image, lobrcbr, the dark pixels belong to the background,
% therefore adopting the thresholding operation is a great way.
bw = im2bw(Ioercbr, graythresh(Ioercbr));
% imshow(bw), title('Thresholded opening-closing by reconstruction (bw)')

% The background markers don't need to close to the edge of objects by 
D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;

%4. Computed the whatershed transform of segmentation function
% imshow(bgm), title('Watershed ridge lines (bgm)')
gradmag2 = imimposemin(gradmag, bgm | fgm4);
L = watershed(gradmag2);

%5. Visualize the Result
% superimpose the foreground markers, background markers, and segmented
% object boundaries on the image (we can dilation certain aspectsm such as 
% object boundary)
It1 = rgb(:, :, 1);
It2 = rgb(:, :, 2);
It3 = rgb(:, :, 3);
fgm5 = imdilate(L == 0, ones(3, 3)) | bgm | fgm4;
It1(fgm5) = 255; It2(fgm5) = 0; It3(fgm5) = 0;
I4 = cat(3, It1, It2, It3);
L = watershed(gradmag2);

figure,
subplot(2,2,1), imshow(I),title('original image');
subplot(2,2,2), imshow(I4),title('mark and objects are superimposed on the original image');
subplot(2,2,3), imshow(L),title('whatershed transform of segmentation');

