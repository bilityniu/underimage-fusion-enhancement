function [ result ] = gammaCorrection(image, a, gamma)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

image = im2double(image);

result = a * (image .^ gamma);

end

