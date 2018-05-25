syms a h t y
F(t,y,a) = a*y/t;
s1 = F(t,y,a);
s2 = F(t+h/2,y+h*s1/2,a);
s3 = F(t+h/2,y+h*s2/2,a);
s4 = F(t+h,y+h*s3,a);
dy = h*(s1 + 2*s2 + 2*s3 + s4)/6;
dy = subs(dy,y,t^a);
tay = taylor(simplify(dy-((t+h)^a-t^a)),h);
chk1 = simplify(tay,'Steps',10)

%% Simpson
F(t,a) = a*t^(a-1);
s1 = F(t,a);
s2 = F(t+h/2,a);
s3 = F(t+h/2,a);
s4 = F(t+h,a);
dy = h*(s1 + 2*s2 + 2*s3 + s4)/6;
tay = taylor(simplify(dy-((t+h)^a-t^a)),h);
chk2 = simplify(tay,'Steps',10)
