function rwcircTEST(pjump,mylayout)
% rwalkongraph(G,pjump) performs a graphical random walk on the graph G
% moving according to markovchain(G,inf,randi(G.numnodes),pjump);
% rwalkongraph(G) defaults to rwalkongraph(G,0);
% rwalkongraph(G,pjump,mylayout) fixes to mylayout the plotting layout;
% rwalkongraph(G,mylayout) defaults to rwalkongraph(G,0,mylayout).

% Resistenze
R=[1100 4700 6800 9800 3600 470 980 1000];

% Potenziale generatore
vs=1;

% Matrice di giacenza del grafo (resistenze con direzione di percorrenza)
R12 = R(1); R14 = R(2); R24 = R(3); R31 = R(4); R32 = R(5); R34 = R(6);
R45 = R(7); R53 = R(8);

A = [ 0 R12 0 R14 0;
      R12 0 0 0 R24; 
      R31 R32 0 R34 0; 
      R14 0 0 0 R45; 
      0 0 R53 0 0];

% Matrice delle conduttanze
D = R.^(-1);
R12 = D(1); R14 = D(2); R24 = D(3); R31 = D(4); R32 = D(5); R34 = D(6);
R45 = D(7); R53 = D(8);

D = [ 0 R12 0 R14 0;
      R12 0 0 0 R24; 
      R31 R32 0 R34 0; 
      R14 0 0 0 R45; 
      0 0 R53 0 0];
G = digraph(D);
S = graph2stoch(G,0); % Matrice stocastica
S = full(S);

narginchk(0,2);

if nargin == 0
    pjump = 0;
end
if ~isnumeric(pjump)
    error('Il primo input deve essere un numero!')
elseif isnumeric(pjump) && isscalar(pjump)
    if pjump > 1 || (pjump < 0 && pjump ~= -1)
        error('Il primo input deve essere -1 o una probabilità!')
    end
end
if nargin < 2
    mylayout = 'layered';
end
if nargin > 2
    error('La funzione accetta massimo due input!')
end

small = 4;
big = 6;
thin = 0.5;
thick = 1;
shg
clf
set(gcf,'color','white', 'numbertitle','off', 'name','Random walk on graph')

hG = plot(G,'NodeColor','k','EdgeColor','b','Layout',mylayout);
set(gca,'xtick',[],'ytick',[])
if isa(G,'digraph') && G.numnodes < 32
    hG.ArrowSize = 8;
end
hG.NodeLabel = zeros(1,G.numnodes);
hG.MarkerSize = small*ones(1,G.numnodes);
hG.LineWidth = thin*ones(1,G.numedges);

uicontrol('style','push','string','step','fontsize',10,'fontweight','bold',...
   'back','w','units','normalized','pos',[0.32 0.05 0.1 0.05], ...
   'callback', @fstep);
run = uicontrol('style','toggle','string','start','fontsize',10,'fontweight','bold',... ...
   'back','w','units','normalized','pos',[0.44 0.05 0.12 0.05], ...
   'callback', @frun);
quit = uicontrol('style','toggle','string','quit','fontsize',10,'fontweight','bold',...
   'back','w','units','normalized','pos',[0.58 0.05 0.1 0.05]);
drawnow

nbuf = 1e5;
[mc] = markovchain(G,nbuf,randi(G.numnodes),pjump);
jbuf = 1;
hG.NodeLabel{mc(jbuf)} = '1';
hG.highlight(mc(jbuf),'NodeColor','r')
hG.MarkerSize(mc(jbuf)) = big;

while ~quit.Value
    if run.Value
        fstep(0,0)
    end
    pause(0.000000000001)
end
close(gcf);

    function fstep(~,~)
        s = mc(jbuf);
        jbuf = jbuf+1;
        t = mc(jbuf);
        e = G.findedge(s,t);
        if e 
            hG.highlight([s t],'EdgeColor','r')
            hG.LineWidth(e) = thick;
        else
            hl = line(hG.XData([s t]),hG.YData([s t]),...
               'linestyle','--','linewidth',1,'color','m');
        end
        pause(0.0000001)
        hG.highlight(s,'NodeColor','k')
        hG.MarkerSize(s) = small;
        pause(0.1)
        hG.highlight(t,'NodeColor','r')
        hG.MarkerSize(t) = big;
        pause(0.0000001)
        if e
            hG.LineWidth(e) = thin;
            hG.highlight([s t],'EdgeColor','b')
        else
            hl.delete
        end
        hG.NodeLabel{t} = num2str(str2double(hG.NodeLabel{t})+1);
    end

% Calcolo posizione di equilibrio statistisco:
%   TH: si ottiene posizione di equilibrio statico elevando la matrice stoc.
%   S un numero infinito di volte.
E = S^1000;                    % APPROSSIMAZIONE!<----CHE ERRORE C'È QUI???
Ve = E(:,1);


% Calcolo del vettore che indica il potenziale in ogni
% nodo e del vettore di equilibrio (PROBABILMENTE MOLTO SBAGLIATO)
I=eye(5);
M=I-S;
U = -vs*M(2:5,1);
M = M(2:5,2:5);
V=M\U;
m = min(V);
V = V-m;
vs = vs - m;
Vals=[V(4) V(3) vs V(2) V(1)]';
disp('Il vettore di Vals è:');
disp(Vals);
disp('Il vettore di equilibrio è:');
disp(Ve);
disp('La matrice stocastica è:');
disp(S);
    function frun(h,~)
        if h.Value
            h.String = 'pause';
            if jbuf > nbuf
               mc = markovchain(G,nbuf);
               jbuf = 1;
            end
        else
            h.String = 'resume';
        end
    end
 
end
