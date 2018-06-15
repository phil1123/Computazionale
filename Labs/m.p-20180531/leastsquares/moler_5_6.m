X = reshape(1:15,3,5)'

%% a.
rank(X)
Z = pinv(X)    % The actual pseudoinverse
B = X\eye(5,5) % Backslash
S = eye(3,3)/X % Slash

%% b.
normf = @(X) norm(X,'fro');
I = eye(5,5); E = eye(3,3);
[normf(Z) normf(B) normf(S)
 normf(X*Z-I) normf(X*B-I) normf(X*S-I)
 normf(Z*X-E) normf(B*X-E) normf(S*X-E)]

%% c.
iseq = @(X,Y) norm(X-Y,'fro') <= 200*eps;
[iseq(X*Z*X,X) iseq(Z*X*Z,Z) iseq(X*Z,(X*Z)') iseq(Z*X,(Z*X)')
 iseq(X*B*X,X) iseq(B*X*B,B) iseq(X*B,(X*B)') iseq(B*X,(B*X)')
 iseq(X*S*X,X) iseq(S*X*S,S) iseq(X*S,(X*S)') iseq(S*X,(S*X)')]