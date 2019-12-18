function [MSE] = calcMSE(x1,x2)
%CALCMSE calculates the mean squared error of two vectors 'x1' and
%'x2'
%The inputs are x1 and x2
%The output of this equation of this function is 'MSE' this is the mean
%squared error between x1 and x2
    x1 = makeVector(x1);
    x2 = makeVector(x2);
    MSE = 1/size(x1,1) * sum((x1 - x2).^2);
end