function [ bright_image ] = Brightness(image, offset, option)
% BRIGHTNESS - Adjusts the brightness of an image
% image   : input RGB or grayscale image
% offset  : brightness value to add or subtract
% option  : '+' , '*' to increase brightness

[H, W, L] = size(image); % get image dimensions
bright_image = zeros(H, W, L); % prepare output image

if L == 3
    % ---- For RGB images ----
    for i = 1:H       % loop over rows
        for j = 1:W   % loop over columns
            if option == '+'
                % increase brightness
                bright_image(i, j, 1) = image(i, j, 1) + offset;
                bright_image(i, j, 2) = image(i, j, 2) + offset;
                bright_image(i, j, 3) = image(i, j, 3) + offset;
            else
                bright_image(i, j, 1) = image(i, j, 1) * offset;
                bright_image(i, j, 2) = image(i, j, 2) * offset;
                bright_image(i, j, 3) = image(i, j, 3) * offset;
            end
        end
    end
else
    % ---- For grayscale images ----
    for i = 1:H
        for j = 1:W
            if option == '+'
                bright_image(i, j) = image(i, j) + offset;
            else
                bright_image(i, j) = image(i, j) * offset;
            end
        end
    end
end

% Clamp values to 0–255 range and convert to uint8
bright_image(bright_image > 255) = 255;
bright_image(bright_image < 0) = 0;
bright_image = uint8(bright_image);

end
