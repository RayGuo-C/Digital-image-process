function res=hough(image)
% HOUGH(IMAGE) creates the Hough transform corresponding to the image IMAGE
% Method:
%1. Decide the r and angle to use;
%2. to calculate the value of r by each foreground pixel in the mage and
%   all of our chosen angle; 
%3. create an accumulator array whose size are the number of angle and
%   maxiam values of r; 
%4. step through all of our r values updating the accumulator array as we
%   go;

% if ~isbw(image) % because this build-in function is removed
    edges=edge(image,'canny');
% else
%    edges=image;

% calculate the value of r by each foreground pixel in the mage and
% all of our chosen angle;
[x,y]=find(edges);
angles=[-90:180]*pi/180;
r=floor(x*cos(angles)+y*sin(angles));

% create an accumulator array whose size are the number of angle and
% maxiam values of r; 
rmax=max(r(find(r>0)));
acc=zeros(rmax+1,270);

% step through all of our r values updating the accumulator array as we go;
for i=1:length(x)
    for j=1:270
        if r(i,j)>=0
        acc(r(i,j)+1,j)=acc(r(i,j)+1,j)+1;
        end
    end
end
res=acc;
