x=randn(10,1)

x =

    0.5377
    1.8339
   -2.2588
    0.8622
    0.3188
   -1.3077
   -0.4336
    0.3426
    3.5784
    2.7694

vander(x)

ans =

   1.0e+04 *

  Columns 1 through 7

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000
    0.0235    0.0128    0.0070    0.0038    0.0021    0.0011    0.0006
   -0.1531    0.0678   -0.0300    0.0133   -0.0059    0.0026   -0.0012
    0.0000    0.0000    0.0000    0.0000    0.0000    0.0001    0.0001
    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000
   -0.0011    0.0009   -0.0007    0.0005   -0.0004    0.0003   -0.0002
   -0.0000    0.0000   -0.0000    0.0000   -0.0000    0.0000   -0.0000
    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000
    9.6205    2.6885    0.7513    0.2100    0.0587    0.0164    0.0046
    0.9583    0.3460    0.1250    0.0451    0.0163    0.0059    0.0021

  Columns 8 through 10

    0.0000    0.0001    0.0001
    0.0003    0.0002    0.0001
    0.0005   -0.0002    0.0001
    0.0001    0.0001    0.0001
    0.0000    0.0000    0.0001
    0.0002   -0.0001    0.0001
    0.0000   -0.0000    0.0001
    0.0000    0.0000    0.0001
    0.0013    0.0004    0.0001
    0.0008    0.0003    0.0001



x=randn(3,1)

x =

   -1.3499
    3.0349
    0.7254

vander(x)

ans =

    1.8222   -1.3499    1.0000
    9.2108    3.0349    1.0000
    0.5262    0.7254    1.0000

x=sym('x',[4 1])
 
x =
 
 x1
 x2
 x3
 x4
 
x(3)
 
ans =
 
x3
 
vander(x)
 
ans =
 
[ x1^3, x1^2, x1, 1]
[ x2^3, x2^2, x2, 1]
[ x3^3, x3^2, x3, 1]
[ x4^3, x4^2, x4, 1]
 
y=sym('y',[4 1])
 
y =
 
 y1
 y2
 y3
 y4
 
v=vander(x)
 
v =
 
[ x1^3, x1^2, x1, 1]
[ x2^3, x2^2, x2, 1]
[ x3^3, x3^2, x3, 1]
[ x4^3, x4^2, x4, 1]
 
c=v\y
 
