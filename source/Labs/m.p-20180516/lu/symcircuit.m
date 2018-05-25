function vvals = symcircuit(rvals)

if nargin == 0
    rvals = rand(1,8);
end

disp('The graph vertices (or nodes) and elementary loops (or faces) are')
disp('numbered as in figure 2.7')
disp('the eight links (or edges) are ordered as (12 13 14 23 25 34 35 45)')
disp('Kirchoff''s voltage law is embodied in the edges-to-faces matrix')

A = [1 -1  0  0    
     0  1 -1  0	   
     1  0 -1  0	   
     0  1  0  0	   
     0  0  1 -1	   
     1  0  0  0	   
     0  0  0 -1	   
     1  0  0 -1] %#ok<*NOPTS>

disp('---- press any key to continue ---- ')
pause
disp('while Kirchoff''s current law is embodied in the edges-to-vertices matrix')

B = [ 1 -1  0  0  0 
      1  0 -1  0  0 
     -1  0  0  1  0 
      0 -1  1  0  0 
      0  0 -1  1  0 
      0  1  0  0 -1 
      0  0  1  0 -1 
      0  0  0 -1  1]

disp('---- press any key to continue ---- ')
pause
disp('By construction the columns of A are orthogonal to all columns of B')
disp('and A''*B yields')

A'*B

disp('Indeed any vertex either does not belong to a loop or it does but with')
disp('the two links one entering and the other leaving the node.')

disp('Of course A and B are not unique: since each edge can be freely oriented,') 
disp('each row of A and B can be simultaneously changed of sign.')

disp('Let us proceed symbolically.')
disp('---- press any key to continue ---- ')
pause
disp('syms vs is r12 r13 r14 r23 r25 r34 r35 r45')
syms vs is r12 r13 r14 r23 r25 r34 r35 r45
r = [r12 r13 r14 r23 r25 r34 r35 r45]
g = 1./r
v0 = [0 0 0 vs].'
i0 = [0 0 is 0 -is].'
disp('---- press any key to continue ---- ')
pause

disp('Then the resistence matrix is R = A''*diag(r)*A') 
R = A'*diag(r)*A
disp('---- press any key to continue ---- ')
pause

disp('while the conductance matrix is G = B''*diag(g)*B')
G = B'*diag(g)*B
disp('---- press any key to continue ---- ')
pause

disp('Since R*i = v0 the loop current is i = R\v0')
i = R\v0
disp('---- press any key to continue ---- ')
pause

disp('By construction, the constant vertex potential is a zero-mode of G.')
disp('Hence we assume v(5)=0 and restrict the equation G*v = i0 to the')
disp('first four vertices, so that v = [G(1:4,1:4)\i0(1:4) ; 0]') 
v = [G(1:4,1:4)\i0(1:4) ; 0]
disp('---- press any key to continue ---- ')
pause

disp('In this particular case, this v is exactly the solution of the singular')
disp('system G*v = i0 as computed by MATLAB backslash operation G\i0 :')
disp(['simplify(v - G\i0) = [' num2str(double(simplify(v - G\i0))') '].'''])
disp('---- press any key to continue ---- ')
pause

disp('The source current is must be such that  vs - v(3) = r35*i(4)')
disp('[Notice the sign error in the text of exrcise 2.4]')
disp('Quite simply vs = r35*is, as can be verified symbolically by')
disp('simplify(subs(vs - v(3) - r35*i(4),vs,r35*is))')
simplify(subs(vs - v(3) - r35*i(4),vs,r35*is))
disp('---- press any key to continue ---- ')
pause

disp('Let us then replace is by vs/r35 in v: ')
disp('v = subs(v,is,vs/r35)')
v = subs(v,is,vs/r35);

disp('Obviously, the node voltages in v are now all proportional to vs,')
disp('since they were proportional to is by construction.')
disp('This can be checked by v/vs - subs(v/vs,vs,0)')
v/vs - subs(v/vs,vs,0) %#ok<MNEFF>

disp('B*v is the potential difference across the edges and must coincide')
disp('with r.*(A*i) on all edges except on edge 35:')
disp('check = simplify(B*v - r.''.*(A*i) )')
check = simplify(B*v - r.'.*(A*i))

vvals = double(subs(subs(v,r,rvals),vs,rvals(7)));


