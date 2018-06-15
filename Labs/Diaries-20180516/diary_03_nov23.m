%-- 23/11/2017 09:42 --%
A=magic(5)

A =

    17    24     1     8    15
    23     5     7    14    16
     4     6    13    20    22
    10    12    19    21     3
    11    18    25     2     9

sum(A)

ans =

    65    65    65    65    65

sum(A,2)

ans =

    65
    65
    65
    65
    65

sum(A')

ans =

    65    65    65    65    65

sum(A')'

ans =

    65
    65
    65
    65
    65

diag(A)

ans =

    17
     5
    13
    21
     9

A

A =

    17    24     1     8    15
    23     5     7    14    16
     4     6    13    20    22
    10    12    19    21     3
    11    18    25     2     9

diag(diag(A))

ans =

    17     0     0     0     0
     0     5     0     0     0
     0     0    13     0     0
     0     0     0    21     0
     0     0     0     0     9

A

A =

    17    24     1     8    15
    23     5     7    14    16
     4     6    13    20    22
    10    12    19    21     3
    11    18    25     2     9

diag(A,1)

ans =

    24
     7
    20
     3

diag(A,2)

ans =

     1
    14
    22

diag(A,5)

ans =

  0×1 empty <a href="matlab:helpPopup double" style="font-weight:bold">double</a> column vector

diag(A,4)

ans =

    15

diag(A)

ans =

    17
     5
    13
    21
     9

sum(diag(A))

ans =

    65

sum(diag(flipud(A)))

ans =

    65

A

A =

    17    24     1     8    15
    23     5     7    14    16
     4     6    13    20    22
    10    12    19    21     3
    11    18    25     2     9

sum(1:25)

ans =

   325

ans/5

ans =

    65

inv(A)

ans =

  Columns 1 through 2

      -0.00493589743589744        0.0511538461538462
        0.0431410256410256       -0.0373076923076923
       -0.0302564102564103       0.00307692307692308
       0.00467948717948719      -0.00653846153846154
       0.00275641025641025                     0.005

  Columns 3 through 4

       -0.0353846153846154       0.00115384615384615
      -0.00461538461538462        0.0126923076923077
       0.00307692307692308       0.00307692307692308
        0.0107692307692308        0.0434615384615384
        0.0415384615384615                    -0.045

  Column 5

        0.0033974358974359
       0.00147435897435898
        0.0364102564102564
       -0.0369871794871795
        0.0110897435897436

format rat
inv(A)

ans =

  Columns 1 through 4

     -77/15600      133/2600       -23/650          3/2600  
      89/2063       -97/2600        -3/650         33/2600  
     -59/1950         1/325          1/325          1/325   
      73/15600      -17/2600         7/650        113/2600  
      43/15600        1/200         27/650         -9/200   

  Column 5

      53/15600 
      23/15600 
      71/1950  
    -577/15600 
      98/8837  

det(A)

ans =

 5070000       

norm(A)

ans =

      65       

A(:)

ans =

      17       
      23       
       4       
      10       
      11       
      24       
       5       
       6       
      12       
      18       
       1       
       7       
      13       
      19       
      25       
       8       
      14       
      20       
      21       
       2       
      15       
      16       
      22       
       3       
       9       

norm(A(:))

ans =

    8325/112   

format longg
norm(A(:))

ans =

          74.3303437365925

norm(A)

ans =

                        65

norm(A,'fro')

ans =

          74.3303437365925

help norm
 <strong>norm</strong>   Matrix or vector norm.
      <strong>norm</strong>(X,2) returns the 2-norm of X.
 
      <strong>norm</strong>(X) is the same as <strong>norm</strong>(X,2).
 
      <strong>norm</strong>(X,1) returns the 1-norm of X.
 
      <strong>norm</strong>(X,Inf) returns the infinity norm of X.
 
      <strong>norm</strong>(X,'fro') returns the Frobenius norm of X.
 
    In addition, for vectors...
 
      <strong>norm</strong>(V,P) returns the p-norm of V defined as SUM(ABS(V).^P)^(1/P).
 
      <strong>norm</strong>(V,Inf) returns the largest element of ABS(V).
 
      <strong>norm</strong>(V,-Inf) returns the smallest element of ABS(V).
 
    By convention, NaN is returned if X or V contains NaNs.
 
    See also <a href="matlab:help cond">cond</a>, <a href="matlab:help rcond">rcond</a>, <a href="matlab:help condest">condest</a>, <a href="matlab:help normest">normest</a>, <a href="matlab:help hypot">hypot</a>.

    <a href="matlab:doc norm">Reference page for norm</a>
    <a href="matlab:matlab.internal.language.introspective.overloads.displayOverloads('norm')">Other functions named norm</a>

norm(A(:),2)

ans =

          74.3303437365925

norm(A,2)

ans =

                        65

norm(A(:,1))

ans =

          32.4807635378234

norm(A(:,2))

ans =

          33.2415402771893

s=0;
for j=1:5; s=s+norm(A(:,j)); end
s

s =

          166.157717545445

for j=1:5; v(j)=norm(A(:,j)); end
v

v =

  Columns 1 through 2

          32.4807635378234          33.2415402771893

  Columns 3 through 4

          34.7131099154196          33.2415402771893

  Column 5

          32.4807635378234

norm(v)

ans =

          74.3303437365925

norm(A(:))

ans =

          74.3303437365925

for j=1:5; v(j)=norm(A(:,j),1); end
v

v =

    65    65    65    65    65

norm(v,1)

ans =

   325

norm(v,1)/5

ans =

    65

load durer
X(1:10,1:10)

ans =
    41    60    51    51    59    62    52    35    33    40
    47    82    79    75    73    76    78    65    51    51
    39    64    74    74    74    69    68    71    70    57
    58    71    61    75    79    77    73    74    73    68
    54    81    69    71    81    77    73    80    73    74
    61    81    77    78    71    69    72    70    79    74
    51    86    86    75    70    69    65    70    65    66
    59    72    78    88    82    68    64    67    64    58
    57    76    66    74    82    80    75    67    64    69
    63    79    68    68    73    82    81    73    66    62

size(X)

ans =
   648   509

caption

caption =

Albrecht Durer's Melancolia.
Can you find the matrix?    

map

map =

  Columns 1 through 2

                         0                         0
        0.0264330458503381        0.0264330458503381
        0.0444549069995727        0.0444549069995727
        0.0602543145526548        0.0602543145526548
        0.0747639438727559        0.0747639438727559
        0.0883842157170541        0.0883842157170541
         0.101335274221794         0.101335274221794
         0.113755064046438         0.113755064046438
         0.125737464785661         0.125737464785661
          0.13735013523475          0.13735013523475
         0.148643940322964         0.148643940322964
         0.159658381777355         0.159658381777355
         0.170424937663718         0.170424937663718
         0.180969223742113         0.180969223742113
         0.191312451147213         0.191312451147213
         0.201472443450438         0.201472443450438
         0.211464366802704         0.211464366802704
         0.221301266973425         0.221301266973425
         0.230994472707028         0.230994472707028
           0.2405539042466           0.2405539042466
         0.249988313133534         0.249988313133534
         0.259305471258198         0.259305471258198
         0.268512321803574         0.268512321803574
         0.277615101143516         0.277615101143516
         0.286619438302516         0.286619438302516
         0.295530436868623         0.295530436868623
          0.30435274303198          0.30435274303198
         0.313090602541305         0.313090602541305
         0.321747908726185         0.321747908726185
         0.330328243255042         0.330328243255042
          0.33883491093976          0.33883491093976
         0.347270969625652         0.347270969625652
         0.355639255996582         0.355639255996582
         0.363942407963461         0.363942407963461
         0.372182884178116         0.372182884178116
         0.380362981115137         0.380362981115137
         0.388484848085523         0.388484848085523
         0.396550500482912         0.396550500482912
         0.404561831512503         0.404561831512503
         0.412520622611774         0.412520622611774
         0.420428552738624         0.420428552738624
         0.428287206675238         0.428287206675238
         0.436098082473387         0.436098082473387
         0.443862598148232         0.443862598148232
         0.451582097712154         0.451582097712154
         0.459257856627196         0.459257856627196
          0.46689108674376          0.46689108674376
         0.474482940784087         0.474482940784087
         0.482034516421238         0.482034516421238
         0.489546859997736         0.489546859997736
         0.497020969922379         0.497020969922379
         0.504457799778954         0.504457799778954
         0.511858261176454         0.511858261176454
          0.51922322636682          0.51922322636682
         0.526553530653217         0.526553530653217
         0.533849974609153         0.533849974609153
         0.541113326126457         0.541113326126457
          0.54834432230815          0.54834432230815
         0.555543671220443         0.555543671220443
         0.562712053516613         0.562712053516613
         0.569850123944112         0.569850123944112
         0.576958512745137         0.576958512745137
         0.584037826959785         0.584037826959785
         0.591088651640046         0.591088651640046
         0.598111550982047         0.598111550982047
         0.605107069383234         0.605107069383234
         0.612075732430559         0.612075732430559
         0.619018047825133         0.619018047825133
         0.625934506248332         0.625934506248332
          0.63282558217386          0.63282558217386
         0.639691734629869         0.639691734629869
         0.646533407914897         0.646533407914897
            0.653351032271            0.653351032271
         0.660145024517234         0.660145024517234
         0.666915788646294         0.666915788646294
         0.673663716386955         0.673663716386955
         0.680389187734682         0.680389187734682
         0.687092571452616         0.687092571452616
         0.693774225544943         0.693774225544943
         0.700434497704517         0.700434497704517
         0.707073725736433         0.707073725736433
         0.713692237959128         0.713692237959128
         0.720290353584469         0.720290353584469
         0.726868383078171         0.726868383078171
         0.733426628501781         0.733426628501781
         0.739965383837383         0.739965383837383
         0.746484935296096         0.746484935296096
         0.752985561611342         0.752985561611342
         0.759467534317806         0.759467534317806
         0.765931118016944         0.765931118016944
         0.772376570629827         0.772376570629827
         0.778804143638063         0.778804143638063
         0.785214082313478         0.785214082313478
         0.791606625937203         0.791606625937203
         0.797982008008758         0.797982008008758
         0.804340456445703         0.804340456445703
         0.810682193774354         0.810682193774354
         0.817007437312081         0.817007437312081
         0.823316399341617         0.823316399341617
         0.829609287277824         0.829609287277824
         0.835886303827305         0.835886303827305
         0.842147647141239         0.842147647141239
         0.848393510961798         0.848393510961798
         0.854624084762462         0.854624084762462
          0.86083955388256          0.86083955388256
         0.867040099656311         0.867040099656311
         0.873225899536653         0.873225899536653
         0.879397127214113         0.879397127214113
         0.885553952730955         0.885553952730955
         0.891696542590844         0.891696542590844
         0.897825059864246         0.897825059864246
         0.903939664289746         0.903939664289746
         0.910040512371503         0.910040512371503
         0.916127757473005         0.916127757473005
         0.922201549907301         0.922201549907301
         0.928262037023876         0.928262037023876
         0.934309363292318         0.934309363292318
         0.940343670382918         0.940343670382918
         0.946365097244352         0.946365097244352
         0.952373780178564         0.952373780178564
         0.958369852912978         0.958369852912978
         0.964353446670153         0.964353446670153
         0.970324690235001         0.970324690235001
         0.976283710019655         0.976283710019655
         0.982230630126105         0.982230630126105
         0.988165572406691         0.988165572406691
         0.994088656522533         0.994088656522533
                         1                         1

  Column 3

                         0
        0.0264330458503381
        0.0444549069995727
        0.0602543145526548
        0.0747639438727559
        0.0883842157170541
         0.101335274221794
         0.113755064046438
         0.125737464785661
          0.13735013523475
         0.148643940322964
         0.159658381777355
         0.170424937663718
         0.180969223742113
         0.191312451147213
         0.201472443450438
         0.211464366802704
         0.221301266973425
         0.230994472707028
           0.2405539042466
         0.249988313133534
         0.259305471258198
         0.268512321803574
         0.277615101143516
         0.286619438302516
         0.295530436868623
          0.30435274303198
         0.313090602541305
         0.321747908726185
         0.330328243255042
          0.33883491093976
         0.347270969625652
         0.355639255996582
         0.363942407963461
         0.372182884178116
         0.380362981115137
         0.388484848085523
         0.396550500482912
         0.404561831512503
         0.412520622611774
         0.420428552738624
         0.428287206675238
         0.436098082473387
         0.443862598148232
         0.451582097712154
         0.459257856627196
          0.46689108674376
         0.474482940784087
         0.482034516421238
         0.489546859997736
         0.497020969922379
         0.504457799778954
         0.511858261176454
          0.51922322636682
         0.526553530653217
         0.533849974609153
         0.541113326126457
          0.54834432230815
         0.555543671220443
         0.562712053516613
         0.569850123944112
         0.576958512745137
         0.584037826959785
         0.591088651640046
         0.598111550982047
         0.605107069383234
         0.612075732430559
         0.619018047825133
         0.625934506248332
          0.63282558217386
         0.639691734629869
         0.646533407914897
            0.653351032271
         0.660145024517234
         0.666915788646294
         0.673663716386955
         0.680389187734682
         0.687092571452616
         0.693774225544943
         0.700434497704517
         0.707073725736433
         0.713692237959128
         0.720290353584469
         0.726868383078171
         0.733426628501781
         0.739965383837383
         0.746484935296096
         0.752985561611342
         0.759467534317806
         0.765931118016944
         0.772376570629827
         0.778804143638063
         0.785214082313478
         0.791606625937203
         0.797982008008758
         0.804340456445703
         0.810682193774354
         0.817007437312081
         0.823316399341617
         0.829609287277824
         0.835886303827305
         0.842147647141239
         0.848393510961798
         0.854624084762462
          0.86083955388256
         0.867040099656311
         0.873225899536653
         0.879397127214113
         0.885553952730955
         0.891696542590844
         0.897825059864246
         0.903939664289746
         0.910040512371503
         0.916127757473005
         0.922201549907301
         0.928262037023876
         0.934309363292318
         0.940343670382918
         0.946365097244352
         0.952373780178564
         0.958369852912978
         0.964353446670153
         0.970324690235001
         0.976283710019655
         0.982230630126105
         0.988165572406691
         0.994088656522533
                         1

prod(size(X))

ans =

      329832

size(X)

ans =

   648   509

image(X)
colormap(map)
axis image
A=A(:,[1 3 2 4])

A =

    17     1    24     8
    23     7     5    14
     4    13     6    20
    10    19    12    21
    11    25    18     2

A(:,:)

ans =

    17     1    24     8
    23     7     5    14
     4    13     6    20
    10    19    12    21
    11    25    18     2

A=magic(5)

A =

    17    24     1     8    15
    23     5     7    14    16
     4     6    13    20    22
    10    12    19    21     3
    11    18    25     2     9

A(:,:)

ans =

    17    24     1     8    15
    23     5     7    14    16
     4     6    13    20    22
    10    12    19    21     3
    11    18    25     2     9

A

A =

    17    24     1     8    15
    23     5     7    14    16
     4     6    13    20    22
    10    12    19    21     3
    11    18    25     2     9

A=A(:,1:3)

A =

    17    24     1
    23     5     7
     4     6    13
    10    12    19
    11    18    25

A=A(:,[1 3 5])
{Index exceeds matrix dimensions.
} 
char(45)

ans =

-

char(32)

ans =

 

char(33)

ans =

!

char(12)

ans =



char(11)

ans =



char(32:66)

ans =

 !"#$%&'()*+,-./0123456789:;<=>?@AB

x = reshape(32:127,32,3)'

x =

  Columns 1 through 12

    32    33    34    35    36    37    38    39    40    41    42    43
    64    65    66    67    68    69    70    71    72    73    74    75
    96    97    98    99   100   101   102   103   104   105   106   107

  Columns 13 through 24

    44    45    46    47    48    49    50    51    52    53    54    55
    76    77    78    79    80    81    82    83    84    85    86    87
   108   109   110   111   112   113   114   115   116   117   118   119

  Columns 25 through 32

    56    57    58    59    60    61    62    63
    88    89    90    91    92    93    94    95
   120   121   122   123   124   125   126   127

char(x)

ans =

 !"#$%&'()*+,-./0123456789:;<=>?
@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_
`abcdefghijklmnopqrstuvwxyz{|}~

x = [37 -37 37 -37]';
y = [10 10 -10 -10]';
r = [ x y rem(x,y) mod(x,y)]

r =

    37    10     7     7
   -37    10    -7     3
    37   -10     7    -3
   -37   -10    -7    -7

mod(x,2)

ans =

     1
     1
     1
     1

mod(x,0)

ans =

    37
   -37
    37
   -37

rem(x,0)

ans =

   NaN
   NaN
   NaN
   NaN

crypto('hello world!')

ans =

,©3{p]>~Y&ma

crypto(ans)

ans =

hello world!

open crypto
ans

ans =

hello world!

ans(ans==w)
{Undefined function or variable 'w'.
} 
ans

ans =

hello world!

ans(ans=='w')

ans =

w

x=ans(ans=='w')

x =

w

x

x =

w

x=ans

x =

w

x='hello world!'

x =

hello world!

x(x=='w')=z
{Undefined function or variable 'z'.
} 
x(x=='w')='z'

x =

hello zorld!

x=='z'

ans =

  1×12 <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a> array

   0   0   0   0   0   0   1   0   0   0   0   0

find(x=='z')

ans =

     7

x=rand(20,1)

x =

         0.141886338627215
         0.421761282626275
         0.915735525189067
         0.792207329559554
         0.959492426392903
         0.655740699156587
        0.0357116785741896
         0.849129305868777
         0.933993247757551
         0.678735154857773
         0.757740130578333
         0.743132468124916
         0.392227019534168
         0.655477890177557
         0.171186687811562
         0.706046088019609
        0.0318328463774207
          0.27692298496089
        0.0461713906311539
        0.0971317812358475

x>0.5

ans =

  20×1 <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a> array

   0
   0
   1
   1
   1
   1
   0
   1
   1
   1
   1
   1
   0
   1
   0
   1
   0
   0
   0
   0

x(x>0.5)

ans =

         0.915735525189067
         0.792207329559554
         0.959492426392903
         0.655740699156587
         0.849129305868777
         0.933993247757551
         0.678735154857773
         0.757740130578333
         0.743132468124916
         0.655477890177557
         0.706046088019609

fp = fopen('gettysburg.txt');
G = char(fread(fp)
 G = char(fread(fp)
                   
{Error: Expression or statement is incorrect--possibly unbalanced (, {, or
[.
} 
G = char(fread(fp))

G =

F
o
u
r
s
c
o
r
e
 
a
n
d
 
s
e
v
e
n
 
y
e
a
r
s
 
a
g
o
 
o
u
r
 
f
a
t
h
e
r
s
 
b
r
o
u
g
h
t
 
f
o
r
t
h
 
o
n
 
t
h
i
s


c
o
n
t
i
n
e
n
t
 
a
 
n
e
w
 
n
a
t
i
o
n
,
 
c
o
n
c
e
i
v
e
d
 
i
n
 
l
i
b
e
r
t
y
 
a
n
d
 
d
e
d
i
c
a
t
e
d
 
t
o
 
t
h
e


p
r
o
p
o
s
i
t
i
o
n
 
t
h
a
t
 
a
l
l
 
m
e
n
 
a
r
e
 
c
r
e
a
t
e
d
 
e
q
u
a
l
.


N
o
w
 
w
e
 
a
r
e
 
e
n
g
a
g
e
d
 
i
n
 
a
 
g
r
e
a
t
 
c
i
v
i
l
 
w
a
r
,
 
t
e
s
t
i
n
g
 
w
h
e
t
h
e
r
 
t
h
a
t
 
n
a
t
i
o
n


o
r
 
a
n
y
 
n
a
t
i
o
n
 
s
o
 
c
o
n
c
e
i
v
e
d
 
a
n
d
 
s
o
 
d
e
d
i
c
a
t
e
d
 
c
a
n
 
l
o
n
g
 
e
n
d
u
r
e
.
 
W
e
 
a
r
e


m
e
t
 
o
n
 
a
 
g
r
e
a
t
 
b
a
t
t
l
e
 
f
i
e
l
d
 
o
f
 
t
h
a
t
 
w
a
r
.
 
W
e
 
h
a
v
e
 
c
o
m
e
 
t
o
 
d
e
d
i
c
a
t
e
 
a


p
o
r
t
i
o
n
 
o
f
 
t
h
a
t
 
f
i
e
l
d
,
 
a
s
 
a
 
f
i
n
a
l
 
r
e
s
t
i
n
g
 
p
l
a
c
e
 
f
o
r
 
t
h
o
s
e
 
w
h
o
 
h
e
r
e


g
a
v
e
 
t
h
e
i
r
 
l
i
v
e
s
 
t
h
a
t
 
t
h
a
t
 
n
a
t
i
o
n
 
m
i
g
h
t
 
l
i
v
e
.
 
I
t
 
i
s
 
a
l
t
o
g
e
t
h
e
r


f
i
t
t
i
n
g
 
a
n
d
 
p
r
o
p
e
r
 
t
h
a
t
 
w
e
 
s
h
o
u
l
d
 
d
o
 
t
h
i
s
.


B
u
t
,
 
i
n
 
a
 
l
a
r
g
e
r
 
s
e
n
s
e
,
 
w
e
 
c
a
n
 
n
o
t
 
d
e
d
i
c
a
t
e
 
-
 
w
e
 
c
a
n
 
n
o
t
 
c
o
n
s
e
c
r
a
t
e


-
 
w
e
 
c
a
n
 
n
o
t
 
h
a
l
l
o
w
 
-
 
t
h
i
s
 
g
r
o
u
n
d
.
 
T
h
e
 
b
r
a
v
e
 
m
e
n
,
 
l
i
v
i
n
g
 
a
n
d
 
d
e
a
d
,


w
h
o
 
s
t
r
u
g
g
l
e
d
 
h
e
r
e
,
 
h
a
v
e
 
c
o
n
s
e
c
r
a
t
e
d
 
i
t
,
 
f
a
r
 
a
b
o
v
e
 
o
u
r
 
p
o
o
r
 
p
o
w
e
r
 
t
o


a
d
d
 
o
r
 
d
e
t
r
a
c
t
.
 
T
h
e
 
w
o
r
l
d
 
w
i
l
l
 
l
i
t
t
l
e
 
n
o
t
e
,
 
n
o
r
 
l
o
n
g
 
r
e
m
e
m
b
e
r
,
 
w
h
a
t


w
e
 
s
a
y
 
h
e
r
e
,
 
b
u
t
 
i
t
 
c
a
n
 
n
e
v
e
r
 
f
o
r
g
e
t
 
w
h
a
t
 
t
h
e
y
 
d
i
d
 
h
e
r
e
.
 
I
t
 
i
s
 
f
o
r


u
s
 
t
h
e
 
l
i
v
i
n
g
,
 
r
a
t
h
e
r
,
 
t
o
 
b
e
 
d
e
d
i
c
a
t
e
d
 
h
e
r
e
 
t
o
 
t
h
e
 
u
n
f
i
n
i
s
h
e
d
 
w
o
r
k


w
h
i
c
h
 
t
h
e
y
 
w
h
o
 
f
o
u
g
h
t
 
h
e
r
e
 
h
a
v
e
 
t
h
u
s
 
f
a
r
 
s
o
 
n
o
b
l
y
 
a
d
v
a
n
c
e
d
.
 
I
t
 
i
s


r
a
t
h
e
r
 
f
o
r
 
u
s
 
t
o
 
b
e
 
h
e
r
e
 
d
e
d
i
c
a
t
e
d
 
t
o
 
t
h
e
 
g
r
e
a
t
 
t
a
s
k
 
r
e
m
a
i
n
i
n
g


b
e
f
o
r
e
 
u
s
 
-
 
t
h
a
t
 
f
r
o
m
 
t
h
e
s
e
 
h
o
n
o
r
e
d
 
d
e
a
d
 
w
e
 
t
a
k
e
 
i
n
c
r
e
a
s
e
d
 
d
e
v
o
t
i
o
n


t
o
 
t
h
a
t
 
c
a
u
s
e
 
f
o
r
 
w
h
i
c
h
 
t
h
e
y
 
g
a
v
e
 
t
h
e
 
l
a
s
t
 
f
u
l
l
 
m
e
a
s
u
r
e
 
o
f
 
d
e
v
o
t
i
o
n


-
 
t
h
a
t
 
w
e
 
h
e
r
e
 
h
i
g
h
l
y
 
r
e
s
o
l
v
e
 
t
h
a
t
 
t
h
e
s
e
 
d
e
a
d
 
s
h
a
l
l
 
n
o
t
 
h
a
v
e
 
d
i
e
d
 
i
n


v
a
i
n
 
-
 
t
h
a
t
 
t
h
i
s
 
n
a
t
i
o
n
,
 
u
n
d
e
r
 
G
o
d
,
 
s
h
a
l
l
 
h
a
v
e
 
a
 
n
e
w
 
b
i
r
t
h
 
o
f


f
r
e
e
d
o
m
 
-
 
a
n
d
 
t
h
a
t
 
g
o
v
e
r
n
m
e
n
t
 
o
f
 
t
h
e
 
p
e
o
p
l
e
,
 
b
y
 
t
h
e
 
p
e
o
p
l
e
,
 
f
o
r
 
t
h
e


p
e
o
p
l
e
,
 
s
h
a
l
l
 
n
o
t
 
p
e
r
i
s
h
 
f
r
o
m
 
t
h
e
 
e
a
r
t
h
.



fp

fp =

     3

G = char(fread(fp))

G =

  0×0 empty <a href="matlab:helpPopup char" style="font-weight:bold">char</a> array

fp = fopen('gettysburg.txt');
G = char(fread(fp))

G =

F
o
u
r
s
c
o
r
e
 
a
n
d
 
s
e
v
e
n
 
y
e
a
r
s
 
a
g
o
 
o
u
r
 
f
a
t
h
e
r
s
 
b
r
o
u
g
h
t
 
f
o
r
t
h
 
o
n
 
t
h
i
s


c
o
n
t
i
n
e
n
t
 
a
 
n
e
w
 
n
a
t
i
o
n
,
 
c
o
n
c
e
i
v
e
d
 
i
n
 
l
i
b
e
r
t
y
 
a
n
d
 
d
e
d
i
c
a
t
e
d
 
t
o
 
t
h
e


p
r
o
p
o
s
i
t
i
o
n
 
t
h
a
t
 
a
l
l
 
m
e
n
 
a
r
e
 
c
r
e
a
t
e
d
 
e
q
u
a
l
.


N
o
w
 
w
e
 
a
r
e
 
e
n
g
a
g
e
d
 
i
n
 
a
 
g
r
e
a
t
 
c
i
v
i
l
 
w
a
r
,
 
t
e
s
t
i
n
g
 
w
h
e
t
h
e
r
 
t
h
a
t
 
n
a
t
i
o
n


o
r
 
a
n
y
 
n
a
t
i
o
n
 
s
o
 
c
o
n
c
e
i
v
e
d
 
a
n
d
 
s
o
 
d
e
d
i
c
a
t
e
d
 
c
a
n
 
l
o
n
g
 
e
n
d
u
r
e
.
 
W
e
 
a
r
e


m
e
t
 
o
n
 
a
 
g
r
e
a
t
 
b
a
t
t
l
e
 
f
i
e
l
d
 
o
f
 
t
h
a
t
 
w
a
r
.
 
W
e
 
h
a
v
e
 
c
o
m
e
 
t
o
 
d
e
d
i
c
a
t
e
 
a


p
o
r
t
i
o
n
 
o
f
 
t
h
a
t
 
f
i
e
l
d
,
 
a
s
 
a
 
f
i
n
a
l
 
r
e
s
t
i
n
g
 
p
l
a
c
e
 
f
o
r
 
t
h
o
s
e
 
w
h
o
 
h
e
r
e


g
a
v
e
 
t
h
e
i
r
 
l
i
v
e
s
 
t
h
a
t
 
t
h
a
t
 
n
a
t
i
o
n
 
m
i
g
h
t
 
l
i
v
e
.
 
I
t
 
i
s
 
a
l
t
o
g
e
t
h
e
r


f
i
t
t
i
n
g
 
a
n
d
 
p
r
o
p
e
r
 
t
h
a
t
 
w
e
 
s
h
o
u
l
d
 
d
o
 
t
h
i
s
.


B
u
t
,
 
i
n
 
a
 
l
a
r
g
e
r
 
s
e
n
s
e
,
 
w
e
 
c
a
n
 
n
o
t
 
d
e
d
i
c
a
t
e
 
-
 
w
e
 
c
a
n
 
n
o
t
 
c
o
n
s
e
c
r
a
t
e


-
 
w
e
 
c
a
n
 
n
o
t
 
h
a
l
l
o
w
 
-
 
t
h
i
s
 
g
r
o
u
n
d
.
 
T
h
e
 
b
r
a
v
e
 
m
e
n
,
 
l
i
v
i
n
g
 
a
n
d
 
d
e
a
d
,


w
h
o
 
s
t
r
u
g
g
l
e
d
 
h
e
r
e
,
 
h
a
v
e
 
c
o
n
s
e
c
r
a
t
e
d
 
i
t
,
 
f
a
r
 
a
b
o
v
e
 
o
u
r
 
p
o
o
r
 
p
o
w
e
r
 
t
o


a
d
d
 
o
r
 
d
e
t
r
a
c
t
.
 
T
h
e
 
w
o
r
l
d
 
w
i
l
l
 
l
i
t
t
l
e
 
n
o
t
e
,
 
n
o
r
 
l
o
n
g
 
r
e
m
e
m
b
e
r
,
 
w
h
a
t


w
e
 
s
a
y
 
h
e
r
e
,
 
b
u
t
 
i
t
 
c
a
n
 
n
e
v
e
r
 
f
o
r
g
e
t
 
w
h
a
t
 
t
h
e
y
 
d
i
d
 
h
e
r
e
.
 
I
t
 
i
s
 
f
o
r


u
s
 
t
h
e
 
l
i
v
i
n
g
,
 
r
a
t
h
e
r
,
 
t
o
 
b
e
 
d
e
d
i
c
a
t
e
d
 
h
e
r
e
 
t
o
 
t
h
e
 
u
n
f
i
n
i
s
h
e
d
 
w
o
r
k


w
h
i
c
h
 
t
h
e
y
 
w
h
o
 
f
o
u
g
h
t
 
h
e
r
e
 
h
a
v
e
 
t
h
u
s
 
f
a
r
 
s
o
 
n
o
b
l
y
 
a
d
v
a
n
c
e
d
.
 
I
t
 
i
s


r
a
t
h
e
r
 
f
o
r
 
u
s
 
t
o
 
b
e
 
h
e
r
e
 
d
e
d
i
c
a
t
e
d
 
t
o
 
t
h
e
 
g
r
e
a
t
 
t
a
s
k
 
r
e
m
a
i
n
i
n
g


b
e
f
o
r
e
 
u
s
 
-
 
t
h
a
t
 
f
r
o
m
 
t
h
e
s
e
 
h
o
n
o
r
e
d
 
d
e
a
d
 
w
e
 
t
a
k
e
 
i
n
c
r
e
a
s
e
d
 
d
e
v
o
t
i
o
n


t
o
 
t
h
a
t
 
c
a
u
s
e
 
f
o
r
 
w
h
i
c
h
 
t
h
e
y
 
g
a
v
e
 
t
h
e
 
l
a
s
t
 
f
u
l
l
 
m
e
a
s
u
r
e
 
o
f
 
d
e
v
o
t
i
o
n


-
 
t
h
a
t
 
w
e
 
h
e
r
e
 
h
i
g
h
l
y
 
r
e
s
o
l
v
e
 
t
h
a
t
 
t
h
e
s
e
 
d
e
a
d
 
s
h
a
l
l
 
n
o
t
 
h
a
v
e
 
d
i
e
d
 
i
n


v
a
i
n
 
-
 
t
h
a
t
 
t
h
i
s
 
n
a
t
i
o
n
,
 
u
n
d
e
r
 
G
o
d
,
 
s
h
a
l
l
 
h
a
v
e
 
a
 
n
e
w
 
b
i
r
t
h
 
o
f


f
r
e
e
d
o
m
 
-
 
a
n
d
 
t
h
a
t
 
g
o
v
e
r
n
m
e
n
t
 
o
f
 
t
h
e
 
p
e
o
p
l
e
,
 
b
y
 
t
h
e
 
p
e
o
p
l
e
,
 
f
o
r
 
t
h
e


p
e
o
p
l
e
,
 
s
h
a
l
l
 
n
o
t
 
p
e
r
i
s
h
 
f
r
o
m
 
t
h
e
 
e
a
r
t
h
.



G'

ans =

Fourscore and seven years ago our fathers brought forth on this
continent a new nation, conceived in liberty and dedicated to the
proposition that all men are created equal.
Now we are engaged in a great civil war, testing whether that nation
or any nation so conceived and so dedicated can long endure. We are
met on a great battle field of that war. We have come to dedicate a
portion of that field, as a final resting place for those who here
gave their lives that that nation might live. It is altogether
fitting and proper that we should do this.
But, in a larger sense, we can not dedicate - we can not consecrate
- we can not hallow - this ground. The brave men, living and dead,
who struggled here, have consecrated it, far above our poor power to
add or detract. The world will little note, nor long remember, what
we say here, but it can never forget what they did here. It is for
us the living, rather, to be dedicated here to the unfinished work
which they who fought here have thus far so nobly advanced. It is
rather for us to be here dedicated to the great task remaining
before us - that from these honored dead we take increased devotion
to that cause for which they gave the last full measure of devotion
- that we here highly resolve that these dead shall not have died in
vain - that this nation, under God, shall have a new birth of
freedom - and that government of the people, by the people, for the
people, shall not perish from the earth.


fclose(fp)

ans =

     0

cG=crypto(G);
cG'

ans =

K
}
x
g
-
a
R
[
Q
I
2
8
k
G
1
4
D
:
)
[
W
@
:
?
i
e
$
D
p
]
X
H
"
c
X
t
~
#
3
G
i
e
 
A
X
H
L
j
O
g
t
\
i
4
d
O
J
T
g
R
4
%
=
o
a
V
p
,
$
H
+
@
O
g
X
A
R
*
b
m
J
#
®
=
J
T
l
8
a
V
N
W
!
®
D
:
k
G
$
H
W
D
m
3
3
G
?
Y
A
I
P
q
G
6
x
_
o
M
>
s
x
_
g
R
p
]
~
#
%
S
8
]
N
'
T
u
0
"
&
b
)
[
~
#
>
s
A
I
3
{
Y
^
+
@
A
I
K
2
E
}
K
2
>
s
x
_
I
P
$
L
.
e
m
F
=
,
b
m
*
<
A
I
K
2
I
P
V
^
$
D
x
_
Q
W
)
[
X
A
`
K
r
r
O
g
U
|
L
A
]
W
"
5
:
x
g
R
5
a
®
=
V
^
m
?
,
©
~
#
3
G
g
R
$
x
O
g
J
#
®
=
J
T
S
f
"
c
2
8
.
q
J
#
®
=
J
T
e
8
p
]
a
V
N
W
!
®
D
:
k
G
2
8
k
G
E
v
G
6
x
_
o
M
>
s
x
_
E
}
2
8
W
D
J
T
~
M
+
@
S
2
K
2
8
<
b
]
A
I
K
2
O
2
7
{
]
1
)
[
X
A
`
K
r
r
O
g
_
l
5
8
%
&
K
j
s
 
#
m
]
1
7
K
~
#
>
s
m
?
:
?
8
<
b
]
O
=
B
F
Q
I
a
V
l
(
g
R
p
]
3
w
;
~
E
n
x
6
A
I
U
®
R
[
®
=
J
T
]
1
7
K
~
#
>
s
K
j
s
 
#
m
l
8
<
Y
A
I
K
j
$
H
.
e
c
©
5
a
®
=
V
^
_
K
~
®
M
u
K
j
R
[
g
R
@
`
1
4
m
?
@
`
O
=
3
G
%
S
>
v
D
:
g
R
,
©
,
O
W
D
4
V
5
a
g
R
$
x
O
g
~
#
>
s
[
x
>
s
&
b
)
[
t
/
L
j
O
g
-
-
D
:
8
<
h
C
Q
W
i
e
.
e
+
x
F
}
~
#
3
G
A
>
0
"
®
=
V
^
A
I
P
q
_
K
_
t
©
.
"
c
~
#
>
s
m
?
Q
I
7
!
X
H
#
m
G
6
p
]
~
#
.
i
m
F
^
O
g
|
Q
W
)
[
X
A
~
®
O
f
3
G
e
8
+
@
1
4
l
8
*
<
E
}
2
8
[
x
V
.
G
6
x
_
o
M
>
s
Q
I
R
:
*
<
E
}
2
8
[
x
V
.
E
}
J
T
1
4
g
C
>
s
%
S
R
:
*
<
E
}
2
8
[
x
V
.
O
=
.
e
9
h
b
m
R
:
~
#
.
i
M
#
_
t
p
`
&
/
'
{
,
©
C
c
C
+
D
:
Y
^
+
@
l
8
-
-
L
A
V
^
A
I
P
q
G
6
r
r
"
\
c
t
@
`
e
8
1
e
b
l
T
q
x
_
O
=
3
G
i
^
O
=
B
F
Q
I
a
V
n
s
v
E
C
+
x
6
k
G
0
"
l
8
X
t
"
c
{
#
Z
b
Q
I
X
H
"
c
2
p
R
[
_
K
\
|
3
G
g
R
D
g
©
W
k
G
R
[
G
6
7
{
C
+
k
w
8
<
U
D
Q
I
>
~
Y
&
k
G
2
C
3
{
W
D
0
"
%
*
Q
I
f
l
x
6
l
8
f
l
"
c
9
h
V
^
c
©
)
&
)
&
g
s
:
x
m
?
$
x
#
q
*
<
e
8
H
3
O
=
3
G
i
^
C
c
|
:
Q
W
O
g
E
n
)
[
R
*
D
:
"
c
t
\
O
f
7
{
m
?
$
x
O
g
~
#
A
;
G
6
q
g
O
=
3
G
m
1
r
®
O
g
.
i
K
j
R
[
_
@
i
e
~
#
Q
I
-
-
L
A
V
^
l
8
C
+
~
#
3
G
l
8
+
x
C
c
Q
I
3
w
;
~
E
n
x
6
k
G
,
©
K
2
g
R
p
]
~
#
Q
I
p
`
h
!
Z
1
7
!
x
_
m
?
R
[
K
_
0
)
o
M
d
O
~
#
A
;
m
?
@
`
K
j
X
H
L
j
O
g
,
©
K
2
O
=
B
F
Q
I
~
#
z
 
K
j
:
?
e
8
p
]
f
l
u
g
.
q
©
W
<
3
N
W
x
_
8
<
h
C
Q
W
=
o
C
+
~
#
3
G
K
j
R
[
i
l
i
e
+
x
C
c
Q
I
,
©
K
2
G
6
x
_
o
M
>
s
x
_
g
R
p
]
~
#
Q
I
`
K
r
r
O
g
p
/
=
o
c
©
)
&
(
x
Z
1
V
^
9
7
|
2
R
[
Q
I
z
 
:
O
g
R
$
x
O
g
z
I
H
:
g
R
,
©
1
4
O
=
J
T
R
[
x
_
G
6
r
r
k
G
*
<
g
R
,
K
Q
I
$
H
g
C
r
r
1
4
k
G
3
w
X
|
®
=
J
T
]
&
p
]
~
#
>
s
E
}
@
,
1
4
K
j
R
[
m
?
4
%
S
b
g
R
,
©
.
q
>
v
D
:
g
R
,
©
W
D
<
Y
O
g
®
6
3
{
Y
^
r
r
Q
P
K
2
]
1
7
K
3
w
X
|
®
=
J
T
0
#
g
R
$
x
O
g
*
<
O
=
3
G
Q
I
4
%
L
j
M
I
c
©
5
a
F
 
D
:
g
R
$
x
O
g
~
#
5
a
Q
I
3
w
©
W
e
8
$
x
3
{
[
x
V
.
O
=
B
F
Q
I
;
~
x
_
Q
W
^
e
<
3
$
H
:
O
g
R
$
x
O
g
~
#
.
i
[
x
>
s
&
b
A
p
i
l
P
q
3
G
n
L
6
s
l
8
7
!
.
e
]
W
$
x
D
:
A
I
[
x
=
h
C
c
,
O
~
#
]
1
l
U
z
I
z
y
G
X
C
Y
R
:
2
8
k
G
~
#
>
s
M
#
Z
b
3
G
b
8
+
@
O
g
:
F
g
R
,
©
_
K
-
Z
,
"
i
^
C
c
.
q
~
#
Q
I
©
.
N
'
%
&
l
8
t
\
"
c
~
#
%
S
©
.
N
'
%
&
l
8
7
!
.
e
]
W
f
l
O
g
©
.
S
9
7
!
K
j
_
t
C
Y
~
#
Q
I
r
r
i
4
®
7
6

cG

cG =

K}xg-aR[QI28kG14D:)[W@:?ie$Dp]XH"cXt~#3Gie AXHLjOgt\i4dOJTgR4%=oaVp,$H+@OgXAR*bmJ#®=JTl8aVNW!®D:kG$HWDm33G?YAIPqG6x_oM>sx_gRp]~#%S8]N'Tu0"&b)[~#>sAI3{Y^+@AIK2E}K2>sx_IP$L.emF=,bm*<AIK2IPV^$Dx_QW)[XA`KrrOgU|LA]W"5:xgR5a®=V^m?,©~#3GgR$xOgJ#®=JTSf"c28.qJ#®=JTe8p]aVNW!®D:kG28kGEvG6x_oM>sx_E}28WDJT~M+@S2K28<b]AIK2O27{]1)[XA`KrrOg_l58%&Kjs #m]17K~#>sm?:?8<b]O=BFQIaVl(gRp]3w;~Enx6AIU®R[®=JT]17K~#>sKjs #ml8<YAIKj$H.ec©5a®=V^_K~®MuKjR[gR@`14m?@`O=3G%S>vD:gR,©,OWD4V5agR$xOg~#>s[x>s&b)[t/LjOg--D:8<hCQWie.e+xF}~#3GA>0"®=V^AIPq_K_t©."c~#>sm?QI7!XH#mG6p]~#.imF^Og|QW)[XA~®Of3Ge8+@14l8*<E}28[xV.G6x_oM>sQIR:*<E}28[xV.E}JT14gC>s%SR:*<E}28[xV.O=.e9hbmR:~#.iM#_tp`&/'{,©CcC+D:Y^+@l8--LAV^AIPqG6rr"\ct@`e81eblTqx_O=3Gi^O=BFQIaVnsvEC+x6kG0"l8Xt"c{#ZbQIXH"c2pR[_K\|3GgRDg©WkGR[G67{C+kw8<UDQI>~Y&kG2C3{WD0"%*QIflx6l8fl"c9hV^c©)&)&gs:xm?$x#q*<e8H3O=3Gi^Cc|:QWOgEn)[R*D:"ct\Of7{m?$xOg~#A;G6qgO=3Gm1r®Og.iKjR[_@ie~#QI--LAV^l8C+~#3Gl8+xCcQI3w;~Enx6kG,©K2gRp]~#QIp`h!Z17!x_m?R[K_0)oMdO~#A;m?@`KjXHLjOg,©K2O=BFQI~#z Kj:?e8p]flug.q©W<3NWx_8<hCQW=oC+~#3GKjR[ilie+xCcQI,©K2G6x_oM>sx_gRp]~#QI`KrrOgp/=oc©)&(xZ1V^97|2R[QIz :OgR$xOgzIH:gR,©14O=JTR[x_G6rrkG*<gR,KQI$HgCrr14kG3wX|®=JT]&p]~#>sE}@,14KjR[m?4%SbgR,©.q>vD:gR,©WD<YOg®63{Y^rrQPK2]17K3wX|®=JT0#gR$xOg*<O=3GQI4%LjMIc©5aF D:gR$xOg~#5aQI3w©We8$x3{[xV.O=BFQI;~x_QW^e<3$H:OgR$xOg~#.i[x>s&bApilPq3GnL6sl87!.e]W$xD:AI[x=hCc,O~#]1lUzIzyGXCYR:28kG~#>sM#Zb3Gb8+@Og:FgR,©_K-Z,"i^Cc.q~#QI©.N'%&l8t\"c~#%S©.N'%&l87!.e]WflOg©.S97!Kj_tCY~#QIrri4®76

crypto(cG)

ans =

Fourscore and seven years ago our fathers brought forth on thiskcontinent a new nation, conceived in liberty and dedicated to thekproposition that all men are created equal.kNow we are engaged in a great civil war, testing whether that nationkor any nation so conceived and so dedicated can long endure. We arekmet on a great battle field of that war. We have come to dedicate akportion of that field, as a final resting place for those who herekgave their lives that that nation might live. It is altogetherkfitting and proper that we should do this.kBut, in a larger sense, we can not dedicate - we can not consecratek- we can not hallow - this ground. The brave men, living and dead,kwho struggled here, have consecrated it, far above our poor power tokadd or detract. The world will little note, nor long remember, whatkwe say here, but it can never forget what they did here. It is forkus the living, rather, to be dedicated here to the unfinished workkwhich they who fought here have thus far so nobly advanced. It iskrather for us to be here dedicated to the great task remainingkbefore us - that from these honored dead we take increased devotionkto that cause for which they gave the last full measure of devotionk- that we here highly resolve that these dead shall not have died inkvain - that this nation, under God, shall have a new birth ofkfreedom - and that government of the people, by the people, for thekpeople, shall not perish from the earth.k

open encrypt
cG=encrypt('gettysburg.txt')
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('encrypt')" style="font-weight:bold">encrypt</a>
Too many output arguments.
} 
encrypt('gettysburg.txt')
K}xg-aR[QI28kG14D:)[W@:?ie$Dp]XH"cXt~#3Gie AXHLjOgt\i4dOJTgR4%.
aVp,$H+@OgXAR*bmJ#®=JTl8aVNW!®D:kG$HWDm33G?YAIPqG6x_oM>sx_gRp]~#<
8]N'Tu0"&b)[~#>sAI3{Y^+@AIK2E}K2>sx_IP$L.es
=,bm*<AIK2IPV^$Dx_QW)[XA`KrrOgU|LA]W"5:xgR5a®=V^m?,©~#3GgR$xOgJ#®=JT
R[AIzM[x>s&b)[EvE}JTMu4Vx_AIPqe8p]3w;~Enx6kGEn)[9hV^IPPqxgm1-hQI:?<
l(OgJTAIM#K2>sCc>s%*QIh!'mkG:FgR$xOg"5>K-hQI$xD:E}H:QI+xG6x_oM>sQI@
2pi4&b)[:FgR$xOgh!'m"\AIieXAh!J#]WK2O6$H~M,"}=QIt\"c~#TuQI0)p],©K2
>vD:gR,©,OWD4V5agR$xOg~#>s[x>s&b)[t/LjOg--D:8<hCQWie.e+xF}~#3G
h!58$H~M28kG8]N'3GgR$xOg*<e8@`l,kGGXgR4%$M
^Og|QW)[XA~®Of3Ge8+@14l8*<E}28[xV.G6x_oM>sQIR:*<E}28[xV.E}JT14gC>s<
R:*<E}28[xV.O=.e9hbmR:~#.iM#_tp`&/'{,©CcC+D:Y^+@l8--LAV^AIPqG6rr"\
0)p]O6kNJP%&kG,©K2l8$xD:E}JT14gC>sx_QWg|Kj:?AI{TD:]1xg_KLn"c2p*<"c+x
©WkGR[G67{C+kw8<UDQI>~Y&kG2C3{WD0"%*QIflx6l8fl"c9hV^c©)&)&gs:xm?$x-
*<e8H3O=3Gi^Cc|:QWOgEn)[R*D:"ct\Of7{m?$xOg~#A;G6qgO=3Gm1r®Og.iKjR[
z gR,©WD4V$H5bc©>s,©:xgRp]gsG6x_oM>sx_O=3GQI+xgR,©ilTD$H.i,©kG>~Wm
0)oMdO~#A;m?@`KjXHLjOg,©K2O=BFQI~#z Kj:?e8p]flug.q©W<3NWx_8<hCQW.
C+~#3GKjR[ilie+xCcQI,©K2G6x_oM>sx_gRp]~#QI`KrrOgp/=oc©)&(xZ1V^
gst\K2ilieR:~#>sKj_tCY~#5aQI@`flK2kG3w©Wm?QIp/?$QWNWK2<Yx_G6;NV.&b3
+xgR$xOgEnz QIt\"c0)oMdO~#A;M#BFQI~#QI~®O6Kjl,]Wl(<YxgQI:FG6;NV.&b3
R:~#>sm?QI,©K2O=wT:s.qK2EvG\QI~#>sgR,©14G6rrkG7!.e]WflOg$xD:G6s kG$H
<3$H:OgR$xOg~#.i[x>s&bApilPq3GnL6sl87!.e]W$xD:AI[x=hCc,O~#]1;
zIzyGXCYR:28kG~#>sM#Zb3Gb8+@Og:FgR,©_K-Z,"i^Cc.q~#QI©.N'%&l8t\"c~#<
©.N'%&l87!.e]WflOg©.S97!Kj_tCY~#QIrri4®7
encrypt('gettysburg.txt','pippo.txt')
encrypt('pippo.txt')
Fourscore and seven years ago our fathers brought forth on this
continent a new nation, conceived in liberty and dedicated to the
proposition that all men are created equal.
Now we are engaged in a great civil war, testing whether that nation
or any nation so conceived and so dedicated can long endure. We are
met on a great battle field of that war. We have come to dedicate a
portion of that field, as a final resting place for those who here
gave their lives that that nation might live. It is altogether
fitting and proper that we should do this.
But, in a larger sense, we can not dedicate - we can not consecrate
- we can not hallow - this ground. The brave men, living and dead,
who struggled here, have consecrated it, far above our poor power to
add or detract. The world will little note, nor long remember, what
we s
