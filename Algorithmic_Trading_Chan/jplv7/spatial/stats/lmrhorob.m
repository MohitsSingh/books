function result=lmrhorob(y,x,W)
[N k] = size(x);
result.nobs = N;
result.meth = 'lmrhorob';
bhat = inv(x'*x)*x'*y;
e = y - x*bhat;
result.beta=bhat;
result.resid=e
sige = e'*e/(N-k);
result.sige = sige;
M1=eye(N)-x*inv(x'*x)*x'
M2=W*x*bhat
M3=M2'*M1*M2
T=trace(W'*W+W*W)
M4=T*sige
M5=M3+M4
J=(M5)/(N*sige)
M6=(e'*W*y-e'*W*e/sige)
lmrhorob=M6^2/N*J-T
result.lmrhorob=lmrhorob
