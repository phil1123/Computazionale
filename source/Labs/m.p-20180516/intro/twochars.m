for i = 0:94
    x = char(32+i);
    for j = 0:94
        y = char(32+j);
        if isequal(crypto([x y]),[x y])
            disp([x y])
        end
    end
end

%%
x = char(32:126)';
y = char(mod(62*(double(x)-32),97)+32);
[x y]