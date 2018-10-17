clc
clear
close all
[valuex,valuey,valuez,NBVP]=DATA;
NBVP=normalize(NBVP,-1,1);
[re,im]=FFT(NBVP);
% re(1:50)=0;
% im(1:50)=0;
re(550:5000)=0;
im(550:5000)=0;
valuex=normalize(valuex(1:5000),-1/3^0.5,1/3^0.5);
valuey=normalize(valuey(1:5000),-1/3^0.5,1/3^0.5);
valuez=normalize(valuez(1:5000),-1/3^0.5,1/3^0.5);
NORM=sqrt(valuex.^2+valuey.^2+valuez.^2);
% NORM=NORM(1:5000);
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
hold on
plot(NORM,'linewidth',1.5)
figure
fer_magplot(NBVP,32,'normalized','dB')
hold on

fer_magplot(x,32,'normalized','dB')