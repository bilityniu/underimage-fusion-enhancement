function [ ret ] = blueCompensate( im )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
im=im2double(im);
[M, N, ~]=size(im);
r=im(:,:,1);
g=im(:,:,2);
b=im(:,:,3);
meanB=mean(mean(b));
meanG=mean(mean(g));
for i=1:M
    for j=1:N
        b(i, j)=b(i, j)+(meanG-meanB)*(1-b(i, j))*g(i, j);
    end
end
ret(:,:,1)=r;
ret(:,:,2)=g;
ret(:,:,3)=b;
end


