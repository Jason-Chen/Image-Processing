function HSV_res = HSV(img , brightness)

[height width c]=size(img);
HSV_res = double(zeros(height,width,c));

for i = 1:1:height
    for j = 1:1:width
        % 取出RGB通道
        R = img(i,j,1);
        G = img(i,j,2);
        B = img(i,j,3);

        % 最大、最小值
        maxV = max([R, G, B]);
        minV = min([R, G, B]);

        % 計算V值, 改變亮度
        V = double(maxV) / double(255);
        V = V * brightness;

        % 計算S值
        if(maxV == 0) S = 0; 
        else S = double(maxV - minV) / double(maxV);
        end
        
        % 計算H值
        H = 0;
        if(maxV == R && G >= B)
            H = double((G - B) * 60) / double(maxV - minV); 
        elseif(maxV == R && G < B)
            H = (double((G - B) * 60) / double(maxV - minV)) + 360; 
        elseif(maxV == G)
            H = double((B - R) * 60) / double(maxV - minV) + 120;     
        elseif(maxV == B)
            H = double((R - G) * 60) / double(maxV - minV) + 240;
        end
        H = H / 360;

        % 將計算結果組合為矩陣
        HSV_res(i,j,1) = H;
        HSV_res(i,j,2) = S;
        HSV_res(i,j,3) = V;
    end
end