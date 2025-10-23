function out = contrast(image, new_max, new_min)
    [H, W, L] = size(image);
    new_image = zeros(H, W, L);  
    old_min = min(image(:));
    old_max = max(image(:));
    if L == 3
        for i = 1:H
            for j = 1:W
                new_image(i,j,1) = ((image(i,j,1) - old_min) / (old_max - old_min)) * (new_max - new_min) + new_min;
                new_image(i,j,2) = ((image(i,j,2) - old_min) / (old_max - old_min)) * (new_max - new_min) + new_min;
                new_image(i,j,3) = ((image(i,j,3) - old_min) / (old_max - old_min)) * (new_max - new_min) + new_min;
            end
        end
    else
        for i = 1:H
            for j = 1:W
                new_image(i,j) = ((image(i,j) - old_min) / (old_max - old_min)) * (new_max - new_min) + new_min;
            end
        end
    end
    out = uint8(new_image);    
end