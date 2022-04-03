function v = get_min_pixel_value(A)
max_rgb_value=255;
m=min(A,[],"all");
if m > 1
    m=1;
end

if m < 0
    m=0;
end
v=round(m*max_rgb_value);
end

