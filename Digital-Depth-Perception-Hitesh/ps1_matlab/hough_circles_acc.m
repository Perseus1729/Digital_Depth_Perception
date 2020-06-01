function H = hough_circles_acc(BW, radius)
    % Compute Hough accumulator array for finding circles.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius: Radius of circles to look for, in pixels

    % TODO: Your code here
    H=zeros(size(BW));
    a=size(BW,2);
    b=size(BW,1);
    for x=1:a
        for y=1:b
            if(BW(y,x))
                for theta=linspace(0,2*pi,361)
                    i=round(x-radius*cos(theta));
                    j=round(y+radius*sin(theta));
                    if(i>0 && i<=a && j>0 && j<=b)
                        H(j,i)=H(j,i)+1;
                    end
                end
            end
        end
    end
end
