pwd

ans =

C:\Users\claudio.destri\Documents\MATLAB

phi=(1+sqrt(5))/2

phi =

   1.618033988749895

format long
phi=(1+sqrt(5))/2

phi =

   1.618033988749895

phi=sym((1+sqrt(5))/2)
 
phi =
 
910872158600853/562949953421312
 
double(phi)

ans =

   1.618033988749895

isprime(910872158600853)

ans =

  <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a>

   0

isprime(23)

ans =

  <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a>

   1

phi=(sym(1)+sqrt(5))/2
 
phi =
 
5^(1/2)/2 + 1/2
 
vpa(phi)
 
ans =
 
1.6180339887498948482045868343656
 
digits
 
Digits = 32
 
vpa(phi,64)
 
ans =
 
1.618033988749894848204586834365638117720309179805762862135448623
 
digits(128)
digits
 
Digits = 128
 
vpa(phi)
 
ans =
 
1.6180339887498948482045868343656381177203091798057628621354486227052604628189024497072072041893911374847540880753868917521266339
 
digits(32)
vpa(phi)
 
ans =
 
1.6180339887498948482045868343656
 
p = [1 -1 -1]

p =

     1    -1    -1

poly2str(p)
{Not enough input arguments.

Error in <a href="matlab:matlab.internal.language.introspective.errorDocCallback('poly2str', 'C:\Program Files\MATLAB\R2016b\toolbox\control\ctrlobsolete\poly2str.m', 43)" style="font-weight:bold">poly2str</a> (<a href="matlab: opentoline('C:\Program Files\MATLAB\R2016b\toolbox\control\ctrlobsolete\poly2str.m',43,0)">line 43</a>)
      s=[s,' ',tvar,'^',num2str(nd-j)];
} 
pwd

ans =

C:\Users\claudio.destri\Documents\MATLAB

diary off
f=@(x) 1./x-(x-1)

f =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)1./x-(x-1)

helpPopup function_handle
helpPopup function_handle
g=@acos

g =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @acos

g(1)

ans =

     0

g(-1)

ans =

   3.141592653589793

f

f =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)1./x-(x-1)

f(3)

ans =

  -1.666666666666667

f=@(x) 1./x-(x-1)

f =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)1./x-(x-1)

f(rand(10,1))

ans =

   1.412686313710105
   1.198214357381511
   8.747846408036560
   1.181463681471657
   1.949020335031701
  11.154621250532507
   4.312189018085759
   2.281668111533547
   1.086872131893313
   1.071500605639123

f=@(x) 1/x-(x-1)

f =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)1/x-(x-1)

f(rand(10,1))

ans =

  Columns 1 through 5

   0.842386918322452   1.872685122463266   0.842386918322452   0.842386918322452   0.842386918322452
   0.029407218239384   1.059705422380199   0.029407218239384   0.029407218239384   0.029407218239384
   0.042833051757054   1.073131255897869   0.042833051757054   0.042833051757054   0.042833051757054
   0.514624351277159   1.544922555417974   0.514624351277159   0.514624351277159   0.514624351277159
   0.199719531111200   1.230017735252015   0.199719531111200   0.199719531111200   0.199719531111200
   0.858113661372785   1.888411865513599   0.858113661372785   0.858113661372785   0.858113661372785
   0.578238717373725   1.608536921514540   0.578238717373725   0.578238717373725   0.578238717373725
   0.084264474810933   1.114562678951748   0.084264474810933   0.084264474810933   0.084264474810933
   0.207792670440446   1.238090874581260   0.207792670440446   0.207792670440446   0.207792670440446
   0.040507573607097   1.070805777747912   0.040507573607097   0.040507573607097   0.040507573607097

  Columns 6 through 10

   0.842386918322452   0.842386918322452   0.842386918322452   0.842386918322452   0.842386918322452
   0.029407218239384   0.029407218239384   0.029407218239384   0.029407218239384   0.029407218239384
   0.042833051757054   0.042833051757054   0.042833051757054   0.042833051757054   0.042833051757054
   0.514624351277159   0.514624351277159   0.514624351277159   0.514624351277159   0.514624351277159
   0.199719531111200   0.199719531111200   0.199719531111200   0.199719531111200   0.199719531111200
   0.858113661372785   0.858113661372785   0.858113661372785   0.858113661372785   0.858113661372785
   0.578238717373725   0.578238717373725   0.578238717373725   0.578238717373725   0.578238717373725
   0.084264474810933   0.084264474810933   0.084264474810933   0.084264474810933   0.084264474810933
   0.207792670440446   0.207792670440446   0.207792670440446   0.207792670440446   0.207792670440446
   0.040507573607097   0.040507573607097   0.040507573607097   0.040507573607097   0.040507573607097