c =
 
                                                                                                                           -(x1*x2^2*y3 - x1*x3^2*y2 + x2*x3^2*y1 - x1^2*x2*y3 + x1^2*x3*y2 - x2^2*x3*y1 - x1*x2^2*y4 + x1*x4^2*y2 - x2*x4^2*y1 + x1^2*x2*y4 - x1^2*x4*y2 + x2^2*x4*y1 + x1*x3^2*y4 - x1*x4^2*y3 + x3*x4^2*y1 - x1^2*x3*y4 + x1^2*x4*y3 - x3^2*x4*y1 - x2*x3^2*y4 + x2*x4^2*y3 - x3*x4^2*y2 + x2^2*x3*y4 - x2^2*x4*y3 + x3^2*x4*y2)/((x1 - x2)*(x1*x2 - x1*x3 - x2*x3 + x3^2)*(x1*x4^2 + x2*x4^2 + x3*x4^2 - x4^3 + x1*x2*x3 - x1*x2*x4 - x1*x3*x4 - x2*x3*x4))
                                                                                                                            (x1*x2^3*y3 - x1*x3^3*y2 + x2*x3^3*y1 - x1^3*x2*y3 + x1^3*x3*y2 - x2^3*x3*y1 - x1*x2^3*y4 + x1*x4^3*y2 - x2*x4^3*y1 + x1^3*x2*y4 - x1^3*x4*y2 + x2^3*x4*y1 + x1*x3^3*y4 - x1*x4^3*y3 + x3*x4^3*y1 - x1^3*x3*y4 + x1^3*x4*y3 - x3^3*x4*y1 - x2*x3^3*y4 + x2*x4^3*y3 - x3*x4^3*y2 + x2^3*x3*y4 - x2^3*x4*y3 + x3^3*x4*y2)/((x1 - x2)*(x1*x2 - x1*x3 - x2*x3 + x3^2)*(x1*x4^2 + x2*x4^2 + x3*x4^2 - x4^3 + x1*x2*x3 - x1*x2*x4 - x1*x3*x4 - x2*x3*x4))
                                                                           -(x1^2*x2^3*y3 - x1^2*x3^3*y2 - x1^3*x2^2*y3 + x1^3*x3^2*y2 + x2^2*x3^3*y1 - x2^3*x3^2*y1 - x1^2*x2^3*y4 + x1^2*x4^3*y2 + x1^3*x2^2*y4 - x1^3*x4^2*y2 - x2^2*x4^3*y1 + x2^3*x4^2*y1 + x1^2*x3^3*y4 - x1^2*x4^3*y3 - x1^3*x3^2*y4 + x1^3*x4^2*y3 + x3^2*x4^3*y1 - x3^3*x4^2*y1 - x2^2*x3^3*y4 + x2^2*x4^3*y3 + x2^3*x3^2*y4 - x2^3*x4^2*y3 - x3^2*x4^3*y2 + x3^3*x4^2*y2)/((x1 - x2)*(x1*x2 - x1*x3 - x2*x3 + x3^2)*(x1*x4^2 + x2*x4^2 + x3*x4^2 - x4^3 + x1*x2*x3 - x1*x2*x4 - x1*x3*x4 - x2*x3*x4))
 -(- y4*x1^3*x2^2*x3 + y3*x1^3*x2^2*x4 + y4*x1^3*x2*x3^2 - y3*x1^3*x2*x4^2 - y2*x1^3*x3^2*x4 + y2*x1^3*x3*x4^2 + y4*x1^2*x2^3*x3 - y3*x1^2*x2^3*x4 - y4*x1^2*x2*x3^3 + y3*x1^2*x2*x4^3 + y2*x1^2*x3^3*x4 - y2*x1^2*x3*x4^3 - y4*x1*x2^3*x3^2 + y3*x1*x2^3*x4^2 + y4*x1*x2^2*x3^3 - y3*x1*x2^2*x4^3 - y2*x1*x3^3*x4^2 + y2*x1*x3^2*x4^3 + y1*x2^3*x3^2*x4 - y1*x2^3*x3*x4^2 - y1*x2^2*x3^3*x4 + y1*x2^2*x3*x4^3 + y1*x2*x3^3*x4^2 - y1*x2*x3^2*x4^3)/((x1 - x2)*(x1*x2 - x1*x3 - x2*x3 + x3^2)*(x1*x4^2 + x2*x4^2 + x3*x4^2 - x4^3 + x1*x2*x3 - x1*x2*x4 - x1*x3*x4 - x2*x3*x4))
 
collect(c)
 
