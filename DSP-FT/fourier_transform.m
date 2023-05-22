fs=1000;
t=0:1/fs:0.5;
y=sin(220*t);
plot(t,y);

N=length(y);
fy=fft(y);
m=abs(fy);
m=m(1:N/2);
f=(0:N/2-1)*fs/N;
plot(f,m);
xlim([0 100]);

i=ifft(fy);
plot(i);