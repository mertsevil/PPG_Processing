function fer_magplot(vec,Samplepersecond,xaxistype,yaxistype)
[re,im]=FFT(vec);
switch yaxistype
    case 'mag'
        T=sqrt(re.^2+im.^2);
    case 'dB'
        T=sqrt(re.^2+im.^2);
        T=20*log10(T);
end
N=max(size(T));
switch xaxistype
    case '2\pi'
        fre=((2*pi)/N)*(0:N-1);
    case 'normalized'
        fre=((1)/N)*(0:N-1);
    case 'halfsamplingsreq'
        fre=(Samplepersecond/(N))*(0:N-1);
end
if rem(N,2)==0
    T=T(1:(N/2)-1);
    fre=fre(1:(N/2)-1);
else
    T=T(1:round(N/2)-1);
    fre=fre(1:round(N/2)-1);
end
plot(fre,T,'linewidth',1.5);
switch xaxistype
    case '2\pi'
        xlabel('Fre (pi(k-1)/N)')
    case 'normalized'
        xlabel('Fre ((k-1)/2N)')
    case 'halfsamplingsreq'
        xlabel('Fre ((k-1)/2N)')
end

switch yaxistype
    case 'mag'
        ylabel('Magnitute (Norm)')
    case 'dB'
        ylabel('Magnitute (dB)')
end
end
