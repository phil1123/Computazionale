%-- 30/11/2017 09:52 --%
(1/7)*21

ans =

     3

1/7

ans =

    0.1429

ans*21

ans =

     3

format long
1/7

ans =

   0.142857142857143

vpa(sym(1/7))
 
ans =
 
0.14285714285714285714285714285714
 
vpa(sym(1/7),6)
 
ans =
 
0.142857
 
ans*21
 
ans =
 
2.9999999999999893418589635984972
 
0.142857*21

ans =

   2.999997000000001


A=randn(10)

A =

  Columns 1 through 3

  -0.070837213160480  -0.691159125382991  -0.504586405514010
  -2.486283920703279   0.449377623166851  -1.270594449808660
   0.581172322675923   0.100633350315076  -0.382584802707648
  -2.192434919965905   0.826069998469923   0.648679262048621
  -2.319280306643302   0.536157079925919   0.825727149241758
   0.079933710298440   0.897888425985076  -1.014943642680138
  -0.948480983570505  -0.131937867924581  -0.471069912683167
   0.411490621423374  -0.147201456151267   0.137024874130050
   0.676977805684030   1.007773405305439  -0.291863375753573
   0.857732545205355  -2.123655462415750   0.301818555261006

  Columns 4 through 6

   0.399930942955802  -0.560664996528185   1.576300146546075
  -0.929961558940129   2.177778709184154  -0.480937151778845
  -0.176830265929232   1.138465387329595   0.327512120829686
  -2.132094599161535  -2.496886503184502   0.664734120627595
   1.145361710518474   0.441326931727609   0.085188592721160
  -0.629090760994156  -1.398137875811074   0.880952785381048
  -1.203849974002218  -0.255055179880806   0.323213137847597
  -0.253944683422812   0.164404073318729  -0.784146183664088
  -1.428646864632098   0.747734028808123  -1.805373351386090
  -0.020857617701600  -0.273046949402907   1.858592948555705

  Columns 7 through 9

  -0.604530088774459   0.308623139948530  -0.904654059246837
   0.103359722310648  -0.233860042129153  -0.288256361205696
   0.563166955145978  -1.056972745960131   0.350062757534178
   0.113596996734002  -0.284140954626164  -1.835859142504305
  -0.904726212798032  -0.086690282459305   1.035975908245481
  -0.467714582451856  -1.469395074486357   2.424461144939365
  -0.124889947223107   0.192182244870785   0.959400509407976
   1.478958491504030  -0.822293276290175  -0.315771995009409
  -0.860815690006961  -0.094240587959724   0.428622679859396
   0.784668467287821   0.336213340954240  -1.035984778513393

  Column 10

   1.877865460495858
   0.940704403352132
   0.787345779935246
  -0.875874261956672
   0.319949134382331
  -0.558294284850904
  -0.311429418546895
  -0.570009916642186
  -1.025733615628713
  -0.908745586874325

A=randn(10,1)

A =

  -0.209897334055591
  -1.698864084172610
   0.607600575846084
  -0.117798289267962
   0.699160333644167
   0.269648641716598
   0.494287055379411
  -1.483121022515899
  -1.020264385682965
  -0.446995010744528

A=randn(10);
b=randn(10,1)

b =

   0.439952188872440
   0.101662443700341
   2.787335227813435
  -1.166665030194641
  -1.854299082689694
  -1.140681144669632
  -1.093343456239605
  -0.433609296474824
  -0.168469878275448
  -0.218533560026581

A\b

ans =

  -0.523820127770103
   0.956446589441460
  -0.237262527659035
   0.646180998658607
   0.220952333674141
   0.079826819924665
   0.397825316622069
  -1.125203155695645
   0.315749953327440
  -1.917790447497712

lugui
m=magic(5)

m =

    17    24     1     8    15
    23     5     7    14    16
     4     6    13    20    22
    10    12    19    21     3
    11    18    25     2     9

p=randperm(5)

p =

     1     2     3     4     5

m(p,:)

ans =

    17    24     1     8    15
    23     5     7    14    16
     4     6    13    20    22
    10    12    19    21     3
    11    18    25     2     9

m

m =

    17    24     1     8    15
    23     5     7    14    16
     4     6    13    20    22
    10    12    19    21     3
    11    18    25     2     9

id=eye(5)

id =

     1     0     0     0     0
     0     1     0     0     0
     0     0     1     0     0
     0     0     0     1     0
     0     0     0     0     1

id(p,:)

ans =

     1     0     0     0     0
     0     1     0     0     0
     0     0     1     0     0
     0     0     0     1     0
     0     0     0     0     1

