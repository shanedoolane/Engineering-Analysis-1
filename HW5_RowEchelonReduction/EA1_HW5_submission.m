% Homework Program 5 %
% Name: Shane Dolan
% Date:11/1/18

function [donematrix] = reduce(M)
%REDUCE puts a matrix M into echelon form.
%input arguments are given: reduce(M)

rowa = 1;
columna = 1;
while columna<size(M,2) && rowa<(size(M,1))
    newmatrix = M(rowa:end,columna:end);
%     if isempty(find(newmatrix))
%         
    if M(rowa,columna) == 0 && ~isempty(find(newmatrix))
        [variable,~]=find(newmatrix,1);
        concat = exchange(newmatrix,variable,1);
        concat = divide(concat,concat(1,1));
        for ii = 2:size(concat,1)
            if concat(ii,1) == 0
                concat(ii,1)=0;
            else
                concat = add(concat,(-1*(concat(ii,1))),1,ii);
            end
        end
        M(rowa:end,columna:end)=concat;
        rowa=rowa+1;
        columna=columna+1;
    elseif ~isempty(find(newmatrix))
        concat=M(rowa:end,columna:end);
        concat = divide(concat,concat(1,1));
        for ii = 2:size(concat,1)
            if concat(ii,1) == 0
                concat(ii,1)=0;
            else
                concat = add(concat,(-1*(concat(ii,1))),1,ii);
            end
        end
        M(rowa:end,columna:end)=concat;
        rowa=rowa+1;
        columna=columna+1;
        
    else
        M(rowa:end,columna:end)=concat;
        rowsa=rows+1
    end
end
donematrix = M;
end

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

% A = randi([-5 5], 4, 10); reduce(A)
% Row 1 will be divided by -3
% 3 will be multiplied by 1 and the result will be added to added to row 2
% -2 will be multiplied by 1 and the result will be added to added to row 3
% -4 will be multiplied by 1 and the result will be added to added to row 4
% Row 1 will be divided by 5
% -6.666667e-01 will be multiplied by 1 and the result will be added to added to row 2
% 7.666667e+00 will be multiplied by 1 and the result will be added to added to row 3
% Row 1 will be divided by 5.933333e+00
% 6.733333e+00 will be multiplied by 1 and the result will be added to added to row 2
% 
% ans =
% 
%   Columns 1 through 9
% 
%     1.0000    0.6667   -0.3333         0    0.6667    1.3333    0.6667    1.0000    1.0000
%          0    1.0000   -0.4000   -0.2000    1.0000    1.2000    0.6000    1.6000    0.2000
%          0         0    1.0000    0.0225   -0.3371   -0.5843   -0.7978   -1.0225   -1.0337
%          0         0         0    1.6180   -2.2697   -4.0674   -0.4382    4.3820   -8.4270
% 
%   Column 10
% 
%    -0.6667
%    -0.2000
%     0.0787
%     3.6629
% 
% A = randi([-5 5], 10, 4); reduce(A)
% Row 1 will be divided by 2
% -2 will be multiplied by 1 and the result will be added to added to row 2
% -1 will be multiplied by 1 and the result will be added to added to row 3
% -5 will be multiplied by 1 and the result will be added to added to row 4
% 3 will be multiplied by 1 and the result will be added to added to row 5
% -2 will be multiplied by 1 and the result will be added to added to row 6
% 3 will be multiplied by 1 and the result will be added to added to row 7
% 4 will be multiplied by 1 and the result will be added to added to row 8
% -1 will be multiplied by 1 and the result will be added to added to row 9
% 1 will be multiplied by 1 and the result will be added to added to row 10
% Row 1 will be divided by 2
% -3 will be multiplied by 1 and the result will be added to added to row 2
% 2 will be multiplied by 1 and the result will be added to added to row 3
% -2 will be multiplied by 1 and the result will be added to added to row 4
% 1 will be multiplied by 1 and the result will be added to added to row 5
% -4 will be multiplied by 1 and the result will be added to added to row 6
% -4 will be multiplied by 1 and the result will be added to added to row 7
% 3 will be multiplied by 1 and the result will be added to added to row 8
% -1 will be multiplied by 1 and the result will be added to added to row 9
% Row 1 will be divided by 5
% 6.500000e+00 will be multiplied by 1 and the result will be added to added to row 2
% -5.000000e-01 will be multiplied by 1 and the result will be added to added to row 3
% 5.500000e+00 will be multiplied by 1 and the result will be added to added to row 4
% -8.500000e+00 will be multiplied by 1 and the result will be added to added to row 5
% -6 will be multiplied by 1 and the result will be added to added to row 6
% 2 will be multiplied by 1 and the result will be added to added to row 7
% -3 will be multiplied by 1 and the result will be added to added to row 8
% 
% ans =
% 
%     1.0000         0    0.5000         0
%          0    1.0000   -0.5000    1.0000
%          0         0    1.0000   -0.6000
%          0         0         0    0.1000
%          0         0         0   -1.7000
%          0         0         0    2.7000
%          0         0         0   -1.9000
%          0         0         0   -4.4000
%          0         0         0   -2.2000
%          0         0         0   -4.2000
% 
% A = [1 2 0 0 0;0 0 0 2 3;0 0 2 1 3]; reduce(A)
% Row 1 will be divided by 1
% the rows 2 and 1 will be exchanged in matrix M
% Error using divide (line 17)
% rows cannot be divided by 0
% 
% Error in reduce (line 14)
%         concat = divide(concat,concat(1,1));
%  
% a = [1 2 4 3 5]; A = [a;a;a;a]; reduce(A)
% Row 1 will be divided by 1
% -1 will be multiplied by 1 and the result will be added to added to row 2
% -1 will be multiplied by 1 and the result will be added to added to row 3
% -1 will be multiplied by 1 and the result will be added to added to row 4
% Unable to perform assignment because the size of the left side is 3-by-4 and the size of the
% right side is 4-by-5.
% 
% Error in reduce (line 40)
%         M(rowa:end,columna:end)=concat;
 




