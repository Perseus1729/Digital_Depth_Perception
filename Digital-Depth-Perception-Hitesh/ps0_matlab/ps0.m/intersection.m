a=imread('ps0-2-b-1.png');
b=imread('img2.tiff');
a(150:250,200:300)=b(200:300,150:250,2);
imshow(a)
imwrite(a,'ps0-3-a-1.png');
