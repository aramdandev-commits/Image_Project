function [ ] = power_low( image,offset, index)
[H,W,L]=size(image);
Rgb_image= zeros(H,W,L);
Gray_image =zeros(H,W);
image = im2double(image);
if index==1
    if L==3
        for i=1:H
            for j=1:W
                if L==3
             Rgb_image(i,j,1)=image(i,j,1)^offset;
             Rgb_image(i,j,2)=image(i,j,2)^offset;
             Rgb_image(i,j,3)=image(i,j,3)^offset;
                else
                    Gray_image(i,j)=image(i,j)^offset;
        
               end
            end   
        end
    end
end
if index==2
    if L==3
        for i=1:H
            for j=1:W
                if L==3
             Rgb_image(i,j,1)=image(i,j,1)^(1/offset);
             Rgb_image(i,j,2)=image(i,j,2)^(1/offset);
             Rgb_image(i,j,3)=image(i,j,3)^(1/offset);
                else
                    Gray_image(i,j)=image(i,j)^(1/offset);
        
               end
            end   
        end
    end
end

if  L==3
    Rgb_image=im2uint8(Rgb_image);
    figure,imshow(Rgb_image);
else
    Gray_image=im2uint8(Gray_image);
    figure,imshow(Gray_image);
end

