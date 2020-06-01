
function D = disparity_ssd(L, R)
    % Compute disparity map D(y, x) such that: L(y, x) = R(y, x + D(y, x))
    %
    % L: Grayscale left image
    % R: Grayscale right image, same size as L
    % D: Output disparity map, same size as L, R
    % TODO: Your code here
    D=zeros(size(L));
    rows=size(L,1);
    colomn=size(L,2);
    L1=zeros(rows+4,colomn+4);
    L1(3:rows+2,3:colomn+2)=L;
    R1=zeros(rows+4,colomn+4);
    R1(3:rows+2,3:colomn+2)=R;
    dis=zeros(1,colomn);
    for y=1:rows
        for x=1:colomn
            fixed=zeros(5,5);
                fixed=L1(y:y+4,x:x+4);
            for x_1=1:colomn
                diff=fixed-R1(y:y+4,x_1:x_1+4);
                dis(1,x_1)=sum(diff(:).^2);
            end
            [M,I]=min(dis);
            D(y,x)=I-x;
        end
    end
    figure,imshow(D,[]);
end
