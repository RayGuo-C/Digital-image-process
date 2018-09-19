% Sobel
% better than prewitt due to wright, and both perform reasonbly well in the
% present of noise.
% filter px highlights vertical edge, and py filter horizontal edge
im = imread('circuit.tif');
px = [-1 0 1; -2 0 2; -1 0 1];
im_px = filter2(px,im);
py = [-1 -2 -1; 0 0 0; 1 2 1];
im_py = filter2(py,im);
im_edge = sqrt(im_px.^2 + im_py.^2); % to get the direction of each edge
im_edge = uint8(im_edge);
%im_edge = im2bw(im_edge/255,0.3);
% we can obtain edges by the Prewitt fillters directly by command
% edge_p=edge(im,'sobel');

figure,
subplot(2,2,1), imshow(im),title('original_img');
subplot(2,2,2), imshow(im_px/255),title('vertical edge');
subplot(2,2,3), imshow(im_py/255),title('horizotal edge');
subplot(2,2,4), imshow(im_edge),title('edge');
