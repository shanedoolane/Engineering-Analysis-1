function PSNR = calcPSNR(x1,x2,maxX)
%CALCPNSR finds the peak signal to noise ratio between two vectors 'x1' and
%'x2'
%inputs: 'x1' is a column vector
%inputs: 'x2' is a column vector
%maxX: is the maximum the maximum value for the elements for the columns x1
%and x2
%output: 'psnr' is the peak signal to noise ratio as a vector. 
    if nargin < 3
        maxX = 1;
    end
    PSNR = 10 * log10((maxX^2)/calcMSE(x1,x2));
    if calcMSE(x1,x2) == 0
        PSNR = 100;
end
