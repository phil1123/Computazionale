function moler_4_11

for n = 1:30
    sn = sym(n);
    d = prod(1:sn) - prod(1:n);
    disp([n d])
    if d ~= 0 
        break
    end
end

for n = 1:200
    if isinf(factorial(n)) 
        break
    end
end
disp(n-1)

% Theory: 
% 22! contains 11+1+2+3=17 factors of 2, namely, it has 2^17 as factor;
% double(22!) has floating point exponent 69 and 
% (2^52)*((22!)/2^69-1) = (22!)/2^17-2^52 = 4071845378257004 is an integer.
% 23! still contains 2^17 as largest power of 2 but double(23!) has 74
% as floating point exponent, hence 
% (2^52)*((23!)/2^74-1) = (23!)/2^22-2^52 cannot be an integer. 