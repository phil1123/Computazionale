%-- 12/03/2018 09:37 --%
orbit(1e-3)
format longg
orbit(1e-4)
orbit(1e-6)
orbit(50,1e-6)
help keplerode
[r,v]=keplerode(0,[1 0 0],[0 0 0.5])
[r,v]=keplerode([0 0],[1 0 0],[0 0 0.5])
[r,v]=keplerode([0 1],[1 0 0],[0 0 0.5])
pcode('keplerode')
[r,v]=keplerode(0,[1 0 0],[0 0 0.5])
[r,v]=keplerode([0 30],[1 0 0],[0 0.5 1]);
plot(r(:,1),r(:,2))
axis equal
[r,v]=keplerode([0 30],[1 0 0],[0 1.5 1]);
plot(r(:,1),r(:,2))
[r,v]=keplerode([-10 10],[1 0 0],[0 1.5 1]);
plot(r(:,1),r(:,2))
[r,v]=keplerode([-10 0],[1 0 0],[0 1.5 1]);
plot(r(:,1),r(:,2))
[r,v]=keplerode([0 -10],[1 0 0],[0 1.5 1]);
plot(r(:,1),r(:,2))
[r,v]=keplerode([-10 10],[-5 -3 0],[-3 1.5 0]);
plot(r(:,1),r(:,2))
open lorenzgui
[r,v]=keplerode(0,[1 0 0],[0 0 0.5])
[r,v,E]=keplerode(0,[1 0 0],[0 0 0.5])
pcode('keplerode')
[r,v,E]=keplerode(0,[1 0 0],[0 0 0.5])
pcode('keplerode')
swinger
open swinger
which swinger
swinger
swinge(0,2)
swinger(0,2)