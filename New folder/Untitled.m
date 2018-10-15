clc
clear
close all
[valuex,valuey,valuez,NBVP]=DATA;
NBVP=normalize(NBVP,-1,1);
[re,im]=FFT(NBVP);
% re(1:50)=0;
% im(1:50)=0;
re(600:5000)=0;
im(600:5000)=0;

N=max(size(re));
for n=1:N
 p=0;
    for k=1:N
        p=p+(re(k)+im(k)*1i)*exp(2*pi*((n-1)/N)*(k-1)*1i);
    end  
    x(n)=p/N;
%     if abs(real(x(n)))<10^-12 && abs(imag(x(n)))<10^-12
%         x(n)=0;
%     elseif abs(real(x(n)))<10^-12 && abs(imag(x(n)))>10^-12 
%         
%         x(n)=abs(imag(x(n)));
%         elseif abs(real(x(n)))>10^-12 && abs(imag(x(n)))<10^-12 
%         x(n)=abs(real(x(n)));
%     end
    
   x(n)=real(x(n));
end
plot(NBVP,'linewidth',1.5)
hold on
% figure
plot(x,'linewidth',1.5)
% hold on
figure
fer_magplot(NBVP,32,'normalized','dB')
hold on

fer_magplot(x,32,'normalized','dB')