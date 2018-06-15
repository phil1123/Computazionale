function g = moebius(na,nb)

g = squarelattice([-na -nb]);
for j = 0:na-1
    g = g.addedge(1+nb*j,g.numnodes-nb*j,1);
end