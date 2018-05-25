function fr = somefraction(N)

k = 0;
for n = 1:N
    x = rand;
    if x*(1/x) == 1
        k = k+1;
    end
end
fr = k/N;