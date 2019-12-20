function [L, a, b]=rgb2lab_n(f)
%initial;
xn=0.9505;
yn=1.00;
zn=1.0891;
fr=im2double(f(:,:,1));
fg=im2double(f(:,:,2));
fb=im2double(f(:,:,3));
r=fr;
g=fg;
b=fb;

if(max(fr(:))>1.0 || max(fg(:))>1.0 || max(fb(:))>1.0)
   r=fr/255.0;
   g=fg/255.0;
   b=fb/255.0;
end

%the nonlinear sRGB' values are transformed to linear RGB values;
r1= r<=0.04045;
g1= g<=0.04045;
b1= b<=0.04045;
sr= r1.*(r/12.92) + ~r1.*(((r+0.055)/1.055).^2.4);
sg= g1.*(g/12.92) + ~g1.*(((g+0.055)/1.055).^2.4);
sb= b1.*(b/12.92) + ~b1.*(((b+0.055)/1.055).^2.4);

%XYZ(D65);
x=0.4124*sr+0.3576*sg+0.1805*sb;
y=0.2126*sr+0.7152*sg+0.0722*sb;
z=0.0193*sr+0.1192*sg+0.9505*sb;

%CIELAB;
q=y/yn;
p=x/xn;
rr=z/zn;
t1=q>0.008856;
t2=p>0.008856;
t3=rr>0.008856;
L=~t1.*(903.3.*q)+t1.*(116*(q.^(1/3))-16);
q1=t1.*(q.^(1/3))+~t1.*(7.787*q+16/116);
p1=t2.*(p.^(1/3))+~t2.*(7.787*p+16/116);
r1=t3.*(rr.^(1/3))+~t3.*(7.787*rr+16/116);
a=500*(p1-q1);
b=200*(q1-r1);