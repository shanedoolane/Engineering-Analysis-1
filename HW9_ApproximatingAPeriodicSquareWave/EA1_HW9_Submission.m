%Combined Functions

%square wave generator

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

%Approximator

function[coeffs,sig_approx,error]=approx_sin(sig,n,f0)
%APPROX_SIN approximates the value of a square wave function given by the
%first input 'sig'. The approximation uses n sinusoidal terms to
%approximate each point of 'sig'.
% The inputs are 'sig' (the square wave function in vector form), 'n' (the
% number of terms), 'f0' (is the fundamental frequency)
% 
% the outputs 'coeffs' (is the coefficients that are multiplied)
%the outputs 'sig_approx' (is the vector of approximated sin points for the vector 'sig')
%'error' (is the the sum of the squared differences between s and
%sig_approx)
    s = sig';
    k = 1:length(sig);
    A=[ones(size(s,1),1)];
    for ii=2:n+1
        for jj=1:size(s,1)
            A(jj,ii)=sin(2*pi*(jj*f0)*(ii-1));
        end
    end
coeffs = A\s;

approx_vec = [];
for kk = 1:length(sig)
    approx_vec(kk) = [coeffs(1)+coeffs(2)*sin(2*pi*(f0)*kk)];    
end
for pp=1:length(sig)
    for oo=2:n
            approx_vec(pp) = approx_vec(pp)+coeffs(oo+1)*sin(2*pi*(oo*f0)*pp);
    end
end
sig_approx=approx_vec;
plot(1:length(sig),approx_vec);

w=[];
for bb = 1:length(s)
    w(bb)=(s(bb)-sig_approx(bb))^2;
end
error = sum(w);
fprintf('The approximate signal = ')
fprintf('%d',coeffs(1));
for hh = 2:n+1
    fprintf(' + %d * sin(2 * pi * f0 * k)',coeffs(hh));
end
fprintf('\n');
fprintf('The approximation error is %d\n',error);
end

%Script

%number of terms to approximate
e = 30;
b = gen_square_wave(100,4);
sig_approx = zeros(1,length(b));
overshoot_vec = zeros(e,1);
r2 = zeros(e,1);
hold on

for ii = 1:e
    [x,y,z] = approx_sin(b,ii,1/200);
    sig_approx(ii,1:end) = y;
    error_vec(ii) = z
    overshoot_vec(ii) = max((sig_approx(ii,1:end))-1);
end

figure(2)
clf
plot(1:e,error_vec);
title('Solve Error');
ylabel('Approximation Error');
xlabel('N approximation terms');
fprintf('Approximation Error        Overshoot Error\n')
for tt =1:e 
   fprintf(' %d',error_vec(tt));fprintf('                %d\n',overshoot_vec(tt)) 
end

fprintf('R^2 error: [%d',error_vec(1))
for mm=2:e
    fprintf(';%d',error_vec(mm))
end
fprintf(']\n')

fprintf('Overshoot error: [%d',overshoot_vec(1))
for mm=2:e
    fprintf(';%d',overshoot_vec(mm))
end
fprintf(']\n')

%answer to question
%the first and every even term following it has a leasing coefficient of 0
%so these terms do not affect the approximation. These terms can be omitted

%Column Vectors

% R^2 error: [1.516511e+02;1.516511e+02;7.970711e+01;7.970711e+01;5.387549e+01;5.387549e+01;4.074824e+01;4.074824e+01;3.284907e+01;3.284907e+01;2.759628e+01;2.759628e+01;2.386548e+01;2.386548e+01;2.108953e+01;2.108953e+01;1.895163e+01;1.895163e+01;1.726106e+01;1.726106e+01;1.589612e+01;1.589612e+01;1.477556e+01;1.477556e+01;1.384301e+01;1.384301e+01;1.305819e+01;1.305819e+01;1.239151e+01;1.239151e+01]
% Overshoot error: [2.731348e-01;2.731348e-01;2.001255e-01;2.001255e-01;1.873380e-01;1.873380e-01;1.816170e-01;1.816170e-01;1.806327e-01;1.806327e-01;1.770301e-01;1.770301e-01;1.768500e-01;1.768500e-01;1.740048e-01;1.740048e-01;1.694143e-01;1.694143e-01;1.731024e-01;1.731024e-01;1.639642e-01;1.639642e-01;1.675091e-01;1.675091e-01;1.675091e-01;1.675091e-01;1.564934e-01;1.564934e-01;1.508872e-01;1.508872e-01]