f=@(x) 1./x-(x-1)

f =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)1./x-(x-1)

ezplot(f)
[Warning: MATLAB has disabled some advanced graphics rendering features by switching to software OpenGL.
For more information, click <a href="matlab:opengl('problems')">here</a>.] 
ezplot(f,[0 10])

ezplot(f,[0 2])
grid
fzero(f,1)

ans =

   1.618033988749895

hold
Current plot held
hold
Current plot released
hold on
hold off
hold
Current plot held
plot([ans 0],'ro')
ans

ans =

   1.618033988749895

plot(ans,0,'ro')
figure
figure
mygoldrect
mygoldrect

h = 

  2×1 <a href="matlab:helpPopup matlab.graphics.chart.primitive.Line" style="font-weight:bold">Line</a> array:

  Line
  Line

mygoldrect

h

h = 

  2×1 <a href="matlab:helpPopup matlab.graphics.chart.primitive.Line" style="font-weight:bold">Line</a> array:

  Line
  Line

h(1)

ans = 

  <a href="matlab:helpPopup matlab.graphics.chart.primitive.Line" style="font-weight:bold">Line</a> with properties:

              Color: [0 0 1]
          LineStyle: '-'
          LineWidth: 0.500000000000000
             Marker: 'none'
         MarkerSize: 6
    MarkerFaceColor: 'none'
              XData: [0 1.618033988749895 1.618033988749895 0 0]
              YData: [0 0 1 1 0]
              ZData: [1×0 double]

  Show <a href="matlab:if exist('ans', 'var'), matlab.graphics.internal.getForDisplay('ans', ans, 'matlab.graphics.chart.primitive.Line'), else, matlab.graphics.internal.getForDisplay('ans'), end">all properties</a>

if exist('ans', 'var'), matlab.graphics.internal.getForDisplay('ans', ans, 'matlab.graphics.chart.primitive.Line'), else, matlab.graphics.internal.getForDisplay('ans'), end
    AlignVertexCenters: 'off'
            Annotation: [1×1 matlab.graphics.eventdata.Annotation]
          BeingDeleted: 'off'
            BusyAction: 'queue'
         ButtonDownFcn: ''
              Children: [0×0 GraphicsPlaceholder]
              Clipping: 'on'
                 Color: [0 0 1]
             CreateFcn: ''
             DeleteFcn: ''
           DisplayName: ''
      HandleVisibility: 'on'
               HitTest: 'on'
         Interruptible: 'on'
              LineJoin: 'round'
             LineStyle: '-'
             LineWidth: 0.500000000000000
                Marker: 'none'
       MarkerEdgeColor: 'auto'
       MarkerFaceColor: 'none'
         MarkerIndices: [1 2 3 4 5]
            MarkerSize: 6
                Parent: [1×1 Axes]
         PickableParts: 'visible'
              Selected: 'off'
    SelectionHighlight: 'on'
                   Tag: ''
                  Type: 'line'
         UIContextMenu: [0×0 GraphicsPlaceholder]
              UserData: []
               Visible: 'on'
                 XData: [0 1.618033988749895 1.618033988749895 0 0]
             XDataMode: 'manual'
           XDataSource: ''
                 YData: [0 0 1 1 0]
           YDataSource: ''
                 ZData: [1×0 double]
           ZDataSource: ''

h(1).Color

ans =

     0     0     1

h(1).Color=[0 1 0]

h = 

  2×1 <a href="matlab:helpPopup matlab.graphics.chart.primitive.Line" style="font-weight:bold">Line</a> array:

  Line
  Line

set(h(1),'color','y')
set(h(1),'color','k','linewidth',4)
xlim([0 5])
mygoldfract(4)
p = 1+1/(1+1/(1+1/(1+1/(1))))
p = 8/5
p = 1.600000000000000
err = 0.018034
exit
