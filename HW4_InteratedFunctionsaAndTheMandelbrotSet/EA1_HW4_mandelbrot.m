% Homework Program 4
%
%Name: Shane Dolan
%section 30
%Date: 10/18.2018
function [EscTime,EscVal,Image] = mandelbrot(limits,nx,ny,maxEscTime)
%MANDELBROT creates visualization of a mandelbrot set
    if ~exist('limits','var') || isempty(limits) 
        limits = [-2.0 0.5 -1.2 1.2];
    end

    if ~exist('nx','var') || isempty(nx) 
        nx = 1000;
    end
    
    if ~exist('ny','var') || isempty(ny) 
        ny = 1000;
    end
    
    if ~exist('maxEscTime','var') || isempty(maxEscTime) 
        maxEscTime = 1000;
    end
   
    x = linspace(limits(1),limits(2),nx); 
    y = linspace(limits(4),limits(3),ny); 
    [X,Y] = meshgrid(x,y);
    %The element C(1,1) represents the upper left corner of the region, which has the value XMIN+1i*YMAX.
    C = X + 1i*Y;
    
    EscTime = inf(ny,nx);
    EscVal = NaN(ny,nx);
    
    Z = zeros(ny,nx);
    %This array Z will store the current values of the sequences {z0, z1, z2, . . . }. 
    done = false(ny,nx);
    
    k= 1;
    while k < maxEscTime && ~all(done(:))
        Z = Z.^2 + C;
        k = k+1;
        new1 = abs(Z)>2 & done==false;
        EscTime(new1) = k;
        EscVal(new1) = abs(Z(new1));
        
        done(new1) = true;
    end
    Image = showMandelbrot(EscTime,EscVal,limits);
        
       
    
    
    