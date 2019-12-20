function ret = redCompensate( im, w )
a = 1;

r = im2double(im(:,:,1));
g = im2double(im(:,:,2));
b = im2double(im(:,:,3));

[height,width,~] = size(im);
padsize = [(w-1)/2,(w-1)/2];
padr = padarray(r, padsize, 'symmetric', 'both');
padg = padarray(g, padsize, 'symmetric', 'both');

ret = im;
for i = 1:height
    for j = 1:width
        slider = padr(i:i+w-1,j:j+w-1);
        slideg = padg(i:i+w-1,j:j+w-1);
        r_mean = mean(mean(slider));
        g_mean = mean(mean(slideg));
        Irc = r(i,j) + a * (g_mean - r_mean) * (1-r(i,j)) * g(i,j);
        Irc = uint8(Irc * 255);
        ret(i, j, 1) = Irc;
    end
end


end

