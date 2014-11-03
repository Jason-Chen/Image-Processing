function resize128 = resizeto128(im)
[height width c] = size(im);
resize128 = uint8(zeros(height/4,width/4,c));

for i = 1:1:height/4
    for j = 1:1:width/4
        for k = 1:1:c
            resize128(i,j,k) = im(4*i,4*j,k);
        end
    end
end