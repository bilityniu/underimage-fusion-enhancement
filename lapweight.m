function lapweight = lapweight(img)
grayimg = rgb2gray(img);
lapweight = double(abs(imfilter(grayimg, fspecial("laplacian"))));
end