ans =
 
                                                                                                    ((x2*y3 - x3*y2 - x2*y4 + x4*y2 + x3*y4 - x4*y3)*x1^2 + (x3^2*y2 - x2^2*y3 + x2^2*y4 - x4^2*y2 - x3^2*y4 + x4^2*y3)*x1 + x2^2*x3*y1 - x2*x3^2*y1 + x2*x4^2*y1 - x2^2*x4*y1 - x3*x4^2*y1 + x3^2*x4*y1 + x2*x3^2*y4 - x2*x4^2*y3 + x3*x4^2*y2 - x2^2*x3*y4 + x2^2*x4*y3 - x3^2*x4*y2)/((x2^2*x3 - x2^2*x4 - x2*x3^2 + x2*x4^2 + x3^2*x4 - x3*x4^2)*x1^3 + (- x2^3*x3 + x2^3*x4 + x2*x3^3 - x2*x4^3 - x3^3*x4 + x3*x4^3)*x1^2 + (x2^3*x3^2 - x2^3*x4^2 - x2^2*x3^3 + x2^2*x4^3 + x3^3*x4^2 - x3^2*x4^3)*x1 - x2^3*x3^2*x4 + x2^3*x3*x4^2 + x2^2*x3^3*x4 - x2^2*x3*x4^3 - x2*x3^3*x4^2 + x2*x3^2*x4^3)
                                                                                                  ((x2*y3 - x3*y2 - x2*y4 + x4*y2 + x3*y4 - x4*y3)*x1^3 + (x3^3*y2 - x2^3*y3 + x2^3*y4 - x4^3*y2 - x3^3*y4 + x4^3*y3)*x1 + x2^3*x3*y1 - x2*x3^3*y1 + x2*x4^3*y1 - x2^3*x4*y1 - x3*x4^3*y1 + x3^3*x4*y1 + x2*x3^3*y4 - x2*x4^3*y3 + x3*x4^3*y2 - x2^3*x3*y4 + x2^3*x4*y3 - x3^3*x4*y2)/((- x2^2*x3 + x2^2*x4 + x2*x3^2 - x2*x4^2 - x3^2*x4 + x3*x4^2)*x1^3 + (x2^3*x3 - x2^3*x4 - x2*x3^3 + x2*x4^3 + x3^3*x4 - x3*x4^3)*x1^2 + (- x2^3*x3^2 + x2^3*x4^2 + x2^2*x3^3 - x2^2*x4^3 - x3^3*x4^2 + x3^2*x4^3)*x1 + x2^3*x3^2*x4 - x2^3*x3*x4^2 - x2^2*x3^3*x4 + x2^2*x3*x4^3 + x2*x3^3*x4^2 - x2*x3^2*x4^3)
                                                              ((x2^2*y3 - x3^2*y2 - x2^2*y4 + x4^2*y2 + x3^2*y4 - x4^2*y3)*x1^3 + (x3^3*y2 - x2^3*y3 + x2^3*y4 - x4^3*y2 - x3^3*y4 + x4^3*y3)*x1^2 + x2^3*x3^2*y1 - x2^2*x3^3*y1 + x2^2*x4^3*y1 - x2^3*x4^2*y1 - x3^2*x4^3*y1 + x3^3*x4^2*y1 + x2^2*x3^3*y4 - x2^2*x4^3*y3 - x2^3*x3^2*y4 + x2^3*x4^2*y3 + x3^2*x4^3*y2 - x3^3*x4^2*y2)/((x2^2*x3 - x2^2*x4 - x2*x3^2 + x2*x4^2 + x3^2*x4 - x3*x4^2)*x1^3 + (- x2^3*x3 + x2^3*x4 + x2*x3^3 - x2*x4^3 - x3^3*x4 + x3*x4^3)*x1^2 + (x2^3*x3^2 - x2^3*x4^2 - x2^2*x3^3 + x2^2*x4^3 + x3^3*x4^2 - x3^2*x4^3)*x1 - x2^3*x3^2*x4 + x2^3*x3*x4^2 + x2^2*x3^3*x4 - x2^2*x3*x4^3 - x2*x3^3*x4^2 + x2*x3^2*x4^3)
 ((y4*x2^2*x3 - y3*x2^2*x4 - y4*x2*x3^2 + y3*x2*x4^2 + y2*x3^2*x4 - y2*x3*x4^2)*x1^3 + (- y4*x2^3*x3 + y3*x2^3*x4 + y4*x2*x3^3 - y3*x2*x4^3 - y2*x3^3*x4 + y2*x3*x4^3)*x1^2 + (y4*x2^3*x3^2 - y3*x2^3*x4^2 - y4*x2^2*x3^3 + y3*x2^2*x4^3 + y2*x3^3*x4^2 - y2*x3^2*x4^3)*x1 - y1*x2^3*x3^2*x4 + y1*x2^3*x3*x4^2 + y1*x2^2*x3^3*x4 - y1*x2^2*x3*x4^3 - y1*x2*x3^3*x4^2 + y1*x2*x3^2*x4^3)/((x2^2*x3 - x2^2*x4 - x2*x3^2 + x2*x4^2 + x3^2*x4 - x3*x4^2)*x1^3 + (- x2^3*x3 + x2^3*x4 + x2*x3^3 - x2*x4^3 - x3^3*x4 + x3*x4^3)*x1^2 + (x2^3*x3^2 - x2^3*x4^2 - x2^2*x3^3 + x2^2*x4^3 + x3^3*x4^2 - x3^2*x4^3)*x1 - x2^3*x3^2*x4 + x2^3*x3*x4^2 + x2^2*x3^3*x4 - x2^2*x3*x4^3 - x2*x3^3*x4^2 + x2*x3^2*x4^3)
 
factor(c)
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('sym/factor', 'C:\Program Files\MATLAB\R2016b\toolbox\symbolic\symbolic\@sym\factor.m', 50)" style="font-weight:bold">sym/factor</a> (<a href="matlab: opentoline('C:\Program Files\MATLAB\R2016b\toolbox\symbolic\symbolic\@sym\factor.m',50,0)">line 50</a>)
The first argument must be a scalar.
} 
factor(c(3))
 
ans =
 
[ x1^2*x3^3*y2 - x1^2*x2^3*y3 + x1^3*x2^2*y3 - x1^3*x3^2*y2 - x2^2*x3^3*y1 + x2^3*x3^2*y1 + x1^2*x2^3*y4 - x1^2*x4^3*y2 - x1^3*x2^2*y4 + x1^3*x4^2*y2 + x2^2*x4^3*y1 - x2^3*x4^2*y1 - x1^2*x3^3*y4 + x1^2*x4^3*y3 + x1^3*x3^2*y4 - x1^3*x4^2*y3 - x3^2*x4^3*y1 + x3^3*x4^2*y1 + x2^2*x3^3*y4 - x2^2*x4^3*y3 - x2^3*x3^2*y4 + x2^3*x4^2*y3 + x3^2*x4^3*y2 - x3^3*x4^2*y2, 1/(x1 - x2), 1/(x2 - x3), 1/(x1 - x3), 1/(x3 - x4), 1/(x2 - x4), 1/(x1 - x4)]
 
