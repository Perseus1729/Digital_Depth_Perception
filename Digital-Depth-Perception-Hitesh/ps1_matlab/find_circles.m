function [centers, radii] = find_circles(BW, radius_range,sens)
    % Find circles in given radius range using Hough transform.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius_range: Range of circle radii [min max] to look for, in pixels

    % TODO: Your code here
    [centers,radii]=imfindcircles(BW,radius_range,'Sensitivity',sens);
 
end
