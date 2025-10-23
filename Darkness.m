function [ dark_image ] = Darkness(image, offset, option)
% DARKNESS - Decreases the brightness of an image
% image   : input RGB or grayscale image
% offset  : value or factor to reduce brightness
% option  : '-' to subtract offset, '/' to divide by offset
image = double(image);

[H, W, L] = size(image);
dark_image = zeros(H, W, L);

if L == 3
    % ---- For RGB images ----
    for i = 1:H
        for j = 1:W
            if option == '-'
                % Decrease brightness by subtraction
                dark_image(i, j, :) = image(i, j, :) - offset;
            elseif option == '/'
                % Decrease brightness by division
                dark_image(i, j, :) = image(i, j, :) / offset;
            else
                error('Option must be "-" or "/"');
            end
        end
    end
else
    % ---- For grayscale images ----
    for i = 1:H
        for j = 1:W
            if option == '-'
                dark_image(i, j) = image(i, j) - offset;
            elseif option == '/'
                dark_image(i, j) = image(i, j) / offset;
            else
                error('Option must be "-" or "/"');
            end
        end
    end
end

% Clamp values to valid 0–255 range and convert
dark_image(dark_image > 255) = 255;
dark_image(dark_image < 0) = 0;
dark_image = uint8(dark_image);

end