open polyinterp
x = 0:3;
y = [-5 -6 -1 16];
x

x =

     0     1     2     3

y

y =

    -5    -6    -1    16

u = -.25:.01:3.25;
v = polyinterp(x,y,u);
plot(x,y,'o',u,v,'-')
[Warning: MATLAB has disabled some advanced graphics rendering features by
switching to software OpenGL. For more information, click <a href="matlab:opengl('problems')">here</a>.] 
plot(x,y,'o',u,v,'.-')
plot(x,y,'o',u,v,'.')
x=sym('x',[4 1])
 
x =
 
 x1
 x2
 x3
 x4
 
y=sym('y',[4 1])
 
y =
 
 y1
 y2
 y3
 y4
 
syms u
polyinterp(x,y,u)
 
ans =
 
(y1*(u - x2)*(u - x3)*(u - x4))/((x1 - x2)*(x1 - x3)*(x1 - x4)) - (y2*(u - x1)*(u - x3)*(u - x4))/((x1 - x2)*(x2 - x3)*(x2 - x4)) + (y3*(u - x1)*(u - x2)*(u - x4))/((x1 - x3)*(x2 - x3)*(x3 - x4)) - (y4*(u - x1)*(u - x2)*(u - x3))/((x1 - x4)*(x2 - x4)*(x3 - x4))
 
open piecelin
L=piecelin(x,y,u)
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('symengine')" style="font-weight:bold">symengine</a>
Cannot prove 'x2 <= u' literally. To test the statement mathematically, use
isAlways.

Error in <a href="matlab:matlab.internal.language.introspective.errorDocCallback('sym/subsindex', 'C:\Program Files\MATLAB\R2016b\toolbox\symbolic\symbolic\@sym\sym.m', 765)" style="font-weight:bold">sym/subsindex</a> (<a href="matlab: opentoline('C:\Program Files\MATLAB\R2016b\toolbox\symbolic\symbolic\@sym\sym.m',765,0)">line 765</a>)
                X = find(mupadmex('symobj::logical',A.s,9)) - 1;

