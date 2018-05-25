function p = friday(n)
cnt = 0;
for y = 1:400
    for m = 1:12
        d = datenum([y,m,n]);
        if weekday(d) == 6
            cnt = cnt+1;
        end
    end
end
p = cnt/4800;
