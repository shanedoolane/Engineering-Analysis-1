% Homework Program 1
%
% Name:     Dolan, Shane
% Section:  20
% Date:     10/08/2018

% *** Get user input for value of N ***
N = input('Enter one dimension of the matrix: ');

% This function creates a matrix called H of a size NxN that contains
% random integer values ranging from 0 to 1. 
H = randi([0 1],N,N);
% This sets the value of the element in the position 1:N+1 to 0 in every
% column. Effectivley, this creates a diagonal line of 0s across matrix H.
% This makes every N+1 term a 0 as you travel through each row of the
% matrix.
H(1:N+1:end) = 0;
% Divide each column by the sum of its entries, or if the column is all
% zeros then keep it all zeros by dividing by 1. This line divides 1 by the
% number of non-zero elements in each column and then replaces each of the
% non-zero elements in that column with the result.
H = H./max(1,sum(H,1));

% *** Create an identity matrix of the proper size ***
I = eye(N);
% *** Create a vector of ones of the proper size ***
one = ones(N,1);

% *** Create a vector of damping ratio values, starting at 0.001 and
% going to 0.999 in increments of 0.001 ***
d_vec = 0.001:0.001:0.999;
% *** Create a matrix to store the rank vector for every value of the
% damping ratio ***
%------------------------------------
r_mat = [N,999];

% This is called a "for loop", and it repeats its contents a
% predetermined number of times.  In this case, it repeats as many
% times as there are elements in "d_vec".  During each iteration, it
% takes a single value from "d_vec" and calculates the ranks of all the
% pages for that specific damping ratio.  Then, it stores the results
% in the matrix "r_mat".
for ii = 1:length(d_vec)
    % This assigns a single value from "d_vec" to the variable "d"
    d = d_vec(ii);
    

    % *** Solve the PageRank problem and store the results in "r" ***
    %r = ((-d*H_I)\((1-d))
    r = inv(I-d*H)*((1-d)*one);

    % This stores the rank vector that was just computed in the
    % appropriate column of the matrix "r_mat", corresponding to the
    % damping ratio that we used.
    r_mat(1:N,ii) = r;
end

% This opens Figure 1, so that we don't open a new figure every time we
% run the code
figure(1);

% *** Plot the rankings matrix "r_mat" against the vector of damping
% ratios "d_vec" ***
plot(d_vec,r_mat)

% *** Label the x-axis "d" ***
xlabel('D')

% *** Label the y-axis "Rank" ***
ylabel('Rank')

% This counts how many times there's a switch in rank.  The code goes
% through the ranks matrix "r_mat", and finds every time there is a
% change in the order of the ranks.  Then, it sums up how many times such a
% switch occurred.
[~,s] = sort(r_mat);
% This finds the number of switches.
switch_num = sum(any(diff(s,1,2)));

% *** Use an "fprintf" statement to print how many rank switches there
% were ***
fprintf('there rank switched %f times', switch_num)
%Quesitons
%-------------
%3a) The ranking order swithces more when the hyperlink matrix size
%increases
%3b) When you plug in 0 for each of the pages into the page rank equation,
%the solution for each web page is 0. Another way to look at this is that
%when the dampening ratio is 0, it is synonymous with randonly typing the
%url of a website. This yields the probability of finding a website if it
%is not linked to by any other pages.
%3c) There are only 3 visible lines so it is possible that the ranks of
%each of these lines switch continuoously throughout the loop making their
%paths on the plot look the same and the number of switches really high.
%4a) 0 
%4b) 2
%4b) The rank of page one is 0.5765. This is the 3rd highest r value of the
%4 pages.

