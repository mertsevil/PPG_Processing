function X=normalize(x,lb,ub)
X=((x-min(x))/(max(x)-min(x)))*(ub-lb)+lb;
end