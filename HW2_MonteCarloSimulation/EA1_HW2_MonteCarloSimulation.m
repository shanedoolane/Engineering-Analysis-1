%Title: Homework 2
%name: Shane Dolan
%Section: 30
%Date: 10/7/19

%asking for user input of number of dice d
d = input('Please enter the number of dice, d:\n');
%asking for user input of number of sides per dice, s
s = input('please enter the number of sides of the dice, s:\n');
%asking for user input of the number of trials, n
n = input('please enter the number of trial that you would like to perform, n:\n');
%this line creates a matrix of random integers simulating dice rolls. the
%elements in the matrix represent the value that the dice lands on and
%therefore range from 1 to s. The columns represent each die in the
%simulation. the rows, denoted by n represent each trial.
A = randi(s,n,d);
%The line below does not work
%fprintf('The results of your trials are listed below: %i\n', A)
%this line sums the rows of matrix A resulting in the total for all of the
%rolls of one specific die.
dice_sums = sum(A,2);
%this divides dice_sums into d:s*d bins and stores the values into tally
%and sums
[tally,sums] = hist(dice_sums,d:s*d);
%probability = is the tally divided by the number of trials
prob = tally/n;
%this prevents the plot from reopening each time we run the code
figure(1);
%this plots the variable prob into the bar chart
bar(prob)
%labeling the x axis
xlabel('Sum');
%labeling the y axis
ylabel('Probability');
%this put the title of the graph on the graph and puts s,n,d as variables
%on the chart.
title([num2str(d) ' Dice, ',num2str(s) ' Sides, ',num2str(n) ' Trials'])
%this function places the transposed vectors of sums and probs into a
%matrix and prints them
results = [sums',prob']


% %trial 1
%     3.0000    0.0010
%     4.0000    0.0030
%     5.0000    0.0060
%     6.0000    0.0070
%     7.0000    0.0130
%     8.0000    0.0210
%     9.0000    0.0310
%    10.0000    0.0220
%    11.0000    0.0480
%    12.0000    0.0510
%    13.0000    0.0530
%    14.0000    0.0710
%    15.0000    0.0650
%    16.0000    0.0700
%    17.0000    0.0830
%    18.0000    0.0610
%    19.0000    0.0820
%    20.0000    0.0710
%    21.0000    0.0550
%    22.0000    0.0480
%    23.0000    0.0450
%    24.0000    0.0310
%    25.0000    0.0260
%    26.0000    0.0160
%    27.0000    0.0130
%    28.0000    0.0030
%    29.0000    0.0030
%    30.0000    0.0010



%trial 2
%     4.0000    0.0008
%     5.0000    0.0031
%     6.0000    0.0077
%     7.0000    0.0153
%     8.0000    0.0268
%     9.0000    0.0436
%    10.0000    0.0615
%    11.0000    0.0804
%    12.0000    0.0964
%    13.0000    0.1077
%    14.0000    0.1126
%    15.0000    0.1083
%    16.0000    0.0965
%    17.0000    0.0802
%    18.0000    0.0617
%    19.0000    0.0432
%    20.0000    0.0270
%    21.0000    0.0156
%    22.0000    0.0076
%    23.0000    0.0030
%    24.0000    0.0008
