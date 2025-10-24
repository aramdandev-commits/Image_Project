function [ new_image ] = hist_eq( image )  % FIXED: added output
[H, W, L] = size(image);

histo = zeros(256,1);
for i = 1:H
    for j = 1:W  % FIXED: changed H to W
        histo(image(i,j,1)+1) = histo(image(i,j,1)+1)+1;  % FIXED: added channel index
    end
end
histo = histo / (H*W);

CDF = zeros(256,1);
NCDF = zeros(256,1);
new_image = zeros(H,W,L);

% calculate CDF
CDF(1) = histo(1);
NCDF(1) = 255*CDF(1);
for i = 2:256
     CDF(i) = CDF(i-1) + histo(i);
     NCDF(i) = round(255 * CDF(i));
end

for m = 1:256
    for l = 1:L
        for h = 1:H
            for w = 1:W
                if(image(h,w,l) == m -1)
                    new_image(h,w,l) = NCDF(m);
                end
            end
        end
    end
end

% Convert to original data type if necessary
if isinteger(image)
    new_image = cast(new_image, class(image));
end

end