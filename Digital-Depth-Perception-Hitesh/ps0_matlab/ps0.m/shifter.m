a=imread('img1.tiff');
img1_green=a(:,:,2);
img1_red=a(:,:,1);
img1_blue=a(:,:,3);
swap=a;
swap(:,:,1)=img1_blue;
swap(:,:,3)=img1_red;
imwrite(swap,'ps0-2-a-1.png');
imwrite(img1_green,'ps0-2-b-1.png');
imwrite(img1_red,'ps0-2-c-1.png');
