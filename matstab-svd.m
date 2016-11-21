
% Stability of a matrix with SVD method
% Ganesh

A = randn(10,3); 
A=A./repmat(sqrt(sum(A.^2)),10,1);

B = A + 0.1*randn(10,3); 
B = B./repmat(sqrt(sum(B.^2)),10,1);

[Ud,Sd,Vd]=svd(A-B);
[Ua,Sa,Va]=svd(A);

rd = sum(diag(Sd));
ra = sum(diag(Sa));
s = rd/ra;