id(p,:)*m-m(p,:)

ans =

     0     0     0     0     0
     0     0     0     0     0
     0     0     0     0     0
     0     0     0     0     0
     0     0     0     0     0

edit
U=magic(7);
b=(1:7)'

b =

     1
     2
     3
     4
     5
     6
     7

n=7;
m=magic(7);
open lu
help lu
 <strong>lu</strong>     <strong>lu</strong> factorization.
    [L,U] = <strong>lu</strong>(A) stores an upper triangular matrix in U and a
    "psychologically lower triangular matrix" (i.e. a product of lower
    triangular and permutation matrices) in L, so that A = L*U. A can be
    rectangular.
 
    [L,U,P] = <strong>lu</strong>(A) returns unit lower triangular matrix L, upper
    triangular matrix U, and permutation matrix P so that P*A = L*U.
 
    [L,U,p] = <strong>lu</strong>(A,'vector') returns the permutation information as a
    vector instead of a matrix.  That is, p is a row vector such that
    A(p,:) = L*U.  Similarly, [L,U,P] = <strong>lu</strong>(A,'matrix') returns a
    permutation matrix P.  This is the default behavior.
 
    Y = <strong>lu</strong>(A) returns the output from LAPACK'S DGETRF or ZGETRF routine if
    A is full. If A is sparse, Y contains the strict lower triangle of L
    embedded in the same matrix as the upper triangle of U. In both full
    and sparse cases, the permutation information is lost.
 
    [L,U,P,Q] = <strong>lu</strong>(A) returns unit lower triangular matrix L, upper
    triangular matrix U, a permutation matrix P and a column reordering
    matrix Q so that P*A*Q = L*U for sparse non-empty A. This uses UMFPACK
    and is significantly more time and memory efficient than the other
    syntaxes, even when used with COLAMD.
 
    [L,U,p,q] = <strong>lu</strong>(A,'vector') returns two row vectors p and q so that
    A(p,q) = L*U.  Using 'matrix' in place of 'vector' returns permutation
    matrices.
 
    [L,U,P,Q,R] = <strong>lu</strong>(A) returns unit lower triangular matrix L, upper
    triangular matrix U, permutation matrices P and Q, and a diagonal
    scaling matrix R so that P*(R\A)*Q = L*U for sparse non-empty A.
    This uses UMFPACK as well.  Typically, but not always, the row-scaling
    leads to a sparser and more stable factorization.  Note that this
    factorization is the same as that used by sparse MLDIVIDE when
    UMFPACK is used.
 
    [L,U,p,q,R] = <strong>lu</strong>(A,'vector') returns the permutation information in two
    row vectors p and q such that R(:,p)\A(:,q) = L*U.  Using 'matrix'
    in place of 'vector' returns permutation matrices.
 
    [L,U,P] = <strong>lu</strong>(A,THRESH) controls pivoting in sparse matrices, where
    THRESH is a pivot threshold in [0,1].  Pivoting occurs when the
    diagonal entry in a column has magnitude less than THRESH times the
    magnitude of any sub-diagonal entry in that column.  THRESH = 0 forces
    diagonal pivoting.  THRESH = 1 is the default.
 
    [L,U,P,Q,R] = <strong>lu</strong>(A,THRESH) controls pivoting in UMFPACK.  THRESH is a
    one or two element vector which defaults to [0.1 0.001].  If UMFPACK
    selects its unsymmetric pivoting strategy, THRESH(2) is not used. It
    uses its symmetric pivoting strategy if A is square with a mostly
    symmetric nonzero structure and a mostly nonzero diagonal.  For its
    unsymmetric strategy, the sparsest row i which satisfies the criterion
    A(i,j) >= THRESH(1) * max(abs(A(j:m,j))) is selected.  A value of 1.0
    results in conventional partial pivoting. Entries in L have absolute
    value of 1/THRESH(1) or less.  For its symmetric strategy, the diagonal
    is selected using the same test but with THRESH(2) instead.  If the
    diagonal entry fails this test, a pivot entry below the diagonal is
    selected, using THRESH(1). In this case, L has entries with absolute
    value 1/min(THRESH) or less. Smaller values of THRESH(1) and THRESH(2)
    tend to lead to sparser <strong>lu</strong> factors, but the solution can become
    inaccurate.  Larger values can lead to a more accurate solution (but
    not always), and usually an increase in the total work and memory
    usage.
 
    [L,U,p] = <strong>lu</strong>(A,THRESH,'vector') and [L,U,p,q,R] = <strong>lu</strong>(A,THRESH,'vector')
    are also valid for sparse matrices and return permutation vectors.
    Using 'matrix' in place of 'vector' returns permutation matrices.
 
    See also <a href="matlab:help chol">chol</a>, <a href="matlab:help ilu">ilu</a>, <a href="matlab:help qr">qr</a>.

    <a href="matlab:doc lu">Reference page for lu</a>
    <a href="matlab:matlab.internal.language.introspective.overloads.displayOverloads('lu')">Other functions named lu</a>