Error in <a href="matlab:matlab.internal.language.introspective.errorDocCallback('piecelin', '\\laboratori\corsi\SMFN\Destri\Moler\ncm_2014\piecelin.m', 18)" style="font-weight:bold">piecelin</a> (<a href="matlab: opentoline('\\laboratori\corsi\SMFN\Destri\Moler\ncm_2014\piecelin.m',18,0)">line 18</a>)
      k(x(j) <= u) = j;
} 
opentoline('\\laboratori\corsi\SMFN\Destri\Moler\ncm_2014\piecelin.m',18,0)
interpgui
interpgui(20)
help interp1
 <strong>interp1</strong> 1-D interpolation (table lookup)
 
    Vq = <strong>interp1</strong>(X,V,Xq) interpolates to find Vq, the values of the
    underlying function V=F(X) at the query points Xq. 
 
    X must be a vector. The length of X is equal to N.
    If V is a vector, V must have length N, and Vq is the same size as Xq.
    If V is an array of size [N,D1,D2,...,Dk], then the interpolation is
    performed for each D1-by-D2-by-...-Dk value in V(i,:,:,...,:). If Xq
    is a vector of length M, then Vq has size [M,D1,D2,...,Dk]. If Xq is 
    an array of size [M1,M2,...,Mj], then Vq is of size
    [M1,M2,...,Mj,D1,D2,...,Dk].
 
    Vq = <strong>interp1</strong>(V,Xq) assumes X = 1:N, where N is LENGTH(V)
    for vector V or SIZE(V,1) for array V.
 
    Interpolation is the same operation as "table lookup".  Described in
    "table lookup" terms, the "table" is [X,V] and <strong>interp1</strong> "looks-up"
    the elements of Xq in X, and, based upon their location, returns
    values Vq interpolated within the elements of V.
 
    Vq = <strong>interp1</strong>(X,V,Xq,METHOD) specifies the interpolation method.
    The available methods are:
 
      'linear'   - (default) linear interpolation
      'nearest'  - nearest neighbor interpolation
      'next'     - next neighbor interpolation
      'previous' - previous neighbor interpolation
      'spline'   - piecewise cubic spline interpolation (SPLINE)
      'pchip'    - shape-preserving piecewise cubic interpolation
      'cubic'    - same as 'pchip'
      'v5cubic'  - the cubic interpolation from MATLAB 5, which does not
                   extrapolate and uses 'spline' if X is not equally
                   spaced.
 
    Vq = <strong>interp1</strong>(X,V,Xq,METHOD,'extrap') uses the interpolation algorithm
    specified by METHOD to perform extrapolation for elements of Xq outside
    the interval spanned by X.
 
    Vq = <strong>interp1</strong>(X,V,Xq,METHOD,EXTRAPVAL) replaces the values outside of the
    interval spanned by X with EXTRAPVAL.  NaN and 0 are often used for
    EXTRAPVAL.  The default extrapolation behavior with four input arguments
    is 'extrap' for 'spline' and 'pchip' and EXTRAPVAL = NaN (NaN +NaNi for 
    complex values) for the other methods.
 
    PP = <strong>interp1</strong>(X,V,METHOD,'pp') is not recommended. Use griddedInterpolant
    instead.
    PP = <strong>interp1</strong>(X,V,METHOD,'pp') uses the interpolation algorithm specified
    by METHOD to generate the ppform (piecewise polynomial form) of V. The
    method may be any of the above METHOD except for 'v5cubic'. PP may then
    be evaluated via PPVAL. PPVAL(PP,Xq) is the same as
    <strong>interp1</strong>(X,V,Xq,METHOD,'extrap').
 
    For example, generate a coarse sine curve and interpolate over a
    finer abscissa:
        X = 0:10; V = sin(X); Xq = 0:.25:10;
        Vq = interp1(X,V,Xq); plot(X,V,'o',Xq,Vq,':.')
 
    For a multi-dimensional example, we construct a table of functional
    values:
        X = [1:10]'; V = [ X.^2, X.^3, X.^4 ];
        Xq = [ 1.5, 1.75; 7.5, 7.75]; Vq = interp1(X,V,Xq);
 
    creates 2-by-2 matrices of interpolated function values, one matrix for
    each of the 3 functions. Vq will be of size 2-by-2-by-3.
 
    Class support for inputs X, V, Xq, EXTRAPVAL:
       float: double, single
 
    See also <a href="matlab:help interpft">interpft</a>, <a href="matlab:help spline">spline</a>, <a href="matlab:help pchip">pchip</a>, <a href="matlab:help interp2">interp2</a>, <a href="matlab:help interp3">interp3</a>, <a href="matlab:help interpn">interpn</a>, <a href="matlab:help ppval">ppval</a>.

    <a href="matlab:doc interp1">Reference page for interp1</a>
    <a href="matlab:matlab.internal.language.introspective.overloads.displayOverloads('interp1')">Other functions named interp1</a>

