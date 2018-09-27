% Mathematics Morphological Operation
% these operation is based on lighten pixel.

% Erode Operation
% Erode operation is a process of shrinking the boundary to the interior,
% and it can be used to eliminate some small and meaningless objects.
A1 = [0 1 1 1 1 0;0 1 1 1 1 0; 0 1 1 1 1 0 ; 0 1 1 1 1 0];
B = [0 1 0; 1 1 1 ; 0 1 0];
A1_erode = imerode(A1,B)
% Dilate Operation
% Dilate operation is a process of merging all the background points
% touching the objects into the objects to extend boundary to the outside,
% and it can be used to fill holes in objects
A2 = [0 0 0 0 ; 0 1 1 0; 0 1 1 0 ; 0 0 0 0];
A2_dilate = imdilate(A2,B)

%
A = [0 0 0 0 0 0;0 1 1 1 1 0; 0 1 1 1 1 0 ; 0 1 1 1 1 0; 0 1 1 1 1 0; 0 0 0 0 0 0];
B1 = [0 0 0; 0 1 0 ; 0 1 0];
B2 = [0 1 0; 0 0 0 ; 0 0 0 ];
Ac= ~A
C1 = imerode(A,B1)
C2 = imerode(A,B2)

% Opening Operation
% The process is first to calculate the corrosion, and then expansion.
% Opening Operation is usually used to remove the small particle noise or
% to disconnect the adhesion between objects. 
% This function is similar to erode operation, but it has the advantage of
% keeping the original size of the target unchanged compared with erode
% operation.

% Closing Operation
% The process is first to calculate the expansion, and then corrosion.
% Closing Operation is usually used to fill small holes in objects, connect
% adjacent between objects, and soomth.
% This function is similar to dilate operation, but it has the advantage of
% keeping the boundary unchanged compared with erode operation.

rgb = imread('Pears1.jpg');
I = rgb2gray(rgb);

hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(I), hy, 'replicate');
Ix = imfilter(double(I), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);

se = strel('disk',30);
Io = imopen(I, se); % opening opertion which is errose followed by close
Ic = imclose(I, se);% closing opertion which is errose followed by close
Ie = imerode(I, se); % errosing operation
Id = imdilate(I, se); % dilating operation

figure,
subplot(2,2,1), imshow(Io),title('opening opertion');
subplot(2,2,2), imshow(Ic),title('closing opertion');
subplot(2,2,3), imshow(Ie),title('errosing operation');
subplot(2,2,4), imshow(Id),title('dilating operation');

Ioer = imreconstruct(Ie, I); % opening by reconstruction after eroding operation using imerode and imreconstruct.
Ioerd = imdilate(Ioer, se); 
Ioercbr = imreconstruct(imcomplement(Ioerd), imcomplement(Ioer)); 
Ioercbr = imcomplement(Ioercbr); %  reconstruction-based opening and closing is better than opening-closing operation
Ioc = imclose(Io,se);

figure,
subplot(2,2,1), imshow(I),title('original image');
subplot(2,2,2), imshow(Ioer),title('open by reconstruction');
subplot(2,2,3), imshow(Ioercbr),title('reconstruction-based opening and closing ');
subplot(2,2,4), imshow(Ioc),title('opening-closing operation');

% Calcualte the regional maxima of lobrcbr to obtain good foreground
% markers
fgm = imregionalmax(Ioercbr);% Calculate the regional maxima of Iobrcbr to obtain good foreground markers.
% superimpose the foreground marker image on the  original image
It1 = rgb(:,:,1);
It2 = rgb(:,:,2);
It3 = rgb(:,:,3);
It1(fgm) = 255; It2(fgm) = 0; It3(fgm) = 0;
I2 = cat(3, It1, It2, It3);
figure,
subplot(1,2,1), imshow(fgm),title('regional maxima image');
subplot(1,2,2), imshow(I2),title('superimpose marker');

% Notice that some of the mostly-occulded and shadowed objects are not
% marked, which means these objects are not segmented properly. Besides,
% the foreground markers in some objects go right up to the objects'
% edge.Which means we should clean the edges of the markers and shrink them
% a bit.
% Therefore, we need to make closing and erose operation.
se2 = strel(ones(5,5));
fgm2 = imclose(fgm, se2);
fgm3 = imerode(fgm2, se2);
figure,
subplot(1,2,1), imshow(fgm2),title('Closing operation');
subplot(1,2,2), imshow(fgm3),title('erose operation');

% remove some stray isolated pixels 
fgm4 = bwareaopen(fgm3, 20);
It1 = rgb(:, :, 1);
It2 = rgb(:, :, 2);
It3 = rgb(:, :, 3);
It1(fgm4) = 255; It2(fgm4) = 0; It3(fgm4) = 0;
I3 = cat(3, It1, It2, It3);
figure,
subplot(1,2,1), imshow(fgm4),title('remove isolated pixels');
subplot(1,2,2), imshow(I3),title('superimpose marker');

% Step 4: Compute Background Markers
bw = im2bw(Ioercbr, graythresh(Ioercbr));

D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;

 gradmag2 = imimposemin(gradmag, bgm | fgm4);
 L = watershed(gradmag2);
figure,
subplot(2,2,1), imshow(bw),title('thresholding segmentation');
subplot(2,2,2), imshow(bgm),title('whatershed transform ridge');
subplot(2,2,3), imshow(gradmag2),title('whatershed transform of segmentation function');
subplot(2,2,4), imshow(L),title('whatershed transform of segmentation function');