[L,U]=lu(m)

L =

  Columns 1 through 3

   0.652173913043478   0.834539813857291   1.000000000000000
   0.826086956521739   1.000000000000000                   0
   1.000000000000000                   0                   0
   0.108695652173913   0.317476732161324   0.353452685421995
   0.282608695652174   0.316442605997932   0.509121909633419
   0.456521739130435   0.481902792140641   0.663256606990623
   0.478260869565217   0.669079627714581   0.845865302642796

  Columns 4 through 6

                   0                   0                   0
                   0                   0                   0
                   0                   0                   0
   0.545166844504802   0.885871638770466  -0.038569346339276
   0.666129110485983   1.000000000000000                   0
   0.803969832185469   0.959043179669227   1.000000000000000
   1.000000000000000                   0                   0

  Column 7

                   0
                   0
                   0
   1.000000000000000
                   0
                   0
                   0


U =

  Columns 1 through 3

  46.000000000000000   6.000000000000000   8.000000000000000
                   0  42.043478260869563   0.391304347826087
                   0                   0  42.456049638055838
                   0                   0                   0
                   0                   0                   0
                   0                   0                   0
                   0                   0                   0

  Columns 4 through 6

  17.000000000000000  26.000000000000000  35.000000000000000
  -5.043478260869565  -3.478260869565219  -1.913043478260871
  -5.877973112719753  -4.053774560496379  -2.229576008273007
  49.216027280477412  -4.678601875532823  -2.573231031543052
                   0  40.933262198079341  37.563294208943645
                   0                   0 -44.533599854021880
                   0                   0                   0

  Column 7

  37.000000000000000
  -1.565217391304348
   5.175801447776628
  -1.026427962489343
  -7.912600640217285
   0.843836570840869
  47.247449265612737

formt short
{Undefined function or variable 'formt'.
} 
format short
[L,U]=lu(m)

L =

    0.6522    0.8345    1.0000         0         0         0         0
    0.8261    1.0000         0         0         0         0         0
    1.0000         0         0         0         0         0         0
    0.1087    0.3175    0.3535    0.5452    0.8859   -0.0386    1.0000
    0.2826    0.3164    0.5091    0.6661    1.0000         0         0
    0.4565    0.4819    0.6633    0.8040    0.9590    1.0000         0
    0.4783    0.6691    0.8459    1.0000         0         0         0


U =

   46.0000    6.0000    8.0000   17.0000   26.0000   35.0000   37.0000
         0   42.0435    0.3913   -5.0435   -3.4783   -1.9130   -1.5652
         0         0   42.4560   -5.8780   -4.0538   -2.2296    5.1758
         0         0         0   49.2160   -4.6786   -2.5732   -1.0264
         0         0         0         0   40.9333   37.5633   -7.9126
         0         0         0         0         0  -44.5336    0.8438
         0         0         0         0         0         0   47.2474

[L,U,p]=lu(m)

L =

    1.0000         0         0         0         0         0         0
    0.8261    1.0000         0         0         0         0         0
    0.6522    0.8345    1.0000         0         0         0         0
    0.4783    0.6691    0.8459    1.0000         0         0         0
    0.2826    0.3164    0.5091    0.6661    1.0000         0         0
    0.4565    0.4819    0.6633    0.8040    0.9590    1.0000         0
    0.1087    0.3175    0.3535    0.5452    0.8859   -0.0386    1.0000


U =

   46.0000    6.0000    8.0000   17.0000   26.0000   35.0000   37.0000
         0   42.0435    0.3913   -5.0435   -3.4783   -1.9130   -1.5652
         0         0   42.4560   -5.8780   -4.0538   -2.2296    5.1758
         0         0         0   49.2160   -4.6786   -2.5732   -1.0264
         0         0         0         0   40.9333   37.5633   -7.9126
         0         0         0         0         0  -44.5336    0.8438
         0         0         0         0         0         0   47.2474


p =

     0     0     1     0     0     0     0
     0     1     0     0     0     0     0
     1     0     0     0     0     0     0
     0     0     0     0     0     0     1
     0     0     0     0     1     0     0
     0     0     0     0     0     1     0
     0     0     0     1     0     0     0

[L,U,p]=lu(m,'vector')

