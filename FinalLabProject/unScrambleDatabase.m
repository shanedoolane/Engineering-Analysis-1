function [newDatabase,indices] = unScrambleDatabase(imagePath,database)
%  UNSCRAMBLEDDATABASE un scrambles the database in the second input using
%  using the order of the images in imagePath to order the columns. The
%  order of images in the image file will then match the order of the
%  columns
%input = 'database' is the database of vectorized images to be reordered
%input = 'imagepath' is the location of the images used to reorder the
%columns
%output = 'newDatabase' is the unscrambled database of images where all of
%the columns correspond with the order of the images in the file. 
%output = 'indicies' is a row vector containing the index of each column in
%the original database that when rearranged will put the database in the
%correct order.
    indices = zeros(1,size(database,2));
    newDatabase = zeros(size(database));
    for ii = 1:size(database,2)
        Player_Image = [imagePath, 'Player', num2str(ii),'.png'];
        image = readImage(Player_Image);
        minimumPos = findMinimumErrorPosition(image,database);
        indices(ii) = minimumPos;
    end
    for jj = 1: length(indices)
        newDatabase(:,jj) = database(:,indices(jj));
    end
end