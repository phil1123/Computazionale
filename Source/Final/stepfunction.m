function y = stepfunction(x,a)
y = 4/a^2*(heaviside(x+a) - heaviside(x-a));