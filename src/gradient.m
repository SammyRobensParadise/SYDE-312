filepath="../test-data/gradient-2.jpeg";

% read i the image as an matrix of RGB values
reference_image=im2single(imread(filepath));
% get pixel height, width and rgb size from image
[px_h,px_w,dim]=size(reference_image);
x=1:1:px_w;
y=1:1:px_h;

% pre-allocate red, green and blue magnitude matricies
red_values=zeros(px_h,px_w);
green_values=zeros(px_h,px_w);
blue_values=zeros(px_h,px_w);

% declare transformations
Ar=[1 0 0];
Ag=[0 1 0];
Ab=[0 0 1];

for j=1:px_w
    for i=1:px_h
        rgb=[reference_image(i,j,1) reference_image(i,j,2) reference_image(i,j,3)];
        red=dot(rgb',Ar);
        green=dot(rgb',Ag);
        blue=dot(rgb',Ab);
        red_values(i,j)=red;
        green_values(i,j)=green;
        blue_values(i,j)=blue;
    end
end

[X,Y]=meshgrid(x,y);
X=X(:);
Y=Y(:);
% get the least squares fit to the red values
Z=red_values(:);
I=ones(size(X));
A=[I X Y];
b=Z;
c=A\b;
z_fit = A*c;
ls_fit_red = reshape(z_fit,[px_h,px_w]);
Z=green_values(:)
b=Z;


