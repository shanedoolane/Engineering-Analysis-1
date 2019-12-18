% Homework Program 7 %
% Name: Shane Dolan
% Section: 30
% Date: 11/14/18

function [Vnew] = transform_mesh(A,V,T,C)
%TRANSFORM_MESH applys a linear transformation to a triangle mesh and
%displays the new mesh as a plot.
%transform_mesh applies takes arguments in the form (A,V,I,C) where A is a
%3x3 matrix, v is the coordinates of 4 vertices, and T is a matrix of
%vertexes that defines 4 triangles, and C is a matrix of 4 colors.
%
%Where:
%A is nx3 and represents the transformation matrix
%V is nx3 of vertices
%T is nx4 matrix of vertices augmented with color code
%C is nx3 with elements from 0 to 1 represing R G & B

validateattributes(A,{'numeric'},{'size',[3,3]},1);
validateattributes(V,{'numeric'},{'ncols',3},2);
validateattributes(T,{'numeric'},{'ncols',4,'integer','>=',1},3);
validateattributes(C,{'numeric'},{'ncols',3,'>=',0,'<=',1},4);
%'nrows',max(max([A(:,4)]))

%applies linear transformation A to the transposed rows of V
Vnew=(A*V')';

% Plot the new and original meshes
trisurf(T(:,1:3),Vnew(:,1),Vnew(:,2),Vnew(:,3),T(:,4)); 
hold on;
trisurf(T(:,1:3),V(:,1),V(:,2),V(:,3),T(:,4),'EdgeColor','none','FaceAlpha',0.2);
colormap(C);
hold off;
xlabel('X Axis');
ylabel('Y Axis');
zlabel('Z Axis');
axis equal;
end

%%%%%%%%%%% MATLAB OUTPUTS
% % % % % % A_scale =
% % % % % % 
% % % % % %     2.0000         0         0
% % % % % %          0    2.0000         0
% % % % % %          0         0    0.5000
% % % % % %  
% % % % % % A_refl =
% % % % % % 
% % % % % %      1     0     0
% % % % % %      0    -1     0
% % % % % %      0     0    -1
% % % % % % 
% % % % % % 
% % % % % % A_rot =
% % % % % % 
% % % % % %     0.9330    0.0670    0.3536
% % % % % %     0.0670    0.9330   -0.3536
% % % % % %    -0.3536    0.3536    0.8660
% % % % % % A =
% % % % % % 
% % % % % %     1.8660    0.1340    0.7072
% % % % % %    -0.1340   -1.8660    0.7072
% % % % % %     0.1768   -0.1768   -0.4330
% % % % % %     
% % % % % % B =
% % % % % % 
% % % % % %     1.8660   -0.1340   -0.1768
% % % % % %     0.1340   -1.8660    0.1768
% % % % % %    -0.7072   -0.7072   -0.4330


%Identity = eye(3,3) = [1,0,0;0,1,0;0,0,1]
%A_scale = [2,0,0;0,2,0;0,0,0.5]
%A_refl = [1,0,0;0,-1,0;0,0,-1]
%A_rot = [0.9330,0.0670,0.3536;0.0670,0.9330,-0.3536;-0.3536,0.3536,0.8660]
%A = [2,0,0;0,2,0;0,0,0.5]*[1,0,0;0,-1,0;0,0,-1]*[0.9330,0.0670,0.3536;0.0670,0.9330,-0.3536;-0.3536,0.3536,0.8660]
%B = [0.9330,0.0670,0.3536;0.0670,0.9330,-0.3536;-0.3536,0.3536,0.8660]*[2,0,0;0,2,0;0,0,0.5]*[1,0,0;0,-1,0;0,0,-1]

%s * rfl * rot

%rot scl rfl


