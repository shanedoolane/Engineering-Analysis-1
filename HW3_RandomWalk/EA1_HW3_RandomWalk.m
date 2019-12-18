% EA 1, Homework program assignment 3
%
% Name: Dolan, Shane
%Section: 30    
%Date: 10/18/2018


%comments above referenced line


%For task one, the number of steps in the random walk;
steps = input('[TASK 1]Please enter the number of steps your would like to take for tasks 1:\n');
steps2 = input('[TASK 2]Please enter the number of steps your would like to take for task 2:\n');
%For task two, the number of steps in the random walk and the number of random walks generated
%(that is, number of ?trials? N1);
%uses the same value of steps as task 1
N = input('[TASK 2]Please enter the number of trials that you would like to test:\n');

%For task three, an array containing the distance sizthresholds, the number of random walks generated,
%or trials N2, and a maximum value for the number of steps that can be taken.
distance_threshold = input('[TASK 3]Please enter the distance threshold boundaries and step(minimum:step:maximum):\n');
quantity = input('[TASK 3]Please enter the quanitity of random walks to simulate per threshold:\n');
max_steps = input('[TASK 3]Please enter the max steps that you are willing to take to reach each threshold:\n');
%this line compiles all of the requested variables for task 3 into the
%array: "test"
%%test = [distance_threshold,quantity,max_steps];

%setting the initial position to the origin.
position = [0,0];



%1 = y+1
%2 = x+1
%3 = y-1
%4 = x-1

%opens new figure
figure(1);
clf(1);
%intializes an animation of the random walk at the origin
h = animatedline(0,0,"marker",'o');
%equalizes x and y scale
axis equal
%sets counter value to 0
ii = 0;

%this loop allows our drunkard to take "steps" number of steps
while ii < steps
    %chooses a random direction
    direction = randi(4);
    %dictates movement if the step is 1 or in the positive direction
    if direction == 1
        %adds +1 to the y position of the walker
        position = position + [0,1];
        %plots a point at the new position of the walker
        addpoints(h,position(1,1),position(1,2));
        %draws the plot
         drawnow
    elseif direction == 2
        position = position + [1,0];
        addpoints(h,position(1,1),position(1,2));
        drawnow
    elseif direction == 3
        position = position + [0,-1];
        addpoints(h,position(1,1),position(1,2));
        drawnow
    elseif direction == 4
        position = position + [-1,0];
        addpoints(h,position(1,1),position(1,2));
        drawnow
    end
    ii = ii+1;
end
%calculates distance using the distance formula
distance = sqrt((position(1,1))^2+position(1,2)^2);
%prints out the distance from the axis and the location of the walker in
%the figure
fprintf('The final position of your drunk self in Task 1 is %i steps along the y axis\nYou are %i steps along the x axis\nYou are %.2f steps from the origin as the crow flies.\n', position(1,2), position(1,1), distance);  


%this is the start of task 2
%Plots of task 2 will not be generated.

%sets counter values to 0
finalpos = zeros(N,2);
position = [0,0];
k = 1;
for gg = 1:N
    jj = 0;
    position = [0,0];
    while jj < steps2
        %chooses a random direction
        direction = randi(4);
        %dictates movement if the step is 1 or in the positive direction
        if direction == 1
            %adds +1 to the y position of the walker
            position = position + [0,1];
        elseif direction == 2
            position = position + [1,0];
        elseif direction == 3
            position = position + [0,-1];
        elseif direction == 4
            position = position + [-1,0];
        end
        %this adds one to the counter jj
        jj = jj+1;
    end
    %enters the final position into a matrix
    finalpos(gg,:) = [position];
end
%calculates distance from the origin using the sitance formula
finaldistance = sqrt(finalpos(:,1).^2+finalpos(:,2).^2);
figure(2);
clf(2);
%Q = round(length(finaldistance)/10)
histogram(finaldistance,50);
title('Distance Frerquency');ylabel('Frequency');xlabel('Distance From Origin');
meandistance = mean(finaldistance);
fprintf('The average distance walked throughout %i trials of %i steps was %.2f steps\n',N,steps2,meandistance);
dmean = zeros(1,length(distance_threshold));

%this is task 3
gg=1;
storage = zeros(quantity,length(distance_threshold));
for pp = distance_threshold
    for kk = 1:quantity
        distancetraveled = 0;
        position = [0,0];
        stepstaken=0;
        while distancetraveled < pp
            direction = randi(4);
            if direction == 1
                position = position + [0,1];
            elseif direction == 2
                position = position + [1,0];
            elseif direction == 3
                position = position + [0,-1];
            elseif direction == 4
                position = position + [-1,0];
            end
            stepstaken = stepstaken +1;
            distancetraveled = sqrt(position(1,1)^2+position(1,2)^2); 
        end
        storage(kk,gg) = stepstaken;
        
        if stepstaken > max_steps
            warning('WARNING! The number of steps taken to travel a distance of %i exceded the threshold that you set.',pp);
        end
       
    end

    gg = gg+1;
end

dmean = mean(storage);
for yy=1:length(dmean)
    fprintf('It took an average of %.2f steps to reach your distance threshold of %f\n',dmean(yy),distance_threshold(yy));
    fprintf('(d = %.0f , %.00f)\n',distance_threshold(yy),dmean(yy));
    
end
figure(3);
clf(3);
plot(distance_threshold,dmean);
title('Average Number of Steps as a Function of Distance Threshold');
xlabel('Distance Threshold');
ylabel('Average Number of Steps')





%questions

%%%Printout

% The final position of your drunk self in Task 1 is -36 steps along the y axis
% You are 32 steps along the x axis
% You are 48.17 steps from the origin as the crow flies.
% The average distance walked throughout 10000 trials of 2000 steps was 39.77 steps
% It took an average of 25.42 steps to reach your distance threshold of 5.000000
% (d = 5 , 25)
% It took an average of 101.78 steps to reach your distance threshold of 10.000000
% (d = 10 , 102)
% It took an average of 231.13 steps to reach your distance threshold of 15.000000
% (d = 15 , 231)
% It took an average of 411.19 steps to reach your distance threshold of 20.000000
% (d = 20 , 411)
% It took an average of 644.30 steps to reach your distance threshold of 25.000000
% (d = 25 , 644)
% It took an average of 912.92 steps to reach your distance threshold of 30.000000
% (d = 30 , 913)
% It took an average of 1268.55 steps to reach your distance threshold of 35.000000
% (d = 35 , 1269)
% It took an average of 1628.88 steps to reach your distance threshold of 40.000000
% (d = 40 , 1629)
% It took an average of 2031.55 steps to reach your distance threshold of 45.000000
% (d = 45 , 2032)
% It took an average of 2548.74 steps to reach your distance threshold of 50.000000
% (d = 50 , 2549)

%Question 2
%I used matlab's built in mean function to find the means of each column of
%the 'storage' vector. This vector contained N (trials) x
%length(distance_threshold) elements. In order to find the mean of the each
%column, we would just use the following: mean(storage). This returns an 1
%by length(distance_threshold) matrix of means. This is the mean number of
%steps needed to reach each respective distance threshold represented by a
%cloumn in my matrix.










