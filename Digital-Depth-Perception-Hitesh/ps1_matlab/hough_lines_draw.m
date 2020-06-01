function hough_lines_draw(img, outfile, peaks, rho, theta)
    % Draw lines found in an image using Hough transform.
    % img: Image on top of which to draw lines
    % outfile: Output image filename to save plot as
    % peaks: Qx2 matrix containing row, column indices of the Q peaks found in accumulator
    % rho: Vector of rho values, in pixels
    % theta: Vector of theta values, in degrees

    % TODO: Your code here
    line_segs=houghlines(img,theta,rho,peaks);
    figure,imshow(img);
    hold on;
    for i=1:length(line_segs)
        endpoints=[line_segs(i).point1;line_segs(i).point2];
        plot(endpoints(:,1),endpoints(:,2),'LineWidth',2,'Color','green');
    end
    hold off;
    saveas(gcf,outfile);
   
end
