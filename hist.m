function [] = hist(image)


[H, W, L] = size(image);

if ~isa(image, 'uint8')
    image = im2uint8(image);
end

% RGB image
if L == 3
    histo1 = zeros(256, 1);
    histo2 = zeros(256, 1);
    histo3 = zeros(256, 1);
    
    for i = 1:H
        for j = 1:W
            histo1(image(i,j,1) + 1) = histo1(image(i,j,1) + 1) + 1;
            histo2(image(i,j,2) + 1) = histo2(image(i,j,2) + 1) + 1;
            histo3(image(i,j,3) + 1) = histo3(image(i,j,3) + 1) + 1;
        end
    end
    
    intensity_level = 0:255;
    figure;
    hold on;
    plot(intensity_level, histo1, 'r', 'LineWidth', 2);
    plot(intensity_level, histo2, 'g', 'LineWidth', 2);
    plot(intensity_level, histo3, 'b', 'LineWidth', 2);
    hold off;
    title('Individual RGB Channel Histograms');
    xlabel('Intensity Value (0–255)');
    ylabel('Pixel Count');
    legend('Red Channel', 'Green Channel', 'Blue Channel');

% Grayscale image
else
    histo = zeros(256, 1);
    for i = 1:H
        for j = 1:W
            histo(image(i,j) + 1) = histo(image(i,j) + 1) + 1;
        end
    end
    
    bar(histo);
    title('Grayscale Image Histogram');
    xlabel('Gray Level (0–255)');
    ylabel('Pixel Count');
end

end
