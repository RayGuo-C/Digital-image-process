% edge detection
% There are large of mathematical methods identifying some points in
% the image which image brightness change sharply, and these points represent
% a set of line segment termed edge

% The methods for edge detection are mainly grouped into two categories: search-based and zero-crossing based
% Search based
% The search based methods detect edges by first computing a measure of edge strength, usually a first-order derivation such as gradient magnitude, and then searching for local maxima of
% gradient magnitude using a computed estimated of the local direction of the edge, usually gradient direction
im = imread('circuit.tif');
% Prewitt 
im_p = edge(im,'Prewitt');
% Sobel
im_s = edge(im,'Sobel');
% Canny: may be the best method
im_c = edge(im,'Canny');

% zero-cross based
% this method searches for zero crossings in a second-order derivative expression computed from the image 
% in order to find edges, usually the zero-crossings of the Laplacian or the zero-crossings of a non-linear
% differential expression.
% note: it is extremely sensitive to noise.
% Laplacian 
% log_laplacian
