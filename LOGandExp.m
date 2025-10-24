function [ ] = LOGandExp( image , index )
[H, W , L ]=size(image);
Rgb_image= zeros(H,W,L);
Gray_image =zeros(H,W);
image = im2double(image);
 for i=1:H
     for j=1:W
         if index==1
             if L==3
                 Rgb_image(i,j,1)=log((image(i,j,1))+1);
                 Rgb_image(i,j,2)=log((image(i,j,2))+1);
                 Rgb_image(i,j,3)=log((image(i,j,3))+1);
             else
                 Gray_image(i,j) =log((imagdy(i,j))+1);
             end
         end
         if index==2
             if L==3
                 Rgb_image(i,j,1)=exp((image(i,j,1))+1);
                 Rgb_image(i,j,2)=exp((image(i,j,2))+1);
                 Rgb_image(i,j,3)=exp((image(i,j,3))+1);
             else
                 Gray_image(i,j) =exp((image(i,j))+1);
             end
             
         end
     end
 end
 Rgb_image = mat2gray(Rgb_image);
 Gray_image = mat2gray(Gray_image);
 
 if L==3
     Rgb_image=im2uint8(Rgb_image);
     figure,imshow(Rgb_image);
 end
 if L==1
     Gray_image=im2uint8(Gray_image);
     figure,imshow(Gray_image);
 end
 
end



