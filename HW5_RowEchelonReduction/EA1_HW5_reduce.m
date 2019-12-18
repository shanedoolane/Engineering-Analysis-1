function [donematrix] = reduce(M)
%REDUCE puts a matrix M into echelon form.
%input arguments are given: reduce(M)

rowa = 1;
columna = 1;
while columna<size(M,2) && rowa<(size(M,1))
    newmatrix = M(rowa:end,columna:end);
%     if isempty(find(newmatrix))
%         
    if M(rowa,columna) == 0 && ~isempty(find(newmatrix))
        [variable,~]=find(newmatrix,1);
        concat = exchange(newmatrix,variable,1);
        concat = divide(concat,concat(1,1));
        for ii = 2:size(concat,1)
            if concat(ii,1) == 0
                concat(ii,1)=0;
            else
                concat = add(concat,(-1*(concat(ii,1))),1,ii);
            end
        end
        M(rowa:end,columna:end)=concat;
        rowa=rowa+1;
        columna=columna+1;
    elseif ~isempty(find(newmatrix))
        concat=M(rowa:end,columna:end);
        concat = divide(concat,concat(1,1));
        for ii = 2:size(concat,1)
            if concat(ii,1) == 0
                concat(ii,1)=0;
            else
                concat = add(concat,(-1*(concat(ii,1))),1,ii);
            end
        end
        M(rowa:end,columna:end)=concat;
        rowa=rowa+1;
        columna=columna+1;
        
    else
        M(rowa:end,columna:end)=concat;
        rowsa=rows+1
    end
end
donematrix = M;
end