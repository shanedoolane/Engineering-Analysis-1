function plotIndices(scrambledIndices,correctIndices)
%PLOTINDICIES takes two inputs 'scrambledIndicies' and 'correctIndices' and
%plots the Database column of a player as a functon of the name in the
%player id. This occurs for both correct and scrambled indicies. A
%correctly ordered database should have a slope of 1 meaning that player 1
%is in the first column and player 100 is in column 100.
    figure(1);
    x = 1:100;
    y = scrambledIndices;
    subplot(1,2,1);
        plot(x,y,'*');
        axis([0 100 0 100])
        axis square
        title('Scrambled Indices')
        xlabel('Player ID')
        ylabel('Database Column')
        a = correctIndices;
    subplot(1,2,2)
        plot(x,a,'*')
        axis([0 100 0 100])
        axis square
        title('Correct Indices')
        xlabel('Player ID')
        ylabel('Database Column')
end