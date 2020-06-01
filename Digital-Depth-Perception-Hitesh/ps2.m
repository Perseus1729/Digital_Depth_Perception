% ps2
%% 1
% Read images
L = im2double(imread(fullfile('input', 'pair0-L.png')));
R = im2double(imread(fullfile('input', 'pair0-R.png')));

% Compute disparity
D_L = disparity_ssd(L, R);
saveas(gcf,fullfile('output','ps2-1-a-1.png'));
D_R = disparity_ssd(R, L);
saveas(gcf,fullfile('output','ps2-1-b-1.png'));

% TODO: Save output images (D_L as output/ps2-1-a-1.png and D_R as output/ps2-1-a-2.png)
% Note: They may need to be scaled/shifted before saving to show results properly
% TODO: Rest of your code here
%% 2
L=im2double(rgb2gray(imread(fullfile('input','pair1-L.png'))));
R=im2double(rgb2gray(imread(fullfile('input','pair1-R.png'))));
D_l=disparity_ssd(L,R);
D_R=disparity_ssd(R,L);
imwrite(D_L,fullfile('output','ps2-2-a-1.png'));
imwrite(D_L,fullfile('output','ps2-2-b-1.png'));

