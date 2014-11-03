function resize256_rotate90 = resizeto256_rotate90(img)
[height width c]=size(img);
resize256_rotate90 = uint8(zeros(height/2,width/2,c));

for i = 1:1:height/2
    for j = 1:1:width/2
        for k = 1:1:c
           resize256_rotate90(j,height/2+1-i,k) = img(2*i,2*j,k);
        end
    end
end