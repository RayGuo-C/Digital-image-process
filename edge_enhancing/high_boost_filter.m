% High boost filtering
% high boost = A(original)-low pass % where A is an 'amplification factor' 
%               = (A-1)(original) + A(hoost pass)
% umsharp masking formula = A/(2A-1)(original) - (1-A)/(2A-1)(low pass)
% the best result A is 3/5<=A<=6/5

im = imread('cat.tif');
% A = 3/5
id=[0 0 0;0 1 0;0 0 0];
f=fspecial('average');
hb1=3*id - 2*f;
im_hb1 = filter2(hb1,im);

% A = 5/6
hb2=1.25*id - 0.25*f;
im_hb2 = filter2(hb2,im);

figure,
subplot(2,2,1), imshow(im),title('original_img');
subplot(2,2,2), imshow(im_hb1/255),title('hb1_A=4/5');
subplot(2,2,3), imshow(im_hb2/255),title('hb2_A=5/6');
