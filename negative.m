function [ ] = negative( image )
[H,W,L]=size(image);
Rgb_image=zeros(H,W,L);
Gray_image=zeros(H,W);
image=im2double(image);
for i=1:H
    for j=1:W
        if L==3
            Rgb_image(i,j,1)=1-image(i,j,1);
            Rgb_image(i,j,2)=1-image(i,j,2);
            Rgb_image(i,j,3)=1-image(i,j,3);
        
        else
            Gray_image(i,j)=1-image(i,j);
        end 
    end
end
Gray_image=im2uint8(Gray_image);
Rgb_image=im2uint8(Rgb_image);
if  L==3
    figure,imshow(Rgb_image);
else
    figure,imshow(Gray_image);

end

