function PSNRs = computePSNRs(imgVec,imageDatabase)
%COMPUTEPSNRS recieves the input of a vectorized images and an entire
%database of images and computes the peak signal to noise ratio between each
%image vectorized in the database and the image vectorized in the first
%imnput.
%Input: 'imgVec' imgVec is the vectorized imaged that is compared to the
%entire image database using PSNR
%Input: 'imageDatabase' is the database of images that is the peak signal
%to noise ratio is computed against imgVec.
%Output: PSNRs is a matrix of the calculated PSNR between the image in
%imgVec.
    PSNRs = zeros(1,size(imageDatabase,2));
    for i = 1: size(imageDatabase,2)
        PSNRs(1,i) = calcPSNR(imgVec,imageDatabase(:,i));
end