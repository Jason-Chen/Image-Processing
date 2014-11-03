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
HSVimg = HSV(img, 1);

H = HSVimg(:,:,1);
S = HSVimg(:,:,2);
V = HSVimg(:,:,3);

figure(9); imshow(HSVimg); imwrite(HSVimg,'lenaHSV.jpg');
figure(10); imshow(H); imwrite(H,'lenaH.jpg');
figure(11); imshow(S); imwrite(S,'lenaS.jpg');
figure(12); imshow(V); imwrite(V,'lenaV.jpg');

HSVimg = rgb2hsv(img);
H = HSVimg(:,:,1);
S = HSVimg(:,:,2);
V = HSVimg(:,:,3);
V = V * 2;

newhsv = cat(3, H, S, V);
RGB = hsv2rgb(newhsv);
figure(13); imshow(RGB); imwrite(newhsv,'lena_HSV_brighter.jpg');
figure(14); imshow(RGB); imwrite(RGB,'lena_brighter.jpg');

% % % % % % histogram_equalization % % % % % %
[heq, before_hist, after_hist] = histogram_equalization(img2);
figure(15); imshow(img2);
figure(16); imshow(heq);
imwrite(heq, 'lean2-equalization.jpg');
figure(17); bar(before_hist);
saveas(figure(17), 'before_hist.png');
figure(18); bar(after_hist);
saveas(figure(18), 'after_hist.png');

% % % % % % world_coordinates % % % % % %
[x1,y1] = world_coordinates(100,100,100);
fprintf('x1: %f, y1: %f\n',x1, y1);

[x2,y2] = world_coordinates(150,150,100);
fprintf('x2: %f, y2: %f\n',x2, y2);

[x3,y3] = world_coordinates(100,150,200);
fprintf('x3: %f, y3: %f\n',x3, y3);
