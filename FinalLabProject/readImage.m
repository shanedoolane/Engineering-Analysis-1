function [image] = readImage(imgName)
%READIMAGE reads the image name from the selected path, converts it to
%grayscale and stores it in the output variable 'image'
%input 'imgName' = the path and name of the image on the computer.
%output 'image' = is the matrix form of the image read in the 'imgNamefile'
    imgName = imread(imgName);
    if ndims(imgName) > 2
        imgName = rgb2gray(imgName);
    end
image = im2double(imgName);