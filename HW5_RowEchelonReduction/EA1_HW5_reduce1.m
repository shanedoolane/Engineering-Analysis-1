function [donematrix] = reduce(M)
%REDUCE puts a matrix M into echelon form.
%input arguments are given: reduce(M)

rowa = 1;
columna = 1;
while rowa<(size(M,1)) && (columna<size(M,2))
    newmatrix = [M(rowa,:),M(columna,:)];
    if sum(find(newmatrix(:,columna)==0))==size(cloumna)
        rowa = rowa+1
        columna = columna+1
    elseif M(rowa,columna) == 0 
        concat = exchange(newmatrix,find(newmatrix(m,1),rowa));
        concat = divide(concat,concat(1,1));
        for ii = size(concat,1)
           concat = add(concat,(-1*(concat(1+ii,1))),1,(ii+2));
        end
    else
        concat=M(rowa,columna);
        concat = divide(concat,concat(1,1));
        for ii = size(concat,1)
           concat = add(concat,(-1*(concat(1+ii,1))),1,(ii+2));
        end
        
    end
    end
    M(rowa:end,columna:end)=concat;
end
donematrix = M
end