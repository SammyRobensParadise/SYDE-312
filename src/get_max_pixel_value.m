function v = get_max_pixel_value(A)
%GET_MAX_PIXEL_VALUE of a normalized pixel grid
max_rgb_value=255;
m=max(A,[],"all");
if m > 1
    m=1;
end
if m < 0
    m=0;
end
v=round(m*max_rgb_value);
end

