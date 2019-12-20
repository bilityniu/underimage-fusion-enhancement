function sm = saliency_detection(img)
gfrgb = imfilter(img, fspecial('gaussian', 3, 3), 'symmetric', 'conv');
cform = makecform('srgb2lab', "AdaptedWhitePoint", whitepoint("d65"));
lab = applycform(gfrgb,cform);
l = double(lab(:,:,1)); lm = mean(mean(l));
a = double(lab(:,:,2)); am = mean(mean(a));
b = double(lab(:,:,3)); bm = mean(mean(b));
sm = (l-lm).^2 + (a-am).^2 + (b-bm).^2;
end

