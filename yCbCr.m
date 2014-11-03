function [Y,Cb,Cr] = yCbCr(img)

% 取出RGB通道
R=img(:,:,1); G=img(:,:,2); B=img(:,:,3);

% 帶入公式計算
Y = 0.299*R + 0.587*G + 0.114*B;
Cb = -0.169*R - 0.331*G + 0.5*B;
Cr = 0.5*R - 0.419*G - 0.081*B;