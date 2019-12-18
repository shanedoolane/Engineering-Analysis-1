function[coeffs,sig_approx,error]=approx_sin(sig,n,f0)
%APPROX_SIN approximates the value of a square wave function given by the
%first input 'sig'. The approximation uses n sinusoidal terms to
%approximate each point of 'sig'.
% The inputs are 'sig' (the square wave function in vector form), 'n' (the
% number of terms), 'f0' (is the fundamental frequency)
% 
% the outputs 'coeffs' (is the coefficients that are multiplied)
%the outputs 'sig_approx' (is the vector of approximated sin points for the vector 'sig')
%'error' (is the the sum of the squared differences between s and sig_approx

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