doc interp1
open interp1
help griddeinterpolant
--- help for <strong>griddedInterpolant</strong> ---

 <strong>griddedInterpolant</strong>   Gridded data interpolant
    F = <strong>griddedInterpolant</strong> creates an empty gridded data interpolant.
 
    F = <strong>griddedInterpolant</strong>(x,v) creates a 1-D interpolant F from a vector
    of sample points x and a vector of values v. F satisfies v = F(x).
 
    F = <strong>griddedInterpolant</strong>(X1,X2,...,Xn,V) creates an N-D interpolant using
    a grid of sample points specified by n N-D arrays Xi created from grid
    vectors xig using [X1,X2,...,Xn] = NDGRID(x1g,x2g,...,xng). V must have
    the same size as the Xi arrays. F satisfies V = F(X1,X2,...,Xn).
 
    F = <strong>griddedInterpolant</strong>({x1g,x2g,...,xng},V) specifies a grid in compact
    form using grid vectors xig. LENGTH(xig) must equal SIZE(V,i). Use this
    syntax to conserve memory when the sample points form a large grid.
    The interpolant F satisfies V = F({x1g,x2g,...,xng}).
 
    F = <strong>griddedInterpolant</strong>(V) uses an implicit grid formed by the grid
    vectors xig = [1 2 3 ... SIZE(V,i)] and the corresponding values V.
 
    F = <strong>griddedInterpolant</strong>(...,METHOD) specifies the interpolation method:
      'linear'   - (default) linear, bilinear, trilinear,... interpolation
      'nearest'  - nearest neighbor interpolation
      'next'     - next neighbor interpolation (1-D only)
      'previous' - previous neighbor interpolation (1-D only)
      'spline'   - spline interpolation
      'pchip'    - shape-preserving piecewise cubic interpolation (1-D only)
      'cubic'    - cubic, bicubic, tricubic,... for uniformly spaced data only
 
    F = <strong>griddedInterpolant</strong>(...,METHOD,EXTRAPOLATIONMETHOD) also specifies
    the extrapolation method. EXTRAPOLATIONMETHOD has the same options as
    METHOD in addition to the following:
      'none'     - Removes support for extrapolation; queries outside the
                   domain of the grid return NaN.
    If EXTRAPOLATIONMETHOD is not specified, EXTRAPOLATIONMETHOD = METHOD.
 
    Example:
      % Construct a 2-D <strong>griddedInterpolant</strong> F from gridded data X,Y,V
        [X,Y] = ndgrid(1:20,1:20);
        V = (X-5).^2 + Y.^2;
        F = <strong>griddedInterpolant</strong>(X,Y,V)
      % Evaluate F at gridded query points Xq_gridded,Yq_gridded
        [Xq_gridded,Yq_gridded] = ndgrid(1.5:1:19.5,1.5:1:19.5);
        Vq = F(Xq_gridded,Yq_gridded);
      % Plot the gridded data X,Y,V and the interpolated values Vq
        mesh(X,Y,V,'Marker','.','EdgeColor','b'), hold on
        plot3(Xq_gridded(:),Yq_gridded(:),Vq(:),'r.')
        legend('gridded sample data','gridded queries','location','best')
      % Evaluate F at scattered query points and plot the interpolation result
        xyq = 2 + 18*gallery('uniformdata',[400 2],0);
        xq_scattered = xyq(:,1);
        yq_scattered = xyq(:,2);
        vq_scattered = F(xq_scattered,yq_scattered);
        figure
        mesh(X,Y,V,'Marker','.','EdgeColor','b'), hold on
        plot3(xq_scattered,yq_scattered,vq_scattered,'r.')
        legend('gridded sample data','scattered queries','location','best')
 
    Example:
      % Construct a 1-D <strong>griddedInterpolant</strong> F
        x = 1:10;
        v = exp(-0.1*x).*sin(2*x);
        F = <strong>griddedInterpolant</strong>(x,v)
      % Perform linear interpolation at query points xq
        xq = 1:0.1:10;
        vq_linear = F(xq);
      % Change the interpolation method to spline
        F.Method = 'spline'
      % Perform spline interpolation at the same query points xq
        vq_spline = F(xq);
      % Plot the linear and spline interpolation results
        plot(x,v,'o',xq,vq_linear,':.',xq,vq_spline,':.')
        legend('sample data','linear interpolation','spline interpolation')
 
    <strong>griddedInterpolant</strong> properties:
        <a href="matlab:help griddedInterpolant/GridVectors">GridVectors</a>         - Cell array with grid vectors of sample points
        <a href="matlab:help griddedInterpolant/Values">Values</a>              - Values associated with each grid point
        <a href="matlab:help griddedInterpolant/Method">Method</a>              - Method used to interpolate at query points
        <a href="matlab:help griddedInterpolant/ExtrapolationMethod">ExtrapolationMethod</a> - Extrapolation method used outside the grid
 
    <strong>griddedInterpolant</strong> methods:
        vq = F(Xq) evaluates the <strong>griddedInterpolant</strong> F at scattered query
        points Xq and returns a column vector of interpolated values vq.
        Each row of Xq contains the coodinates of one query point.
 
        vq = F(xq1,xq2,...,xqn) also allows the scattered query points to
        be specified as column vectors of coordinates.
 
        Vq = F(Xq1,Xq2,...,Xqn) evaluates F at gridded query points
        specified in full grid format as n N-D arrays Xqi created from grid
        vectors xqig using [Xq1,Xq2,...,Xqn] = NDGRID(xq1g,xq2g,...,xqng).
 
        Vq = F({xq1g,xq2g,...,xqng}) also allows a grid of query points to
        be specified in compact form as grid vectors xqig. Use this syntax
        to conserve memory when the query points form a large grid. The
        array of interpolated values Vq has the same size as the grid:
        LENGTH(xq1g)-by-LENGTH(xq2g)-by-...-by-LENGTH(xqng).
 
     See also <a href="matlab:help scatteredInterpolant">scatteredInterpolant</a>, <a href="matlab:help ndgrid">ndgrid</a>, <a href="matlab:help interp1">interp1</a>, <a href="matlab:help interp2">interp2</a>, <a href="matlab:help interp3">interp3</a>, <a href="matlab:help interpn">interpn</a>

    <a href="matlab:doc griddedInterpolant">Reference page for griddedInterpolant</a>

