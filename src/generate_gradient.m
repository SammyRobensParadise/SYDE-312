
function [final_image]= generate_gradient(l,w,fc,sc,f_num)
length_image=l;     % length of the output image
width_image=w;      % width of the output image
first_color=fc;     % starting color RGB
second_color=sc;    % end color RGB
final_image(1:width_image,1:length_image,1:3)=255;  % preparing image for gradient
red_component=round(linspace(first_color(1),second_color(1),l));
green_component=round(linspace(first_color(2),second_color(2),l));
blue_component=round(linspace(first_color(3),second_color(3),l));
final_image=uint8(final_image);
for x=1:length(red_component)
    final_image(:,x,1)= red_component(x); 
    final_image(:,x,2)= green_component(x); 
    final_image(:,x,3)= blue_component(x); 
    figure(f_num),imshow(final_image)
    drawnow
end
end
