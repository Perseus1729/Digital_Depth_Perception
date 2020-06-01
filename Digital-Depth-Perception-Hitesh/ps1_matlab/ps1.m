% ps1

%% 1-a
img = imread(fullfile('input', 'ps1-input0.png'));  % already grayscale
%% TODO: Compute edge image img_edges
img_edges=edge(img,'Canny');
imwrite(img_edges, fullfile('output', 'ps1-1-a-1.png'));  % save as output/ps1-1-a-1.png

%% 2-a
[H, theta, rho] = hough_lines_acc(img_edges);  % defined in hough_lines_acc.m
%% TODO: Plot/show accumulator array H, save as output/ps1-2-a-1.png
figure;imagesc(H,'XData',theta,'YData',rho);saveas(gcf,fullfile('output', 'ps1-2-a-1.png'));
%% 2-b
peaks = hough_peaks(H, 10);  % defined in hough_peaks.m

%% TODO: Highlight peak locations on accumulator array, save as output/ps1-2-b-1.png
hold on;plot(theta(peaks(:,2)),rho(peaks(:,1)),'rs');hold off;
saveas(gcf,fullfile('output', 'ps1-2-b-1.png'));
%% 2-c
hough_lines_draw(img,fullfile('output', 'ps1-2-c-1.png'),peaks,rho,theta);
%% 3-a
img_noise=imread(fullfile('input','ps1-input0-noise.png'));
filter=fspecial('gaussian',[11,11],9);
filtered_image=imfilter(img_noise,filter);
imwrite(filtered_image,fullfile('output','ps1-3-a-1.png'));
%% 3-b
noised_edge=edge(img_noise,'Canny');
smoothed_edge=edge(filtered_image,'Canny');
imwrite(noised_edge,fullfile('output','ps1-3-b-1.png'));
imwrite(smoothed_edge,fullfile('output','ps1-3-b-2.png'));
figure,imshow(smoothed_edge);
%% 3-c
[H, theta, rho] = hough_lines_acc(smoothed_edge); 
figure;imagesc(H,'XData',theta,'YData',rho);
peaks1 = hough_peaks(H, 10,'Threshold',0.44*max(H(:)),'NHoodSize',[27,27]);
hold on;plot(theta(peaks1(:,2)),rho(peaks1(:,1)),'rs');hold off;
saveas(gcf,fullfile('output', 'ps1-3-c-1.png'));
hough_lines_draw(img_noise,fullfile('output', 'ps1-3-c-2.png'),peaks1,rho,theta);

%% 4-a
img1=imread(fullfile('input','ps1-input1.png'));
mono=rgb2gray(img1);
filter1=fspecial('gaussian',[10,10],5);
filterd_img1=imfilter(mono,filter1);
figure,imshow(mono),figure,imshow(filterd_img1),imwrite(filterd_img1,fullfile('output','ps1-4-a-1.png'));
%% 4-b
edge_img1=edge(filterd_img1,'Canny');
figure,imshow(edge_img1),imwrite(edge_img1,fullfile('output','ps1-4-b-1.png'));
%% 4-c
[H, theta, rho] = hough_lines_acc(edge_img1); 
figure;imagesc(H,'XData',theta,'YData',rho);
peaks2 = hough_peaks(H, 10,'Threshold',0.15*max(H(:)),'NHoodSize',[27,27]);
hold on;plot(theta(peaks2(:,2)),rho(peaks2(:,1)),'rs');hold off;
saveas(gcf,fullfile('output', 'ps1-4-c-1.png'));
hough_lines_draw(mono,fullfile('output', 'ps1-4-c-2.png'),peaks2,rho,theta);
%% 5-a
imwrite(filterd_img1,fullfile('output','ps1-5-a-1.png')),imwrite(edge_img1,fullfile('output','ps1-5-b-1.png'));
H=hough_circles_acc(edge_img1,20);
centers=hough_peaks(H,10,"Threshold",0.77*max(H(:)));
figure,imshow(mono);
hold on;
for i=1:size(centers,1)
        r = 20;
        center_x = centers(i, 2);
        center_y = centers(i, 1);
        theta = linspace(0, 2 * pi, 361);
        xx = center_x + r * cos(theta);
        yy = center_y + r * sin(theta);
        plot(xx, yy,'g', 'LineWidth', 2);
end
hold off;
saveas(gcf,fullfile('output','ps1-5-a-3.png'));
%% 5-b
figure,imshow(mono);
[centers,radii]=find_circles(edge_img1,[20,50],0.85);
viscircles(centers, radii,'EdgeColor','g');
saveas(gcf,fullfile('output','ps1-5-b-1.png'));
%% 6-a

img2=imread(fullfile('input','ps1-input2.png'));
mono_img2=rgb2gray(img2);
filtered_img2=imfilter(mono_img2,filter1);
edge_img2=edge(filtered_img2,'Canny');
[H_2, theta, rho] = hough_lines_acc(edge_img2); 
peaks3 = hough_peaks(H_2, 10,"Threshold",0.05*max(H_2(:)));
hough_lines_draw(mono_img2,fullfile('output', 'ps1-6-a-1.png'),peaks3,rho,theta);
peaks3 = hough_peaks(H_2, 10,"Threshold",0.4*max(H_2(:)));
hough_lines_draw(mono_img2,fullfile('output', 'ps1-6-c-1.png'),peaks3,rho,theta);
%% 7-a
figure,imshow(filtered_img2);
[centers,radii]=find_circles(edge_img2,[15,50],0.86);
viscircles(centers,radii,"EdgeColor",'b');
saveas(gcf,fullfile('output','ps1-7-a-1.png'));
%% 8-a
img=imread(fullfile('input','ps1-input3.png'));
mono=rgb2gray(img);
edges=edge(mono,'Canny');
[H, theta, rho] = hough_lines_acc(edges);
peaks=hough_peaks(H,10,'Threshold',0.7*max(H(:)));
hough_lines_draw(mono,fullfile('output', 'ps1-8-a-1.png'), peaks, rho, theta);
outfile=imread(fullfile('output', 'ps1-8-a-1.png'));
figure,imshow(outfile);
[centers,radii]=find_circles(edges,[15,50],0.86);
viscircles(centers,radii,"EdgeColor",'b');
saveas(gcf,fullfile('output','ps1-8-a-1.png'));