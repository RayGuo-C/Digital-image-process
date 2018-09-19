% Prewitt
% filter px highlights vertical edge, and py filter horizontal edge
im = imread('circuit.tif');
px = [-1 0 1; -1 0 1; -1 0 1];
im_px = filter2(px,im);
py = [-1 -1 -1; 0 0 0; 1 1 1];
im_py = filter2(py,im);
im_edge = sqrt(im_px.^2 + im_py.^2); % to get the direction of each edge
im_edge = uint8(im_edge);
im_edge_bw = im2bw(im_edge);
% we can obtain edges by the Prewitt fillters directly by command
im_edge_p=edge(im,'Prewitt');

subplot(3,2,1), imshow(im),title('original_img');
subplot(3,2,2), imshow(im_px/255),title('vertical edge');
subplot(3,2,3), imshow(im_py/255),title('horizotal edge');
subplot(3,2,4), imshow(im_edge),title('edge');
subplot(3,2,5), imshow(im_edge_bw),title('edge_bw');
subplot(3,2,6), imshow(im_edge_p),title('edge_p');