L =

    1.0000         0         0         0         0         0         0
    0.8261    1.0000         0         0         0         0         0
    0.6522    0.8345    1.0000         0         0         0         0
    0.4783    0.6691    0.8459    1.0000         0         0         0
    0.2826    0.3164    0.5091    0.6661    1.0000         0         0
    0.4565    0.4819    0.6633    0.8040    0.9590    1.0000         0
    0.1087    0.3175    0.3535    0.5452    0.8859   -0.0386    1.0000


U =

   46.0000    6.0000    8.0000   17.0000   26.0000   35.0000   37.0000
         0   42.0435    0.3913   -5.0435   -3.4783   -1.9130   -1.5652
         0         0   42.4560   -5.8780   -4.0538   -2.2296    5.1758
         0         0         0   49.2160   -4.6786   -2.5732   -1.0264
         0         0         0         0   40.9333   37.5633   -7.9126
         0         0         0         0         0  -44.5336    0.8438
         0         0         0         0         0         0   47.2474


p =

     3     2     1     7     5     6     4

L*U-m(p,:)

ans =

   1.0e-14 *

         0         0         0         0         0         0         0
         0         0         0         0         0         0         0
         0         0   -0.7105         0         0         0         0
         0         0         0         0    0.0888         0         0
   -0.1776         0   -0.3553         0   -0.7105    0.7105    0.1776
         0         0         0         0         0         0    0.1776
         0   -0.1776         0         0         0    0.7105         0

x
 
x =
 
 b1/2 - b2/8 - (23*b3)/32
         b2/4 - (5*b3)/16
                     b3/4
 
4:1

ans =

  1×0 empty <a href="matlab:helpPopup double" style="font-weight:bold">double</a> row vector

1:3:22

ans =

     1     4     7    10    13    16    19    22

7:-1:1

ans =

     7     6     5     4     3     2     1

m=randi(3,3)

m =

     3     3     1
     3     2     3
     2     1     2

m=randi(3,3,1)

m =

     3
     1
     2

m=randi(30,3,1)

m =

    19
     1
    19

m=randi(7,3)

m =

     3     2     2
     1     1     2
     4     2     1

m=m-tril(m)

m =

     0     2     2
     0     0     2
     0     0     0

m=randi(7,3)

m =

     5     5     4
     2     4     1
     4     4     4

m=m-tril(m,-1)

m =

     5     5     4
     0     4     1
     0     0     4

b=sym('b',3,1)
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('sym/assume', 'C:\Program Files\MATLAB\R2016b\toolbox\symbolic\symbolic\@sym\sym.m', 517)" style="font-weight:bold">sym/assume</a> (<a href="matlab: opentoline('C:\Program Files\MATLAB\R2016b\toolbox\symbolic\symbolic\@sym\sym.m',517,0)">line 517</a>)
Expected input to match one of these values:

'integer', 'rational', 'real', 'positive', 'clear'

The input did not match any of the valid values.

Error in <a href="matlab:matlab.internal.language.introspective.errorDocCallback('sym', 'C:\Program Files\MATLAB\R2016b\toolbox\symbolic\symbolic\@sym\sym.m', 205)" style="font-weight:bold">sym</a> (<a href="matlab: opentoline('C:\Program Files\MATLAB\R2016b\toolbox\symbolic\symbolic\@sym\sym.m',205,0)">line 205</a>)
                assume(S, a);

Caused by:
    Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('validatestring>checkString', 'C:\Program Files\MATLAB\R2016b\toolbox\matlab\lang\validatestring.p', 90)" style="font-weight:bold">validatestring>checkString</a> (<a href="matlab: opentoline('C:\Program Files\MATLAB\R2016b\toolbox\matlab\lang\validatestring.p',90,0)">line 90</a>)
    Expected input to be one of these types:

    char, string

    Instead its type was double.
} 
b=sym('b',[3 1])
 
b =
 
 b1
 b2
 b3
 
b=sym('pippo',[3 1])
 
b =
 
 pippo1
 pippo2
 pippo3
 
b=sym('b',[3 1])
 
b =
 
 b1
 b2
 b3
 
b1
{Undefined function or variable 'b1'.
} 
b(1)
 
ans =
 
b1
 
x=sym('x',[3 1])
 
x =
 
 x1
 x2
 x3
 
x=m\b
 
x =
 
 b1/5 - b2/4 - (11*b3)/80
             b2/4 - b3/16
                     b3/4
 
m

m =

     5     5     4
     0     4     1
     0     0     4

bksub(m,b)
 
ans =
 
 b1/5 - b2/4 - (11*b3)/80
             b2/4 - b3/16
                     b3/4
 
