close all
filepath="../test-data/landscape-test-2.jpeg";
% flag to determine if intermediate plots should be output
interm_plots=1;
% read i the image as an matrix of RGB values
reference_image=im2single(imread(filepath));

if interm_plots
    % plot the image pixel by pixel
    figure
    imshow(reference_image)
    hold on
    title("Reference Image")
    ylabel("Pixel Height")
    xlabel("Pixel Width")
    hold off
end

% get pixel height, width and rgb size from image
[px_h,px_w,dim]=size(reference_image);
x=1:1:px_w;
y=1:1:px_h;

% pre-allocate red, green and blue channel magnitude matricies
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

if interm_plots
    figure
    subplot(3,1,1)
    colormap autumn
    mesh(red_values,"FaceColor","r")
    title("R Channel Surface")
    legend("Red Channel")
    subplot(3,1,2)
    colormap cool
    mesh(green_values,"FaceColor","g")
    title("G Channel Surface")
    legend("Green Channel")
    subplot(3,1,3)
    colormap parula
    mesh(blue_values,"FaceColor","b")
    title("Blue Channel Surface")
    legend("Blue Channel")
end

ls_fit_red = least_square_fit(red_values(:),x,y,px_h,px_w);
ls_fit_green = least_square_fit(green_values(:),x,y,px_h,px_w);
ls_fit_blue= least_square_fit(blue_values(:),x,y,px_h,px_w);

if interm_plots
    figure
    mesh(ls_fit_red)
    hold on
    mesh(ls_fit_green)
    mesh(ls_fit_blue)
    title("R,G,B Least Squares Planes")
    legend("Red Channel","Green Channel","Blue Channel")
    hold off
end

% get the maximum pixel values for the RGB Channels
max_r=get_max_pixel_value(ls_fit_red);
max_g=get_max_pixel_value(ls_fit_green);
max_b=get_max_pixel_value(ls_fit_blue);

% get the minimum pixel values for the RGB Channels
min_r=get_min_pixel_value(ls_fit_red);
min_g=get_min_pixel_value(ls_fit_green);
min_b=get_min_pixel_value(ls_fit_blue);

% create maximum and minimum pixel RGB values
max_pixel=[max_r max_g max_b];
min_pixel=[min_r min_g min_b];


result=generate_gradient(px_h,px_w,max_pixel,min_pixel,5);

figure
image(result)



