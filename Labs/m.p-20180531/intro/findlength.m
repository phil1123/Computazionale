L = zeros(1,1000);
for n = 1:1000, L(n) = length3np1(n); end
plot(L)
n = find(L==max(L))
length3np1(n)
threenplus1(n)