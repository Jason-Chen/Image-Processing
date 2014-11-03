% % % % % % 原始圖 % % % % % %
img=imread('lena.jpg');
img2=imread('lena2.jpg');
figure(1); imshow(img);

% % % % % % resize128 % % % % % %
resize128 = resizeto128(img);
figure(2); imshow(resize128); imwrite(resize128,'lena128.jpg');

% % % % % % resize1024 % % % % % %
resize1024 = resizeto1024(img);
figure(3); imshow(resize1024); imwrite(resize1024,'lena1024.jpg');

% % % % % % resize256_rotate90 % % % % % %
resize256_rotate90 = resizeto256_rotate90(img);
figure(4); imshow(resize256_rotate90); imwrite(resize256_rotate90,'lena256_degree90.jpg');

% % % % % % YCbCr % % % % % %
% [Y,Cb,Cr] = yCbCr(img);
% YCbCr=cat(3,Y,Cb,Cr);

YCbCr = rgb2ycbcr(img);
Y = YCbCr(:,:,1);
Cb = YCbCr(:,:,2);
Cr = YCbCr(:,:,3);

figure(5); imshow(YCbCr); imwrite(YCbCr,'lenaYCbCr.jpg');
figure(6); imshow(Y); imwrite(Y,'lenaY.jpg');
figure(7); imshow(Cb); imwrite(Cb,'lenaCb.jpg');
figure(8); imshow(Cr); imwrite(Cr,'lenaCr.jpg');

% % % % % % HSV % % % % % %
HSV = HSV(img,1);
% HSV = rgb2hsv(img);

H = HSV(:,:,1);
S = HSV(:,:,2);
V = HSV(:,:,3);

figure(9); imshow(HSV); imwrite(HSV,'lenaHSV.jpg');
figure(10); imshow(H); imwrite(H,'lenaH.jpg');
figure(11); imshow(S); imwrite(S,'lenaS.jpg');
figure(12); imshow(V); imwrite(V,'lenaV.jpg');

% % % % % % histogram_equalization % % % % % %
[heq, before_hist, after_hist] = histogram_equalization(img2);
figure(13); imshow(img2);
figure(14); imshow(heq);
imwrite(heq, 'lean2-equalization.jpg');
figure(15); bar(before_hist);
saveas(figure(15), 'before_hist.png');
figure(16); bar(after_hist);
saveas(figure(16), 'after_hist.png');


% % % % % % world_coordinates % % % % % %
[x1,y1] = world_coordinates(100,100,100);
fprintf('x1: %f, y1: %f\n',x1, y1);

[x2,y2] = world_coordinates(150,150,100);
fprintf('x2: %f, y2: %f\n',x2, y2);

[x3,y3] = world_coordinates(100,150,200);
fprintf('x3: %f, y3: %f\n',x3, y3);