b
 
b =
 
 b1
 b2
 b3
 
bksub(m,b)
 
ans =
 
 b1/5 - b2/4 - (11*b3)/80
             b2/4 - b3/16
                     b3/4
 
[1 2]==[1 3]

ans =

  1×2 <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a> array

   1   0

help max
 <strong>max</strong>    Largest component.
    For vectors, <strong>max</strong>(X) is the largest element in X. For matrices,
    <strong>max</strong>(X) is a row vector containing the maximum element from each
    column. For N-D arrays, <strong>max</strong>(X) operates along the first
    non-singleton dimension.
 
    [Y,I] = <strong>max</strong>(X) returns the indices of the maximum values in vector I.
    If the values along the first non-singleton dimension contain more
    than one maximal element, the index of the first one is returned.
 
    <strong>max</strong>(X,Y) returns an array with the largest elements taken from X or Y.
    X and Y must have compatible sizes. In the simplest cases, they can be
    the same size or one can be a scalar. Two inputs have compatible sizes
    if, for every dimension, the dimension sizes of the inputs are either
    the same or one of them is 1.
 
    [Y,I] = <strong>max</strong>(X,[],DIM) operates along the dimension DIM. 
 
    When X is complex, the maximum is computed using the magnitude
    <strong>max</strong>(ABS(X)). In the case of equal magnitude elements, then the phase
    angle <strong>max</strong>(ANGLE(X)) is used.
 
    <strong>max</strong>(...,NANFLAG) specifies how NaN (Not-A-Number) values are treated.
    NANFLAG can be:
    'omitnan'    - Ignores all NaN values and returns the maximum of the 
                   non-NaN elements.  If all elements are NaN, then the
                   first one is returned.
    'includenan' - Returns NaN if there is any NaN value.  The index points
                   to the first NaN element.
    Default is 'omitnan'.
 
    Example: 
        X = [2 8 4; 7 3 9]
        max(X,[],1)
        max(X,[],2)
        max(X,5)
 
    See also <a href="matlab:help min">min</a>, <a href="matlab:help cummax">cummax</a>, <a href="matlab:help median">median</a>, <a href="matlab:help mean">mean</a>, <a href="matlab:help sort">sort</a>.

    <a href="matlab:doc max">Reference page for max</a>
    <a href="matlab:matlab.internal.language.introspective.overloads.displayOverloads('max')">Other functions named max</a>

doc max
m

m =

     5     5     4
     0     4     1
     0     0     4

m(2:3,3)

ans =

     1
     4

m=randi(7,3)

m =

     6     2     3
     7     4     2
     2     5     7

m=randi(7,5)

m =

     1     5     1     6     1
     1     1     7     4     7
     1     7     7     2     3
     2     6     7     3     3
     5     6     7     1     3

[L,U,p]=lutx(m)

L =

    1.0000         0         0         0         0
    0.2000    1.0000         0         0         0
    0.2000   -0.0345    1.0000         0         0
    0.2000    0.6552   -0.7024    1.0000         0
    0.4000    0.6207    0.1250    0.1364    1.0000


U =

    5.0000    6.0000    7.0000    1.0000    3.0000
         0    5.8000    5.6000    1.8000    2.4000
         0         0    5.7931    3.8621    6.4828
         0         0         0    7.3333    3.3810
         0         0         0         0   -0.9610


p =

     5
     3
     2
     1
     4

[L1,U1,p1]=lu(m)

L1 =

    1.0000         0         0         0         0
    0.2000    1.0000         0         0         0
    0.2000   -0.0345    1.0000         0         0
    0.2000    0.6552   -0.7024    1.0000         0
    0.4000    0.6207    0.1250    0.1364    1.0000


U1 =

    5.0000    6.0000    7.0000    1.0000    3.0000
         0    5.8000    5.6000    1.8000    2.4000
         0         0    5.7931    3.8621    6.4828
         0         0         0    7.3333    3.3810
         0         0         0         0   -0.9610


p1 =

     0     0     0     0     1
     0     0     1     0     0
     0     1     0     0     0
     1     0     0     0     0
     0     0     0     1     0

isequal(L,L1)

ans =

  <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a>

   0

L-L1

ans =

   1.0e-15 *

         0         0         0         0         0
         0         0         0         0         0
         0         0         0         0         0
         0         0         0         0         0
         0   -0.1110    0.0833         0         0

U-U1

ans =

   1.0e-15 *

         0         0         0         0         0
         0         0         0         0         0
         0         0         0   -0.4441    0.8882
         0         0         0         0         0
         0         0         0         0   -0.2220

exit
