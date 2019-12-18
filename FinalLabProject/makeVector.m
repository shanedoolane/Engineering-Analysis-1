function [vec0ut] = makeVector(matrixIn)
%VEC0UT takes a matrix and orders it chronologically as a vector
%input = 'matrixIn' matrix that is to be reordered as vector
%output = 'vec0ut' is the vectorized version of 'matrixIn'
    if ~isnumeric(matrixIn)
        error('Input matrix is not numeric.');
    end
    if ndims(matrixIn) > 2
        error('Input matrix has invalid dimensions.');
    end
vec0ut = matrixIn(:);