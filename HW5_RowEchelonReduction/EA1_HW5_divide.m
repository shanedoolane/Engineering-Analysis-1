function [dividedmatrix] = divide(M,d,i)
%DIVIDE replaces row i with row i/d for any given matrix. 
%
%input arguments are taken as follows: (matrix M, divisor, row i)
%
%If row i is not provided, then DIVIDE will divide row 1 by d. d can't be 0. 

if exist('i','var') && ~i==round(i) && i>=1 && i<=size(M,1)
    error('matrix rows are only non zero positive integers');
elseif ~exist('i','var') || isempty('i')
    i = 1;
elseif ~(i>=1 && i<=size(M,1))
    error('the row chosen to divide must be between 1 and the number of rows in the matrix.');
end

if d==0
    error('rows cannot be divided by 0');
end

fprintf('Row %i will be divided by %d\n',i,d);

M(i,:) = M(i,:).*(1/d);
    
dividedmatrix = M;
end