function [heq,before_hist,after_hist] = histogram_equalization(img)

% 轉換為 hsv
hsvImg = rgb2hsv(img);
% 取出v
valueImg = hsvImg(:,:,3);

% 以1/256的間距製作直方圖
x = 0:1/256:1;

% 計算直方圖
before_hist = hist(valueImg(:),x);

% 計算累積分布函數
cdf = cumsum(before_hist);
intValueImg = im2uint8(valueImg);

% 初始化均值矩陣
sizeImg = size(img);
eqImg = zeros(sizeImg(1),sizeImg(2),'uint8');

% 找出最小不為0之值
minCdf = min(cdf(cdf>0));

% 計算均值
for n = 1:sizeImg(1)
    for m = 1:sizeImg(2)
        eqImg(n,m)= round(255*((cdf(intValueImg(n,m)+1)-minCdf)/((sizeImg(1)*sizeImg(2))-minCdf)));
    end
end

eqIdouble = im2double(eqImg);

% 計算均衡化的直方圖
after_hist = hist(eqIdouble(:),x);

% 把h, s通道還原
newhsvI = cat(3,hsvImg(:,:,1),hsvImg(:,:,2),eqIdouble);
% 轉換為RGB
newrgbI = hsv2rgb(newhsvI);
% 轉換為整數
heq = im2uint8(newrgbI);