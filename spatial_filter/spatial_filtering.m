
% filter: the combination of mask and function is called a filter

% note: there are two major methods to deal with edge of image as applying
% a filter
%1. Ignore the edge: directly ignore the edge, but if the mask is large, some
% significiant message is ignored
%2 'pad with zeros'; assume that all necessary values outside the image are
%zero

% filtering in Matlab
x = uint8(10*magic(5));
a = ones(3,3)/9;
a_m = fspecial('average',3); % we can create filter by hand or fspecial function in matlab
a_filter_s = filter2(a,x,'same'); % the edge is operated by pad with zero
a_filter_v = filter2(a,x,'valid'); % apply the mask only to 'inside' pixel
% low-pass filter
% pass over the high frequency components, and reduces or eliminates
% low frequency components and it will soomth the image and remove noise
% high-pass filter
% pass over the low frequency components, and reduces or eliminates
% high frequency components.Then it suit to enhance the edge.