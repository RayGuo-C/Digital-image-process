% Otsu
% Otsu's methods used to automatically perform cluster-based image
% thresholding, and reduce a graylevel image into a binary image;
% The algorithm assumes that the images contains two classes of pixels
% following bi-modal histogram(foreground pixels and backgroud pixels).
% Method:
% it then calculates the optimum threshold separating the two classes so
% that their combined spread (intra-class variance) is minimal, or 
% equivalently (because the sum of pairwise squared distances is constant),
% so that their inter-class variance is maximal
% limitations
% The performation of global thresholding techniques including Otsu's
% method is shown to be limited by the small object size, the small
% difference, the large variances of the object and the background
% intensities and the large amount of noise added.
im = imread('house.tif');
[histogramCounts,~] = imhist(im);
total = sum(histogramCounts); % ... total ... is the number of pixel in the given image

% OTSU automic thresholding methods
sumB = 0;
wB = 0;
maximum = 0.0;
sum1 = dot( (0:255), histogramCounts); 
for ii=1:256
    wB = wB + histogramCounts(ii);
    wF = total - wB;
    if (wB == 0 || wF == 0)
        continue;
    end
    sumB = sumB +  (ii-1) * histogramCounts(ii);
    mF = (sum1 - sumB) / wF;
    between = wB * wF * ((sumB / wB) - mF) * ((sumB / wB) - mF);
    if ( between >= maximum )
        level = ii;
        maximum = between;
    end
end

im_otsu = im;
im_otsu(im_otsu < level) = 0;
im_otsu(im_otsu > level) = 255;

% build_in functon for otsu in matlab 
level_m = graythresh(im);
im_otsu_m = im;
im_otsu_m(im_otsu_m < level) = 0;
im_otsu_m(im_otsu_m > level) = 255;
% build_in function for multi_otsu in matlab
% mutilevel image thresholds using Otsu's methods
mul_level = 4;
thresh = multithresh(im,mul_level);
im_multiotsu_m = imquantize(im,thresh);
im_multiotsu_m = label2rgb(im_multiotsu_m); 

figure,
subplot(2,2,1), imshow(im),title('original_img');
subplot(2,2,2), imshow(im_otsu),title('otsu');
subplot(2,2,3), imshow(im_otsu_m),title('otsu_m');
subplot(2,2,4), imshow(im_multiotsu_m),title('multiotsu_m');
