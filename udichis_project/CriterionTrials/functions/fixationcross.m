function F=fixationcross(size,stroke,backgroundgray)
if nargin <1
    size=200;
    stroke=1;
    backgroundgray=120;
elseif nargin >=1 && nargin <2
    stroke=1;
    backgroundgray=120;
elseif nargin >=2 && nargin <3
    backgroundgray=120;
end
F=ones(size,size)*backgroundgray;
F(:,floor((size-stroke)/2)+1:floor((size-stroke)/2)+stroke)=255;
F(floor((size-stroke)/2)+1:floor((size-stroke)/2)+stroke,:)=255;
F=uint8(F);    