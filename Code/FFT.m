function [re,im]=FFT(vec)
N=max(size(vec));

for k=1:N
    p=0;
    for n=1:N
        p=p+vec(n)*exp(-2*pi*((n-1)/N)*(k-1)*1i);
    end
    X(k)=p;
    if abs(real(X(k)))<10^-12
        re(k)=0;
    else
       re(k)=real(X(k)); 
    end
    
    if abs(imag(X(k)))<10^-12
        im(k)=0;
    else
       im(k)=imag(X(k)); 
    end
    
    
end

end
