function [square_wave]=gen_square_wave(halfp,cycles)
%GEN_SQUARE generates a square wave pattern with: 2*halfp elements per period, a duty cycle of 50%, and 'cycles' number of repeated periods.
%inputs 'halfp' is the number of elements per "square" of the function
%       'cycles' is the number of periods that the functions 
%outputs 'square_wave' is the outputted vector of values which is the
%values of the square wave functions.
    clf;
    %one cycle
    xp = [ones(1,halfp),-1*ones(1,halfp)];
    %full vector of y vals
    y = [];
    for ii = 1:cycles
        y = [y,xp]; 
    end
    square_wave=y;
    %plot of a line at y = 0
    hold on;
    plot([0,length(y)],[0,0]);
    plot(0:length(y)-1,y);
    ylim([-2,2]);
end



