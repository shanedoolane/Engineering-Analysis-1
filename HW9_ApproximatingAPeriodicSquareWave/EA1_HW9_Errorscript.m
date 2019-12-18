%number of terms to approximate
e = 100;
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