doc griddedInterpolant
open vandal
vandal(4)
/          2    3 \
| 1, x1, x1 , x1  |
|                 |
|          2    3 |
| 1, x2, x2 , x2  |
|                 |
|          2    3 |
| 1, x3, x3 , x3  |
|                 |
|          2    3 |
\ 1, x4, x4 , x4  /

 
ans =
 
(x1 - x2)*(x1 - x3)*(x1 - x4)*(x2 - x3)*(x2 - x4)*(x3 - x4)
 
x=sym('x',[4 1])
 
x =
 
 x1
 x2
 x3
 x4
 
vandal(4)
<a href="matlab: opentoline('\\laboratori\corsi\SMFN\Destri\Moler\ncm_2014\vandal.m',11,1)">11  </a>for i = 1:n
x
 
x =
 
 1
 1
 1
 1
 
dbstep
<a href="matlab: opentoline('\\laboratori\corsi\SMFN\Destri\Moler\ncm_2014\vandal.m',12,1)">12  </a>   x(i) = sym(['x' int2str(i)]);
dbstep
<a href="matlab: opentoline('\\laboratori\corsi\SMFN\Destri\Moler\ncm_2014\vandal.m',13,1)">13  </a>end
dbstep
<a href="matlab: opentoline('\\laboratori\corsi\SMFN\Destri\Moler\ncm_2014\vandal.m',12,1)">12  </a>   x(i) = sym(['x' int2str(i)]);
dbstep
<a href="matlab: opentoline('\\laboratori\corsi\SMFN\Destri\Moler\ncm_2014\vandal.m',13,1)">13  </a>end
dbstep
<a href="matlab: opentoline('\\laboratori\corsi\SMFN\Destri\Moler\ncm_2014\vandal.m',12,1)">12  </a>   x(i) = sym(['x' int2str(i)]);
dbstep
<a href="matlab: opentoline('\\laboratori\corsi\SMFN\Destri\Moler\ncm_2014\vandal.m',13,1)">13  </a>end
dbstep
<a href="matlab: opentoline('\\laboratori\corsi\SMFN\Destri\Moler\ncm_2014\vandal.m',12,1)">12  </a>   x(i) = sym(['x' int2str(i)]);
dbstep
<a href="matlab: opentoline('\\laboratori\corsi\SMFN\Destri\Moler\ncm_2014\vandal.m',13,1)">13  </a>end
dbstep
<a href="matlab: opentoline('\\laboratori\corsi\SMFN\Destri\Moler\ncm_2014\vandal.m',15,1)">15  </a>V = sym(ones(n,n));
x
 
x =
 
 x1
 x2
 x3
 x4
 
if system_dependent('IsDebugMode')==1, dbcont; end
/          2    3 \
| 1, x1, x1 , x1  |
|                 |
|          2    3 |
| 1, x2, x2 , x2  |
|                 |
|          2    3 |
| 1, x3, x3 , x3  |
|                 |
|          2    3 |
\ 1, x4, x4 , x4  /

if system_dependent('IsDebugMode')==1, dbstep; end
if system_dependent('IsDebugMode')==1, dbstep; end
if system_dependent('IsDebugMode')==1, dbstep; end
if system_dependent('IsDebugMode')==1, dbstep; end
V
 
V =
 
[ 1,      x1,        x1^2,        x1^3]
[ 0, x2 - x1, x2^2 - x1^2, x2^3 - x1^3]
[ 1,      x3,        x3^2,        x3^3]
[ 1,      x4,        x4^2,        x4^3]
 
dbcont
 
ans =
 
(x1 - x2)*(x1 - x3)*(x1 - x4)*(x2 - x3)*(x2 - x4)*(x3 - x4)
 
x
 
x =
 
 x1
 x2
 x3
 x4
 
det(vander(x))
 
ans =
 
x1^3*x2^2*x3 - x1^3*x2^2*x4 - x1^3*x2*x3^2 + x1^3*x2*x4^2 + x1^3*x3^2*x4 - x1^3*x3*x4^2 - x1^2*x2^3*x3 + x1^2*x2^3*x4 + x1^2*x2*x3^3 - x1^2*x2*x4^3 - x1^2*x3^3*x4 + x1^2*x3*x4^3 + x1*x2^3*x3^2 - x1*x2^3*x4^2 - x1*x2^2*x3^3 + x1*x2^2*x4^3 + x1*x3^3*x4^2 - x1*x3^2*x4^3 - x2^3*x3^2*x4 + x2^3*x3*x4^2 + x2^2*x3^3*x4 - x2^2*x3*x4^3 - x2*x3^3*x4^2 + x2*x3^2*x4^3
 
