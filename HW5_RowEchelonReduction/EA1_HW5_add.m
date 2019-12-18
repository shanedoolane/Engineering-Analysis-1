function [addedmatrix] = add(M,r,i1,i2)
%ADD adds r*i1 to i2. If only one row is provided, then r*r1 is added to r2
%ADD takes arguments in the format: add(matrix, r, i1, i2)

if exist('r','var') && r==0
    error('nice try. we arent gonna multiply this row by 0')
elseif ~exist('r','var')
    r=1
end

if ~exist('i2','var') || isempty(i2)
    i2 = 1;
    fprintf('%d will be multiplied by %i and the result will be added to row 1\n',r,i1);
end
fprintf('%d will be multiplied by %i and the result will be added to added to row %i\n',r,i1,i2);

M(i2,:)=M(i2,:)+r.*M(i1,:);

addedmatrix = M;
end
