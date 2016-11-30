
% Stability of a Matrix with alignment method
% Matrix aligning and Matrix norm
% Ganesh 

clear all
clc

% Step 1: "Align" the matrices by matching up columns
% pseudo code: for matrices A and B, form normalized matrices Anorm and Bnorm
% compute inner products between all columns of Anorm and Bnorm
% find the best matches and form permutation matrix that aligns B to A.

% Create A and B matrices of size 4*4 
A = rand(4,4)
B = A + (0.01*rand(4,4))

n = size(A,2);
Anorm = A*inv(diag(sqrt(diag(A'*A))))
Bnorm = B*inv(diag(sqrt(diag(B'*B))))

Corrmat = (Anorm'*Bnorm)'

for j=1:n, 
  perm_mat(:,j) = Corrmat(:,j)==max(Corrmat(:,j));  
end

Baligned = B*perm_mat

% Step 2:  Compute the approximate volume of A-Baligned
%n = size(A,2);
[U,S,V]=svd(A-Baligned)  

%  the average length is the nth root of the product of singular values
s = diag(S)  
L = prod(s).^(1/n)

% compare to original length A
[Ua,Sa,Va]=svd(A)
sa = diag(Sa)
L_A = prod(sa).^(1/n)  

% this measure may need to be replaced by other matrix norm measures like frobenius
 
f = L/L_A
