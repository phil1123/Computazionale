function testranslate(method)

g=zeros(100,1);g(33:44)=1;bar(g)
for j=1:30
translate(g,.7,method);bar(real(g))
drawnow
pause(0.4)
translate(g,.3,method);bar(real(g))
drawnow
pause(0.4)
end