factor(ans)
 
ans =
 
[ x3 - x4, x2 - x4, x2 - x3, x1 - x4, x1 - x3, x1 - x2]
 
cheby5
 
phi =
 
5^(1/2)/2 + 1/2
 
 
T =
 
 16*x^5 - 20*x^3 + 5*x
 16*x^5 - 20*x^3 + 5*x
 16*x^5 - 20*x^3 + 5*x
 16*x^5 - 20*x^3 + 5*x
 16*x^5 - 20*x^3 + 5*x
 16*x^5 - 20*x^3 + 5*x
 16*x^5 - 20*x^3 + 5*x
 

phi =

    1.6180


err =

   1.8319e-15

syms x
chebyshevT(x,5)
 
ans =
 
chebyshevT(x, 5)
 
y=chebyshevT(x,5)
 
y =
 
chebyshevT(x, 5)
 
sym2poly(y)
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('sym/sym2poly', 'C:\Program Files\MATLAB\R2016b\toolbox\symbolic\symbolic\@sym\sym2poly.m', 29)" style="font-weight:bold">sym/sym2poly</a> (<a href="matlab: opentoline('C:\Program Files\MATLAB\R2016b\toolbox\symbolic\symbolic\@sym\sym2poly.m',29,0)">line 29</a>)
Not a polynomial.
} 
y=chebyshevT(5,x)
 
y =
 
16*x^5 - 20*x^3 + 5*x
 
y=chebyshevT(15,x)
 
y =
 
16384*x^15 - 61440*x^13 + 92160*x^11 - 70400*x^9 + 28800*x^7 - 6048*x^5 + 560*x^3 - 15*x
 
ezplot(y,[-1 1])
ezplot(chebyshevT(40,x),[0 1])
ezplot(chebyshevT(40,x),[-1 1])
rungeinterp
myrungeinterp
pi/4

ans =

    0.7854

f=@(x)x.^2

f =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)x.^2

ezplot(f,[0 4])
hold
Current plot held
z=linspace(0,4,1e3);
plot(x,inverse(f,x))
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('griddedInterpolant/subsref')" style="font-weight:bold">griddedInterpolant/subsref</a>
Invalid arguments specified in evaluating the interpolant.

Error in <a href="matlab:matlab.internal.language.introspective.errorDocCallback('interp1', 'C:\Program Files\MATLAB\R2016b\toolbox\matlab\polyfun\interp1.p', 162)" style="font-weight:bold">interp1</a> (<a href="matlab: opentoline('C:\Program Files\MATLAB\R2016b\toolbox\matlab\polyfun\interp1.p',162,0)">line 162</a>)
        VqLite = F(Xqcol);

Error in <a href="matlab:matlab.internal.language.introspective.errorDocCallback('inverse', 'C:\Users\claudio.destri\Documents\MATLAB\inverse.m', 14)" style="font-weight:bold">inverse</a> (<a href="matlab: opentoline('C:\Users\claudio.destri\Documents\MATLAB\inverse.m',14,0)">line 14</a>)
x = interp1(y0,x0,y,'pchip');
} 
which inverse
C:\Users\claudio.destri\Documents\MATLAB\inverse.m
plot(x,inverse(f,z))
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('plot')" style="font-weight:bold">plot</a>
Data must be numeric, datetime, duration or an array convertible to double.
} 
plot(z,inverse(f,z))
hold
Current plot released
plot(z,inverse(f,z))
z=linspace(0,1,1e3);
plot(z,inverse(f,z))
hold
Current plot held
plot(z,f(z))
f=@(x)x.^2*exp(x)

f =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)x.^2*exp(x)

hold
Current plot released
plot(z,f(z))
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('mtimes')" style="font-weight:bold"> * </a>
Inner matrix dimensions must agree.

Error in <a href="matlab:matlab.internal.language.introspective.errorDocCallback('@(x)x.^2*exp(x)')" style="font-weight:bold">@(x)x.^2*exp(x)</a>
} 
f=@(x)x.^2.*exp(x)

f =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)x.^2.*exp(x)

plot(z,f(z))
plot(z,inverse(f,z))
plot(z,f(z))
hold
Current plot held
plot(z,inverse(f,z))
z=linspace(0,exp(1),1e3);
plot(z,inverse(f,z))
plot(z,inverse(f,z))
exit
