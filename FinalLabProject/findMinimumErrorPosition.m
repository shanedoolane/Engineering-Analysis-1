function [minPos] = findMinimumErrorPosition(imgVec,imageDatabase)
%MINPOS finds the position of the image vector in the organized database that has the
%minimum mean standard error between imgVec and imageDatabase
%input = 'imgVec' MSE will be computed between this vectorized image and
%the rest of the image database.
%input = 'imagedatabase' the database that imgVec will be compared to.
%output = 'minPos' the column of imageDatabase that hold the image vector
%with the lease error.
    if size (imgVec,2) > 1
        imgVec = makeVector(imgVec);
    end
    MSEvec = zeros(size(imageDatabase,2),1);
    for ii = 1:size(imageDatabase,2)
        MSEvec(ii) = calcMSE(imgVec, imageDatabase(:,ii));
    end
[~,minPos] = min(MSEvec);
