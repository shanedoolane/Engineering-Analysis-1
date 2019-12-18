% Homework Program 8
%
%Name: Shane Dolan
%section 30
%Date: 10/18.2018

function [cs,ns,coords] = coordinator(A,b)
%COORDINATOR determines if some vector b is in column or null space of a
%a matrix A. if b is in the column space or the null space, it gives the
%coordinates of the vector in it's respective space. coordinator also
%outputs 'cs': the column space, 'ns' the nullspace a vector 'coords' which is the
%coordinates of vector b in the column or null space.

if ~exist('A','var') || isempty(A)
   A = [];
end
if ~exist('b','var') || isempty(b)
   b = [];
end


[reducedM,pivotM] = rref(A);
m = size(A,1);
n = size(A,2);
coords = [];

csdimension = pivotM;
nsdimension = size(reducedM,2)-length(csdimension);

fprintf('The column space of A is %i dimensional\n',length(csdimension));
fprintf('The null space of A is %i dimensional\n',nsdimension);

%find basis vectors for the column space of A
freec = setdiff(1:n,pivotM);
ns = zeros(n,length(freec));
cs = A(:,pivotM);

column = 1;
for ii = freec
    x = 1;
    for jj = pivotM
        ns(jj,column) = -reducedM(x,ii);
        x = x+1;
    end
    ns(ii,column)=1;
    column = column+1;
end

%find if b is in the ns or the cs
if size(b,1) ~= size(cs,1)
    fprintf('b is not in the column space of matrix A\n')
    redaugcs = [0];
else
    [redaugcs,cspv]=rref([cs,b]);
    if rank(redaugcs) ~=rank(cs)
        fprintf('b is not in the column space of A\n');
    elseif rank(redaugcs)==rank(cs)
        fprintf('b is in the column space of A, the coordinates are:\n');
        for ii = 1:size(cs,2)
            fprintf('%f\n',redaugcs(ii,end));
        end
    end
end

if nsdimension == 0 
    fprintf('b is not in the null space of A\n')
elseif size(b,1) ~= size(ns,1)
    fprintf('b is not in the null space of A\n')
    redaugns = zeros(1);
else
    [redaugns,~]=rref([ns,b]);
    if rank(redaugns) ~=rank(ns)
        fprintf('b is nort in the null space of A\n');
    elseif rank(redaugns) == rank(ns)
        fprintf('b is in the null space of A, the coordinates are:\n')
        for ii=1:size(ns,2)
            fprintf('%f\n', redaugns(ii,end));
        end
    end
end

%b is in the null space but not the column space
if ((size(b,1) == size(ns,1)) && (rank(redaugns)==rank(ns))) && (size(b,1) ~= size(cs,1) || rank(redaugcs) ~= rank(cs))
    coords = zeros(size(ns,2),1);
    for ii = 1:size(ns,2)
        coords(ii,1) = redaugns(ii,end);
    end
    
%b is only in both the null and column space
elseif ((rank(redaugns) == rank(ns)) && (rank(redaugcs) == rank(cs)))
    coords = zeros(size(ns,2),2);
    for ii = 1:size(cs,2)
        coords(ii,1) = redaugcs(ii,end);
    end
    for ii = 1:size(ns,2)
        coords(ii,2)=redaugns(ii,end);
    end
    
%b is only in the column space
elseif ((size(b,1) == size(cs,1)) && (rank(redaugcs)==rank(cs))) && (size(b,1) ~=size(ns,1) || rank(redaugns)~=rank(ns))
        coords = zeros(size(cs,2),1);
        for ii = 1:size(cs,2)
            coords(ii,1)=redaugcs(ii,end);
        end
end
cs
ns
coords
end

%%%%Test Cases%%%%
% % % A = [1 2 -4 -3 0;-2 -3 5 8 8;2 2 -2 -9 -13]; b = [1;8;2];
% % % coordinator(A,b)
% % % The column space of A is 3 dimensional
% % % The null space of A is 2 dimensional
% % % b is in the column space of A, the coordinates are:
% % % 121.000000
% % % -30.000000
% % % 20.000000
% % % b is not in the null space of A
% % % 
% % % cs =
% % % 
% % %      1     2    -3
% % %     -2    -3     8
% % %      2     2    -9
% % % 
% % % 
% % % ns =
% % % 
% % %     -2    -5
% % %      3    -2
% % %      1     0
% % %      0    -3
% % %      0     1
% % % 
% % % 
% % % coords =
% % % 
% % %    121
% % %    -30
% % %     20
% 
% 
% 
% A = [1 2 -4 -3 0;-2 -3 5 8 8;2 2 -2 -9 -13]; b = [1;8;2;3];
% coordinator(A,b)
% The column space of A is 3 dimensional
% The null space of A is 2 dimensional
% b is not in the column space of matrix A
% b is not in the null space of A
% 
% cs =
% 
%      1     2    -3
%     -2    -3     8
%      2     2    -9
% 
% 
% ns =
% 
%     -2    -5
%      3    -2
%      1     0
%      0    -3
%      0     1
% 
% 
% coords =
% 
%      []
% 
% 
% 
% % % A = [1 2 -4 -3 0;-2 -3 5 8 8;2 2 -2 -9 -13]; b = [1;8;2;3;-1];
% % % coordinator(A,b)
% % % The column space of A is 3 dimensional
% % % The null space of A is 2 dimensional
% % % b is not in the column space of matrix A
% % % b is in the null space of A, the coordinates are:
% % % 2.000000
% % % -1.000000
% % % 
% % % cs =
% % % 
% % %      1     2    -3
% % %     -2    -3     8
% % %      2     2    -9
% % % 
% % % 
% % % ns =
% % % 
% % %     -2    -5
% % %      3    -2
% % %      1     0
% % %      0    -3
% % %      0     1
% % % 
% % % 
% % % coords =
% % % 
% % %      2
% % %     -1
% 
% 
% 
% A = [1 2 -4 -3 0;-2 -3 5 8 8;2 2 -2 -9 -13]; b = [1;8;2;3;-2];
% coordinator(A,b)
% The column space of A is 3 dimensional
% The null space of A is 2 dimensional
% b is not in the column space of matrix A
% b is nort in the null space of A
% 
% cs =
% 
%      1     2    -3
%     -2    -3     8
%      2     2    -9
% 
% 
% ns =
% 
%     -2    -5
%      3    -2
%      1     0
%      0    -3
%      0     1
% 
% 
% coords =
% 
%      []
% 
% 
% 
% % % A = [1 0 2;0 1 3;0 0 0]; b = [1;2;3];
% % % coordinator(A,b)
% % % The column space of A is 2 dimensional
% % % The null space of A is 1 dimensional
% % % b is not in the column space of A
% % % b is nort in the null space of A
% % % 
% % % cs =
% % % 
% % %      1     0
% % %      0     1
% % %      0     0
% % % 
% % % 
% % % ns =
% % % 
% % %     -2
% % %     -3
% % %      1
% % % 
% % % 
% % % coords =
% % % 
% % %      []
% 
% 
% 
% A = [2 -2;2 -2];b = [1;1];
% coordinator(A,b)
% The column space of A is 1 dimensional
% The null space of A is 1 dimensional
% b is in the column space of A, the coordinates are:
% 0.500000
% b is in the null space of A, the coordinates are:
% 1.000000
% 
% cs =
% 
%      2
%      2
% 
% 
% ns =
% 
%      1
%      1
% 
% 
% coords =
% 
%     0.5000    1.0000

