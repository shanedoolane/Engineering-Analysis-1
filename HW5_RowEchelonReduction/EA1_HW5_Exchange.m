function [exchangedmatrix]=exchange(M,i1,i2)
%EXCHANGE exchanges rows of a matrix. 
%
%if one row is given, the function returns the same matrix with the first
%and selected rows exchanged. If two rows are indicated, then EXCHANGE will
%exchange the two indicated rows. If no rows are indicated, EXCHANGE will
%switch the first and second rows of M.

if (~exist('i1','var') || isempty(i1)) && (~exist('i1','var') || isempty(i1))
    i1 = 1;
    i2 = 2;

elseif exist('i1','var') && i1 == round(i1) && i1~=0 && (~exist('i2','var') || isempty(i2))
    i2 = 1;
    
elseif exist('i2','var') && i2 == round(i2) && i2~=0 && (~exist('i1','var') || isempty(i1))
    i1 = 1;
elseif exist('i2','var') && i2 == round(i2) && i2~=0 && exist('i1','var') && i1 == round(i1) && i1~=0
     i1=i1;
     i2=i2;
     
elseif exist('i1','var') && ~(i1 == round(i1) || i1==0)
    error('the line number i1 is not an integer');
elseif exist('i2','var') && ~(i2 == round(i2))
    error('the line number i2 is not an integer');

end

fprintf('the rows %i and %i will be exchanged in matrix M\n',i1,i2);

A = M(i1,:);
B = M(i2,:);
M(i1,:)= B;
M(i2,:) = A;

exchangedmatrix = M;
end