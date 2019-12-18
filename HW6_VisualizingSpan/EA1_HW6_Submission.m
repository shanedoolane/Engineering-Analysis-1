% Homework Program 4
%
%Name: Shane Dolan
%section 30
%Date: 11/8/2018

%%------------------
%%%%X1,X2,X3 were replaced with A1,A2,A3 because these variables confused
%%%%me less and they seem more intuitive. To run the tests, i had to change
%%%%all of the coefficient arrays to A1,A2,A3.
%%------------------
function span_EA1(A,b,A1,A2,A3)
%SPAN_EA1 plots vectors, x1, x2, and x3 in 3d space allowing for the
%visualization of span and to check if vector B is in the span of A

%%% Fill in the code for all comments beginning with a single '%'.

% Replace the preceding comment with a comment that describes the function.

% Check that the number of inputs is between 3 (for n=1) and 5 (for n=3)
if nargin < 3 || nargin > 5
    error('The number of input arguments is inconsistent with that which is necessary');
end


% Store the number of rows and columns of A.
[m,n] = size(A);


% Check that the dimensions of the vectors are either 2 or 3.
if (m ~=2 && m ~=3)
    error('The length of the vectors must be 2 or 3');
end


% Check that the number of vectors is between 1 and 3.
if ~(n>=1 && n<=3)
    error('The number of columns in A is not between 1 and 3');
end   
    
% Check the dimensions of b.
if length(b) > 3
    error('b can not be larger than 3x1');
end
    
% Check that the number of coefficient arrays matches n.
if nargin-2 ~=n
    error('The number of coefficient arrays does not match n');
end

% Compute the total number of grid points, and check that
% this number is > 0.
if nargin == 3 &&  length(A1) < 0
   error('there should be more points in R than 0');
elseif nargin == 4 && length(A1)*length(A2) < 0
    error('there should be more points in R2 than 0')
elseif nargin == 5 && length(A1)*length(A2)*length(A3) < 0
    error('there should be more points in R3 than 0');
end
    

%%% These statements create the figure and orient the plot.
figure; hold on;

if m == 3
    view([-37.5,30]);
    scatter3(0,0,0,'go','LineWidth',3);
else
    plot(0,0,'go','LineWidth',3);
end

%%% These statements set up the figure.
%%% You can modify the limits to change the view.
xlim([-2 2]);ylim([-2 2]);zlim([-2 2]);
axis square
xlabel('x1');ylabel('x2');zlabel('x3')

%%% Plot the vectors (v1,...,vn).
for ii = 1:n
    if m == 3
        quiver3(0,0,0,A(1,ii),A(2,ii),A(3,ii),1.0,'LineWidth',3,'MaxHeadSize',.5,'Color',[1 0 0]);
    else
        quiver(0,0,A(1,ii),A(2,ii),1.0,'LineWidth',3,'MaxHeadSize',.5,'Color',[1 0 0]);
    end
end

leg= legend('Origin','Vectors','AutoUpdate','off');


% Generate an array of points by looping over all possible values 
% of (a1,a2,a3) (for n=3) and computing the corresponding linear combination
% of vectors. Include the cases n=1, 2, or 3.
coord = [];
if n == 3
    for ii = A1
        for jj = A2
            for kk = A3
                Q = ii*A(:,1)+jj*A(:,2)+kk*A(:,3);
                coord = [coord,Q];
            end
        end
    end
elseif n == 2
    for ii = A1
        for jj = A2
            Q = ii*A(:,1)+jj*A(:,2);
            coord = [coord,Q];
        end
    end
elseif n == 1
    for ii = A1
        Q = ii*A(:,1);
        coord = [coord,Q];
    end
end
        

% Print each point using the command "scatter" for m=2, or "scatter3"
% for m=3. Use the "pause" command to slow down the plotting.
if m == 3 
    scatter3(coord(1,:),coord(2,:),coord(3,:));
elseif m == 2
    scatter(coord(1,:),coord(2,:));
end


%%% These statements show the vector "b" as an arrow.
if m == 3
    h= quiver3(0,0,0,b(1),b(2),b(3),1.0,'LineWidth',2,'MaxHeadSize',.5,'Color',[1 0 1]);
else
    h= quiver(0,0,b(1),b(2),1.0,'LineWidth',2,'MaxHeadSize',.5,'Color',[1 0 1]);
end
h.DisplayName = 'b';
leg.PlotChildren(end+1) = h;



% Check to see if b is in the span of the columns of A.
% If it is not, then print out a corresponding message.
% If it is, then print the dependence relation:
% b= a1 x v1 + a2 x v2 + a3 x v3
% where (a1,a2,a3) take on the numerical values.
x = A\b;
if n==3
    if abs(x(1))==inf||abs(x(2))==inf||abs(x(3))==inf
        fprintf('b is not in the span of the columns of A\n');
    else
        fprintf('b is in the span of the columns of A\n b = %f x v1 + %f x v2 + %f x v3\n',x(1),x(2),x(3));
    end
elseif n==2
    if abs(x(1))==inf||abs(x(2))==inf
        fprintf('b is not in the span of the columns of A\n');
    else
        fprintf('b is in the span of the columns of A\n b = %f x v1 + %f x v2\n',x(1),x(2));
    end
elseif n==1
    abs(x(1))==inf
        fprintf('b is not in the spand of the columns of A\n b = %f x v1\n',x(1));
end

    



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Test Cases:
% 2D:
% A = [1 0; 1 1]; b = [-1; 0]; X1 = [-2:0.25:2]; X2= [-2:0.5:2];
%%%%%The span is a plane
% A = [1 1; -1 -1]; b = [1; 0]; X1 = [-2:0.25:2]; X2=X1;
%%%%%The span is a line


% 3D, use the same X1, X2, X3 for all examples:
% A = [0.4 1; -0.4 0; 0.5 1]; b = [-0.3; 0.8; -0.5]; X1= (-5:0.4:5); X2= (-3:0.4:3);
%%%%%% X3 is not defined by the user, not sure if this is an error or not
%%%%%% but the function throws an error here becasue it needs X3. If this
%%%%%% were run without X3, the span is a plane
% A = [1 1 1; -1 -1 0; 0 -1 1]; b = rand(3,1); X1= (-2:0.4:2); X2=(-3:0.4:3); X3= X1;
%%%%%% The span is a space in r3

%%% For the following examples use X1= (-3:0.4:3); X2= X1; X3= X1;
% A = rand(3,1); b = rand(3,1);
%%%%%The number of coefficient arrays does not match n
%%%%% This is because the matrix A only has 1 column, but X1,X2, and X3 are
%%%%% defined. Because of this, the number of coefficient arrays (X1,X2,X3)
%%%%% does not match the number of columns of A.
% A = rand(3,2); b = rand(3,1);
%%%%%The number of coefficient arrays does not match n
%%%%%This is because the matrix A only has 1 column, but X1,X2, and X3 are
%%%%% defined. Because of this, the number of coefficient arrays (X1,X2,X3)
%%%%% does not match the number of columns of A.
% r = rand(3,2); A = [r 2*r(:,1)]; b = rand(3,1);
%%%%%The span is a plane is r3
