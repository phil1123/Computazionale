% Approccio 'brute force' all'esecizio 2.5
for n=2:20
    h = hilb(n);
    [~,p] = chol(h);
    disp(['n = ' num2str(n) ', p = ' num2str(p)])
end
%%
for n=2:35
    pasc = pascal(n);
    [~,p] = chol(pasc);
    disp(['n = ' num2str(n) ', p = ' num2str(p)])
end
%%
for n=2:35
    pasc = pascal(n,[],'sym');
    [~,p] = chol(pasc);
    disp(['n = ' num2str(n) ', p = ' num2str(p)])
end
%%
for n=1:40
    R = randn(n);
    A = R + R' + n*eye(n);
    [~,p] = chol(A);
    disp(['n = ' num2str(n) ', p = ' num2str(p)])
end
%%
for n=2:35
    [~,p] = chol(pasc);
    disp(['n = ' num2str(n) ', p = ' num2str(p)])
end
