f=@(x)1-2*x+3*x.^2

f =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)1-2*x+3*x.^2

ezplot(f)
[Warning: MATLAB has disabled some advanced
graphics rendering features by switching to
software OpenGL. For more information, click
<a href="matlab:opengl('problems')">here</a>.] 
t=linspace(-3,3,20);
y=f(t)+0.2*randn(size(t));
xlim([-3 3])
ylim([-3 50])
hold
Current plot held
plot(t,y,'*')
y=f(t)+randn(size(t));
plot(t,y,'*')
p=polyfit(t,y,2)

p =

    3.0256   -2.1979    0.8578

f

f =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)1-2*x+3*x.^2

x=linspace(-3,3,1000);
plot(x,polyval(p,x))
plot(x,f(x))
p=polyfit(t,y,4)

p =

  Columns 1 through 4

   -0.0454    0.0541    3.4092   -2.5197

  Column 5

    0.4807

plot(x,polyval(p,x))
p=polyfit(t,y,10)

p =

  Columns 1 through 4

   -0.0027   -0.0042    0.0653    0.0713

  Columns 5 through 8

   -0.5705   -0.3933    2.0474    0.9377

  Columns 9 through 11

    0.6070   -3.3234    1.1214

plot(x,polyval(p,x))
y=f(t)+5*randn(size(t));
plot(t,y,'*')
clear
clf
censusgui
censusgui2
figure(2)
censusgui
figure(2)
censusgui2

X =

     1     2     3
     4     5     6
     7     8     9
    10    11    12
    13    14    15

y=16:21

y =

    16    17    18    19    20    21

X\y
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('mldivide')" style="font-weight:bold"> \ </a>
Matrix dimensions must agree.
} 
y=y'

y =

    16
    17
    18
    19
    20
    21

X\y
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('mldivide')" style="font-weight:bold"> \ </a>
Matrix dimensions must agree.
} 
X

X =

     1     2     3
     4     5     6
     7     8     9
    10    11    12
    13    14    15

y=(16:20)'

y =

    16
    17
    18
    19
    20

X\y
[Warning: Rank deficient, rank = 2, tol =
2.470090e-14.] 

ans =

   -7.5000
         0
    7.8333

format long
X\y
[Warning: Rank deficient, rank = 2, tol =
2.470090e-14.] 

ans =

  -7.499999999999997
                   0
   7.833333333333330

pinv(X)*y

ans =

  -7.555555555555555
   0.111111111111103
   7.777777777777786

b1=X\y
[Warning: Rank deficient, rank = 2, tol =
2.470090e-14.] 

b1 =

  -7.499999999999997
                   0
   7.833333333333330

b2=pinv(X)*y

b2 =

  -7.555555555555555
   0.111111111111103
   7.777777777777786

norm(b1)

ans =

  10.844865656664956

norm(b2)

ans =

  10.844011831079525


ans =

     2


Z =

  Columns 1 through 2

  -0.388888888888889  -0.244444444444445
  -0.022222222222223  -0.011111111111111
   0.344444444444445   0.222222222222223

  Columns 3 through 4

  -0.100000000000000   0.044444444444445
  -0.000000000000000   0.011111111111111
   0.100000000000000  -0.022222222222222

  Column 5

   0.188888888888889
   0.022222222222222
  -0.144444444444445

[Warning: Rank deficient, rank = 2, tol =
2.470090e-14.] 

B =

  Columns 1 through 2

  -0.400000000000000  -0.250000000000000
                   0                   0
   0.333333333333333   0.216666666666666

  Columns 3 through 4

  -0.100000000000000   0.050000000000000
                   0                   0
   0.100000000000000  -0.016666666666667

  Column 5

   0.200000000000000
                   0
  -0.133333333333333

[Warning: Rank deficient, rank = 2, tol =
2.696722e-14.] 

S =

  Columns 1 through 2

  -0.611111111111111                   0
  -0.027777777777778                   0
   0.555555555555555                   0

  Columns 3 through 4

                   0                   0
                   0                   0
                   0                   0

  Column 5

   0.111111111111111
   0.027777777777778
  -0.055555555555556

format short

ans =

     2


Z =

  Columns 1 through 4

   -0.3889   -0.2444   -0.1000    0.0444
   -0.0222   -0.0111   -0.0000    0.0111
    0.3444    0.2222    0.1000   -0.0222

  Column 5

    0.1889
    0.0222
   -0.1444

[Warning: Rank deficient, rank = 2, tol =
2.470090