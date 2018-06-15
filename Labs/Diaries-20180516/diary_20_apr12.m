%-- 12/04/2018 09:34 --%
tic;[x,R]=randquartic(1e4);toc
R
tic;[x,R]=randquartic(1e5);toc
tic;[x,R]=randquartic(1e6);toc
R
format longG
R
histogram(x)
c=histcounts(x);
hold
fplot(@(x)max(c)*exp(-x.^/2-0.1*x.^4))
fplot(@(x)max(c)*exp(-x.^2/2-0.1*x.^4))
tic;[x,R]=randquartic(1e6,0,2);toc
R
tic;[x,R]=randquartic(1e6,0,5);toc
R
hold
histogram(x)
hold
c=histcounts(x);
fplot(@(x)max(c)*exp(-x.^2/2-5*x.^4))
fplot(@(x)max(c)*exp(-x.^2/2-5*x.^4),[-1.5 1.5])
help histogram
size(c)
hold
histogram(x,40)
hold
c=histcounts(x,40);
fplot(@(x)max(c)*exp(-x.^2/2-5*x.^4),[-1.5 1.5])
clf
fplot(@(x)exp(+x.^2/2-0.1*x.^4),[-1.5 1.5])
fplot(@(x)exp(+x.^2/2-0.1*x.^4),[-5 5])
fplot(@(x)exp(+x.^2/2-0.5*x.^4),[-5 5])
fplot(@(x)exp(+x.^2/2-0.01*x.^4),[-5 5])
fplot(@(x)exp(+x.^2/2-0.01*x.^4),[-10 10])
tic;[x,R]=randquartic_devel(1e6);toc
R
tic;[x,R]=randquartic_devel(1e6);toc
R
histogram(x,40)
hold
c=histcounts(x,40);
fplot(@(x)exp(+x.^2/2-0.1*x.^4),[-5 5])
fplot(@(x)max(c)*exp(+x.^2/2-0.1*x.^4),[-5 5])
fplot(@(x)max(c)*exp(+x.^2/2-0.1*x.^4-1/2/0.1),[-5 5])
hold
histogram(x,40)
hold
fplot(@(x)max(c)*exp(+x.^2/2-0.1*x.^4-1/16/0.1),[-5 5])
clear
p=rand(4,1)
p=p/sum(p)
tic;x=metropolis(1e5,p);toc
histogram(x,(1:2:9)/2)
clf
histogram(x,(1:2:9)/2)
c=histcounts(x,(1:2:9)/2)
c/1e5
[ans' p]
tic;x=metropolis(1e6,p);toc
c=histcounts(x,(1:2:9)/2)';
[c/1e6 p]
tic;x=metropolis(1e7,p);toc
c=histcounts(x,(1:2:9)/2)';
[c/1e7 p]
tic;x=metropolis(1e6,p,10);toc
c=histcounts(x,(1:2:9)/2)';
[c/1e6 p]
tic;x=metropolis(1e6,p,1);toc
R=autocorr(x,2:9);
R
format shortG
R
R=autocorr(x,1:9);
R
R=autocorr(x,2:9);
R(:,1)
R=autocorr(x,2:30);
R(:,1)
p.f=@(x)exp(+x.^2/2-0.1*x.^4)
q.f=@(x)exp(+x.^2/2-0.1*x.^4)
q.start=0;
q.sigma=1;
tic;x=metropolis(1e6,q);toc
histogram(x,40)
c=histcounts(x,40);
hold
fplot(@(x)max(c)*exp(+x.^2/2-0.1*x.^4-1/16/0.1),[-5 5])