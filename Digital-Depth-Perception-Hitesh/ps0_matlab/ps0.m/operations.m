img1=imread('img1.tiff');
img1_gr=img1(:,:,2);
minimum= min(img1_gr(:));
maximum= max(img1_gr(:));
mean_val=mean(img1_gr(:));
standard_deviation=std(double(img1_gr(:)));
new_image=((img1-mean_val)/standard_deviation)*10+mean_val;
imwrite(new_image,'ps0-4-b-1.png');
new_left=img1;
new_left(:,[1:(end-2)])=img1(:,[3:(end)]);
imwrite(new_left,'ps0-4-c-1.png');
new_diff=img1-new_left;
imwrite(new_diff,'ps0-4-d-1.png');

