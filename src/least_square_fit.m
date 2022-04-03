function F = least_square_fit(Z,x,y,px_h,px_w)
[X,Y]=meshgrid(x,y);
X=X(:);
Y=Y(:);
I=ones(size(X));
A=[I X Y];
b=Z;
c=A\b;
z_fit = A*c;
F = reshape(z_fit,[px_h,px_w]);
end

