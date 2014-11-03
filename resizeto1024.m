function resize1024 = resizeto1024(im)

[height width c]=size(im);
resize1024 = uint8(zeros(height*2,width*2,c));

% 四點接放相同數值
for i = 1:1:height
    for j = 1:1:width
        for k = 1:1:c
            resize1024(i*2-1,j*2-1,k) = im(i,j,k);
            resize1024(i*2-1,j*2,k) = im(i,j,k);
            resize1024(i*2,j*2-1,k) = im(i,j,k);
            resize1024(i*2,j*2,k) = im(i,j,k);
        end
    end
end